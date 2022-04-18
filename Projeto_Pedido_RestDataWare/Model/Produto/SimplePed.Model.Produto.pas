unit SimplePed.Model.Produto;

interface

uses
  SimplePed.Model.Produto.Interfaces, SimplePed.Model.Entidade.Produto,
  SimpleInterface, Data.DB, SimpleDAO, SimpleQueryRestDW;

Type
  TModelProduto = class(TInterfacedObject, iModelProduto)
  private
    FEntidade : TPRODUTO;
    FDAO : iSimpleDAO<TPRODUTO>;
    FDataSource : TDataSource;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelProduto;
    function Entidade: TPRODUTO;
    function DAO: iSimpleDAO<TPRODUTO>;
    function DataSource(aDataSource: TDataSource): iModelProduto;
  end;

implementation

{ TModelProduto }

uses SimplePed.Model.Conexao.RestDW, System.SysUtils;

constructor TModelProduto.Create;
begin
  FEntidade := TPRODUTO.Create;
  FDAO := TSimpleDAO<TPRODUTO>
            .New(TSimpleQueryRestDW<TPRODUTO>
                  .New(ModelConexao.RESTDWDataBase1));
end;

function TModelProduto.DAO: iSimpleDAO<TPRODUTO>;
begin
  Result := FDAO;
end;

function TModelProduto.DataSource(aDataSource: TDataSource): iModelProduto;
begin
  Result := Self;
  FDataSource := aDataSource;
  FDAO.DataSource(FDataSource);
end;

destructor TModelProduto.Destroy;
begin
  FreeAndNil(FEntidade);
  inherited;
end;

function TModelProduto.Entidade: TPRODUTO;
begin
  Result := FEntidade;
end;

class function TModelProduto.New: iModelProduto;
begin
  Result := Self.Create;
end;

end.
