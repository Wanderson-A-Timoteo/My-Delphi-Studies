unit eNota.Controller.NotaFiscal.Interfaces;

interface

type

  iCommand = interface
    ['{B4D16F58-7878-4801-A02E-9B4515A36B61}']
    function Execute : iCommand;
  end;

  iInvoker = interface
    ['{29B37AD3-820B-4EE1-93DB-D91C72F3F4D3}']
    function Add(Value : iCommand) : iInvoker;
    function Execute : iInvoker;
  end;

  iNotaFiscal = interface
    ['{05ED2560-0012-455E-8898-F6023F4287CC}']
    function Criar : iNotaFiscal;
    function Validar : iNotaFiscal;
    function Enviar : iNotaFiscal;
    function Gravar : iNotaFiscal;
    function Email : iNotaFiscal;

  end;

  iNotaFiscalView = interface
    ['{0144B2C3-5DC8-4FC5-99E7-2F01A732E9D1}']
    function EnviarNotaSefaz : iNotaFiscal;
  end;

implementation

end.
