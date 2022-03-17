unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
Tpessoa = record
  Nome : String;
  Idade: Integer;
end;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Button2: TButton;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    {Desta forma a procedure Não passa o endereço de memoria}
    {procedure mudaNome(Value : String);}

    {Ao declarar var a procedure passa o endereço de memoria da variavel,
      desta forma é possível mudar seu valor }
    procedure mudaNome(var Value : String);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Pessoa : array[0..9] of TPessoa;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  novaPessoa : TPessoa;

begin
  {Com With não precisamos declarar novaPessoa.Nome, pois ele já pega todos os
  seus elementos, sendo necessario apenas chamar seu atributo dentro de begin}
  with novaPessoa do
  begin
    Nome  := Edit1.Text;
    Idade := StrToInt(Edit3.Text);
  end;
  {
    DECLARAÇÃO SEM WITH
    novaPessoa.Nome  := Edit1.Text;
    novaPessoa.Idade := StrToInt(Edit3.Text);
  }
  Pessoa[StrToInt(Edit2.Text)] := novaPessoa;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  mudaNome(Pessoa[StrToInt(Edit2.Text)].Nome);
  ShowMessage('Nome: ' + Pessoa[StrToInt(Edit2.Text)].Nome + ', Idade: ' + IntToStr(Pessoa[StrToInt(Edit2.Text)].Idade)+ ' anos ');
end;

{ Desta forma esta procedure cria uma nova variavel para ser manipulada, não
sendo possível alterar o valor da variavel passada como parametro

procedure TForm1.mudaNome(Value: String);
begin
  Value := Value + ' Mudou o nome';
end;
}

procedure TForm1.mudaNome(var Value: String);
begin
  Value := Value + ' Mudou o nome';
end;

end.
