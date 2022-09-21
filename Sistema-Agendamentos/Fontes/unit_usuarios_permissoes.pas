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
    Cds_modulos: TClientDataSet;
    Cds_modulosid_item: TIntegerField;
    Cds_modulosds_modulo: TStringField;
    Cds_modulosabrir: TBooleanField;
    Cds_modulosinserir: TBooleanField;
    Cds_modulosalterar: TBooleanField;
    Cds_modulosexcluir: TBooleanField;
    Cds_modulosimprimir: TBooleanField;
    procedure SpeedButtonCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbg_registrosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
      Column: TColumn; State: TGridDrawState);
    procedure dbg_registrosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButtonAgendarMouseEnter(Sender: TObject);
    procedure SpeedButtonAgendarMouseLeave(Sender: TObject);
    procedure SpeedButtonCancelarMouseEnter(Sender: TObject);
    procedure SpeedButtonCancelarMouseLeave(Sender: TObject);
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
  DataModule1.Usuarios.fnc_carrega_modulos( Cds_modulos );
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