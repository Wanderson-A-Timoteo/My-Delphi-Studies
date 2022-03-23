unit Principal;

interface

uses
  System.Classes;

procedure register;

Type
  TNotifyEvent = procedure(Sender : TObject) of Object;

  TEventos = class(TComponent)
  private
    FNome: String;
    FStatus: TNotifyEvent;
    procedure SetNome(const Value: String);
    procedure SetStatus(const Value: TNotifyEvent);
    procedure OnStatus;

  public
    function TamanhoString(Value : String) : Integer;

  published
    property Nome : String read FNome write SetNome;
    property Status : TNotifyEvent read FStatus write SetStatus;

  end;

implementation

{ TEventos }

procedure register;
begin
  RegisterComponents('Delphi Updates', [TEventos]);
end;

procedure TEventos.OnStatus;
begin
  if Assigned(Status) then
    Status(Self);
end;

procedure TEventos.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TEventos.SetStatus(const Value: TNotifyEvent);
begin
  FStatus := Value;
end;

function TEventos.TamanhoString(Value: String): Integer;
begin
  Nome := Value;
  Result := Length(Value);
  OnStatus;
end;

end.
