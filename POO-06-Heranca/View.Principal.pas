unit View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Unit4, Classe.Cliente,
  Classe.Pessoa;

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
  Pessoa1 : TPessoa;
  Cliente1 : TCliente;
begin
  Pessoa1 := TPessoa.Create;
  Cliente1 := TCliente.Create;
  try
    Pessoa1.Nome := 'Wanderson';
    Pessoa1.DataNasc := '20/12/1983';

    Cliente1.Nome := 'Jeane';
    Cliente1.DataNasc := '21/11/1982';


    ShowMessage(Pessoa1.Nome + ' - ' + IntToStr(Pessoa1.Idade));

    ShowMessage(Cliente1.Nome + ' - ' + IntToStr(Cliente1.Idade));
  finally
    Pessoa1.Free;
    Cliente1.Free;
  end;
end;

end.
