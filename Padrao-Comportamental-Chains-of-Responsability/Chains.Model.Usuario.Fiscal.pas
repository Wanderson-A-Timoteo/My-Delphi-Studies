unit Chains.Model.Usuario.Fiscal;


interface

uses Chains.Model.Interfaces;

Type
  TModelUsuarioFiscal = class(TInterfacedObject, iUsuario, iResponsability)
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

{ TModelUsuarioFiscal }

constructor TModelUsuarioFiscal.Create;
begin

end;

function TModelUsuarioFiscal.Desconto(Value: Currency): iResponsability;
begin
  Result := Self;

  if Value <= 70 then
    raise Exception.Create('Desconto Concedido pelo Fiscal com Sucesso');

  if not Assigned(FSucessor) then
    raise Exception.Create('Essa operação não pode ser executada');

  FSucessor.Desconto(Value);

end;

destructor TModelUsuarioFiscal.Destroy;
begin

  inherited;
end;

class function TModelUsuarioFiscal.New: iUsuario;
begin
  Result := Self.Create;
end;

function TModelUsuarioFiscal.NextResponsability(
  Value: iResponsability): iResponsability;
begin
  Result := Self;
  FSucessor := Value;
end;

function TModelUsuarioFiscal.Responsability: iResponsability;
begin
  Result := Self;
end;

end.
