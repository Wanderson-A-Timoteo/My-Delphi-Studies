unit unit_principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Buttons;

type
  Tform_principal = class(TForm)
    pnl_fundo: TPanel;
    pnl_topo: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Image1: TImage;
    Label1: TLabel;
    Panel2: TPanel;
    pnl_menu_lateral: TPanel;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    btn_menu_hamburgue: TSpeedButton;
    SpeedButton3: TSpeedButton;
    pnl_barra: TPanel;
    Panel1: TPanel;
    SpeedButton4: TSpeedButton;
    SpeedButton13: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btn_menu_hamburgueClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_principal: Tform_principal;
  bExpandido : Boolean;

implementation

{$R *.dfm}

procedure Tform_principal.btn_menu_hamburgueClick(Sender: TObject);
begin
  if bExpandido then
    pnl_menu_lateral.Width := 45
  else
    pnl_menu_lateral.Width := 160;

  bExpandido := not bExpandido;
end;

procedure Tform_principal.SpeedButton1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure Tform_principal.SpeedButton2Click(Sender: TObject);
begin
  Application.Minimize;
end;

procedure Tform_principal.SpeedButton5Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
