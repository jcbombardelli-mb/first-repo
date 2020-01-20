const Registradora = artifacts.require("Registradora");

module.exports = function(deployer) {
  deployer.deploy(Registradora);
};