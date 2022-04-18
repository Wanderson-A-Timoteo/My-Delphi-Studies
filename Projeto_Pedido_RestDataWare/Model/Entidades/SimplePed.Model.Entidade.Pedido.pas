unit SimplePed.Model.Entidade.Pedido;

interface

uses
  SimpleAttributes;

type

  TPEDIDO = class
  private
    FID: Integer;
    FDATA: TDateTime;
    procedure SetDATA(const Value: TDateTime);
    procedure SetID(const Value: Integer);
  published
    [PK, AutoInc]
    property ID : Integer read FID write SetID;
    property DATA : TDateTime read FDATA write SetDATA;
  end;

implementation

{ TPEDIDO }

procedure TPEDIDO.SetDATA(const Value: TDateTime);
begin
  FDATA := Value;
end;

procedure TPEDIDO.SetID(const Value: Integer);
begin
  FID := Value;
end;

end.
