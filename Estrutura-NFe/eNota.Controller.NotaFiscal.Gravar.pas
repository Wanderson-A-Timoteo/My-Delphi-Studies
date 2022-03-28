unit eNota.Controller.NotaFiscal.Gravar;

interface

uses
  eNota.Controller.NotaFiscal.Interfaces;

type
  TControllerNotaFiscalGravar = class(TInterfacedObject, iCommand)
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

constructor TControllerNotaFiscalGravar.Create(Parent : iNotaFiscal);
begin
  FParent := Parent;
end;

destructor TControllerNotaFiscalGravar.Destroy;
begin

  inherited;
end;

function TControllerNotaFiscalGravar.Execute: iCommand;
begin
  Result := Self;
  Fparent.Gravar;
end;

class function TControllerNotaFiscalGravar.New(Parent : iNotaFiscal) : iCommand;
begin
  Result := Self.Create(Parent);
end;

end.
