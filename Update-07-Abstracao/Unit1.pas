unit Unit1;
{

 ABSTRA��O � a capacidade da linguagem de representar um objeto
 do mundo real para dentro da linguagem de programa��o. Essa � uma das
 diretrizes para a linguagem ser considerada orientada a objetos.



}
interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Memo.Types, FMX.ScrollBox,
  FMX.Memo, Cliente;

type

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CadastrarCliente(Nome, Telefone, Endereco, Cidade : String);

    procedure CadastrarClientePOO( Value : TCliente);
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  CadastrarCliente('Wanderson', '6533322255', 'Rua dos desesperados 100', 'Cuiab�');
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Cliente : TCliente;

begin
  Cliente := Tcliente.Create;
  try
    Cliente.Nome := 'Wanderson';
    Cliente.Telefone := '6532489444';
    Cliente.Endereco := 'Rua da saudade';
    Cliente.Cidade := 'Cuiab�';

    CadastrarClientePOO(Cliente);
  finally
    Cliente.Free;
  end;
end;
{ Exemplo de forma procedural }
procedure TForm1.CadastrarCliente(Nome, Telefone, Endereco, Cidade : String);

var
  Lista : TStringList;

begin
  Lista := TStringList.Create;

  try
    Lista.Add('Nome: ' + Nome);
    Lista.Add('Telefone: ' + Telefone);
    Lista.Add('Endere�o: ' + Endereco);
    Lista.Add('Cidade: ' + Cidade);

    Lista.SaveToFile('Cliente.txt');

  finally
    Lista.Free;
  end;

end;

procedure TForm1.CadastrarClientePOO(Value: TCliente);
var
  Lista : TStringList;

begin

Lista := TStringList.Create;

  try
    Lista.Add('Nome: ' + Value.Nome);
    Lista.Add('Telefone: ' + Value.Telefone);
    Lista.Add('Endere�o: ' + Value.Endereco);
    Lista.Add('Cidade: ' + Value.Cidade);

    Lista.SaveToFile('Cliente.txt');

  finally
    Lista.Free;
  end;

end;

end.
