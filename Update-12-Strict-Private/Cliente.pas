unit Cliente;

{

 STRICT PRIVATE - As variaveis e metodos declarados como strict private
 garante que n�o ficar�o vis�veis mesmo para as classes amigas.


}

interface

uses
  System.Classes, System.SysUtils;

// STRICT PRIVATE
type
  TClasseAmiga = class
    strict private
      Fteste : String; // Variavel strict private, n�o estar� vis�vel
    public
      procedure TesteDeSoftware;
  end;

type
  TCliente = class
  strict private   // Variaveis e metodos strict private, n�o estar� vis�vel
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
// A variavel strict private FTeste N�O esta visivel para a classe TCliente
var
  aClasse : TClasseAmiga;
begin
  aClasse.  // N�O VIS�VEL
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
// Todas variaveis e metodos strict private da classe TCliente N�O est�o
// visivel para a classe TClasseAmiga.
var
  aClasse : TCliente;
begin
  aClasse.    // N�O VIS�VEL


end;

end.
