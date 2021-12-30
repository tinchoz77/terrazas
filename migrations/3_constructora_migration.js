const Trust  = artifacts.require("Constructora");

module.exports = function (deployer) {
  deployer.deploy(Trust, '0x75993aBEB66e50bfA20525064237A9Eab0dd4aAb', 2000);
};
