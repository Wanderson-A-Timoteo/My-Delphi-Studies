unit PesquisarCriancas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Comp.Client, System.DateUtils, Vcl.ExtCtrls, UnitNossoMdi;

type
  TFormPesquisarCriancas = class(TForm)
    EditNome: TEdit;
    LabelNome: TLabel;
    SpbPesquisar: TSpeedButton;
    DbgPesquisarCrianca: TDBGrid;
    PanelContainer: TPanel;
    LabelTitulo: TLabel;
    PanelBarraNome: TPanel;
    PanelBarraTitulo: TPanel;
    SpbCadastrar: TSpeedButton;
    SpbSair: TSpeedButton;
    PanelBtnCadastrar: TPanel;
    PanelBtnSair: TPanel;
    SpbFechar: TSpeedButton;
    procedure SpbPesquisarClick(Sender: TObject);
    procedure EditNomeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpbCadastrarClick(Sender: TObject);
    procedure SpbCadastrarMouseEnter(Sender: TObject);
    procedure SpbCadastrarMouseLeave(Sender: TObject);
    procedure SpbSairMouseEnter(Sender: TObject);
    procedure SpbSairMouseLeave(Sender: TObject);
    procedure SpbFecharMouseEnter(Sender: TObject);
    procedure SpbFecharMouseLeave(Sender: TObject);
    procedure DbgPesquisarCriancaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure SpbSairClick(Sender: TObject);
    procedure SpbFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPesquisarCriancas: TFormPesquisarCriancas;

implementation

{$R *.dfm}

uses DMDados, Fontdata.Utils, BibPesquisa , CadastrarCrianca, BibMarco;

procedure TFormPesquisarCriancas.SpbCadastrarMouseEnter(Sender: TObject);
begin
  SpbCadastrar.Font.Color := clBlack;
end;

procedure TFormPesquisarCriancas.SpbCadastrarMouseLeave(Sender: TObject);
begin
  SpbCadastrar.Font.Color := clWhite;
end;

procedure TFormPesquisarCriancas.SpbFecharClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFormPesquisarCriancas.SpbFecharMouseEnter(Sender: TObject);
begin
  SpbFechar.Font.Color := clRed;
end;

procedure TFormPesquisarCriancas.SpbFecharMouseLeave(Sender: TObject);
begin
  SpbFechar.Font.Color := $00DFDFDF;
end;

procedure TFormPesquisarCriancas.SpbSairMouseEnter(Sender: TObject);
begin
  SpbSair.Font.Color := clBlack;
end;

procedure TFormPesquisarCriancas.SpbSairMouseLeave(Sender: TObject);
begin
  SpbSair.Font.Color := clWhite;
end;

procedure TFormPesquisarCriancas.DbgPesquisarCriancaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
begin
  TUtilsVCL.ZebrarDBGrid(DbgPesquisarCrianca, Rect, DataCol, Column, State);
end;

procedure TFormPesquisarCriancas.EditNomeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
    SpbPesquisarClick(Sender);
end;

procedure TFormPesquisarCriancas.FormActivate(Sender: TObject);
begin
  PanelContainer.Left := Round( (FormPesquisarCriancas.Width - PanelContainer.Width) / 2);
  PanelContainer.Top  := Round( (FormPesquisarCriancas.Height - PanelContainer.Height) / 2);
end;

procedure TFormPesquisarCriancas.FormShow(Sender: TObject);
begin
  SpbPesquisarClick(Sender);
end;

procedure TFormPesquisarCriancas.SpbPesquisarClick(Sender: TObject);
var
  LDataHoraAtual: TDateTime;
begin
  LDataHoraAtual := DataModuleDados.DataServidor(False);
  with DataModuleDados.QryPesquisarCrianca do
  begin
    Close;
    ParamByName('nome').AsString                := '%' + EditNome.Text + '%';
    ParamByName('data_hora_inicial').AsDateTime := IncHour(LDataHoraAtual, -12);
    ParamByName('data_hora_final').AsDateTime   := LDataHoraAtual;
    Open;
  end;
end;

procedure TFormPesquisarCriancas.SpbCadastrarClick(Sender: TObject);
begin
  try
     Self.Hide;
     FormCadastrarCrianca := TFormCadastrarCrianca.Create(nil);
     FormCadastrarCrianca.ShowModal;
     Self.Show;
   finally
     FreeAndNil(FormCadastrarCrianca);
   end;
end;

procedure TFormPesquisarCriancas.SpbSairClick(Sender: TObject);
begin
  Close;
end;

end.
