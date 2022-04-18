unit SimplePed.Model.Entidade.PedidoItens;

interface

uses
  SimpleAttributes;

type
  TPEDIDOITENS = class
  private
    FID_PRODUTO: Integer;
    FID_PEDIDO: Integer;
    FVALORUNITARIO: Currency;
    FID: Integer;
    FVALORTOTAL: Currency;
    FQUANTIDADE: Currency;
    procedure SetID(const Value: Integer);
    procedure SetID_PEDIDO(const Value: Integer);
    procedure SetID_PRODUTO(const Value: Integer);
    procedure SetQUANTIDADE(const Value: Currency);
    procedure SetVALORTOTAL(const Value: Currency);
    procedure SetVALORUNITARIO(const Value: Currency);
  published
    [PK, AutoInc]
    property ID : Integer read FID write SetID;
    property ID_PEDIDO : Integer read FID_PEDIDO write SetID_PEDIDO;
    property ID_PRODUTO : Integer read FID_PRODUTO write SetID_PRODUTO;
    property VALORUNITARIO : Currency read FVALORUNITARIO write SetVALORUNITARIO;
    property QUANTIDADE : Currency read FQUANTIDADE write SetQUANTIDADE;
    property VALORTOTAL : Currency read FVALORTOTAL write SetVALORTOTAL;
  end;

implementation

{ TPEDIDOITENS }

procedure TPEDIDOITENS.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TPEDIDOITENS.SetID_PEDIDO(const Value: Integer);
begin
  FID_PEDIDO := Value;
end;

procedure TPEDIDOITENS.SetID_PRODUTO(const Value: Integer);
begin
  FID_PRODUTO := Value;
end;

procedure TPEDIDOITENS.SetQUANTIDADE(const Value: Currency);
begin
  FQUANTIDADE := Value;
end;

procedure TPEDIDOITENS.SetVALORTOTAL(const Value: Currency);
begin
  FVALORTOTAL := Value;
end;

procedure TPEDIDOITENS.SetVALORUNITARIO(const Value: Currency);
begin
  FVALORUNITARIO := Value;
end;

end.
