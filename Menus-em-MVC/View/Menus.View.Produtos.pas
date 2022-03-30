unit Menus.View.Produtos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Layouts, Menus.Controller.ListBox.Factory,
  System.Rtti, FMX.Grid.Style, Data.Bind.EngExt, Fmx.Bind.DBEngExt,
  Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope, FMX.ScrollBox,
  FMX.Grid, Data.DB, Menus.Controller.Entity.Interfaces,
  Menus.Controller.Entity.Factory;

type
  TfrmProdutos = class(TForm)
    ToolBar1: TToolBar;
    labelProdutos: TLabel;
    Layout1: TLayout;
    DataSource1: TDataSource;
    StringGrid1: TStringGrid;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FEntity : iControllerEntity;
  public
    { Public declarations }
  end;

var
  frmProdutos: TfrmProdutos;

implementation

{$R *.fmx}

procedure TfrmProdutos.FormCreate(Sender: TObject);
begin
  TControllerListBoxFactory.New.Procutos(Layout1).Exibir;
  FEntity := TControllerEntityFactory.New.Produto.Lista(DataSource1);
end;

initialization
  RegisterFmxClasses([TfrmProdutos]);

end.
