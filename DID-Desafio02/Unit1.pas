unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.CategoryButtons, Vcl.WinXCtrls, System.Actions,
  Vcl.ActnList, System.ImageList, Vcl.ImgList;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Image3: TImage;
    Image2: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Image4: TImage;
    Image5: TImage;
    Label6: TLabel;
    Label7: TLabel;
    SplitView1: TSplitView;
    Image6: TImage;
    CategoryButtons1: TCategoryButtons;
    ActionList1: TActionList;
    ImageList1: TImageList;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    Action5: TAction;
    CategoryButtons2: TCategoryButtons;
    Action6: TAction;
    Action7: TAction;
    SplitView2: TSplitView;
    Action8: TAction;
    Action9: TAction;
    Action10: TAction;
    Action11: TAction;
    Action12: TAction;
    CategoryButtons3: TCategoryButtons;
    Panel2: TPanel;
    procedure Image2Click(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure Action10Execute(Sender: TObject);
    procedure Action7Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Unit2;

procedure TForm1.Action10Execute(Sender: TObject);
begin
  frmCadastro := TfrmCadastro.Create(Self);
  frmCadastro.Parent := Panel2;
  frmCadastro.Show;
end;

procedure TForm1.Action2Execute(Sender: TObject);
begin
  if SplitView2.Opened then
    SplitView2.Close
  else
    SplitView2.Open;
end;

procedure TForm1.Action7Execute(Sender: TObject);
begin
  Close;
end;

procedure TForm1.Image2Click(Sender: TObject);
begin
  if SplitView1.Opened then
    SplitView1.Close
  else
    SplitView1.Open;
end;

end.
