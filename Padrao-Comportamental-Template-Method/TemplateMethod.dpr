program TemplateMethod;

uses
  Vcl.Forms,
  TemplateMethod.View.Principal in 'TemplateMethod.View.Principal.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
