unit DS.Model.Entidade.Factory;

interface

uses
  DS.Model.Entidade.Produto;

type

  TModelEntidadeFactory = class
    private

    public
      function Produto : TModelEntidadeProduto;
  end;

implementation

{ TModelEntidadeFactory }

function TModelEntidadeFactory.Produto: TModelEntidadeProduto;
begin
  Result := ModelEntidadeProduto;
end;

end.
