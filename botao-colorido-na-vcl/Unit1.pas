unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    PnlBotaoSalvar: TPanel;
    PnlBotaoFechar: TPanel;
    PnlBotaoConfirmar: TPanel;
    procedure PnlBotaoSalvarClick(Sender: TObject);
    procedure PnlBotaoFecharClick(Sender: TObject);
    procedure PnlBotaoFecharMouseEnter(Sender: TObject);
    procedure PnlBotaoFecharMouseLeave(Sender: TObject);
    procedure PnlBotaoConfirmarClick(Sender: TObject);
    procedure PnlBotaoConfirmarMouseEnter(Sender: TObject);
    procedure PnlBotaoConfirmarMouseLeave(Sender: TObject);
    procedure PnlBotaoSalvarMouseEnter(Sender: TObject);
    procedure PnlBotaoSalvarMouseLeave(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  FBotaoCorInicial : TColor;

implementation

{$R *.dfm}

procedure TForm1.PnlBotaoConfirmarClick(Sender: TObject);
begin
  ShowMessage('Botão confirmar!');
end;

procedure TForm1.PnlBotaoConfirmarMouseEnter(Sender: TObject);
begin
  FBotaoCorInicial := PnlBotaoConfirmar.Color;
  PnlBotaoConfirmar.Color   := clHotLight;
end;

procedure TForm1.PnlBotaoConfirmarMouseLeave(Sender: TObject);
begin
  PnlBotaoConfirmar.Color := FBotaoCorInicial;
end;

procedure TForm1.PnlBotaoFecharClick(Sender: TObject);
begin
  ShowMessage('Botão Fechar!');
end;

procedure TForm1.PnlBotaoFecharMouseEnter(Sender: TObject);
begin
  FBotaoCorInicial := PnlBotaoFechar.Color;
  PnlBotaoFechar.Color   := clRed;
end;

procedure TForm1.PnlBotaoFecharMouseLeave(Sender: TObject);
begin
  PnlBotaoFechar.Color := FBotaoCorInicial;
end;

procedure TForm1.PnlBotaoSalvarClick(Sender: TObject);
begin
  ShowMessage('Botão Salvar!');
end;

procedure TForm1.PnlBotaoSalvarMouseEnter(Sender: TObject);
begin
  FBotaoCorInicial := PnlBotaoSalvar.Color;
  PnlBotaoSalvar.Color   := clGreen;
end;

procedure TForm1.PnlBotaoSalvarMouseLeave(Sender: TObject);
begin
  PnlBotaoSalvar.Color := FBotaoCorInicial;
end;

end.
