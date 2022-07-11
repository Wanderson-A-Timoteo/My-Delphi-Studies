unit classe.usuarios;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, Vcl.Forms, unit_dados;

type
  TUsuarios = class

    private
      Fcd_permissao: Integer;
      Fs_senha: String;
      Fds_login: String;
      Fds_usuario: String;
      Fid_usuarios: Integer;
      FConexao: TFDConnection;

    public

      property Conexao      : TFDConnection read FConexao      write FConexao;
      property id_usuarios  : Integer       read Fid_usuarios  write Fid_usuarios;
      property ds_usuario   : String        read Fds_usuario   write Fds_usuario;
      property ds_login     : String        read Fds_login     write Fds_login;
      property ds_senha     : String        read Fs_senha      write Fs_senha;
      property cd_permissao : Integer       read Fcd_permissao write Fcd_permissao;

      constructor Create(Conexao : TFDConnection);
      destructor Destroy; Override;
  end;

var
 QryConsulta : TFDQuery;

implementation

{ TUsuarios }

constructor TUsuarios.Create(Conexao: TFDConnection);
begin
  FConexao := Conexao;
  QryConsulta := TFDQuery.Create(nil);
  QryConsulta.Connection := FConexao;
end;

destructor TUsuarios.Destroy;
begin
  QryConsulta.Free;
  inherited;
end;

end.
