unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.WinXPanels, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Panel1: TPanel;
    Image3: TImage;
    Image4: TImage;
    Panel2: TPanel;
    Image5: TImage;
    Panel3: TPanel;
    Image6: TImage;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    CardPanel1: TCardPanel;
    CardPanel2: TCardPanel;
    Card1: TCard;
    Panel7: TPanel;
    Card2: TCard;
    Panel8: TPanel;
    Image7: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel9: TPanel;
    Image8: TImage;
    Panel10: TPanel;
    Label8: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Image9: TImage;
    Label18: TLabel;
    Label19: TLabel;
    Panel11: TPanel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    cont : Integer;
    procedure pintarheader;
    procedure pintarproduto;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  cont := 10;
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if cont = 10 then
    pintarheader;

  pintarproduto;
end;

procedure TForm1.pintarheader;
begin
  with TControlCanvas.Create do
  begin
    Control := Panel11;
    Font.Color := RGB(80, 80, 80);
    Font.Size := 11;
    Font.Name := 'Segoe UI Light';
    Font.Style := [fsBold];
    TextOut(10, cont, 'Código');
    Free;
  end;
  with TControlCanvas.Create do
  begin
    Control := Panel11;
    Font.Color := RGB(80, 80, 80);
    Font.Size := 11;
    Font.Name := 'Segoe UI Light';
    //Font.Style := [fsBold];
    TextOut(140, cont, 'Descrição');
    Free;
  end;
  with TControlCanvas.Create do
  begin
    Control := Panel11;
    Font.Color := RGB(80, 80, 80);
    Font.Size := 11;
    Font.Name := 'Segoe UI Light';
    //Font.Style := [fsBold];
    TextOut(Panel11.Width - 230, cont, 'Qnt');
    Free;
  end;
  with TControlCanvas.Create do
  begin
    Control := Panel11;
    Font.Color := RGB(80, 80, 80);
    Font.Size := 11;
    Font.Name := 'Segoe UI Light';
    //Font.Style := [fsBold];
    TextOut(Panel11.Width - 170, cont, 'Vr.Unit');
    Free;
  end;
  with TControlCanvas.Create do
  begin
    Control := Panel11;
    Font.Color := RGB(24, 127, 222);
    Font.Size := 11;
    Font.Name := 'Segoe UI Light';
    Font.Style := [fsBold];
    TextOut(Panel11.Width - 100, cont, 'Total');
    Free;
  end;
  with TControlCanvas.Create do
  begin
    Control := Panel11;
    Rectangle(10, cont + 30, Panel11.Width - 10, cont + 31);
    Free;
  end;
  cont := cont + 40;
end;

procedure TForm1.pintarproduto;
begin

with TControlCanvas.Create do
begin
  Control := Panel11;
  Font.Color := RGB(24, 127, 222);
  Font.Size := 11;
  Font.Name := 'Segoe UI Light';
  Font.Style := [fsBold];
  TextOut(10, cont, '1234567890123');
  Free;
end;

with TControlCanvas.Create do
begin
  Control := Panel11;
  Font.Color := RGB(80, 80, 80);
  Font.Size := 11;
  Font.Name := 'Segoe UI Light';
  //Font.Style := [fsBold];
  TextOut(140, cont, 'Arroz Branco');
  Free;
end;

with TControlCanvas.Create do
begin
  Control := Panel11;
  Font.Color := RGB(80, 80, 80);
  Font.Size := 11;
  Font.Name := 'Segoe UI Light';
  //Font.Style := [fsBold];
  TextOut(Panel11.Width - 230, cont, '1,000x');
  Free;
end;

with TControlCanvas.Create do
begin
  Control := Panel11;
  Font.Color := RGB(80, 80, 80);
  Font.Size := 11;
  Font.Name := 'Segoe UI Light';
  //Font.Style := [fsBold];
  TextOut(Panel11.Width - 170, cont, 'R$ 13,00');
  Free;
end;

with TControlCanvas.Create do
begin
  Control := Panel11;
  Font.Color := RGB(24, 127, 222);
  Font.Size := 11;
  Font.Name := 'Segoe UI Light';
  Font.Style := [fsBold];
  TextOut(Panel11.Width - 100, cont, 'R$ 13,00');
  Free;
end;

with TControlCanvas.Create do
begin
  Control := Panel11;
  Rectangle(10, cont+30, Panel11.Width - 10, cont+31);
  Free;
end;
  cont := cont + 40;
end;

end.
