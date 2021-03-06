unit unit_usuarios_consulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Buttons, Vcl.DBCtrls,
  Vcl.Mask, unit_dados, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, classe.cliente;

type
  Tform_usuario_consulta = class(TForm)
    shape_fundo_form_agendamento: TShape;
    PanelAgrupaCamposConsulta: TPanel;
    PanelContainer: TPanel;
    LabelConsultaNomeCliente: TLabel;
    LabelTituloConsultarUsuarios: TLabel;
    PanelBotoesConsultarCancelarCadastrarCliente: TPanel;
    PanelBotaoConsultar: TPanel;
    SpeedButtonConsultarUsuario: TSpeedButton;
    EditConsultaNomeUsuario: TEdit;
    PanelBordaConsultaNomeCliente: TPanel;
    dbg_registros_consulta_usuarios: TDBGrid;
    LabelClientesCadastrados: TLabel;
    ds_usuario_consulta: TDataSource;
    Label1: TLabel;
    PanelBotaoCadastrarNovoCliente: TPanel;
    SpeedButtonCadastrarNovoUsuario: TSpeedButton;
    PanelBotoesCadastrarNovoClienteFechar: TPanel;
    PanelBotaoCancelar: TPanel;
    SpeedButtonCancelarConsulta: TSpeedButton;
    labelMsnDELouEdit: TLabel;
    PanelBotaoSelecionarCliente: TPanel;
    SpeedButtonSelecionarUsuario: TSpeedButton;
    Panel1: TPanel;
    procedure SpeedButtonCancelarConsultaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButtonCancelarConsultaMouseEnter(Sender: TObject);
    procedure SpeedButtonCancelarConsultaMouseLeave(Sender: TObject);
    procedure SpeedButtonCadastrarNovoUsuarioMouseLeave(Sender: TObject);
    procedure SpeedButtonCadastrarNovoUsuarioMouseEnter(Sender: TObject);
    procedure SpeedButtonSelecionarUsuarioMouseEnter(Sender: TObject);
    procedure SpeedButtonSelecionarUsuarioMouseLeave(Sender: TObject);
    procedure SpeedButtonCadastrarNovoUsuarioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    //LUsuarios : TUsuario;
  end;

var
  form_usuario_consulta: Tform_usuario_consulta;

implementation

{$R *.dfm}

uses unit_funcoes, unit_clientes, classe_conexao, unit_mensagens, unit_agendamento, unit_agenda, classe.agendamento,
  unit_cliente_consulta, unit_usuarios_cadastro;


procedure Tform_usuario_consulta.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
  begin
    //ds_usuario_consulta.DataSet := LClientes.fnc_consulta( EditConsultaNomeUsuario.Text );
  end;

end;

procedure Tform_usuario_consulta.SpeedButtonCadastrarNovoUsuarioClick(Sender: TObject);
begin
   try
    form_usuarios_cadastro := Tform_usuarios_cadastro.Create(Self);
    form_usuarios_cadastro.ShowModal;
  finally
    form_usuarios_cadastro.Free;
  end;
end;

procedure Tform_usuario_consulta.SpeedButtonCadastrarNovoUsuarioMouseEnter(Sender: TObject);
begin
  SpeedButtonCadastrarNovoUsuario.Font.Color := $00591A05;
end;

procedure Tform_usuario_consulta.SpeedButtonCadastrarNovoUsuarioMouseLeave(Sender: TObject);
begin
  SpeedButtonCadastrarNovoUsuario.Font.Color := clWhite;
end;

procedure Tform_usuario_consulta.SpeedButtonCancelarConsultaClick(Sender: TObject);
begin
  Close;
end;

procedure Tform_usuario_consulta.SpeedButtonCancelarConsultaMouseEnter(Sender: TObject);
begin
  SpeedButtonCancelarConsulta.Font.Color := $00591A05;
end;

procedure Tform_usuario_consulta.SpeedButtonCancelarConsultaMouseLeave(Sender: TObject);
begin
  SpeedButtonCancelarConsulta.Font.Color := clWhite;
end;

procedure Tform_usuario_consulta.SpeedButtonSelecionarUsuarioMouseEnter(Sender: TObject);
begin
  SpeedButtonSelecionarUsuario.Font.Color := $00591A05;
end;

procedure Tform_usuario_consulta.SpeedButtonSelecionarUsuarioMouseLeave(Sender: TObject);
begin
  SpeedButtonSelecionarUsuario.Font.Color := clWhite;
end;

end.
