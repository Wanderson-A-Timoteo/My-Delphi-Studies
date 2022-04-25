unit untLoginScreen1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  untBase, FMX.TabControl, FMX.Objects, FMX.Layouts, FMX.Controls.Presentation,
  FMX.Edit;

type
  TLoginScreen1 = class(TFormBase)
    Path1: TPath;
    lyt1: TLayout;
    lyt2: TLayout;
    edt1: TEdit;
    lyt3: TLayout;
    Path2: TPath;
    StyleBook1: TStyleBook;
    Line1: TLine;
    lyt4: TLayout;
    edt2: TEdit;
    lyt5: TLayout;
    Path3: TPath;
    Line2: TLine;
    rct4: TRectangle;
    Text1: TText;
    Text2: TText;
    Line3: TLine;
    Text3: TText;
    procedure Text1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LoginScreen1: TLoginScreen1;

implementation

uses
  untPrincipal;

{$R *.fmx}

procedure TLoginScreen1.Text1Click(Sender: TObject);
begin
  inherited;
  frmMenu := Tfrmmenu.Create(Self);
  frmMenu.Show;
end;

end.
