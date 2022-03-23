unit eInterface.Model.Pessoa.Factory;

interface

uses
  eInterface.Model.Interfaces, eInterface.Model.PessoaFisica,
  eInterface.Model.PessoaJuridica;

type

  TModelPessoaFactory = class(TInterfacedObject, IPessoaFactory)
      private

      protected

      public
        constructor Create;
        destructor Destroy; override;

        class function New : IPessoaFactory;

        function PessoaFisica : IPessoa;
        function PessoaJuridica : IPessoa;

      published

  end;

  implementation

  { TModelPessoaFactory }

constructor TModelPessoaFactory.Create;
begin

end;

destructor TModelPessoaFactory.Destroy;
begin

  inherited;
end;

class function TModelPessoaFactory.New: IPessoaFactory;
begin
  Result := Self.Create;
end;

function TModelPessoaFactory.PessoaFisica: IPessoa;
begin
  Result :=  TModelPessoaFisica.New;
end;

function TModelPessoaFactory.PessoaJuridica: IPessoa;
begin
  Result := TModelPessoaJuridica.New;
end;

end.
