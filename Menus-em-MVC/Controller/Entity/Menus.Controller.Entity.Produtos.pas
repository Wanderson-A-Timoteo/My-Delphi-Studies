unit Menus.Controller.Entity.Produtos;

interface

uses Menus.Controller.Entity.Interfaces, Menus.Model.Conexoes.Interfaces,
  Menus.Concoller.Conexoes.Factory.Conexao,
  Menus.Concoller.Conexoes.Factory.DataSet, Menus.Model.Entity.Interfaces,
  Menus.Model.Entity.Factory, Data.DB;

type
  TControllerEntityProdutos = class(TInterfacedObject, iControllerEntity)
    private
    FConexao : iModelConexao;
    FDataSet : iModelDataSet;
    FEntity : iModelEntity;
    public
      constructor Create;
      destructor Destroy; override;

      class function New : iControllerEntity;

      function Lista(aDataSource :TDataSource) : iControllerEntity;

  end;

implementation

{ TControllerEntityProdutos }

constructor TControllerEntityProdutos.Create;
begin
  FConexao := TControllerConexoesFactoryConexao.New.Conexao;
  FDataSet := TControllerConexoesFactoryDataSet.New.DataSet(FConexao);
  FEntity  := TModelEntityFactory.New.Produtos(FDataSet);
end;

destructor TControllerEntityProdutos.Destroy;
begin

  inherited;
end;

function TControllerEntityProdutos.Lista(
  aDataSource: TDataSource): iControllerEntity;
begin
  Result := Self;
  aDataSource.DataSet := TDataSet(FEntity.Listar);
end;

class function TControllerEntityProdutos.New: iControllerEntity;
begin
  Result := Self.Create;
end;

end.
