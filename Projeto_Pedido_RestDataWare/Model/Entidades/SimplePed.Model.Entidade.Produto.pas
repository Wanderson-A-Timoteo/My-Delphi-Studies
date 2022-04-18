unit SimplePed.Model.Entidade.Produto;

interface

uses
  SimpleAttributes;

type
  TPRODUTO = class
  private
    FDESCRICAO: String;
    FVALORUNITARIO: Currency;
    FID: Integer;
    procedure SetDESCRICAO(const Value: String);
    procedure SetID(const Value: Integer);
    procedure SetVALORUNITARIO(const Value: Currency);
    function GetDESCRICAO: String;
  published
    [PK, AutoInc]
    property ID : Integer read FID write SetID;
    property DESCRICAO : String read GetDESCRICAO write SetDESCRICAO;
    property VALORUNITARIO : Currency read FVALORUNITARIO write SetVALORUNITARIO;
  end;

implementation

uses
  SimplePed.Model.Exceptions;

{ TPRODUTO }

function TPRODUTO.GetDESCRICAO: String;
begin
  if FDESCRICAO = '' then
    raise TValidaCampo.Create('DESCRICAO', 'O Campo Descrição não pode ser Nulo');

  Result := FDESCRICAO;
end;

procedure TPRODUTO.SetDESCRICAO(const Value: String);
begin
  FDESCRICAO := Value;
end;

procedure TPRODUTO.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TPRODUTO.SetVALORUNITARIO(const Value: Currency);
begin
  FVALORUNITARIO := Value;
end;

end.
