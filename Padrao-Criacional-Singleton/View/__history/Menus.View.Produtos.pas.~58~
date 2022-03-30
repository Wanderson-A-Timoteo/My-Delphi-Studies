unit Menus.View.Produtos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Layouts, System.Rtti, FMX.Grid.Style,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,
  FMX.ScrollBox, FMX.Grid, Data.DB, Menus.Controller.Entity.Factory,
  Menus.Controller.Entity.Interfaces, FMX.Edit;

type
  TfrmProduto = class(TForm)
    ToolBar1: TToolBar;
    frmProdutos: TLabel;
    Layout1: TLayout;
    DataSource1: TDataSource;
    StringGrid1: TStringGrid;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    Layout2: TLayout;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure FormCreate(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);

  private
    { Private declarations }
    FEntity : iControllerEntity;
    procedure preencherDados;
  public
    { Public declarations }
  end;

var
  frmProduto: TfrmProduto;

implementation

{$R *.fmx}

uses Menus.Controller.ListBox.Factory, Menus.Controller.ListBox.Interfaces;

procedure TfrmProduto.Button1Click(Sender: TObject);
begin
  DataSource1.DataSet.Append;
end;

procedure TfrmProduto.Button2Click(Sender: TObject);
begin
  DataSource1.DataSet.Edit;
end;

procedure TfrmProduto.Button3Click(Sender: TObject);
begin
  DataSource1.DataSet.Delete;
end;

procedure TfrmProduto.Button4Click(Sender: TObject);
begin
  preencherDados;
  DataSource1.DataSet.Post;
end;

procedure TfrmProduto.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  Edit1.Text := DataSource1.DataSet.FieldByName('CODIGO').AsString;
  Edit2.Text := DataSource1.DataSet.FieldByName('DESCRICAO_ABREVIADA').AsString;
end;

procedure TfrmProduto.FormCreate(Sender: TObject);
begin
  FEntity := TControllerEntityFactory.New.Produto.Lista(DataSource1);
  TControllerListBoxFactory.New.Produtos(Layout1).Exibir;
end;

procedure TfrmProduto.preencherDados;
begin
  DataSource1.DataSet.FieldByName('CODIGO').Value := Edit1.Text;
  DataSource1.DataSet.FieldByName('DESCRICAO_ABREVIADA').Value := Edit2.Text;
end;

initialization
  RegisterFmxClasses([TfrmProduto]);

end.
