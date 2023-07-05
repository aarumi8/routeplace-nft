// SPDX-License-Identifier: Unlicensed
pragma solidity >=0.8.0 <0.9.0;

import "@routerprotocol/evm-gateway-contracts/contracts/IDapp.sol";
import "@routerprotocol/evm-gateway-contracts/contracts/IGateway.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/cryptography/EIP712.sol";

interface IXERC721 {
  function transferCrossChain(
    string calldata chainId,
    uint256 tokenId,
    address recipient
  ) external;
  function transferFrom(address from, address to, uint256 tokenId) external;
}

/// @title Market
/// @author Kravtsov Dmitriy
/// @notice A cross-chain nft marketplace smart contract
contract Market is IDapp, EIP71 {
  // address of the owner
  address public owner;

 // name of the chain
  string public ChainId;

  // address of the gateway contract
  IGateway public gatewayContract;

  // set contract on source and destination chain
  mapping(string => string) public ourContractOnChains;

  // request identifier to loked value
  mapping(uint256 => LockedValue) public lockedValue;

  struct LockedValue {
    address owner;
    address buyer;
    uint256 value;
  }

  constructor(
    string memory chainId,
    address getewayAddress,
    string memory feePayerAddress
  ) {
    ChainId = chainId;
    gatewayContract = IGateway(getewayAddress);
    owner = msg.sender;

    // setting metadata for dapp
    gatewayContract.setDappMetadata(feePayerAddress);
  }

  /// @notice function to set the fee payer address on Router Chain.
  /// @param feePayerAddress address of the fee payer on Router Chain.
  function setDappMetadata(string memory feePayerAddress) external {
    require(msg.sender == owner, "only owner");
    gatewayContract.setDappMetadata(feePayerAddress);
  }

  /// @notice function to set the Router Gateway Contract.
  /// @param gateway address of the gateway contract.
  function setGateway(address gateway) external {
    require(msg.sender == owner, "only owner");
    gatewayContract = IGateway(gateway);
  }

  /// @notice function to set the address of our contracts on different chains.
  /// This will help in access control when a cross-chain request is received.

  function setContractOnChain(
    string calldata chainId,
    string calldata contractAddress
  ) external {
    require(msg.sender == owner, "only owner");
    
    ourContractOnChains[chainId] = contractAddress;
  }

  struct OrderData {
    string orderChain;
    address owner;
    address collection;
    uint256 token_id;
    uint256 nonce;
    string[] chainsIds;
    uint256[] priceOnChains;
  }

  struct RecieveOrder {
    OrderData order;
    address buyer;
  }

  function _getPriceOnThisChain(
    string[] memory chainsIds, 
    uint256[] memory priceOnChains
  ) internal view returns (uint256) {
    require(chainsIds.length == priceOnChains.length, "Invalid order (price length)");
    for (uint256 i = 0; i < chainsIds.length; i++) {
      if (keccak256(bytes(chainsIds[i])) == keccak256(bytes(ChainId))) {
        return priceOnChains[i];
      }
    }
    revert("Price no found");
  }

  function _resolveOrderCommon(OrderData calldata order) internal {
    IXERC721(order.collection).transferFrom(order.owner, msg.sender, order.token_id);
    (bool success, ) = order.owner.call{value: msg.value}("");
    require(success, "Payment failed.");
  }

  function _resolveOrderCrossChain(OrderData memory order, string memory dstChain, address buyer) internal {
    IXERC721(order.collection).transferCrossChain(dstChain, order.token_id, buyer);
  }

  function buyNft(OrderData calldata order, string calldata signature) external payable {
    require(_getPriceOnThisChain(order.chainsIds, order.priceOnChains) == msg.value, "Invalid value");
    // add signature verification
    if (keccak256(bytes(order.orderChain)) == keccak256(bytes(ChainId))) {
      _resolveOrderCommon(order);
    } else {
      _sendCrossChainRequest(RecieveOrder(order, msg.sender), msg.value);
    }
  }

  function _sendCrossChainRequest(RecieveOrder memory requestOrder, uint256 value) internal {
    string memory destChainId = requestOrder.order.orderChain;
    require(
      keccak256(bytes(ourContractOnChains[destChainId])) !=
        keccak256(bytes("")),
      "contract on dest not set"
    );

    // sending the order struct to the destination chain as payload.
    bytes memory packet = abi.encode(requestOrder);
    bytes memory requestPacket = abi.encode(
      ourContractOnChains[destChainId],
      packet
    );

    uint256 requestIdentifier = gatewayContract.iSend{ value: 0 }(
      1,
      0,
      string(""),
      destChainId,
      hex"000000000007a12000000006fc23ac00000000000007a12000000006fc23ac00000000000000000000000000000000000300",
      requestPacket
    );

    lockedValue[requestIdentifier] = LockedValue(requestOrder.order.owner, requestOrder.buyer, value);
  }
  

  /// @notice function to get the request metadata to be used while initiating cross-chain request
  /// @return requestMetadata abi-encoded metadata according to source and destination chains
  function getRequestMetadata(
    uint64 destGasLimit,
    uint64 destGasPrice,
    uint64 ackGasLimit,
    uint64 ackGasPrice,
    uint128 relayerFees,
    uint8 ackType,
    bool isReadCall,
    string calldata asmAddress
  ) public pure returns (bytes memory) {
    bytes memory requestMetadata = abi.encodePacked(
      destGasLimit,
      destGasPrice,
      ackGasLimit,
      ackGasPrice,
      relayerFees,
      ackType,
      isReadCall,
      asmAddress
    );
    return requestMetadata;
  }

  function toBytes(address a) public pure returns (bytes memory b){
    assembly {
        let m := mload(0x40)
        a := and(a, 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF)
        mstore(add(m, 20), xor(0x140000000000000000000000000000000000000000, a))
        mstore(0x40, add(m, 52))
        b := m
    }
 }

  /// @notice function to handle the cross-chain request received from some other chain.
  /// @param requestSender address of the contract on source chain that initiated the request.
  /// @param packet the payload sent by the source chain contract when the request was created.
  /// @param srcChainId chain ID of the source chain in string.
  function iReceive(
    string memory requestSender,
    bytes memory packet,
    string memory srcChainId
  ) external override returns (bytes memory) {
    require(msg.sender == address(gatewayContract), "only gateway");
    require(
      keccak256(bytes(ourContractOnChains[srcChainId])) ==
        keccak256(bytes(requestSender))
    );

    // decoding our payload
    RecieveOrder memory recieveOrder = abi.decode(packet, (RecieveOrder));
    
    _resolveOrderCrossChain(recieveOrder.order, srcChainId, recieveOrder.buyer);

    return "";
  }

  /// @notice function to handle the acknowledgement received from the destination chain
  /// back on the source chain.
  /// @param requestIdentifier event nonce which is received when we create a cross-chain request
  /// We can use it to keep a mapping of which nonces have been executed and which did not.
  /// @param execFlag a boolean value suggesting whether the call was successfully
  /// executed on the destination chain.
  /// @param execData returning the data returned from the handleRequestFromSource
  /// function of the destination chain.
  function iAck(
    uint256 requestIdentifier,
    bool execFlag,
    bytes memory execData
  ) external override {
    require(msg.sender == address(gatewayContract), "only gateway");
    
    LockedValue memory currentLockedValue = lockedValue[requestIdentifier];
    if (execFlag) {
      (bool success, ) = currentLockedValue.owner.call{value: currentLockedValue.value}("");
      require(success, "Payment failed.");
    } else {
      (bool success, ) = currentLockedValue.buyer.call{value: currentLockedValue.value}("");
      require(success, "Payment failed.");
    }

    delete lockedValue[requestIdentifier];
  }

  /// @notice Function to convert bytes to address
  /// @param _bytes bytes to be converted
  /// @return addr address pertaining to the bytes
  function toAddress(bytes memory _bytes) internal pure returns (address addr) {
    bytes20 srcTokenAddress;
    assembly {
      srcTokenAddress := mload(add(_bytes, 0x20))
    }
    addr = address(srcTokenAddress);
  }
}
