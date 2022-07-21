unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, pngimage, Vcl.Buttons, Vcl.ExtCtrls,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList;

type
  TForm1 = class(TForm)
    FlowPanel1: TFlowPanel;
    SpeedButton1: TSpeedButton;
    ActionList1: TActionList;
    ImageList1: TImageList;
    Action1: TAction;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure Action4Execute(Sender: TObject);
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
  ShowMessage('teste');
end;

procedure TForm1.Action2Execute(Sender: TObject);
begin
  ShowMessage('teste');
end;

procedure TForm1.Action3Execute(Sender: TObject);
begin
  ShowMessage('teste');
end;

procedure TForm1.Action4Execute(Sender: TObject);
begin
  ShowMessage('teste');
end;

end.
