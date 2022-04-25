unit untPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Effects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts,
  FMX.MultiView, FMX.ListBox, FMX.ImgList, System.ImageList;

type
  TfrmMenu = class(TForm)
    rctToolBar: TRectangle;
    rct2: TRectangle;
    ShadowEffect1: TShadowEffect;
    btn1: TButton;
    btn2: TButton;
    lyt1: TLayout;
    MultiView1: TMultiView;
    lst1: TListBox;
    ListBoxItem1: TListBoxItem;
    rct1: TRectangle;
    Path1: TPath;
    lbl1: TLabel;
    lbl2: TLabel;
    ListBoxItem2: TListBoxItem;
    lyt2: TLayout;
    Glyph1: TGlyph;
    lbl3: TLabel;
    ListBoxItem3: TListBoxItem;
    lyt3: TLayout;
    Glyph2: TGlyph;
    lbl4: TLabel;
    ListBoxItem4: TListBoxItem;
    lyt4: TLayout;
    Glyph3: TGlyph;
    lbl5: TLabel;
    ListBoxItem5: TListBoxItem;
    lyt5: TLayout;
    Glyph4: TGlyph;
    lbl6: TLabel;
    ListBoxItem6: TListBoxItem;
    Line1: TLine;
    lbl7: TLabel;
    ListBoxItem7: TListBoxItem;
    lyt6: TLayout;
    Glyph5: TGlyph;
    lbl8: TLabel;
    ListBoxItem8: TListBoxItem;
    lyt7: TLayout;
    Glyph6: TGlyph;
    lbl9: TLabel;
    il1: TImageList;
    btn3: TButton;
    lbl10: TLabel;
    procedure rct3MouseLeave(Sender: TObject);
    procedure rct6MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Single);
    procedure Path1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenu: TfrmMenu;

implementation

uses
  untPerfil;

{$R *.fmx}

procedure TfrmMenu.Path1Click(Sender: TObject);
begin
  frmPerfil := TfrmPerfil.Create(Self);
  frmPerfil.Show;
end;

procedure TfrmMenu.rct3MouseLeave(Sender: TObject);
begin
  TRectangle(Sender).AnimateColor('Fill.Color', TAlphaColorRec.White, 0.3);
end;

procedure TfrmMenu.rct6MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Single);
begin
  TRectangle(Sender).AnimateColor('Fill.Color', TAlphaColor($FF58CAC5), 0.3);
end;

end.
