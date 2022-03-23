unit Conexao.MySQL;

interface

uses
  Interfaces;

type
  TConexaoMySQL = class(TInterfacedObject, IConexao)
    procedure Gravar;
    procedure Ler;
end;

implementation

{ TConexaoMySQL }

procedure TConexaoMySQL.Gravar;
begin
// Gravar no Banco
end;

procedure TConexaoMySQL.Ler;
begin
// Ler dados
end;

end.
