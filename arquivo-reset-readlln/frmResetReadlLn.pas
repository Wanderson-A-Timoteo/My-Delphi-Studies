unit frmResetReadlLn;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Memo2: TMemo;
    Label1: TLabel;
    Label2: TLabel;
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
  f: TextFile;
  s: string;
begin
  AssignFile(f,'my.txt'); //Associa o nome do
  // arquivo a uma vari�vel
  Reset(f); //Abre o arquivo para leitura
  ReadLn(f, s); //L� a primeira linha do arquivo
  Memo2.Lines.Append(s); //Coloca a linha no Memo
  CloseFile(f); //Fecha o arquivo
end;

end.
