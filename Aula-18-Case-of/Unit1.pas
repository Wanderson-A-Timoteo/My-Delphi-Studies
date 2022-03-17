unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  { Os parametros da estrutura Case precisam ser numeros inteiros ou enumerados }
  case MessageDlg('Devo continuar?', mtConfirmation, [mbYes, mbNo, mbCancel], 0) of
    6:
      ShowMessage('Seja feliz com sua aplicação');
    7:
      begin
        ShowMessage('Adeus');
        Close;
      end;
  else
    begin
      ShowMessage('Tudo bem então, você quem sabe, não farei nada');
    end;
  end;
end;

end.
