unit Relatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFormRelatorio = class(TForm)
    Label1: TLabel;
    PanelContainer: TPanel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRelatorio: TFormRelatorio;

implementation

{$R *.dfm}

procedure TFormRelatorio.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TFormRelatorio.FormActivate(Sender: TObject);
begin
  PanelContainer.Left := Round( (FormRelatorio.Width - PanelContainer.Width) / 2);
  PanelContainer.Top  := Round( (FormRelatorio.Height - PanelContainer.Height) / 2);
end;

end.
