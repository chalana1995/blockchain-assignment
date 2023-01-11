const BuyBicycle = artifacts.require("Bicycle");

module.exports = function (deployer) {
  deployer.deploy(BuyBicycle);
};
