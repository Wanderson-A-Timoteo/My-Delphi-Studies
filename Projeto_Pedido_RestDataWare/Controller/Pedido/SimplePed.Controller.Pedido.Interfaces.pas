unit SimplePed.Controller.Pedido.Interfaces;

interface

uses
  Data.DB, SimplePed.Model.Entidade.Pedido,
  SimplePed.Model.Entidade.PedidoItens;

type
  iControllerPedidoItens = interface;

  iControllerPedido = interface
    ['{8197E30B-2419-427E-896E-9A0AA0209030}']
    function DataSource (aDataSource : TDataSource) : iControllerPedido;
    function Buscar : iControllerPedido;
    function Insert : iControllerPedido;
    function Delete : iControllerPedido;
    function Update : iControllerPedido;
    function Entidade : TPEDIDO;
    function Itens : iControllerPedidoItens;
  end;

  iControllerPedidoItens = interface
    ['{C2172D85-BAC8-4BC1-AA5B-43746D2CE7A3}']
    function DataSource (aDataSource : TDataSource) : iControllerPedidoItens;
    function Buscar : iControllerPedidoItens; overload;
    function Buscar (aId : Integer) : iControllerPedidoItens; overload;
    function Insert : iControllerPedidoItens;
    function Delete : iControllerPedidoItens;
    function Update : iControllerPedidoItens;
    function Entidade : TPEDIDOITENS;
  end;

implementation

end.
