unit Menus.Controller.Entity.Clientes;

interface

uses Menus.Controller.Entity.Interfaces, Menus.Model.Conexoes.Interfaces,
  Menus.Controller.Conexoes.Factory.Conexao,
  Menus.Controller.Conexoes.Factory.DataSet, Menus.Model.Entity.Interfaces,
  Menus.Model.Entity.Factory, Data.DB;

Type
  TControllerEntityCliente = class(TInterfacedObject, iControllerEntity)
    private
      FConexao : iModelConexao;
      FDataSet : iModelDataSet;
      FEntity : iModelEntity;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iControllerEntity;
      function Lista(aDataSource : TDataSource) : iControllerEntity;
  end;

implementation

{ TControllerEntityCliente }

constructor TControllerEntityCliente.Create;
begin
  FConexao := TControllerConexoesFactoryConexao.New.Conexao;
  FDataSet := TControllerConexoesFactoryDataSet.New.DataSet(FConexao);
  FEntity := TModelEntityFactory.New.Clientes(FDataSet);
end;

destructor TControllerEntityCliente.Destroy;
begin

  inherited;
end;

function TControllerEntityCliente.Lista(
  aDataSource: TDataSource): iControllerEntity;
begin
  Result := Self;
  aDataSource.DataSet := TDataSet(FEntity.Listar);
end;

class function TControllerEntityCliente.New: iControllerEntity;
begin
  Result := Self.Create;
end;

end.
