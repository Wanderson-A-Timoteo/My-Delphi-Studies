unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    ProgressBar1: TProgressBar;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  I : Integer;
begin
  for I := 0 to 10000 do
    begin
      ProgressBar1.Position := I;
      Application.ProcessMessages;  // Deixa mover a caixa durante a execução
    end;

end;

procedure TForm1.Button2Click(Sender: TObject);
var
  I : Integer;
begin
  for I := 10000 downto 0 do
    begin
      ProgressBar1.Position := I;
      Application.ProcessMessages;
    end;

end;

end.
