unit SistemaFinanceiro.Model.Conexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TdmConexao = class(TDataModule)
    SQLConexao: TFDConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    const ARQUIVOCONFIGURACAO = 'SistemaFinanceiro.cfg';
  public
    { Public declarations }
    procedure CarregarConfiguracoes;
    procedure Conectar;
    procedure Desconectar;
  end;

var
  dmConexao: TdmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }

procedure TdmConexao.CarregarConfiguracoes;
var
  ParametroNome: String;
  ParametroValor : String;
  Contador: Integer;
  ListaParametros: TStringList;
begin
  SQLConexao.Params.Clear;
  if not FileExists(ARQUIVOCONFIGURACAO) then
    raise Exception.Create('Error: Arquivo de configura��o do Banco de Dados n�o encontrado.');
  ListaParametros := TStringList.Create;
  try
    ListaParametros.LoadFromFile(ARQUIVOCONFIGURACAO);
    for Contador := 0 to Pred(ListaParametros.Count) do
    begin
      if ListaParametros[Contador].IndexOf('=') > 0 then
      begin
        ParametroNome  := ListaParametros[Contador].Split(['='])[0].Trim; // Trim retira os espa�os
        ParametroValor := ListaParametros[Contador].Split(['='])[1].Trim;
        SQLConexao.Params.Add(ParametroNome + '=' + ParametroValor);
      end;
    end;

  finally
    ListaParametros.Free;
  end;
end;

procedure TdmConexao.Conectar;
begin
  SQLConexao.Connected;
end;

procedure TdmConexao.DataModuleCreate(Sender: TObject);
begin
  CarregarConfiguracoes;
  Conectar;
end;

procedure TdmConexao.Desconectar;
begin
  SQLConexao.Connected := False;
end;

end.
