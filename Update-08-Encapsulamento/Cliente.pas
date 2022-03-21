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
  public
    Nome: String;
    Telefone : String;
    Endereco : String;
    Cidade : String;
    UF : String;

    constructor Create;
    procedure CadastrarCliente;
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
end;

end.
