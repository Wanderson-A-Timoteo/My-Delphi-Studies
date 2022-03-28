unit eNota.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, eNota.Controller.NotaFiscal.Interfaces,
  Vcl.StdCtrls, eNota.Controller.NotaFiscal;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    FNotaFiscal : iNotaFiscalView;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  TControllerNotaFiscal.New.EnviarNotaSefaz;
end;

end.
