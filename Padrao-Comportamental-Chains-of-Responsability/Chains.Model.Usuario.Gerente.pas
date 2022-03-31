unit Chains.Model.Usuario.Gerente;

interface

uses Chains.Model.Interfaces;

Type
  TModelUsuarioGerente = class(TInterfacedObject, iUsuario, iResponsability)
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

{ TModelUsuarioGerente }

constructor TModelUsuarioGerente.Create;
begin

end;

function TModelUsuarioGerente.Desconto(Value: Currency): iResponsability;
begin
  Result := Self;
  raise Exception.Create('Desconto Concedido pelo Gerente com Sucesso');
end;

destructor TModelUsuarioGerente.Destroy;
begin

  inherited;
end;

class function TModelUsuarioGerente.New: iUsuario;
begin
  Result := Self.Create;
end;

function TModelUsuarioGerente.NextResponsability(
  Value: iResponsability): iResponsability;
begin
  Result := Self;
  FSucessor := Value;
end;

function TModelUsuarioGerente.Responsability: iResponsability;
begin
  Result := Self;
end;

end.
