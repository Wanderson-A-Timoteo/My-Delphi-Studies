unit eInterface.Controller.Pessoa;

interface

uses
  eInterface.Controller.Interfaces, eInterface.Model.Interfaces,
  eInterface.Model.Pessoa.Factory;

Type
  TControllerPessoa = class(TInterfacedObject, IControllerPessoa)
  private

  public
    constructor Create;
    destructor Destroy; override;
    class function New : IControllerPessoa;
    function Pessoa(Value : TTypePessoa) : IPessoa;

  end;


implementation

{ TControllerPessoa }

constructor TControllerPessoa.Create;
begin

end;

destructor TControllerPessoa.Destroy;
begin

  inherited;
end;

class function TControllerPessoa.New: IControllerPessoa;
begin
  Result := Self.Create;
end;

function TControllerPessoa.Pessoa(Value: TTypePessoa): IPessoa;
begin
  case Value of
    tpFisica: Result := TModelPessoaFactory.New.PessoaFisica;
    tpJuridica: Result := TModelPessoaFactory.New.PessoaJuridica;
  end;
end;

end.
