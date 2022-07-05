unit unit_modelo1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls;

type
  Tform_modelo1 = class(TForm)
    image_seta_esquerda_voltar: TImage;
    btn_fechar_janela: TSpeedButton;
    procedure btn_fechar_janelaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure image_seta_esquerda_voltarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_modelo1: Tform_modelo1;

implementation

{$R *.dfm}

uses unit_principal;

procedure Tform_modelo1.btn_fechar_janelaClick(Sender: TObject);
begin
  form_principal.pnl_menu.Enabled := True;
  form_modelo1.Close;
end;

procedure Tform_modelo1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(form_modelo1);
end;

procedure Tform_modelo1.image_seta_esquerda_voltarClick(Sender: TObject);
begin
  form_principal.pnl_menu.Enabled := True;
  form_modelo1.Close;
end;

end.
