unit SistemaFinanceiro.View.Splash;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Imaging.pngimage;

type
  TfrmSplash = class(TForm)
    pnlPrincipal: TPanel;
    imgDll: TImage;
    lblNomeAplicacao: TLabel;
    ProgressBar1: TProgressBar;
    lblStatus: TLabel;
    Timer1: TTimer;
    Panel1: TPanel;
    Image1: TImage;
    imgBancoDeDados: TImage;
    imgConfiguracao: TImage;
    imgIniciar: TImage;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    procedure AtualizarStatus(Mensagem: String; Image : TImage);
  public
    { Public declarations }
  end;

var
  frmSplash: TfrmSplash;

implementation

{$R *.dfm}

procedure TfrmSplash.AtualizarStatus(Mensagem: String; Image : TImage);
begin
  lblStatus.Caption := Mensagem;
  Image.Visible := True;
end;

procedure TfrmSplash.Timer1Timer(Sender: TObject);
begin
  if ProgressBar1.Position <= 100 then
  begin
    ProgressBar1.StepIt;
    case ProgressBar1.Position of
      10:
        AtualizarStatus('Carregando dependências...', imgDll);
      25:
        AtualizarStatus('Conectando ao Banco de Dados...', imgBancoDeDados);
      45:
        AtualizarStatus('Carregando as configurações...', imgConfiguracao);
      75:
        AtualizarStatus('Iniciando o Sistema...', imgIniciar);

    end;
  end;
  if ProgressBar1.Position = 100 then
  begin
    Close;
  end;

end;

end.
