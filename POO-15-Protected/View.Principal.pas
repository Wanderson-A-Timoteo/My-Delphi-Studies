unit View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Unit4, Classe.Cliente,
  Classe.Pessoa;

type
  TForm3 = class(TForm)
    Button1: TButton;
    edtNome: TEdit;
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
  Pessoa1 : TPessoa;
  Cliente1 : TCliente;
  Value : Currency;
begin
  Pessoa1 := TPessoa.Create;
  Cliente1 := TCliente.Create;
  try
    ShowMessage(Cliente1.Endereco.Logradouro);
  finally
    Pessoa1.Free;
    Cliente1.Free;
  end;
end;

end.
