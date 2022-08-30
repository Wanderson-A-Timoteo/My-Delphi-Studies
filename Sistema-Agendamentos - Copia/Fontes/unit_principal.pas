unit unit_principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.Buttons, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage;

type
  Tform_principal = class(TForm)
    Label1: TLabel;
    LabelUsuarioLogado: TLabel;
    PanelFundo: TPanel;
    PanelBordaHeader: TPanel;
    PanelLogoGrande: TPanel;
    PanelBtnMaximizarFechar: TPanel;
    ImageLogoPequeno: TImage;
    ImageLogoGrande: TImage;
    SpeedButtonMaximinizar: TSpeedButton;
    SpeedButtonFechar: TSpeedButton;
    PanelBordaFooter: TPanel;
    Label2: TLabel;
    PanelBtnAgendamento: TPanel;
    SpeedButtonAgendamento: TSpeedButton;
    PanelBtnGerarRelatorio: TPanel;
    SpeedButtonGerarRelatorio: TSpeedButton;
    PanelBtnServidor: TPanel;
    SpeedButtonServidor: TSpeedButton;
    PanelBtnUsuarios: TPanel;
    SpeedButtonUsuarios: TSpeedButton;
    PanelBtnLojas: TPanel;
    SpeedButtonLojas: TSpeedButton;
    procedure Sair1Click(Sender: TObject);
    procedure SpeedButtonFecharClick(Sender: TObject);
    procedure SpeedButtonMaximinizarClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure SpeedButtonServidorClick(Sender: TObject);
    procedure SpeedButtonAgendamentoClick(Sender: TObject);
    procedure SpeedButtonAgendamentoMouseEnter(Sender: TObject);
    procedure SpeedButtonAgendamentoMouseLeave(Sender: TObject);
    procedure SpeedButtonServidorMouseEnter(Sender: TObject);
    procedure SpeedButtonServidorMouseLeave(Sender: TObject);
    procedure SpeedButtonUsuariosMouseEnter(Sender: TObject);
    procedure SpeedButtonUsuariosMouseLeave(Sender: TObject);
    procedure SpeedButtonUsuariosClick(Sender: TObject);
    procedure SpeedButtonGerarRelatorioMouseEnter(Sender: TObject);
    procedure SpeedButtonGerarRelatorioMouseLeave(Sender: TObject);
    procedure SpeedButtonGerarRelatorioClick(Sender: TObject);
    procedure SpeedButtonLojasClick(Sender: TObject);
    procedure SpeedButtonLojasMouseEnter(Sender: TObject);
    procedure SpeedButtonLojasMouseLeave(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_principal: Tform_principal;

implementation

{$R *.dfm}

uses unit_configurar_servidor, unit_funcoes, unit_mensagens, unit_agendamento, unit_clientes, unit_agenda,
  unit_usuarios_consulta, unit_relatorios, unit_lojas, unit_login;

procedure Tform_principal.FormResize(Sender: TObject);
begin
  PanelFundo.Top := Round((form_principal.Height - PanelFundo.Height) / 2);
  PanelFundo.Left := Round((form_principal.Width - PanelFundo.Width) / 2);
end;

procedure Tform_principal.Sair1Click(Sender: TObject);
begin
  if fnc_criar_mensagem('CONFIRMAÇÃO',
                        'Sair do Sistema',
                        'Deseja Realmente Sair do Sistema?',
                        ExtractFilePath(Application.ExeName) + 'imagens\info.png',
                        'CONFIRMAR') then
   Application.Terminate
   else
   Exit;
end;

procedure Tform_principal.SpeedButtonAgendamentoClick(Sender: TObject);
begin
  form_agenda := Tform_agenda.Create(Self);
  try
    form_agenda.ShowModal;
  finally
    form_agenda.Free;
  end;
end;

procedure Tform_principal.SpeedButtonAgendamentoMouseEnter(Sender: TObject);
begin
  SpeedButtonAgendamento.Font.Color := $00591A05;
end;

procedure Tform_principal.SpeedButtonAgendamentoMouseLeave(Sender: TObject);
begin
  SpeedButtonAgendamento.Font.Color := clWhite;
end;

procedure Tform_principal.SpeedButtonFecharClick(Sender: TObject);
begin
  if fnc_criar_mensagem('CONFIRMAÇÃO',
                        'Sair do Sistema',
                        'Deseja Realmente Sair do Sistema?',
                        ExtractFilePath(Application.ExeName) + 'imagens\info.png',
                        'CONFIRMAR') then
   Application.Terminate
   else
   Exit;
end;

procedure Tform_principal.SpeedButtonGerarRelatorioClick(Sender: TObject);
begin
  form_relatorios := Tform_relatorios.Create(Self);
  try
    form_relatorios.ShowModal;
  finally
    form_relatorios.Free;
  end;
end;

procedure Tform_principal.SpeedButtonGerarRelatorioMouseEnter(Sender: TObject);
begin
  SpeedButtonGerarRelatorio.Font.Color := $00591A05;
end;

procedure Tform_principal.SpeedButtonGerarRelatorioMouseLeave(Sender: TObject);
begin
  SpeedButtonGerarRelatorio.Font.Color := clWhite;
end;

procedure Tform_principal.SpeedButtonLojasClick(Sender: TObject);
begin
  form_lojas := Tform_lojas.Create(Self);
  try
    form_lojas.ShowModal;
  finally
    form_lojas.Free;
  end;
end;

procedure Tform_principal.SpeedButtonLojasMouseEnter(Sender: TObject);
begin
  SpeedButtonLojas.Font.Color := $00591A05;
end;

procedure Tform_principal.SpeedButtonLojasMouseLeave(Sender: TObject);
begin
  SpeedButtonLojas.Font.Color := clWhite;
end;

procedure Tform_principal.SpeedButtonMaximinizarClick(Sender: TObject);
begin
  Application.Minimize;
end;

procedure Tform_principal.SpeedButtonServidorClick(Sender: TObject);
begin
  form_configurar_servidor := Tform_configurar_servidor.Create(nil);
  try
    form_configurar_servidor.ShowModal;
  finally
    form_configurar_servidor.Free;
  end;
end;

procedure Tform_principal.SpeedButtonServidorMouseEnter(Sender: TObject);
begin
  SpeedButtonServidor.Font.Color := $00591A05;
end;

procedure Tform_principal.SpeedButtonServidorMouseLeave(Sender: TObject);
begin
  SpeedButtonServidor.Font.Color := clWhite;
end;

procedure Tform_principal.SpeedButtonUsuariosClick(Sender: TObject);
begin
  form_usuario_consulta := Tform_usuario_consulta.Create(Self);
  try
    form_usuario_consulta.ShowModal;
  finally
    form_usuario_consulta.Free;
  end;
end;

procedure Tform_principal.SpeedButtonUsuariosMouseEnter(Sender: TObject);
begin
  SpeedButtonUsuarios.Font.Color := $00591A05;
end;

procedure Tform_principal.SpeedButtonUsuariosMouseLeave(Sender: TObject);
begin
  SpeedButtonUsuarios.Font.Color := clWhite;
end;

end.
