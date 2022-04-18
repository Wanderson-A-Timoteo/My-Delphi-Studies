unit SimplesPed.Model;

interface

uses
  SimplesPed.Model.Interfaces, SimplePed.Model.Produto.Interfaces,
  SimplePed.Model.Pedido.Interfaces;

Type
  TModel = class(TInterfacedObject, iModel)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModel;
      function Produto : iModelProduto;
      function Pedido : iModelPedido;
      function PedidoItens : iModelPedidoItens;
  end;

implementation

uses
  SimplePed.Model.Produto, SimplePed.Model.Pedido, SimplePed.Model.PedidoItens;

{ TModel }

constructor TModel.Create;
begin

end;

destructor TModel.Destroy;
begin

  inherited;
end;

class function TModel.New: iModel;
begin
  Result := Self.Create;
end;

function TModel.Pedido: iModelPedido;
begin
  Result := TModelPedido.New;
end;

function TModel.PedidoItens: iModelPedidoItens;
begin
  Result := TModelPedidoItens.New;
end;

function TModel.Produto: iModelProduto;
begin
  Result := TModelProduto.New;
end;

end.
