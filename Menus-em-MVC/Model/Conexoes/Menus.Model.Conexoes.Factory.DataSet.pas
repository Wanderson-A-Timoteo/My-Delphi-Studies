unit Menus.Model.Conexoes.Factory.DataSet;

interface

uses
  Menus.Model.Conexoes.Interfaces, Menus.Model.Conexoes.TableFiredac;

type
  TModelConexoesFactoryDatSet = class(TInterfacedObject, iModelFactoryDataSet)
    private

    public
      constructor Create;
      destructor Destroy; override;

      class function New : iModelFactoryDataSet;

      function DataSetFiredac(Conexao : iModelConexao) : iModelDataSet;
  end;

implementation

{ TModelConexoesFactoryDatSet }

constructor TModelConexoesFactoryDatSet.Create;
begin

end;

function TModelConexoesFactoryDatSet.DataSetFiredac(Conexao : iModelConexao) : iModelDataSet;
begin
  Result := TModelConexoesTableFiredac.New(Conexao);
end;

destructor TModelConexoesFactoryDatSet.Destroy;
begin

  inherited;
end;

class function TModelConexoesFactoryDatSet.New: iModelFactoryDataSet;
begin
  Result := Self.Create;
end;

end.
