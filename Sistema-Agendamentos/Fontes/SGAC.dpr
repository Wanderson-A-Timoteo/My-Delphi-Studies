program SGAC;

uses
  Vcl.Forms,
  unit_principal in 'unit_principal.pas' {form_principal},
  unit_dados in 'unit_dados.pas' {DataModule1: TDataModule},
  unit_login in 'unit_login.pas' {form_login},
  unit_configurar_servidor in 'unit_configurar_servidor.pas' {form_configurar_servidor},
  unit_mensagens in 'unit_mensagens.pas' {form_mensagens},
  unit_funcoes in 'unit_funcoes.pas',
  classe_conexao in 'classe_conexao.pas', System.SysUtils;

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := true;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;


  Application.CreateForm(TDataModule1, DataModule1);

  if DataModule1.Conexao.fnc_conectar_banco_dados then
  begin
    form_login := Tform_login.Create(nil);
    form_login.ShowModal;

    Application.CreateForm(Tform_principal, form_principal);

    form_login.Hide;
    form_login.Free;

    Application.Run;
  end else
  begin
    fnc_criar_mensagem('CONEX�O AO BANCO DE DADOS',
                      'Erro ao conectar ao Banco de Dados',
                      'N�o foi poss�vel conectar ao Banco de Dados, poss�vel causa: ' +
                       DataModule1.Conexao.MsgErro,
                       ExtractFilePath(Application.ExeName) + '\imagens\erro.png','OK');

    Application.CreateForm(Tform_configurar_servidor, form_configurar_servidor);
    form_configurar_servidor.ShowModal;

  end;




end.
