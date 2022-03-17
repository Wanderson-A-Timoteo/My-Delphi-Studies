unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
Tpessoa = record
  Nome : String;
  Idade: Integer;
end;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Button2: TButton;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Pessoa : array[0..9] of TPessoa;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  novaPessoa : TPessoa;

begin
  novaPessoa.Nome  := Edit1.Text;
  novaPessoa.Idade := StrToInt(Edit3.Text);
  Pessoa[StrToInt(Edit2.Text)] := novaPessoa;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  ShowMessage('Nome: ' + Pessoa[StrToInt(Edit2.Text)].Nome + ', Idade: ' + IntToStr(Pessoa[StrToInt(Edit2.Text)].Idade)+ ' anos ');
end;

end.
