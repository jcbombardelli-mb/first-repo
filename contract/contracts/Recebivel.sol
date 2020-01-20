pragma solidity >=0.4.21 <0.7.0;

contract Recebivel {

  uint public codIncorporadora;
  uint public codContratoEletronico;

  string cnpjCustodiante;
  string nomeCustodiante;

  uint totalRecebivel;

  struct Parcela {
    uint id;
    uint valor;
    uint vencimento;
    StatusParcela status;
  }

  Parcela[] public parcelas;
  mapping(uint => uint) indexParcelaIndexedById;

  enum StatusParcela {
    ABERTA,
    PAGA,
    CANCELADA
  }

  constructor(uint _codIncorporadora, uint _codContratoEletronico,
    string memory _cnpjCustodiante, string memory _nomeCustodiante, uint _totalParcelas, uint _totalRecebivel,
    uint _dataPrimeiroVencimento) public {

    codIncorporadora = _codIncorporadora;
    codContratoEletronico = _codContratoEletronico;
    cnpjCustodiante = _cnpjCustodiante;
    nomeCustodiante = _nomeCustodiante;
    totalRecebivel = _totalRecebivel;

    uint dataVencimentoParaParcela = _dataPrimeiroVencimento;
    uint256 valorPorParcela = _totalRecebivel / _totalParcelas;
    uint codParcela = _codContratoEletronico;

    for (uint i = 0; i < _totalParcelas; i++) {

      Parcela memory parcela = Parcela(++codParcela, valorPorParcela, dataVencimentoParaParcela, StatusParcela.ABERTA);

      uint indexParcela = parcelas.push(parcela);
      indexParcelaIndexedById[codParcela] = indexParcela;

    }
  }

  function getTotalParcelas() public view returns(uint){
      return parcelas.length;
  }

}