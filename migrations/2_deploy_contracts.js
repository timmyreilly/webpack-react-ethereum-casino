var Casino = artifacts.require("./Casino.sol");

module.exports = function(deployer) {
  // this worked: deployer.deploy(Casino, 1, 3);
  // web3.toWei(0.1, 'ether'), 100, {gas: 3000000} // This is better?
  deployer.deploy(Casino, 1, 3);  
};
