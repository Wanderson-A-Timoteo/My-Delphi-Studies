unit Menus.Controller.Entity.Produtos;

interface

uses Menus.Controller.Entity.Interfaces, Menus.Model.Conexoes.Interfaces,
  Menus.Controller.Conexoes.Factory.Conexao,
  Menus.Controller.Conexoes.Factory.DataSet, Menus.Model.Entity.Interfaces,
  Menus.Model.Entity.Factory, Data.DB, Menus.Controller.Conexoes.Interfaces,
  Menus.Controller.Conexoes.Facade;

Type
  TControllerEntityProdutos = class(TInterfacedObject, iControllerEntity)
    private
      FFacadeConexao : iControllerConexoesFacade;
      FEntity : iModelEntity;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iControllerEntity;
      function Lista(aDataSource : TDataSource) : iControllerEntity;
  end;

implementation

{ TControllerEntityProdutos }

constructor TControllerEntityProdutos.Create;
begin
  FFacadeConexao := TControllerConexoesFacade.New;
  FEntity := TModelEntityFactory.New.Produtos(FFacadeConexao.iDataSet);
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
