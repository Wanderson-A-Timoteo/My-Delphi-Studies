unit unitConsultaMovimentacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, JvExMask, JvToolEdit,
  JvMaskEdit, Vcl.ExtCtrls;

type
  TfrmConsultaMovimentacao = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    txtDataInicial: TJvMaskEdit;
    txtDataFinal: TJvMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    btnConsultarMovimentacoes: TButton;
    Label4: TLabel;
    DBGridMovimentacoes: TDBGrid;
    DBGridProdutos: TDBGrid;
    Label5: TLabel;
    lblTotal: TLabel;
    procedure btnConsultarMovimentacoesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaMovimentacao: TfrmConsultaMovimentacao;

implementation

{$R *.dfm}

uses unitDM;

procedure TfrmConsultaMovimentacao.btnConsultarMovimentacoesClick(Sender: TObject);
begin
  DataModule1.sqlMovimentacoes.Close;
  DataModule1.sqlMovimentacoes.SQL.Clear;
  DataModule1.sqlMovimentacoes.SQL.Text := 'SELECT * FROM movimentacoes WHERE Date(data_hora) BETWEEN :pDataInicial AND :pDataFinal';
  DataModule1.sqlMovimentacoes.ParamByName('pDataInicial').Value := StrToDate(txtDataInicial.Text);
  DataModule1.sqlMovimentacoes.ParamByName('pDataFinal').Value := StrToDate(txtDataFinal.Text);
  DataModule1.sqlMovimentacoes.Open;

  lblTotal.Caption := IntToStr(DataModule1.sqlMovimentacoes.RecordCount);
end;

procedure TfrmConsultaMovimentacao.FormShow(Sender: TObject);
begin
  DataModule1.sqlMovimentacoes.Refresh;
  DataModule1.sqlMovimentacoesProdutos.Refresh;
  lblTotal.Caption := IntToStr(DataModule1.sqlMovimentacoes.RecordCount);
end;

end.
