unit unitDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TDataModule1 = class(TDataModule)
    ConexaoEstoqueFarmacia: TFDConnection;
    tbProdutos: TFDTable;
    DataSourceProdutos: TDataSource;
    DataSourceMovimentacoes: TDataSource;
    DataSourceMovimentacoesProdutos: TDataSource;
    tbMovimentacoes: TFDTable;
    tbMovimentacoesProdutos: TFDTable;
    sqlAumentaEstoque: TFDCommand;
    sqlDiminuiEstoque: TFDCommand;
    sqlMovimentacoes: TFDQuery;
    DataSourceSQLMovimentacoes: TDataSource;
    tbProdutosid: TIntegerField;
    tbProdutosnome: TWideStringField;
    tbProdutosfabricante: TWideStringField;
    tbProdutosvalidade: TDateField;
    tbProdutosestoque_atual: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
