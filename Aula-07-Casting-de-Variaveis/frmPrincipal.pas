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
    procedure ExibeVariavel(Valor: Integer);
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

  { Casting - convertendo o valor da variavel Global do tipo string para integer}
  ExibeVariavel(StrToInt(Global));
end;

procedure TForm1.ExibeVariavel(Valor : Integer);
begin
{ ShowMessage exibe uma string, por isso é necessario Casting - convertendo o valor da variavel Valor do tipo integer para string}
  ShowMessage (IntToStr(Valor));
end;

function TForm1.fncExibeTexto: String;
begin
  Result := edtNome.Text;
end;

end.
