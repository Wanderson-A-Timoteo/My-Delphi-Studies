unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, Vcl.Buttons, Vcl.WinXCtrls, Vcl.ExtCtrls,
  Vcl.CategoryButtons;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    SplitView1: TSplitView;
    SpeedButton1: TSpeedButton;
    ActionList1: TActionList;
    ImageList1: TImageList;
    Action1: TAction;
    CategoryButtons1: TCategoryButtons;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    Action5: TAction;
    SplitView2: TSplitView;
    FlowPanel1: TFlowPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    procedure Action1Execute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure Action4Execute(Sender: TObject);
    procedure Action5Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Action1Execute(Sender: TObject);
begin
  if SplitView1.Opened then
    SplitView1.Close
  else
    SplitView1.Open;

end;

procedure TForm1.Action2Execute(Sender: TObject);
begin
  ShowMessage('');
end;

procedure TForm1.Action3Execute(Sender: TObject);
begin
  if SplitView2.Opened then
    SplitView2.Close
  else
    SplitView2.Open;
end;

procedure TForm1.Action4Execute(Sender: TObject);
begin
  ShowMessage('');
end;

procedure TForm1.Action5Execute(Sender: TObject);
begin
  ShowMessage('');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  SplitView1.Close;
  SplitView2.Close;
end;

end.
