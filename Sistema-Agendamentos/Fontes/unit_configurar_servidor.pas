unit unit_configurar_servidor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Buttons;

type
  Tform_configurar_servidor = class(TForm)
    shape_fundo: TShape;
    PanelConfiguracaoServidor: TPanel;
    PanelConfiguracaoAtualServidor: TPanel;
    PanelNovaConfiguracaoServidor: TPanel;
    pnlContainer: TPanel;
    ImageServidorDados: TImage;
    Label1: TLabel;
    Label2: TLabel;
    pnlConfigServidor: TPanel;
    pnlConfigServidorCancelar: TPanel;
    pnlConfigServidorEntrar: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButtonCancelar: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    PanelBordaNovaConfigServidor: TPanel;
    PanelBordaConfigAtualServidor: TPanel;
    EditNovoNomeServidor: TEdit;
    EditNovaSenha: TEdit;
    EditNovaBaseDados: TEdit;
    EditNovoUsuario: TEdit;
    EditNovaPorta: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    EditAtualNomeServidor: TEdit;
    Label18: TLabel;
    Label20: TLabel;
    Label22: TLabel;
    EditAtualBaseDados: TEdit;
    EditAtualUsuario: TEdit;
    EditAtualSenha: TEdit;
    EditAtualPorta: TEdit;
    Label24: TLabel;
    PanelBordaNovaConfigCaminhoBDServidor: TPanel;
    PanelBordaNovaConfigPorta: TPanel;
    PanelBordaNovaConfigSenha: TPanel;
    PanelBordaNovaConfigUsuario: TPanel;
    PanelBordaNovaConfigBaseDados: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    PanelBordaConfigAtualServidorDriverID: TPanel;
    Label25: TLabel;
    EditAtualDriverID: TEdit;
    Panel6: TPanel;
    Label27: TLabel;
    Label28: TLabel;
    EditNovaDriverID: TEdit;
    procedure SpeedButtonCancelarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_configurar_servidor: Tform_configurar_servidor;

implementation

{$R *.dfm}

uses unit_funcoes, unit_dados, classe_conexao;

procedure Tform_configurar_servidor.FormShow(Sender: TObject);
begin
  if DataModule1.Conexao.fnc_ler_arquivo_INI then
  begin
    EditAtualNomeServidor.Text  := DataModule1.Conexao.Servidor;
    EditAtualBaseDados.Text     := DataModule1.Conexao.Base;
    EditAtualUsuario.Text       := DataModule1.Conexao.Login;
    EditAtualSenha.Text         := DataModule1.Conexao.Senha;
    EditAtualPorta.Text         := DataModule1.Conexao.Porta;
    EditAtualDriverID.Text      := DataModule1.Conexao.DriverId;
  end;
end;

procedure Tform_configurar_servidor.SpeedButton1Click(Sender: TObject);
begin
  prcValidarCamposObrigatorios( form_configurar_servidor );

  DataModule1.Conexao.Servidor := EditNovoNomeServidor.Text;
  DataModule1.Conexao.Base     := EditNovaBaseDados.Text;
  DataModule1.Conexao.Login    := EditNovoUsuario.Text;
  DataModule1.Conexao.Senha    := EditNovaSenha.Text;
  DataModule1.Conexao.Porta    := EditNovaPorta.Text;
  DataModule1.Conexao.DriverId := EditNovaDriverID.Text;

  DataModule1.Conexao.GravarArquivoINI;

  if DataModule1.Conexao.fnc_conectar_banco_dados then
  begin

    fnc_criar_mensagem('CONEXÃO AO BANCO DE DADOS',
                       'Conectado com o Banco de Dados',
                       'Conexão com o Banco de Dados Realizado com Sucesso! ' +
                       'O Sistema precisa ser reiniciado!',
                       ExtractFilePath(Application.ExeName) + 'imagens\aviso.png','OK');
    Application.Terminate;
  end else
  begin
    fnc_criar_mensagem('CONEXÃO AO BANCO DE DADOS',
                      'Erro ao conectar ao Banco de Dados',
                      'Não foi possível conectar ao Banco de Dados, possível causa: ' +
                       DataModule1.Conexao.MsgErro,
                       ExtractFilePath(Application.ExeName) + 'imagens\erro.png','OK');

    EditNovoNomeServidor.SetFocus;
  end;
end;

procedure Tform_configurar_servidor.SpeedButtonCancelarClick(Sender: TObject);
begin
  Close;
end;

end.
