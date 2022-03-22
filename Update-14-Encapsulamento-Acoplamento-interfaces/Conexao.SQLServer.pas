unit Conexao.SQLServer;

interface

uses
  Interfaces;

type
  TConexaoSQLServer = class(TInterfacedObject, IConexao)
    procedure Gravar;
    procedure Ler;
  end;

implementation

{ TConexaoSQLServer }

procedure TConexaoSQLServer.Gravar;
begin
  // Gravar no Banco
end;

procedure TConexaoSQLServer.Ler;
begin
// Ler dados
end;

end.
