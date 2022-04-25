unit untPerfil;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  untBase, FMX.Objects, FMX.TabControl, FMX.Layouts, FMX.Controls.Presentation;

type
  TfrmPerfil = class(TFormBase)
    rct4: TRectangle;
    vt1: TVertScrollBox;
    Circle1: TCircle;
    lyt1: TLayout;
    btn1: TButton;
    Circle2: TCircle;
    btn2: TButton;
    rct5: TRectangle;
    lyt2: TLayout;
    GridPanelLayout1: TGridPanelLayout;
    lyt3: TLayout;
    Text1: TText;
    Text2: TText;
    lyt4: TLayout;
    Text3: TText;
    Text4: TText;
    lyt5: TLayout;
    Text5: TText;
    Text6: TText;
    CalloutRectangle1: TCalloutRectangle;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPerfil: TfrmPerfil;

implementation

{$R *.fmx}

procedure TfrmPerfil.btn1Click(Sender: TObject);
begin
  inherited;
  Close;
end;

end.
