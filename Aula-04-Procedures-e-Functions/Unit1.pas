unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    edtNome: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }

    s : string;

    i : integer;

    procedure ExibeVariaveis(Valor : string);
    function fncExibeTexto : string;


  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


procedure TForm1.Button1Click(Sender: TObject);
begin
  s := fncExibeTexto;

  ExibeVariaveis(s);

end;

procedure TForm1.ExibeVariaveis(Valor : string);
begin
  ShowMessage(Valor);
end;

function TForm1.fncExibeTexto: string;
begin
  Result := edtNome.Text + ' - Parabens! Voc� conseguiu chamar a fun��o';
end;

end.
