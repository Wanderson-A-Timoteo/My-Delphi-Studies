unit Cliente;

{

 ENCAPSULAMENTO tem como pricipio a cria��o de um objeto para encapsular
 dentro dele todas as suas fun��es, metodos e atributos que ele precise para
 funcionar sem depender de nenhum outro.

}

interface

uses
  System.Classes, System.SysUtils;

type
  TCliente = class
  private
    FDataNascimento : TDateTime;
  public
    Nome: String;
    Telefone : String;
    Endereco : String;
    Cidade : String;
    UF : String;
    DataNascimento : TDateTime;
    Saldo : Currency;

    constructor Create;
    procedure CadastrarCliente;
    procedure CriarFinanceiro;
    function Idade : Integer; // Idade encapsulada, se torna um metodo publico
    procedure setDataNascimento(aValue : String);
  end;

implementation

{ TCliente }

procedure TCliente.CadastrarCliente;
var
  Lista : TStringList;

begin

  Lista := TStringList.Create;

  try
    Lista.Add('Nome: ' + Nome);
    Lista.Add('Telefone: ' + Telefone);
    Lista.Add('Endere�o: ' + Endereco);
    Lista.Add('Cidade: ' + Cidade);
    Lista.Add('UF: ' + UF);

    Lista.SaveToFile('Cliente.txt');

  finally
    Lista.Free;
  end;

end;

constructor TCliente.Create;
begin
  UF := 'MT';
  Saldo := 1000;
end;

procedure TCliente.CriarFinanceiro;
var
  Lista : TStringList;
begin
  Lista := TStringList.Create;
  try
    Lista.Add('Nome: ' + Nome);
    Lista.Add('Saldo: ' + CurrToStr(Saldo));
    Lista.SaveToFile(Nome + 'Financeiro.txt');
  finally
    Lista.Free;
  end;

end;

function TCliente.Idade: Integer;
begin
  Result := Trunc((Now - FDataNascimento) / 365.25);
end;

procedure TCliente.setDataNascimento(aValue: String);
begin
  if not TryStrToDateTime(aValue, FDataNascimento) then
    raise Exception.Create('A data � inv�lida, formato correto: 99/99/9999');

  FDataNascimento := StrToDateTime(aValue);

end;

end.
