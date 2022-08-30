program DBGRID;

uses
  Vcl.Forms,
  unit_principal in 'unit_principal.pas' {Form_Principal},
  unit_dados in 'unit_dados.pas' {dmDados};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm_Principal, Form_Principal);
  Application.CreateForm(TdmDados, dmDados);
  Application.Run;
end.
