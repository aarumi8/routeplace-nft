import { task, types } from "hardhat/config";
import { TaskArguments } from "hardhat/types";

task("TASK_DEPLOY_XERC721").setAction(async function (
  _taskArguments: TaskArguments,
  hre
) {
  const network = await hre.ethers.provider.getNetwork();
  const chainId = network.chainId;
  const chainName = network.name;
  const nftName = "RouterNft";
  const nftSymbol = "RN";
  const routerChainName = "RouterTestnet";
  const routerChainId = "router_9601-1";
  const routerContractAddress = "router1u7sr8snavkkjspf65p2yzwz52xawqcl5skcwfnw98e0z75t89ekqw72w70";

  const deployments = require("../../deployment/deployments.json");

  const gatewayContract = deployments[chainId].gatewayContract;
  const feePayerAddress = deployments[chainId].feePayerAddress;

  const deployContract = "XERC721";

  console.log("Contract Deployment Started ");
  const Erc721 = await hre.ethers.getContractFactory("XERC721");
  const erc721 = await Erc721.deploy(
    nftName,
    nftSymbol,
    String(chainId),
    gatewayContract,
    feePayerAddress,
  );
  await erc721.deployed();

  console.log(deployContract + " Contract deployed to: ", erc721.address);
  console.log("Contract Deployment Ended");

  //const WAIT_BLOCK_CONFIRMATIONS = 1;
  //await erc721.deployTransaction.wait(WAIT_BLOCK_CONFIRMATIONS);

  function sleep(ms: number | undefined) {
    return new Promise(resolve => setTimeout(resolve, ms));
  }
  await sleep(60000);

  await hre.run(`verify:verify`, {
    address: erc721.address,
    constructorArguments: [
      nftName,
      nftSymbol,
      String(chainId),
      gatewayContract,
      feePayerAddress
    ],
  });

  await hre.run("TASK_STORE_DEPLOYMENTS", {
    contractName: deployContract,
    contractAddress: erc721.address,
    chainID: chainId.toString(),
  });
  
  return null;
});
