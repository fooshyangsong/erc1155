// SPDX-License-Identifier: MIT
const IMBA1155 = artifacts.require("IMBA1155.sol");
const IMBA = artifacts.require("IMBA.sol");

//accounts is arrays of address which we use to sign our transaction
module.exports = async function (deployer, network, accounts) {

  let proxyRegistryAddress = "";
  if (network === 'rinkeby') {
    proxyRegistryAddress = "0xFdC25f2508cA76335f960e1CEcDC53AfB253Ea59";
  } else {
    proxyRegistryAddress = "0xEe40cBdDC0EA15535940b01C03fCD96111A2646a";
  }

  deployer.deploy(IMBA1155);

  await deployer.deploy(
    IMBA,
    proxyRegistryAddress,
    { gas: 109720 }
  );


    // const [admin, _] = accounts;
  
    // if(network === 'bscTestnet' || network === 'rinkeby') {
    //   await deployer.deploy(ContractA, admin);
    //   const contractA = await ContractA.deployed();
    //   await deployer.deploy(ContractB, admin, contractA.address);
    // }
  
    // if(network === 'bsc') {
    //   //Deployment logic for mainnet
    // }
  };
