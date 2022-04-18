unit SimplePed.Model.Pedido;

interface

uses
  SimplePed.Model.Pedido.Interfaces, SimplePed.Model.Entidade.Pedido,
  SimpleInterface, Data.DB, SimpleDAO, SimpleQueryRestDW;

Type
  TModelPedido = class(TInterfacedObject, iModelPedido)
  private
    FEntidade : TPEDIDO;
    FDAO : iSimpleDAO<TPEDIDO>;
    FDataSource : TDataSource;
    FPedidoItens : iModelPedidoItens;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelPedido;
    function Entidade: TPEDIDO; overload;
    function Entidade (aEntidade : TPEDIDO) : iModelPedido; overload;
    function DAO: iSimpleDAO<TPEDIDO>;
    function DataSource(aDataSource: TDataSource): iModelPedido;
    function Itens : iModelPedidoItens;
  end;

implementation

{ TModelPedido }

uses SimplePed.Model.Conexao.RestDW, System.SysUtils,
  SimplePed.Model.Entidade.PedidoItens, SimplePed.Model.PedidoItens;

constructor TModelPedido.Create;
begin
  FEntidade := TPEDIDO.Create;
  FDAO := TSimpleDAO<TPEDIDO>
            .New(TSimpleQueryRestDW<TPEDIDO>
                  .New(ModelConexao.RESTDWDataBase1));
  FPedidoItens := TModelPedidoItens.New;
end;

function TModelPedido.DAO: iSimpleDAO<TPEDIDO>;
begin
  Result := FDAO;
end;

function TModelPedido.DataSource(aDataSource: TDataSource): iModelPedido;
begin
  Result := Self;
  FDataSource := aDataSource;
  FDAO.DataSource(FDataSource);
end;

destructor TModelPedido.Destroy;
begin
  FreeAndNil(FEntidade);
  inherited;
end;

function TModelPedido.Entidade(aEntidade: TPEDIDO): iModelPedido;
begin
  Result := Self;
  FEntidade := aEntidade;
end;

function TModelPedido.Itens: iModelPedidoItens;
begin
  Result := FPedidoItens;
end;

function TModelPedido.Entidade: TPEDIDO;
begin
  Result := FEntidade;
end;

class function TModelPedido.New: iModelPedido;
begin
  Result := Self.Create;
end;

end.
