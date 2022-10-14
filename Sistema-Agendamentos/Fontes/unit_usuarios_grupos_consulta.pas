unit unit_usuarios_grupos_consulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Buttons, Vcl.DBCtrls,
  Vcl.Mask, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  Tform_usuarios_grupos_consulta = class(TForm)
    shape_fundo_form_agendamento: TShape;
    PanelAgrupaCamposConsulta: TPanel;
    PanelContainer: TPanel;
    LabelConsultaNomeCliente: TLabel;
    LabelTituloConsultarUsuarios: TLabel;
    PanelBotaoConsultar: TPanel;
    SpeedButtonConsultarGruposUsuario: TSpeedButton;
    EditConsultaNomeGrupoUsuario: TEdit;
    PanelBordaConsultaNomeCliente: TPanel;
    dbg_registros_consulta_usuarios: TDBGrid;
    LabelClientesCadastrados: TLabel;
    ds_grupos_usuario_consulta: TDataSource;
    Label1: TLabel;
    PanelBotaoCadastrarNovoCliente: TPanel;
    SpeedButtonCadastrarNovoGrupo: TSpeedButton;
    PanelBotoesCadastrarNovoClienteFechar: TPanel;
    PanelBotaoCancelar: TPanel;
    SpeedButtonCancelarConsulta: TSpeedButton;
    labelMsnDELouEdit: TLabel;
    PanelBordaGrid: TPanel;
    procedure SpeedButtonCancelarConsultaClick(Sender: TObject);
    procedure SpeedButtonCancelarConsultaMouseEnter(Sender: TObject);
    procedure SpeedButtonCancelarConsultaMouseLeave(Sender: TObject);
    procedure SpeedButtonCadastrarNovoGrupoMouseLeave(Sender: TObject);
    procedure SpeedButtonCadastrarNovoGrupoMouseEnter(Sender: TObject);
    procedure SpeedButtonConsultarGruposUsuarioClick(Sender: TObject);
    procedure SpeedButtonConsultarGruposUsuarioMouseEnter(Sender: TObject);
    procedure SpeedButtonConsultarGruposUsuarioMouseLeave(Sender: TObject);
    procedure dbg_registros_consulta_usuariosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
      Column: TColumn; State: TGridDrawState);
    procedure SpeedButtonCadastrarNovoGrupoClick(Sender: TObject);
    procedure EditConsultaNomeGrupoUsuarioKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    //LUsuarios : TUsuario;
  end;

type
  TDBGridPadrao = class(TDBGrid);

var
  form_usuarios_grupos_consulta: Tform_usuarios_grupos_consulta;

implementation

{$R *.dfm}

uses unit_dados, unit_funcoes, unit_usuarios_permissoes;


procedure Tform_usuarios_grupos_consulta.dbg_registros_consulta_usuariosDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  // Zebrando o DBGrid
  if Odd(dbg_registros_consulta_usuarios.DataSource.DataSet.RecNo) then
    dbg_registros_consulta_usuarios.Canvas.Brush.Color := $00E9E9E9
  else
    dbg_registros_consulta_usuarios.Canvas.Brush.Color := clWhite; // $00F9F9F9;

  // Mudando a cor da seleção
  if (gdSelected in State) then
  begin
    dbg_registros_consulta_usuarios.Canvas.Brush.Color := $00FF8000;
    dbg_registros_consulta_usuarios.Canvas.Font.Color  := clWhite; // $00844726;
    dbg_registros_consulta_usuarios.Canvas.Font.Style  := [fsBold]; // $00844726;
  end;

  dbg_registros_consulta_usuarios.Canvas.FillRect(Rect);
  dbg_registros_consulta_usuarios.DefaultDrawColumnCell(Rect, DataCol, Column, State);


  // Mudando a posição e alinhando vertical do texto de cada linha
  dbg_registros_consulta_usuarios.Canvas.TextRect(Rect, Rect.Left + 8, Rect.Top + 8, Column.Field.DisplayText);
end;

procedure Tform_usuarios_grupos_consulta.EditConsultaNomeGrupoUsuarioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
  begin
    DataModule1.Usuarios.prc_consultar_grupos_usuarios(EditConsultaNomeGrupoUsuario.Text);
    ds_grupos_usuario_consulta.DataSet := DataModule1.Usuarios.QryGruposUsuarios;
    //pcrAjustaTamanhoLinha(dbg_registros_consulta_usuarios, 30);
  end;
end;

procedure Tform_usuarios_grupos_consulta.SpeedButtonCadastrarNovoGrupoClick(Sender: TObject);
begin
  try
    form_usuarios_permissoes := Tform_usuarios_permissoes.Create(Self);
    form_usuarios_permissoes.ShowModal;
  finally
    form_usuarios_permissoes.Free;
  end;
end;

procedure Tform_usuarios_grupos_consulta.SpeedButtonCadastrarNovoGrupoMouseEnter(Sender: TObject);
begin
  SpeedButtonCadastrarNovoGrupo.Font.Color := $00591A05;
end;

procedure Tform_usuarios_grupos_consulta.SpeedButtonCadastrarNovoGrupoMouseLeave(Sender: TObject);
begin
  SpeedButtonCadastrarNovoGrupo.Font.Color := clWhite;
end;

procedure Tform_usuarios_grupos_consulta.SpeedButtonCancelarConsultaClick(Sender: TObject);
begin
  Close;
end;

procedure Tform_usuarios_grupos_consulta.SpeedButtonCancelarConsultaMouseEnter(Sender: TObject);
begin
  SpeedButtonCancelarConsulta.Font.Color := $00591A05;
end;

procedure Tform_usuarios_grupos_consulta.SpeedButtonCancelarConsultaMouseLeave(Sender: TObject);
begin
  SpeedButtonCancelarConsulta.Font.Color := clWhite;
end;

procedure Tform_usuarios_grupos_consulta.SpeedButtonConsultarGruposUsuarioClick(Sender: TObject);
begin
  DataModule1.Usuarios.prc_consultar_grupos_usuarios(EditConsultaNomeGrupoUsuario.Text);
  ds_grupos_usuario_consulta.DataSet := DataModule1.Usuarios.QryGruposUsuarios;
  //pcrAjustaTamanhoLinha(dbg_registros_consulta_usuarios, 30);

end;

procedure Tform_usuarios_grupos_consulta.SpeedButtonConsultarGruposUsuarioMouseEnter(Sender: TObject);
begin
  SpeedButtonConsultarGruposUsuario.Font.Color := $00591A05;
end;

procedure Tform_usuarios_grupos_consulta.SpeedButtonConsultarGruposUsuarioMouseLeave(Sender: TObject);
begin
  SpeedButtonConsultarGruposUsuario.Font.Color := clWhite;
end;

end.
