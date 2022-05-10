program ClinicaMedica;

uses
  Vcl.Forms,
  unitPrincipal in 'unitPrincipal.pas' {frmPrincipal},
  unitCadastroPaciente in 'unitCadastroPaciente.pas' {frmCadastroPaciente},
  unitCadastroAgendamento in 'unitCadastroAgendamento.pas' {frmCadastroAgendamento},
  unitDM in 'unitDM.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmCadastroPaciente, frmCadastroPaciente);
  Application.CreateForm(TfrmCadastroAgendamento, frmCadastroAgendamento);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
