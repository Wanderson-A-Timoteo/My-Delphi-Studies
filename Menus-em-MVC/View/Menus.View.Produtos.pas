unit Menus.View.Produtos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Layouts, Menus.Controller.ListBox.Factory;

type
  TfrmProdutos = class(TForm)
    ToolBar1: TToolBar;
    labelProdutos: TLabel;
    Layout1: TLayout;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
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
end;

initialization
  RegisterFmxClasses([TfrmProdutos]);

end.
