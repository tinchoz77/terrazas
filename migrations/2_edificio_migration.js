const Edificio  = artifacts.require("Edificio");

module.exports = function (deployer) {
  deployer.deploy(Edificio);
};
