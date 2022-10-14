unit unit_usuarios_cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Buttons, Vcl.DBCtrls,
  Vcl.Mask, classe.profissionais, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, ACBrBase, ACBrEnterTab;

type
  Tform_usuarios_cadastro = class(TForm)
    shape_fundo_form_agendamento: TShape;
    PanelAgrupaCamposAgendamento: TPanel;
    PanelContainer: TPanel;
    LabelNoemProfissional: TLabel;
    LabelConfirmarSenha: TLabel;
    LabelTituloCadastrarUsuarios: TLabel;
    PanelBotoesAgendarCancelar: TPanel;
    PanelBotaoAgendar: TPanel;
    PanelBotaoCancelar: TPanel;
    SpeedButtonSalvar: TSpeedButton;
    SpeedButtonCancelar: TSpeedButton;
    EditNomeUsuario: TEdit;
    PanelBordaNomeUsuario: TPanel;
    PanelBordaSenha: TPanel;
    EditSenha: TEdit;
    Senha: TLabel;
    PanelBordaConfirmarSenha: TPanel;
    Label10: TLabel;
    Label2: TLabel;
    dbl_cmb_grupo_usuarios: TDBLookupComboBox;
    SpeedButtonCadastrarGrupoUsuarios: TSpeedButton;
    Label1: TLabel;
    PanelBordaTitulo: TPanel;
    LabelRepetirSenha: TLabel;
    EditRepetirSenha: TEdit;
    Label4: TLabel;
    PanelBordaLogin: TPanel;
    EditLogin: TEdit;
    Label3: TLabel;
    Label5: TLabel;
    ACBrEnterTab1: TACBrEnterTab;
    dsc_grupo: TDataSource;
    procedure SpeedButtonCancelarClick(Sender: TObject);
    procedure SpeedButtonSalvarMouseEnter(Sender: TObject);
    procedure SpeedButtonSalvarMouseLeave(Sender: TObject);
    procedure SpeedButtonCancelarMouseEnter(Sender: TObject);
    procedure SpeedButtonCancelarMouseLeave(Sender: TObject);
    procedure SpeedButtonSalvarClick(Sender: TObject);
    procedure SpeedButtonCadastrarGrupoUsuariosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    senha_original : String;
  end;

var
  form_usuarios_cadastro: Tform_usuarios_cadastro;

implementation

{$R *.dfm}

uses unit_dados, unit_funcoes, unit_usuarios_grupos_consulta, unit_usuarios_permissoes;

procedure Tform_usuarios_cadastro.FormShow(Sender: TObject);
begin
  DataModule1.Usuarios.prc_consultar_grupos_usuarios('');
  dsc_grupo.DataSet := DataModule1.Usuarios.QryGruposUsuarios;
end;

procedure Tform_usuarios_cadastro.SpeedButtonCadastrarGrupoUsuariosClick(Sender: TObject);
begin
  try
    form_usuarios_grupos_consulta := Tform_usuarios_grupos_consulta.Create(Self);
    form_usuarios_grupos_consulta.ShowModal;

    DataModule1.Usuarios.prc_consultar_grupos_usuarios('');
    dsc_grupo.DataSet := DataModule1.Usuarios.QryGruposUsuarios;
  finally
    form_usuarios_grupos_consulta.Free;
  end;
end;

procedure Tform_usuarios_cadastro.SpeedButtonCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure Tform_usuarios_cadastro.SpeedButtonCancelarMouseEnter(Sender: TObject);
begin
  SpeedButtonCancelar.Font.Color := $00591A05;
end;

procedure Tform_usuarios_cadastro.SpeedButtonCancelarMouseLeave(Sender: TObject);
begin
  SpeedButtonCancelar.Font.Color := clWhite;
end;

procedure Tform_usuarios_cadastro.SpeedButtonSalvarClick(Sender: TObject);
var
  sErro,
  sTipoOperacao : String;
begin
  prcValidarCamposObrigatorios(form_usuarios_cadastro);

  if EditSenha.Text <> EditRepetirSenha.Text then
  begin
    fnc_criar_mensagem('CADASTRAR USUÁRIO',
                       'Erro ao Repetir Senha do Usuário',
                       'Senhas digitadas não conferem!',
                       ExtractFilePath(Application.ExeName) + 'imagens\erro.png',
                       'ERRO');

    EditSenha.SetFocus;
    Abort;
  end;

  if DataModule1.Usuarios.id_usuarios > 0 then

    sTipoOperacao := 'ALTERAR'
  else
    sTipoOperacao := 'INSERIR';

  with DataModule1.Usuarios do
  begin
     ds_usuario    := EditNomeUsuario.Text;
     ds_login      := EditLogin.Text;

     // Se senha digitada for diferente da senha armazenada, usuario mudou de senha
     if EditSenha.Text <> UpperCase(senha_original) then
       // Então é preciso criptografar a nova senha
       ds_senha := MD5(EditSenha.Text)
     else
      // Se a senha não for alterada, manda a senha original do Banco de Dados
       ds_senha := senha_original;

     cd_permissao  := dbl_cmb_grupo_usuarios.KeyValue;

     if fnc_operacoes_crud(sTipoOperacao, '', sErro) then
     begin
        fnc_criar_mensagem('CADASTRAR USUÁRIO',
                           'Inserir/Alterar Dados do Usuário',
                           'Dados salvo com sucesso!',
                           ExtractFilePath(Application.ExeName) + 'imagens\sucesso.png',
                           'ERRO');

        Close;
     end else
     begin
        fnc_criar_mensagem('CADASTRAR USUÁRIO',
                           'ERRO ao Inserir/Alterar Dados do Usuário',
                           'Erro: ' + sErro,
                           ExtractFilePath(Application.ExeName) + 'imagens\erro.png',
                           'ERRO');

        EditNomeUsuario.SetFocus;
     end;
  end;
end;

procedure Tform_usuarios_cadastro.SpeedButtonSalvarMouseEnter(Sender: TObject);
begin
   SpeedButtonSalvar.Font.Color := $00591A05;
end;

procedure Tform_usuarios_cadastro.SpeedButtonSalvarMouseLeave(Sender: TObject);
begin
  SpeedButtonSalvar.Font.Color := clWhite;
end;

end.
