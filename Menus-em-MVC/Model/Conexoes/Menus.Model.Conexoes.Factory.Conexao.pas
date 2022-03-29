unit Menus.Model.Conexoes.Factory.Conexao;

interface

uses
  Menus.Model.Conexoes.Interfaces, Menus.Model.Conexoes.ConexaoFiredac;

type
  TModelConexoesFactoryConexao = class(TInterfacedObject, iModelFactoryConexao)
    private

    public
      constructor Create;
      destructor Destroy; override;

      class function New : iModelFactoryConexao;

      function ConexaoFiredac : iModelConexao;
  end;

implementation

{ TModelConexoesFactoryConexao }

function TModelConexoesFactoryConexao.ConexaoFiredac: iModelConexao;
begin
  Result := TModelConexaoFiredac.New;
end;

constructor TModelConexoesFactoryConexao.Create;
begin

end;

destructor TModelConexoesFactoryConexao.Destroy;
begin

  inherited;
end;

class function TModelConexoesFactoryConexao.New: iModelFactoryConexao;
begin
  Result := Self.Create;
end;

end.
