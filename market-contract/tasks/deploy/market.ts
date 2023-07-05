import { task, types } from "hardhat/config";
import { TaskArguments } from "hardhat/types";

task("TASK_DEPLOY_MARKET").setAction(async function (
  _taskArguments: TaskArguments,
  hre
) {
  const network = await hre.ethers.provider.getNetwork();
  const chainId = network.chainId;
  const chainName = network.name;
  const deployments = require("../../deployment/deployments.json");

  const gatewayContract = deployments[chainId].gatewayContract;
  const feePayerAddress = deployments[chainId].feePayerAddress;

  const deployContract = "Market";

  console.log("Contract Deployment Started ");
  const Market = await hre.ethers.getContractFactory("Market");
  const market = await Market.deploy(
    String(chainId),
    gatewayContract,
    feePayerAddress,
  );
  await market.deployed();

  console.log(deployContract + " Contract deployed to: ", market.address);
  console.log("Contract Deployment Ended");

  //const WAIT_BLOCK_CONFIRMATIONS = 8;
  //await market.deployTransaction.wait(WAIT_BLOCK_CONFIRMATIONS);

  function sleep(ms: number | undefined) {
    return new Promise(resolve => setTimeout(resolve, ms));
  }
  await sleep(60000);

  await hre.run(`verify:verify`, {
    address: market.address,
    constructorArguments: [
      String(chainId),
      gatewayContract,
      feePayerAddress,
    ],
  });
  
  return null;
});
