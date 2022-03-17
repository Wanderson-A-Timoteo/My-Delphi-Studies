unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
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
  I := 0;
  {Diferente do While que antes de entrar faz o teste condicional, o repeat
  entra e executa uma vez para depois fazer o teste condicional }
  repeat
    Memo1.Lines.Add('Adicionado linha' + IntToStr(I));
    Inc(I);
  until (I >= 10);  // Executa enquanto for true

  Memo1.Lines.Add('Finalizado');

end;

end.
