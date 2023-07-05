// SPDX-License-Identifier: Unlicensed
pragma solidity >=0.8.0 <0.9.0;

import "@routerprotocol/evm-gateway-contracts/contracts/IDapp.sol";
import "@routerprotocol/evm-gateway-contracts/contracts/IGateway.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/// @title XERC721
/// @author Kravtsov Dmitriy
/// @notice A cross-chain ERC-721 smart contract to demonstrate how one can create
/// cross-chain NFT contracts using Router CrossTalk.
contract XERC721 is ERC721, ERC721URIStorage, ERC721Enumerable, IDapp {
  // address of the owner
  address public owner;

  // id of the chain
  string public ChainId;

  // address of the gateway contract
  IGateway public gatewayContract;

  // set contract on source and destination chain
  mapping(string => string) public ourContractOnChains;

  // Custom for mint
  mapping(address => uint256) public mintingCounter;

  // transfer params struct where we specify which NFT should be transferred to
  // the destination chain and to which address
  struct TransferParams {
    uint256 nftId;
    bytes recipient;
    string uri;
  }

  constructor(
    string memory nftName, 
    string memory nftSymbol,
    string memory chainId,
    address getewayAddress,
    string memory feePayerAddress
  ) ERC721(nftName, nftSymbol) {
    ChainId = chainId;
    gatewayContract = IGateway(getewayAddress);
    owner = msg.sender;
    // setting metadata for dapp
    gatewayContract.setDappMetadata(feePayerAddress);
  }

  // Custom mint
  function mint(string memory uri) external {
    uint256 tokenId = ((uint256(keccak256(bytes(ChainId))) >> 20) << 180) + (uint256(uint160(msg.sender)) << 20) + mintingCounter[msg.sender];
    _safeMintWithUri(msg.sender, tokenId, uri);
    mintingCounter[msg.sender] += 1;
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

  function _safeMintWithUri(address to, uint256 tokenId, string memory uri) internal {
    _safeMint(to, tokenId);
    _setTokenURI(tokenId, uri);
  }
  
  function tokenURI(uint256 tokenId)
    public
    view
    override(ERC721, ERC721URIStorage)
    returns (string memory)
  {
      return super.tokenURI(tokenId);
  }


  /// @notice function to set the address of our ERC20 contracts on different chains.
  /// This will help in access control when a cross-chain request is received.

  function setContractOnChain(
    string calldata chainId,
    string calldata contractAddress
  ) external {
    require(msg.sender == owner, "only owner");
    
    ourContractOnChains[chainId] = contractAddress;
  }

  function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
    super._burn(tokenId);
  }
  
  // This function sends the NFT from the source chain to the destination chain 
  function transferCrossChain(
    string calldata chainId,
    uint256 tokenId,
    address recipient
  ) public payable {
    require(
      keccak256(bytes(ourContractOnChains[chainId])) !=
        keccak256(bytes("")),
      "contract on dest not set"
    );

    require(
      _ownerOf(tokenId) == _msgSender() || super._isApprovedOrOwner(_msgSender(), tokenId),
      "caller is not the owner and not approved"
    );

    TransferParams memory transferParams;
    transferParams.nftId = tokenId;
    transferParams.recipient = toBytes(recipient);
    transferParams.uri = super.tokenURI(tokenId);
    // burning the NFT from the address of the user calling _burn function
    _burn(transferParams.nftId);
    string memory destChainId = chainId;
    // sending the transfer params struct to the destination chain as payload.
    bytes memory packet = abi.encode(transferParams);
    bytes memory requestPacket = abi.encode(
      ourContractOnChains[destChainId],
      packet
    );

    gatewayContract.iSend{ value: msg.value }(
      1,
      0,
      string(""),
      destChainId,
      hex"000000000007a12000000006fc23ac0000000000000000000000000000000000000000000000000000000000000000000000",
      requestPacket
    );
  }

  function toBytes(address a) public pure returns (bytes memory b) {
    assembly {
        let m := mload(0x40)
        a := and(a, 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF)
        mstore(add(m, 20), xor(0x140000000000000000000000000000000000000000, a))
        mstore(0x40, add(m, 52))
        b := m
    }
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
    TransferParams memory transferParams = abi.decode(packet, (TransferParams));
    _safeMintWithUri(toAddress(transferParams.recipient), transferParams.nftId, transferParams.uri);

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
  ) external override {}

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

  function supportsInterface(bytes4 interfaceId)
    public
    view
    override(ERC721, ERC721Enumerable, ERC721URIStorage)
    returns (bool)
  {
      return super.supportsInterface(interfaceId);
  }

  function _beforeTokenTransfer(
    address from,
    address to,
    uint256 firstTokenId,
    uint256 batchSize
  ) internal virtual override(ERC721, ERC721Enumerable) {
    super._beforeTokenTransfer(from, to, firstTokenId, batchSize);
  }
}