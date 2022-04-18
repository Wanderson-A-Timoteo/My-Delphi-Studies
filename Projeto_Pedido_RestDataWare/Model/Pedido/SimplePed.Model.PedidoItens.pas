unit SimplePed.Model.PedidoItens;

interface

uses
  SimplePed.Model.Pedido.Interfaces, SimplePed.Model.Entidade.Pedido,
  SimpleInterface, Data.DB, SimpleDAO, SimpleQueryRestDW,
  SimplePed.Model.Entidade.PedidoItens;

Type
  TModelPedidoItens = class(TInterfacedObject, iModelPedidoItens)
  private
    FEntidade : TPEDIDOITENS;
    FDAO : iSimpleDAO<TPEDIDOITENS>;
    FDataSource : TDataSource;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelPedidoItens;
    function Entidade: TPEDIDOITENS; overload;
    function Entidade (aEntidade : TPEDIDOITENS) : iModelPedidoItens; overload;
    function DAO: iSimpleDAO<TPEDIDOITENS>;
    function DataSource(aDataSource: TDataSource): iModelPedidoItens;
  end;

implementation

{ TModelPedidoItens }

uses SimplePed.Model.Conexao.RestDW, System.SysUtils;

constructor TModelPedidoItens.Create;
begin
  FEntidade := TPEDIDOITENS.Create;
  FDAO := TSimpleDAO<TPEDIDOITENS>
            .New(TSimpleQueryRestDW<TPEDIDOITENS>
                  .New(ModelConexao.RESTDWDataBase1));
end;

function TModelPedidoItens.DAO: iSimpleDAO<TPEDIDOITENS>;
begin
  Result := FDAO;
end;

function TModelPedidoItens.DataSource(aDataSource: TDataSource): iModelPedidoItens;
begin
  Result := Self;
  FDataSource := aDataSource;
  FDAO.DataSource(FDataSource);
end;

destructor TModelPedidoItens.Destroy;
begin
  FreeAndNil(FEntidade);
  inherited;
end;

function TModelPedidoItens.Entidade(aEntidade: TPEDIDOITENS): iModelPedidoItens;
begin
  Result := Self;
  FEntidade := aEntidade;
end;

function TModelPedidoItens.Entidade: TPEDIDOITENS;
begin
  Result := FEntidade;
end;

class function TModelPedidoItens.New: iModelPedidoItens;
begin
  Result := Self.Create;
end;

end.
