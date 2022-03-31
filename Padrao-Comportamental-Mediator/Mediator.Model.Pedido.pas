unit Mediator.Model.Pedido;

interface

uses Mediator.Model.Interfaces;

Type
  TModelPedido = class(TInterfacedObject, iColleague, iDisplay<iColleague>)
    private
      FDestino, FOrigem : iColleague;
      FMediator : iMediator;
      FSetor, FName, FPedido : String;
      FDisplay : TEvExibir;
    public
      constructor Create(Value : iMediator; Name : String);
      destructor Destroy; override;
      class function New(Value : iMediator; Name : String) : iColleague;
      function EnviarPedido(FDestino : iColleague; Pedido : String) : iColleague;
      function ReceberPedido(FOrigem : iColleague; Pedido : String) : iColleague;
      function GetName : String;
      function Display : iDisplay<iColleague>;
      function Exibir(Value : TEvExibir) : iDisplay<iColleague>;
      function &End : iColleague;
  end;

implementation

uses
  System.SysUtils;

{ TModelPedido }

function TModelPedido.&End: iColleague;
begin
  Result := Self;
end;

constructor TModelPedido.Create(Value : iMediator; Name : String);
begin
  FMediator := Value;
  FName := Name;
  FMediator.Add(Self);
end;

destructor TModelPedido.Destroy;
begin
  FMediator.Remove(FName);
  inherited;
end;

function TModelPedido.Display: iDisplay<iColleague>;
begin
  Result := Self;
end;

function TModelPedido.EnviarPedido(FDestino: iColleague;
  Pedido: String): iColleague;
begin
  Result := Self;
  FMediator.EnviarPedido(Self, FDestino, Pedido);
  FDisplay(Format('Pedido %s Enviado para o setor %s', [Pedido, FDestino.GetName]));
end;

function TModelPedido.Exibir(Value: TEvExibir): iDisplay<iColleague>;
begin
  Result := Self;
  FDisplay := Value;
end;

function TModelPedido.GetName: String;
begin
  Result := FName;
end;

class function TModelPedido.New(Value : iMediator; Name : String): iColleague;
begin
  Result := Self.Create(Value, Name);
end;

function TModelPedido.ReceberPedido(FOrigem: iColleague;
  Pedido: String): iColleague;
begin
  Result := Self;
  Self.FOrigem := FOrigem;
  Self.FPedido := Pedido;
  FDisplay(Format('Pedido %s foi Recebido com Sucesso do Setor %s', [FPedido, Self.FOrigem.GetName]));
end;

end.
