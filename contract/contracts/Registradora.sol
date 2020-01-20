pragma solidity >=0.4.21 <0.7.0;

import "./Recebivel.sol";

contract Registradora {

  Recebivel[] public recebiveis;


  event recebivelCriado(uint _codIncorporadora, uint _codContratoEletronico, Recebivel addr);

  function novoRecebivel(uint _codIncorporadora, uint _codContratoEletronico,
    string memory _cnpjCustodiante, string memory _nomeCustodiante, uint _totalParcelas, uint _totalRecebivel,
    uint _dataPrimeiroVencimento) public {
      Recebivel recebivel = new Recebivel(_codIncorporadora, _codContratoEletronico, _cnpjCustodiante,
        _nomeCustodiante, _totalParcelas, _totalRecebivel, _dataPrimeiroVencimento);

      recebiveis.push(recebivel);

      emit recebivelCriado(_codIncorporadora, _codContratoEletronico, recebivel);
  }

  function getTotalRecebiveis() public view returns(uint){
    return recebiveis.length;
  }

}