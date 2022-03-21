unit Cliente;

{

 PROPERTY s�o como os gethers e sethers do JAVA, ou seja, s�o propriedades
 de alguns atributos que permitem a altera��o de seu valor de forma
 implicita.

}

interface

uses
  System.Classes, System.SysUtils;

// Declara��o de uma classe para teste de vissibilidade de variaveis
type
  TClasseAmiga = class
    private
      Fteste : String; // Variavel privada, teoricamente n�o estar� dispon�vel
    public
      procedure TesteDeSoftware;
  end;

type
  TCliente = class
  private
    FDataNascimento: TDateTime;
    FNome: String;
    FTelefone : String;
    FEndereco : String;
    procedure SetDataNascimento(const Value: TDateTime);
    procedure SetNome(const Value: String);
    function GetEndereco: String;
    procedure SetEndereco(const Value: String);
  public
    Cidade : String;
    UF : String;
    Saldo : Currency;

    constructor Create;
    procedure CadastrarCliente;
    procedure CriarFinanceiro;
    function Idade : Integer;
    property Nome : String read FNome write SetNome;
    property DataNascimento : TDateTime read FDataNascimento write SetDataNascimento;
    property Telefone : String read FTelefone write FTelefone;
    property Endereco : String read GetEndereco write SetEndereco;
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

function TCliente.GetEndereco: String;
begin
  Result := FEndereco + 'Mato Grosso | Brasil';
end;

function TCliente.Idade: Integer;
begin
  Result := Trunc((Now - FDataNascimento) / 365.25);
end;

procedure TCliente.SetDataNascimento(const Value: TDateTime);
// A variavel privada FTeste esta visivel para a classe TCliente
var
  aClasse : TClasseAmiga;
begin
  aClasse.Fteste;
  FDataNascimento := Value;
end;

procedure TCliente.SetEndereco(const Value: String);
begin
  FEndereco := Value;
end;

procedure TCliente.SetNome(const Value: String);
begin
if Value = '' then
raise Exception.Create('Error: Nome n�o pode ser vazio');
  FNome := Value;
end;

{ TClasseAmiga }

procedure TClasseAmiga.TesteDeSoftware;
// Todas variaveis e metodos privada da classe TCliente est�o visivel
// para a classe TClasseAmiga, isso viola o encapsulamento
// Por isso � uma boa pratica declarar cada classe em uma Unit separada.
var
  aClasse : TCliente;
begin
  aClasse.FDataNascimento;


end;

end.
