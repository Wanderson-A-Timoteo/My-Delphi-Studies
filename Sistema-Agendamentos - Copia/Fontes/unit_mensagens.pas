unit unit_mensagens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.Imaging.pngimage;

type
  Tform_mensagens = class(TForm)
    panel_fundo: TPanel;
    shape_fundo: TShape;
    panel_borda_header: TPanel;
    label_titulo_janela: TLabel;
    img_icone: TImage;
    label_titulo_msg: TLabel;
    label_mensagem_para_usuario: TLabel;
    pnlBotoesSimNao: TPanel;
    pnlBotaoNao: TPanel;
    SpeedButtonNao: TSpeedButton;
    pnlBotaoSim: TPanel;
    SpeedButtonSim: TSpeedButton;
    procedure SpeedButtonNaoClick(Sender: TObject);
    procedure SpeedButtonSimClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButtonSimMouseEnter(Sender: TObject);
    procedure SpeedButtonSimMouseLeave(Sender: TObject);
    procedure SpeedButtonNaoMouseEnter(Sender: TObject);
    procedure SpeedButtonNaoMouseLeave(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    bRespostaMSG : Boolean;
    sCaminhoImagem,
    sTituloJanela,
    sTituloMSG,
    sTipo,
    sMSG : String
  end;

var
  form_mensagens: Tform_mensagens;

implementation

{$R *.dfm}

procedure Tform_mensagens.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Tform_mensagens.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    SpeedButtonSimClick(Self)
  else
  if Key = VK_ESCAPE then
    SpeedButtonNaoClick(Self);

end;

procedure Tform_mensagens.FormShow(Sender: TObject);
begin
  bRespostaMSG                        := False;
  label_titulo_janela.Caption         := sTituloJanela;
  label_titulo_msg.Caption            := sTituloMSG;
  label_mensagem_para_usuario.Caption := sMSG;
  img_icone.Picture.LoadFromFile( sCaminhoImagem );

  if sTipo = 'OK' then
  begin
    pnlBotaoNao.Visible := False;
    SpeedButtonSim.Caption := 'OK (Enter)';
  end;
end;

procedure Tform_mensagens.SpeedButtonNaoClick(Sender: TObject);
begin
  bRespostaMSG := False;
  Close;
end;

procedure Tform_mensagens.SpeedButtonNaoMouseEnter(Sender: TObject);
begin
  SpeedButtonNao.Font.Color := $00591A05;
end;

procedure Tform_mensagens.SpeedButtonNaoMouseLeave(Sender: TObject);
begin
  SpeedButtonNao.Font.Color := clWhite;
end;

procedure Tform_mensagens.SpeedButtonSimClick(Sender: TObject);
begin
  bRespostaMSG := True;
  Close;
end;

procedure Tform_mensagens.SpeedButtonSimMouseEnter(Sender: TObject);
begin
  SpeedButtonSim.Font.Color := $00591A05;
end;

procedure Tform_mensagens.SpeedButtonSimMouseLeave(Sender: TObject);
begin
  SpeedButtonSim.Font.Color := clWhite;
end;

end.



