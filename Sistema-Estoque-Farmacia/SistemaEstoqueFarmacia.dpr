program SistemaEstoqueFarmacia;

uses
  Vcl.Forms,
  unitPrincipal in 'unitPrincipal.pas' {frmPrincipal},
  unitCadastroProduto in 'unitCadastroProduto.pas' {frmCadastroProduto},
  unitCadastroMovimentacao in 'unitCadastroMovimentacao.pas' {frmCadastroMovimentacao},
  unitConsultaMovimentacao in 'unitConsultaMovimentacao.pas' {frmConsultaMovimentacao},
  unitDM in 'unitDM.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmCadastroProduto, frmCadastroProduto);
  Application.CreateForm(TfrmCadastroMovimentacao, frmCadastroMovimentacao);
  Application.CreateForm(TfrmConsultaMovimentacao, frmConsultaMovimentacao);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
