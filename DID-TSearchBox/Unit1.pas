unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, Vcl.Buttons, Vcl.WinXCtrls, Vcl.ExtCtrls,
  Vcl.CategoryButtons, Vcl.StdCtrls, System.Notification;

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
    SearchBox1: TSearchBox;
    Memo1: TMemo;
    NotificationCenter1: TNotificationCenter;
    procedure Action1Execute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure Action4Execute(Sender: TObject);
    procedure Action5Execute(Sender: TObject);
    procedure SearchBox1InvokeSearch(Sender: TObject);
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
  NotificationCenter1.CancelNotification('DID - VCL');
end;

procedure TForm1.Action3Execute(Sender: TObject);
begin
  if SplitView2.Opened then
    SplitView2.Close
  else
    SplitView2.Open;
end;

procedure TForm1.Action4Execute(Sender: TObject);
var
  Notify : TNotification;
begin
  Notify := NotificationCenter1.CreateNotification;
  try
    Notify.Name := 'DID - VCL';
    Notify.Title := 'DID - VCL';
    Notify.AlertBody := 'Mensagem Criada pelo DID';
    NotificationCenter1.PresentNotification(Notify);
  finally
    Notify.Free;
  end;
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

procedure TForm1.SearchBox1InvokeSearch(Sender: TObject);
begin
  Memo1.Lines.Add(SearchBox1.Text);
end;

end.
