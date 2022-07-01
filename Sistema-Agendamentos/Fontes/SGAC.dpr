program SGAC;

uses
  Vcl.Forms,
  unit_principal in 'unit_principal.pas' {form_principal},
  unit_dados in 'unit_dados.pas' {DataModule1: TDataModule},
  unit_login in 'unit_login.pas' {form_login},
  unit_clientes in 'unit_clientes.pas' {form_clientes},
  unit_mensagens in 'unit_mensagens.pas' {form_mensagens},
  unit_funcoes in 'unit_funcoes.pas',
  classe_conexao in 'classe_conexao.pas',
  System.SysUtils,
  unit_configurar_servidor in 'unit_configurar_servidor.pas' {form_configurar_servidor},
  classe.profissionais in 'classe.profissionais.pas',
  unit_cliente_consulta in 'unit_cliente_consulta.pas' {form_cliente_consulta},
  unit_agendamento in 'unit_agendamento.pas' {form_agendamento},
  unit_agendamento_consulta in 'unit_agendamento_consulta.pas' {form_agendamento_consulta},
  classe.cliente in 'classe.cliente.pas',
  classe.agendamento in 'classe.agendamento.pas',
  unit_profissionais in 'unit_profissionais.pas' {form_profissionais};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
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
    fnc_criar_mensagem('CONEXÃO AO BANCO DE DADOS',
                       'Erro ao conectar ao Banco de Dados',
                       'Não foi possível conectar ao Banco de Dados, possível causa: ' +
                        DataModule1.Conexao.MsgErro,
                        ExtractFilePath(Application.ExeName) + 'imagens\erro.png','OK');

    Application.CreateForm(Tform_configurar_servidor, form_configurar_servidor);

    form_configurar_servidor.ShowModal;

  end;

end.
