program eNota;

uses
  Vcl.Forms,
  eNota.View.Principal in 'eNota.View.Principal.pas' {Form1},
  eNota.Controller.NotaFiscal in 'eNota.Controller.NotaFiscal.pas',
  eNota.Controller.NotaFiscal.Interfaces in 'eNota.Controller.NotaFiscal.Interfaces.pas',
  eNota.Controller.NotaFiscal.Criar in 'eNota.Controller.NotaFiscal.Criar.pas',
  eNota.Controller.NotaFiscal.Validar in 'eNota.Controller.NotaFiscal.Validar.pas',
  eNota.Controller.NotaFiscal.Enviar in 'eNota.Controller.NotaFiscal.Enviar.pas',
  eNota.Controller.NotaFiscal.Gravar in 'eNota.Controller.NotaFiscal.Gravar.pas',
  eNota.Controller.NotaFiscal.Email in 'eNota.Controller.NotaFiscal.Email.pas',
  eNota.Controller.Invoker in 'eNota.Controller.Invoker.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
