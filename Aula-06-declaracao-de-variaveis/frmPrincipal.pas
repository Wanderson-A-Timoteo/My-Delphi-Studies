unit frmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    edtNome: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure ExibeVariavel(Valor: string);
    function fncExibeTexto: String;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Global: string;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Global := fncExibeTexto;
  ExibeVariavel(Global);
end;

procedure TForm1.ExibeVariavel(Valor : string);
begin
  ShowMessage(Valor);
end;

function TForm1.fncExibeTexto: String;
var
strFunc : string;
begin
  strFunc := 'Sou da fun��o';
  Result := edtNome.Text + strFunc;
end;

end.
