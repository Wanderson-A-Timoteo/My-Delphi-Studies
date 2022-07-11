unit unit_usuarios_cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Buttons, Vcl.DBCtrls,
  Vcl.Mask, unit_dados, classe.profissionais, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

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
    procedure SpeedButtonCancelarClick(Sender: TObject);
    procedure SpeedButtonSalvarMouseEnter(Sender: TObject);
    procedure SpeedButtonSalvarMouseLeave(Sender: TObject);
    procedure SpeedButtonCancelarMouseEnter(Sender: TObject);
    procedure SpeedButtonCancelarMouseLeave(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_usuarios_cadastro: Tform_usuarios_cadastro;

implementation

{$R *.dfm}

uses unit_funcoes;

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

procedure Tform_usuarios_cadastro.SpeedButtonSalvarMouseEnter(Sender: TObject);
begin
   SpeedButtonSalvar.Font.Color := $00591A05;
end;

procedure Tform_usuarios_cadastro.SpeedButtonSalvarMouseLeave(Sender: TObject);
begin
  SpeedButtonSalvar.Font.Color := clWhite;
end;

end.
