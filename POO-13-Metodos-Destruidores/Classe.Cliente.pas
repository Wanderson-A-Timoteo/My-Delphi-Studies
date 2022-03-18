unit Classe.Cliente;

interface

uses Classe.Pessoa, Classe.Endereco;

type
  TCliente = class(TPessoa)
  private
    FValorCredito: Currency;
    FEndereco: TEndereco;
    procedure SetValorCredito(const Value: Currency);
    procedure SetEndereco(const Value: TEndereco);
  public
    constructor Create; overload;
    constructor Create(Value : String); overload;
    constructor Create(Value : TPessoa); overload;
    destructor Destroy; override;
    function RetornaNome : String; override;
    function MetodoAbstrato : String; override;
    property ValorCredito : Currency read FValorCredito write SetValorCredito;
    property Endereco : TEndereco read FEndereco write SetEndereco;

  end;

implementation

{ TCliente }

constructor TCliente.Create;
begin
  FEndereco := TEndereco.Create;
  Nome := 'Novo Cliente';
end;

constructor TCliente.Create(Value: String);
begin
  Nome := Value;
end;

constructor TCliente.Create(Value: TPessoa);
begin
  Nome := Value.Nome;
  DataNasc := Value.DataNasc;
  Sexo := Value.Sexo;
end;

destructor TCliente.Destroy;
begin
  FEndereco.Free;
end;

function TCliente.MetodoAbstrato: String;
begin
  Result := 'Eu sou o Metodo Abstrato';
end;

function TCliente.RetornaNome: String;
begin
  inherited;
  Result := 'Eu sou Filha de ' + Nome;
end;

procedure TCliente.SetEndereco(const Value: TEndereco);
begin
  FEndereco := Value;
end;

procedure TCliente.SetValorCredito(const Value: Currency);
begin
  FValorCredito := Value;
end;

end.
