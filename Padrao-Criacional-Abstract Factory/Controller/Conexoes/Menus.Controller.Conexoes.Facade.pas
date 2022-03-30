unit Menus.Controller.Conexoes.Facade;

interface

uses Menus.Controller.Conexoes.Interfaces, Menus.Model.Conexoes.Interfaces,
  Menus.Controller.Conexoes.Factory.Conexao,
  Menus.Controller.Conexoes.Factory.DataSet;

Type
  TControllerConexoesFacade = class(TInterfacedObject, iControllerConexoesFacade)
    private
      FConexao : iModelConexao;
      FDataSet : iModelDataSet;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iControllerConexoesFacade;
      function iConexao : iModelConexao;
      function iDataSet : iModelDataSet;
  end;

implementation

{ TControllerConexoesFacade }

constructor TControllerConexoesFacade.Create;
begin
  FConexao := TControllerConexoesFactoryConexao.New.Conexao;
  FDataSet := TControllerConexoesFactoryDataSet.New.DataSet(FConexao);
end;

destructor TControllerConexoesFacade.Destroy;
begin

  inherited;
end;

function TControllerConexoesFacade.iConexao: iModelConexao;
begin
  Result := FConexao;
end;

function TControllerConexoesFacade.iDataSet: iModelDataSet;
begin
  Result := FDataSet;
end;

class function TControllerConexoesFacade.New: iControllerConexoesFacade;
begin
  Result := Self.Create;
end;

end.
