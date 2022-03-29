unit Menus.Model.Conexoes.TableFiredac;

interface

uses
  Menus.Model.Conexoes.Interfaces, FireDAC.Comp.Client, System.Classes;

type
  TModelConexoesTableFiredac = class(TInterfacedObject, iModelDataSet)
    private
      FTable : TFDTable;
    public
      constructor Create(Conexao : iModelConexao);
      destructor Destroy; override;

      class function New(Conexao : iModelConexao) : iModelDataSet;

      function Open(aTable : String) : iModelDataSet;
      function EndDataSet : TComponent;
  end;

implementation

{ TModelConexoesTableFiredac }

constructor TModelConexoesTableFiredac.Create(Conexao : iModelConexao);
begin
  FTable := TFDTable.Create(nil);
  FTable.Connection := (Conexao.EndConexao as TFDConnection);
end;

destructor TModelConexoesTableFiredac.Destroy;
begin
  FTable.Free;
  inherited;
end;

function TModelConexoesTableFiredac.EndDataSet: TComponent;
begin
  Result := FTable;
end;

class function TModelConexoesTableFiredac.New(Conexao : iModelConexao) : iModelDataSet;
begin
  Result := Self.Create(Conexao);
end;

function TModelConexoesTableFiredac.Open(aTable: String): iModelDataSet;
begin
  Result := Self;
  FTable.Open(aTable);
end;

end.
