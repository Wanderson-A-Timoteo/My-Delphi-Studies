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
    procedure Sair1Click(Sender: TObject);
    procedure SpeedButtonFecharClick(Sender: TObject);
    procedure SpeedButtonMaximinizarClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure SpeedButtonServidorClick(Sender: TObject);
    procedure SpeedButtonAgendamentoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_principal: Tform_principal;

implementation

{$R *.dfm}

uses unit_configurar_servidor, unit_funcoes, unit_mensagens, unit_agendamento, unit_clientes;

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
                        ExtractFilePath(Application.ExeName) + 'imagens\aviso.png',
                        'Comfirmar') then
   Application.Terminate
   else
   Exit;
end;

procedure Tform_principal.SpeedButtonAgendamentoClick(Sender: TObject);
begin
  form_agendamento := Tform_agendamento.Create(Self);
  try
    form_agendamento.ShowModal;
  finally
    form_agendamento.Free;
  end;
end;

procedure Tform_principal.SpeedButtonFecharClick(Sender: TObject);
begin
  if fnc_criar_mensagem('CONFIRMAÇÃO',
                        'Sair do Sistema',
                        'Deseja Realmente Sair do Sistema?',
                        ExtractFilePath(Application.ExeName) + 'imagens\aviso.png',
                        'Comfirmar') then
   Application.Terminate
   else
   Exit;
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

end.
