unit unit_profissionais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Buttons, Vcl.DBCtrls,
  Vcl.Mask, unit_dados, classe.profissionais, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  Tform_profissionais = class(TForm)
    shape_fundo_form_agendamento: TShape;
    PanelAgrupaCamposAgendamento: TPanel;
    PanelContainer: TPanel;
    LabelNoemProfissional: TLabel;
    LabelCelular: TLabel;
    LabelTituloCadastrarProfissional: TLabel;
    MaskEditCelular: TMaskEdit;
    PanelBotoesAgendarCancelar: TPanel;
    PanelBotaoAgendar: TPanel;
    PanelBotaoCancelar: TPanel;
    SpeedButtonAgendar: TSpeedButton;
    SpeedButtonCancelar: TSpeedButton;
    EditNomeProfissional: TEdit;
    PanelBordaNomeProfissional: TPanel;
    PanelBordaEspecialidade: TPanel;
    EditEspecialidade: TEdit;
    LabelEspecialidade: TLabel;
    PanelBordaCelular: TPanel;
    dbg_registros: TDBGrid;
    Label1: TLabel;
    ds_profissionais: TDataSource;
    procedure SpeedButtonCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbg_registrosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
      Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_profissionais: Tform_profissionais;

implementation

{$R *.dfm}


procedure Tform_profissionais.dbg_registrosDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  //prcDrawColumnCell(dbg_registros, Rect, DataCol, Column, State);
  //prcAjustaTamanhoLinha(dbg_Registros, 33);
end;

procedure Tform_profissionais.FormShow(Sender: TObject);
begin
  ds_profissionais.DataSet := DataModule1.Profissional.fnc_consulta('');
end;

procedure Tform_profissionais.SpeedButtonCancelarClick(Sender: TObject);
begin
  Close;
end;

end.
