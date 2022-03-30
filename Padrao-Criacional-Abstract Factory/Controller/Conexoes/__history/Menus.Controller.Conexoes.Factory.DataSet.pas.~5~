unit Menus.Controller.Conexoes.Factory.DataSet;

interface

uses Menus.Controller.Conexoes.Interfaces, Menus.Model.Conexoes.Interfaces,
  Menus.Model.Conexoes.Factory.DataSet;

Type
  TControllerConexoesFactoryDataSet = class(TInterfacedObject, iControllerFactoryDataSet)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iControllerFactoryDataSet;
      function DataSet(Conexao : iModelConexao) : iModelDataSet;
  end;

implementation

{ TControllerConexoesFactoryDataSet }

constructor TControllerConexoesFactoryDataSet.Create;
begin

end;

function TControllerConexoesFactoryDataSet.DataSet(Conexao : iModelConexao) : iModelDataSet;
begin
  Result := TModelConexaoFactoryDataSet.New.DataSetFiredac(Conexao);
end;

destructor TControllerConexoesFactoryDataSet.Destroy;
begin

  inherited;
end;

class function TControllerConexoesFactoryDataSet.New: iControllerFactoryDataSet;
begin
  Result := Self.Create;
end;

end.
