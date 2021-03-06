unit eInterface.Model.PessoaJuridica;

interface

uses
  eInterface.Model.Interfaces;

type
  TModelPessoaJuridica = class(TInterfacedObject, IPessoa)

  private
    FNome : String;
    FSobreNome : String;
    FDisplay : TEventDisplay;
    function Nome(Value : String) : IPessoa; overload;
    function Nome : String; overload;
    function SobreNome(Value : String) : IPessoa;
    function NomeCompleto : IPessoa;
    function Display (Value : TEventDisplay) : IPessoa;

  public
    constructor Create;
    destructor Destroy; override;
    class function New : IPessoa;
  end;

implementation

{ TModelPessoa }

constructor TModelPessoaJuridica.Create;
begin

end;

destructor TModelPessoaJuridica.Destroy;
begin

  inherited;
end;

function TModelPessoaJuridica.Display(Value: TEventDisplay): IPessoa;
begin
  Result := Self;
  FDisplay := Value;
end;

class function TModelPessoaJuridica.New: IPessoa;
begin
  Result := Self.Create;
end;

function TModelPessoaJuridica.Nome(Value: String): IPessoa;
begin
  Result := Self;
  FNome := Value
end;

function TModelPessoaJuridica.Nome: String;
begin
  Result := FNome;
end;

function TModelPessoaJuridica.NomeCompleto: IPessoa;
begin
  Result := Self;
  FDisplay(Fnome + ' ' + FSobreNome + ' LTDA ME');
end;

function TModelPessoaJuridica.SobreNome(Value: String): IPessoa;
begin
  Result := Self;
  FSobreNome := Value
end;

end.
