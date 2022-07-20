unit Unit3;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls, FMX.MultiView, FMX.Effects, FMX.Objects,
  FMX.Controls.Presentation, FMX.Layouts, FMX.ListBox;

type
  TForm3 = class(TForm)
    Layout1: TLayout;
    ToolBar1: TToolBar;
    Rectangle1: TRectangle;
    ShadowEffect1: TShadowEffect;
    Layout2: TLayout;
    Layout3: TLayout;
    MultiView1: TMultiView;
    Rectangle2: TRectangle;
    StyleBook1: TStyleBook;
    SpeedButton1: TSpeedButton;
    Layout4: TLayout;
    Image1: TImage;
    Layout5: TLayout;
    Rectangle3: TRectangle;
    Circle1: TCircle;
    ListBox1: TListBox;
    ListBoxGroupHeader1: TListBoxGroupHeader;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxGroupHeader2: TListBoxGroupHeader;
    ListBoxItem3: TListBoxItem;
    Layout6: TLayout;
    Layout7: TLayout;
    Rectangle4: TRectangle;
    GridPanelLayout1: TGridPanelLayout;
    Layout8: TLayout;
    Rectangle5: TRectangle;
    ShadowEffect2: TShadowEffect;
    Circle2: TCircle;
    Layout9: TLayout;
    Rectangle6: TRectangle;
    Circle3: TCircle;
    Layout10: TLayout;
    Rectangle7: TRectangle;
    Circle4: TCircle;
    Layout11: TLayout;
    Rectangle8: TRectangle;
    Circle5: TCircle;
    ShadowEffect3: TShadowEffect;
    ShadowEffect4: TShadowEffect;
    ShadowEffect5: TShadowEffect;
    Layout12: TLayout;
    Layout13: TLayout;
    GridPanelLayout2: TGridPanelLayout;
    Layout14: TLayout;
    Rectangle9: TRectangle;
    Layout15: TLayout;
    Rectangle10: TRectangle;
    ShadowEffect6: TShadowEffect;
    ShadowEffect7: TShadowEffect;
    GridPanelLayout3: TGridPanelLayout;
    Layout16: TLayout;
    Rectangle11: TRectangle;
    ShadowEffect8: TShadowEffect;
    Layout17: TLayout;
    Rectangle12: TRectangle;
    ShadowEffect9: TShadowEffect;
    SpeedButton2: TSpeedButton;
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.fmx}

procedure TForm3.SpeedButton2Click(Sender: TObject);
begin
  Close;
end;

end.
