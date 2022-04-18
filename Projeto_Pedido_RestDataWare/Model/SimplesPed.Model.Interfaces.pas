unit SimplesPed.Model.Interfaces;

interface

uses
  SimplePed.Model.Produto.Interfaces, SimplePed.Model.Pedido.Interfaces;

type

  iModel = interface
    ['{2A108A7C-FAA6-42F5-8982-B70F1F79A212}']
    function Produto : iModelProduto;
    function Pedido : iModelPedido;
    function PedidoItens : iModelPedidoItens;
  end;

implementation

end.
