unit View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Unit4, Classe.Pessoa;

type
  TForm3 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}
{
  4 - Principais Conceitos
  Abstração
  Herança
  Encapsulamento
  Polimorfismo
}

procedure TForm3.Button1Click(Sender: TObject);
var
  Pessoa : TPessoa;
begin
  Pessoa := TPessoa.Create;
  try
    Pessoa.Nome := 'Thulio';
    Pessoa.Sexo := 'Masculino';
    ShowMessage(Pessoa.Nome + ' - ' + Pessoa.Sexo);
  finally
    Pessoa.Free;
  end;
end;

end.
