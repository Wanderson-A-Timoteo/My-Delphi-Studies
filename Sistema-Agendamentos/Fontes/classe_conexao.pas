unit classe_conexao;

interface

uses
  FireDAC.Comp.Client, FireDAC.Stan.Intf, System.SysUtils,
  Vcl.Forms;

type
  TConexao = class
    private
      FServidor: String;
      FMsgErro: String;
      FSenha: String;
      FBase: String;
      FLogin: String;
      FPorta: String;
      FDriverId: String;
      FConexao: TFDConnection;
    public
      constructor Create(NomeConexao : TFDConnection);
      destructor Destroy; override;

      function fnc_ler_arquivo_INI: Boolean;
      function fnc_conectar_banco_dados : Boolean;

      procedure GravarArquivoINI;

      property Conexao  : TFDConnection Read FConexao  Write FConexao;
      property Servidor : String        Read FServidor Write FServidor;
      property Base     : String        Read FBase     Write FBase;
      property Login    : String        Read FLogin    Write FLogin;
      property Senha    : String        Read FSenha    Write FSenha;
      property Porta    : String        Read FPorta    Write FPorta;
      property DriverId : String        Read FDriverId Write FDriverId;
      property MsgErro  : String        Read FMsgErro  Write FMsgErro;
  end;

implementation

uses
  System.IniFiles, unit_funcoes;

{ TConexao }

constructor TConexao.Create(NomeConexao: TFDConnection);
begin
  FConexao :=  NomeConexao;
end;

destructor TConexao.Destroy;
begin
  FConexao.Connected := False;
  inherited;
end;

function TConexao.fnc_conectar_banco_dados: Boolean;
begin
  Result := True;

  FConexao.Params.Clear;

  if not fnc_ler_arquivo_INI then
  begin
    Result := False;
    FMsgErro := 'O arquivo INI de configura��o n�o foi encontrado!';
  end else
  begin
    FConexao.Params.Add('Server=' + FServidor);
    FConexao.Params.Add('User_Name=' + FLogin);
    FConexao.Params.Add('Password=' + FSenha);
    FConexao.Params.Add('Port=' + FPorta);
    FConexao.Params.Add('Database=' + FBase);
    FConexao.Params.Add('DriverID=' + FDriverId);
    try
      FConexao.Connected := true;
    except
      on e:Exception do
      begin
        FMsgErro := e.Message;
        Result := False;
      end;
    end;
  end;
end;

procedure TConexao.GravarArquivoINI;
var
  IniFile: String;
  Ini: TIniFile;
begin
  IniFile := ChangeFileExt(Application.Exename, '.ini');
  Ini := TIniFile.Create(IniFile);

  try
    ini.WriteString('Configuracao', 'Servidor', FServidor);
    ini.WriteString('Configuracao', 'Base', FBase);
    ini.WriteString('Configuracao', 'Porta', FPorta);
    ini.WriteString('Acesso', 'Login', FLogin);
    ini.WriteString('Acesso', 'Senha', Criptografia(FSenha, 'SGAC'));
    ini.WriteString('Acesso', 'DriverID', FDriverId);
  finally
    Ini.Free;
  end;

end;


function TConexao.fnc_ler_arquivo_INI : boolean;
var
  IniFile: String;
  Ini: TIniFile;
begin
  IniFile := ChangeFileExt(Application.Exename, '.ini');
  Ini     := TIniFile.Create(IniFile);

  if not FileExists(IniFile) then
    Result := False
  else
    begin
      try
      FServidor := ini.ReadString('Configuracao', 'Servidor','');
      FBase     := ini.ReadString('Configuracao', 'Base', '');
      FPorta    := ini.ReadString('Configuracao', 'Porta', '');
      FLogin    := ini.ReadString('Acesso', 'Login', '');
      FDriverId := ini.ReadString('Acesso', 'DriverID', '');

      FSenha    := ini.ReadString('Acesso', 'Senha', '');
      FSenha    := Criptografia(FSenha, 'SGAC');
    finally
      Result := True;
      Ini.Free;
    end;
  end;
end;

end.
