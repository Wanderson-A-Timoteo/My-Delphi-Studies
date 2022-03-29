unit Menus.View.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts;

type
  TfrmPrincipal = class(TForm)
    Layout1: TLayout;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  Menus.Controller.ListBox.Factory;

{$R *.fmx}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  TControllerListBoxFactory.New.Principal(Layout1).Exibir;
end;

end.
