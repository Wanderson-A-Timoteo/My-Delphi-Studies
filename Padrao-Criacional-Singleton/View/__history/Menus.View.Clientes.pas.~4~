unit Menus.View.Clientes;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Layouts, Menus.Controller.Entity.Interfaces,
  Data.DB, System.Rtti, FMX.Grid.Style, Data.Bind.EngExt, Fmx.Bind.DBEngExt,
  Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope, FMX.ScrollBox,
  FMX.Grid;

type
  TfrmClientes = class(TForm)
    ToolBar1: TToolBar;
    frmProdutos: TLabel;
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
  frmClientes: TfrmClientes;

implementation

{$R *.fmx}

uses Menus.Controller.ListBox.Factory, Menus.Controller.Entity.Factory;

procedure TfrmClientes.FormCreate(Sender: TObject);
begin
  FEntity := TControllerEntityFactory.New.Cliente.Lista(DataSource1);
  TControllerListBoxFactory.New.Clientes(Layout1).Exibir;
end;

initialization
  RegisterFmxClasses([TfrmClientes]);

end.
