unit Chains.Model.Usuario.Caixa;

interface

uses Chains.Model.Interfaces;

Type
  TModelUsuarioCaixa = class(TInterfacedObject, iUsuario, iResponsability)
    private
      FSucessor : iResponsability;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iUsuario;
      function Responsability : iResponsability;
      function NextResponsability(Value : iResponsability) : iResponsability;
      function Desconto(Value : Currency) : iResponsability;
  end;

implementation

uses
  System.SysUtils;

{ TModelUsuarioCaixa }

constructor TModelUsuarioCaixa.Create;
begin

end;

function TModelUsuarioCaixa.Desconto(Value: Currency): iResponsability;
begin
  Result := Self;

  if Value <= 10 then
    raise Exception.Create('Desconto Concedido pelo Caixa com Sucesso');

  if not Assigned(FSucessor) then
    raise Exception.Create('Essa operação não pode ser executada');

  FSucessor.Desconto(Value);

end;

destructor TModelUsuarioCaixa.Destroy;
begin

  inherited;
end;

class function TModelUsuarioCaixa.New: iUsuario;
begin
  Result := Self.Create;
end;

function TModelUsuarioCaixa.NextResponsability(
  Value: iResponsability): iResponsability;
begin
  Result := Self;
  FSucessor := Value;
end;

function TModelUsuarioCaixa.Responsability: iResponsability;
begin
  Result := Self;
end;

end.
