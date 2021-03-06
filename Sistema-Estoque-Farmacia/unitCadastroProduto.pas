unit unitCadastroProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask, Data.DB, Vcl.Grids,
  Vcl.DBGrids;

type
  TfrmCadastroProduto = class(TForm)
    Label1: TLabel;
    DBNavigator1: TDBNavigator;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBGrid1: TDBGrid;
    Button1: TButton;
    DBEdit5: TDBEdit;
    btnExportar: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExportarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroProduto: TfrmCadastroProduto;

implementation

{$R *.dfm}

uses unitDM;

procedure TfrmCadastroProduto.btnExportarClick(Sender: TObject);
var
  LLista : TStringList;
  Llinha : String;
begin
  LLista := TStringList.Create;
  DataModule1.tbProdutos.First;
  while not DataModule1.tbProdutos.Eof do
  begin
    Llinha := DataModule1.tbProdutosid.DisplayText + ';' +
              DataModule1.tbProdutosnome.DisplayText + ';' +
              DataModule1.tbProdutosfabricante.DisplayText;
    LLista.Add(Llinha);
    DataModule1.tbProdutos.Next;
  end;
  if FileExists('D:\Projetos\ws-delphi\My-Delphi-Studies\Sistema-Estoque-Farmacia\exportacao\tbprodutos.csv') then DeleteFile('D:\Projetos\ws-delphi\My-Delphi-Studies\Sistema-Estoque-Farmacia\exportacao\tbprodutos.csv');
    LLista.SaveToFile('D:\Projetos\ws-delphi\My-Delphi-Studies\Sistema-Estoque-Farmacia\exportacao\tbprodutos.csv');
  ShowMessage('Tabela Produtos exportada com Sucesso!');
end;

procedure TfrmCadastroProduto.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadastroProduto.FormShow(Sender: TObject);
begin
  DataModule1.tbProdutos.Refresh;
end;

end.
