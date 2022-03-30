unit Menus.Model.Conexoes.Factory.Conexao;

interface

uses Menus.Model.Conexoes.Interfaces, Menus.Model.Conexoes.ConexaoFiredac;

Type
  TModelConexaoFactoryConexoes = class(TInterfacedObject, iModelFactoryConexao)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelFactoryConexao;
      function ConexaoFiredac : iModelConexao;
  end;

implementation

{ TModelConexaoFactoryConexoes }

function TModelConexaoFactoryConexoes.ConexaoFiredac: iModelConexao;
begin
  Result := TModelConexaoFiredac.New;
end;

constructor TModelConexaoFactoryConexoes.Create;
begin

end;

destructor TModelConexaoFactoryConexoes.Destroy;
begin

  inherited;
end;

class function TModelConexaoFactoryConexoes.New: iModelFactoryConexao;
begin
  Result := Self.Create;
end;

end.
