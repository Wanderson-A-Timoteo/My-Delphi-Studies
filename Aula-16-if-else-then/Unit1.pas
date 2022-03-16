unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
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
var
  b : boolean;
begin
  b := true;
  // CheckBox j� retorna um boolean
  if CheckBox1.Checked AND CheckBox2.Checked then
    ShowMessage('CheckBox1 e CheckBox2 Marcados')
  else if CheckBox1.Checked then
    ShowMessage('Apenas CheckBox1 Marcado')
  else if CheckBox2.Checked then
    ShowMessage('Apenas CheckBox2 Marcado')
  else
    ShowMessage('Nenhum CheckBox Marcado');
end;

end.
