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
  Pessoa1, Pessoa2 : TPessoa;
begin
  Pessoa1 := TPessoa.Create;
  Pessoa2 := TPessoa.Create;
  try
    Pessoa1.Nome := 'Wanderson';
    Pessoa1.DataNasc := '20/12/1983';

    Pessoa2.Nome := 'Jeane';
    Pessoa2.DataNasc := '21/11/1982';

    ShowMessage(Pessoa1.Nome + ' - ' + IntToStr(Pessoa1.Idade));

    ShowMessage(Pessoa2.Nome + ' - ' + IntToStr(Pessoa2.Idade));
  finally
    Pessoa1.Free;
    Pessoa2.Free;
  end;
end;

end.
