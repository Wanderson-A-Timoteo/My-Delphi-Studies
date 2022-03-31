unit Chains.Model.Item;

interface

uses Chains.Model.Interfaces, Chains.Model.Usuario.Caixa,
  Chains.Model.Usuario.Fiscal, Chains.Model.Usuario.Gerente;

Type
  TModelItem = class(TInterfacedObject, iItem, iOperacoes)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iItem;
      function Operacoes : iOperacoes;
      function Desconto(Value : Currency) : iOperacoes;
      function &End : iItem;
  end;

implementation

{ TModelItem }

function TModelItem.&End: iItem;
begin
  Result := Self;
end;

constructor TModelItem.Create;
begin

end;

function TModelItem.Desconto(Value: Currency): iOperacoes;
begin
  TModelUsuarioCaixa.New
    .Responsability
      .NextResponsability(
        TModelUsuarioFiscal.New
          .Responsability
            .NextResponsability(
              TModelUsuarioGerente.New
                .Responsability
                .NextResponsability(nil)
            )
      ).Desconto(Value);
end;

destructor TModelItem.Destroy;
begin

  inherited;
end;

class function TModelItem.New: iItem;
begin
  Result := Self.Create;
end;

function TModelItem.Operacoes: iOperacoes;
begin
  Result := Self;
end;

end.
