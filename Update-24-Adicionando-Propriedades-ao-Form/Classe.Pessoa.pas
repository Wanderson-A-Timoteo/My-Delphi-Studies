unit Classe.Pessoa;

interface

uses
  System.Classes, System.SysUtils, Interfaces;

type
  TPessoa = class
  private
    FPrivate : String;

  // Variaveis protected somente as classes filhas tem visibilidade
  protected
    FProtected : String;

  public
    Nome : String;
    Telefone : String;
    Endereco : String;
    Cidade : String;
    UF : String;
    Conexao : IConexao;

    // virtual -> Permite ser sobrecarregada
    constructor Create(aConexao : IConexao); virtual;
    procedure Cadastrar;


    // Exemplo de Polimorfismo, mesmo nome porém com parametros diferentes
    procedure CriarFinanceiro; overload;  // overload = sobrecarregado
    procedure CriarFinanceiro(Value : Currency); overload;

    function GetFProtected : String;
    // Metodo abstract não precisa ser implementado na mesma classe, pois
    // sua implementação será nas classes filhas.
    function Tipo : String; virtual; abstract;

  end;

  // Outra classe
  TMyComp = class(TComponent)
    constructor Create(AOwner: TComponent); override;

  end;

implementation

{ TCliente }

procedure TPessoa.Cadastrar;
var
  Lista : TStringList;

begin

  Lista := TStringList.Create;

  try
    Lista.Add('Nome: ' + Nome);
    Lista.Add('Telefone: ' + Telefone);
    Lista.Add('Endereço: ' + Endereco);
    Lista.Add('Cidade: ' + Cidade);
    Lista.Add('UF: ' + UF);

    Lista.SaveToFile(Nome + '_Cliente.txt');

    Conexao.Gravar;

  finally
    Lista.Free;
  end;

end;

constructor TPessoa.Create(aConexao : IConexao);
begin
  Conexao := aConexao;
  UF := 'MT';
end;

// Se receber valor, entra neste metodo o add o valor recebido
procedure TPessoa.CriarFinanceiro(Value: Currency);
var
  Lista : TStringList;
begin
  Lista := TStringList.Create;
  try
    Lista.Add('Nome: ' + Nome);
    Lista.Add('Saldo: ' + CurrToStr(Value));
    Lista.SaveToFile(Nome + '_Financeiro.txt');
  finally
    Lista.Free;
  end;

end;

// Se não receber um valor, entra neste metodo e add o valor 1000 padrão.
procedure TPessoa.CriarFinanceiro;
var
  Lista : TStringList;
begin
  Lista := TStringList.Create;
  try
    Lista.Add('Nome: ' + Nome);
    Lista.Add('Saldo: 1000');
    Lista.SaveToFile(Nome + '_Financeiro.txt');
  finally
    Lista.Free;
  end;

end;

function TPessoa.GetFProtected: String;
begin
  Result := FProtected;
end;

{ TMyComp }
// Efetuado a sobrecarga e a chamada por herança do componente
constructor TMyComp.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

end;

end.
