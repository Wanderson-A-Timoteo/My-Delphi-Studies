unit eNota.Controller.NotaFiscal.Enviar;

interface

uses
  eNota.Controller.NotaFiscal.Interfaces;

type
  TControllerNotaFiscalEnviar = class(TInterfacedObject, iCommand)
    private
      FParent : iNotaFiscal;
    public
      constructor Create(Parent : iNotaFiscal);
      destructor Destroy; override;

      class function New(Parent : iNotaFiscal) : iCommand;

      function Execute : iCommand;

  end;

implementation

{ TControllerNotaFiscalCriar }

constructor TControllerNotaFiscalEnviar.Create(Parent : iNotaFiscal);
begin
  FParent := Parent;
end;

destructor TControllerNotaFiscalEnviar.Destroy;
begin

  inherited;
end;

function TControllerNotaFiscalEnviar.Execute: iCommand;
begin
  Result := Self;
  Fparent.Enviar;
end;

class function TControllerNotaFiscalEnviar.New(Parent : iNotaFiscal) : iCommand;
begin
  Result := Self.Create(Parent);
end;

end.
