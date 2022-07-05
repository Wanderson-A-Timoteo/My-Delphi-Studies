program Menu_Multiplas_Opcoes_Form_Modal;

uses
  Vcl.Forms,
  unit_principal in 'unit_principal.pas' {form_principal},
  unit_modelo2 in 'unit_modelo2.pas' {form_modelo2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tform_principal, form_principal);
  Application.CreateForm(Tform_modelo2, form_modelo2);
  Application.Run;
end.
