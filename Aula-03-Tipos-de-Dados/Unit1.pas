unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    {

      - integer: pode guardar 2.147.483.647 numeros, negativos ou positivos
        De -2.147.483.647 -> 2.147.483.647

      - currency: Trabalha com valores até 4 casas decimais, pode ser definido para trabalhar com moedas

      - double: Trabalhar com valores flutuantes

      - real: Trabalhar com valores flutuantes

      - string: Recebe um valor com caracteres

      - boolean: Recebe um valor verdadeiro ou falso
    }

    i : integer;
    c : currency;
    d : double;
    r : real;
    s : string;
    b : boolean;


  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin

    { Atribuindo valor as variaveis }

    i := 1;
    c := 4.34;
    d := 5.43;
    s := 'Wanderson';

    b := true;
    b := false;
end;

end.
