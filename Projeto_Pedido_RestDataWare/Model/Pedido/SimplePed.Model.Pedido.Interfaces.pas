unit SimplePed.Model.Pedido.Interfaces;

interface

uses
  SimplePed.Model.Entidade.Pedido, SimpleInterface, Data.DB,
  SimplePed.Model.Entidade.PedidoItens;

type
  iModelPedidoItens = interface;

  iModelPedido = interface
    ['{3B23189E-D0F9-4218-92BD-FDC3F7977D50}']
    function Entidade : TPEDIDO; overload;
    function Entidade (aEntidade : TPEDIDO) : iModelPedido; overload;
    function DAO : iSimpleDAO<TPEDIDO>;
    function DataSource(aDataSource : TDataSource) : iModelPedido;
    function Itens : iModelPedidoItens;
  end;

  iModelPedidoItens = interface
    ['{3B23189E-D0F9-4218-92BD-FDC3F7977D50}']
    function Entidade : TPEDIDOITENS; overload;
    function Entidade (aEntidade : TPEDIDOITENS) : iModelPedidoItens; overload;
    function DAO : iSimpleDAO<TPEDIDOITENS>;
    function DataSource(aDataSource : TDataSource) : iModelPedidoItens;
  end;

implementation

end.
