unit unit_usuarios_permissoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Buttons, Vcl.DBCtrls,
  Vcl.Mask, unit_dados, classe.profissionais, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, ACBrBase, ACBrEnterTab, Datasnap.DBClient;

type
  Tform_usuarios_permissoes = class(TForm)
    shape_fundo_form_agendamento: TShape;
    PanelAgrupaCamposAgendamento: TPanel;
    PanelContainer: TPanel;
    LabelNoemProfissional: TLabel;
    LabelTituloCadastrarProfissional: TLabel;
    PanelBotoesAgendarCancelar: TPanel;
    PanelBotaoAgendar: TPanel;
    PanelBotaoCancelar: TPanel;
    SpeedButtonAgendar: TSpeedButton;
    SpeedButtonCancelar: TSpeedButton;
    EditNomeProfissional: TEdit;
    PanelBordaNomeProfissional: TPanel;
    dbg_registros: TDBGrid;
    Label1: TLabel;
    ds_permissoes: TDataSource;
    Label10: TLabel;
    ACBrEnterTab1: TACBrEnterTab;
    PnlBordaDBGrid: TPanel;
    cds_modulos: TClientDataSet;
    cds_modulosid_item: TIntegerField;
    cds_modulosabrir: TBooleanField;
    cds_modulosinserir: TBooleanField;
    cds_modulosalterar: TBooleanField;
    cds_modulosexcluir: TBooleanField;
    cds_modulosimprimir: TBooleanField;
    cds_modulosds_modulo: TStringField;
    procedure SpeedButtonCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbg_registrosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
      Column: TColumn; State: TGridDrawState);
    procedure dbg_registrosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButtonAgendarMouseEnter(Sender: TObject);
    procedure SpeedButtonAgendarMouseLeave(Sender: TObject);
    procedure SpeedButtonCancelarMouseEnter(Sender: TObject);
    procedure SpeedButtonCancelarMouseLeave(Sender: TObject);
    procedure dbg_registrosCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_usuarios_permissoes: Tform_usuarios_permissoes;

implementation

{$R *.dfm}

uses unit_funcoes;


procedure Tform_usuarios_permissoes.dbg_registrosCellClick(Column: TColumn);
begin
  if (Column.FieldName <> 'ds_modulo') then
  begin
    cds_modulos.Edit;
    cds_modulos.FieldByName( Column.FieldName ).AsBoolean := not cds_modulos.FieldByName( Column.FieldName ).AsBoolean;
    cds_modulos.Post;
  end;
end;

procedure Tform_usuarios_permissoes.dbg_registrosDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  //prcDrawColumnCell(dbg_registros, Rect, DataCol, Column, State);
  //prcAjustaTamanhoLinha(dbg_Registros, 33);
end;

procedure Tform_usuarios_permissoes.dbg_registrosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (not (dbg_registros.DataSource.DataSet.IsEmpty)) AND (key = VK_DELETE) then
    DataModule1.Profissional.prc_deleta(dbg_registros.DataSource.DataSet.FieldByName('id_profissional').AsInteger );

  //prcAjustaTamanhoLiha(dbg_Registros, 33);
end;

procedure Tform_usuarios_permissoes.FormShow(Sender: TObject);
begin
  cds_modulos.Close;
  cds_modulos.CreateDataSet;
  DataModule1.Usuarios.prc_carrega_modulos( cds_modulos );
  //prcAjustaTamanhoLinha(dbg_registros, 33);
end;

procedure Tform_usuarios_permissoes.SpeedButtonAgendarMouseEnter(Sender: TObject);
begin
  SpeedButtonAgendar.Font.Color := $00591A05;
end;

procedure Tform_usuarios_permissoes.SpeedButtonAgendarMouseLeave(Sender: TObject);
begin
  SpeedButtonAgendar.Font.Color := clWhite;
end;

procedure Tform_usuarios_permissoes.SpeedButtonCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure Tform_usuarios_permissoes.SpeedButtonCancelarMouseEnter(Sender: TObject);
begin
  SpeedButtonCancelar.Font.Color := $00591A05;
end;

procedure Tform_usuarios_permissoes.SpeedButtonCancelarMouseLeave(Sender: TObject);
begin
  SpeedButtonCancelar.Font.Color := clWhite;
end;

end.
