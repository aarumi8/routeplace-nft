from bottle import post, request, run, response
import bottle
from bottle_cors_plugin import cors_plugin
from db import connection
import json
from eth_abi import encode
import sha3
from web3 import Web3
from hexbytes import HexBytes
from eth_account.messages import encode_defunct


class EnableCors(object):
    name = "enable_cors"
    api = 2

    def apply(self, fn, context):
        def _enable_cors(*args, **kwargs):
            # set CORS headers
            response.headers["Access-Control-Allow-Origin"] = "*"
            response.headers["Access-Control-Allow-Methods"] = "GET, POST, PUT, OPTIONS"
            response.headers[
                "Access-Control-Allow-Headers"] = "Origin, Accept, Content-Type, X-Requested-With, X-CSRF-Token"

            if bottle.request.method != "OPTIONS":
                # actual request; reply with the actual response
                return fn(*args, **kwargs)

        return _enable_cors


def get_contracts(collection_uuid):
    return connection.select(
        '''
            SELECT *
            FROM contracts
            WHERE collection = %s;
        ''',
        (collection_uuid,)
    )


def get_floor_price(chain_id, contract_address):
    return "0x001"


def get_volume(chain_id, contract_address):
    return "0x0141"


@post("/getCollections")
def get_collections():
    collections = connection.select(
        '''
            SELECT *
            FROM collections;
        ''',
        ()
    )
    for collection in collections:
        collection["contracts"] = get_contracts(collection["uuid"])
        for contract in collection["contracts"]:
            chain_id = contract["chain_id"]
            address = contract["address"]
            contract["floor"] = get_floor_price(chain_id, address)
            contract["volume"] = get_volume(chain_id, address)

    return json.dumps(collections)


def get_token_prices(order_uuid):
    return connection.select(
        '''
            SELECT *
            FROM order_prices
            WHERE order_uuid = %s;
        ''',
        (order_uuid,)
    )


@post("/getTokenListing")
def get_listed_tokens():
    tokens = connection.select(
        '''
            SELECT 
                o.chain_id, 
                o.collection_address, 
                o.token_id, 
                o.owner, 
                o.uuid, 
                o.nonce,
                o.uuid AS order_uuid
            FROM orders o
            INNER JOIN (
                SELECT o.chain_id, 
                    o.collection_address, 
                    o.token_id,
                    MAX(o.nonce) AS max_nonce
                FROM orders o
                GROUP BY o.chain_id, o.collection_address, o.token_id
            ) tmp
                ON o.chain_id = tmp.chain_id AND 
                   o.collection_address = tmp.collection_address AND 
                   o.token_id = tmp.token_id AND
                   o.nonce = tmp.max_nonce
            LEFT JOIN contracts c
                ON o.chain_id = c.chain_id AND o.collection_address = c.address
            WHERE c.collection = %s AND o.token_id = %s;
        ''',
        (request.json["collection_uuid"], request.json["token_id"])
    )

    for token in tokens:
        if token["order_uuid"]:
            token["prices"] = get_token_prices(token["order_uuid"])

    return json.dumps(tokens)


@post("/getListedTokens")
def get_listed_tokens():
    tokens = connection.select(
        '''
            SELECT 
                o.chain_id, 
                o.collection_address, 
                o.token_id, 
                o.owner, 
                o.uuid, 
                o.nonce,
                o.uuid AS order_uuid
            FROM orders o
            INNER JOIN (
                SELECT o.chain_id, 
                    o.collection_address, 
                    o.token_id,
                    MAX(o.nonce) AS max_nonce
                FROM orders o
                GROUP BY o.chain_id, o.collection_address, o.token_id
            ) tmp
                ON o.chain_id = tmp.chain_id AND 
                   o.collection_address = tmp.collection_address AND 
                   o.token_id = tmp.token_id AND
                   o.nonce = tmp.max_nonce
            LEFT JOIN contracts c
                ON o.chain_id = c.chain_id AND o.collection_address = c.address
            WHERE c.collection = %s;
        ''',
        (request.json["collectionUuid"],)
    )

    for token in tokens:
        if token["order_uuid"]:
            token["prices"] = get_token_prices(token["order_uuid"])

    return json.dumps(tokens)


@post("/getNextNonce")
def get_next_nonce():
    chain_id = request.json["chain_id"]
    collection_address = request.json["collection_address"]
    token_id = request.json["token_id"]
    try:
        return str(connection.select(
            '''
                SELECT MAX(o.nonce) AS max_nonce
                FROM orders o
                WHERE chain_id = %s AND collection_address = %s AND token_id = %s
                GROUP BY chain_id, collection_address, token_id;
            ''',
            (chain_id, collection_address, token_id)
        )[0]["max_nonce"] + 1)
    except Exception as e:
        return str(0)


def is_verified(order, signature):
    k = sha3.keccak_256()
    k.update(encode(["string", "address", "address", "uint256", "uint256", "string[]", "uint256[]"], order))
    w3 = Web3(Web3.HTTPProvider(""))
    message = encode_defunct(hexstr=k.hexdigest())
    address = w3.eth.account.recover_message(message, signature=HexBytes(signature))
    return address.lower() == order[2]


@post("/listing")
def listing():
    chain_id = request.json["chain_id"]
    collection_address = request.json["collection_address"]
    token_id = request.json["token_id"]
    signature = request.json["signature"]
    owner = request.json["owner"]
    prices = request.json["prices"]
    next_nonce = request.json["nonce"]

    if not is_verified(
        [
            chain_id,
            collection_address,
            owner,
            int(token_id),
            int(next_nonce),
            list(map(lambda x: x["chain_id"], prices)),
            list(map(lambda x: int(x["price"], 16), prices))
        ],
        signature
    ):
        return "Signature is invalid"

    order_uuid = connection.insert(
        '''
            INSERT INTO orders
            (chain_id, collection_address, token_id, nonce, signature, owner)
            VALUES (%s, %s, %s, %s, %s, %s)
            RETURNING uuid;
        ''',
        (chain_id, collection_address, token_id, next_nonce, signature, owner)
    )[0]["uuid"]

    for price in prices:
        _ = connection.insert(
            '''
                INSERT INTO order_prices
                (order_uuid, chain_id, price)
                VALUES (%s, %s, %s)
                RETURNING *;
            ''',
            (order_uuid, price["chain_id"], price["price"])
        )

    return json.dumps({"order_uuid": order_uuid})


if __name__ == "__main__":
    application = bottle.default_app()
    application.install(cors_plugin("*"))
    application.install(EnableCors())
    run(application, host="0.0.0.0", port=8004)
