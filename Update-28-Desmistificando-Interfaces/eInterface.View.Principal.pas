unit eInterface.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, eInterface.Model.Interfaces,
  eInterface.Controller.Interfaces, eInterface.Controller.Pessoa;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Memo1: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    label3: TLabel;
    ComboBox1: TComboBox;
    procedure Button1Click(Sender: TObject);
    procedure Selecione(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FPessoa : IPessoa;
    procedure ExibeResultado(Value : String);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  FPessoa
    .Nome(Edit1.Text)
    .SobreNome(Edit2.Text)
    .Display(ExibeResultado)
    .NomeCompleto
end;

procedure TForm1.ExibeResultado(Value: String);
begin
  Memo1.Lines.Add(Value);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := true;
end;

procedure TForm1.Selecione(Sender: TObject);
begin
  case ComboBox1.ItemIndex of
    0 : FPessoa := TControllerPessoa.New.Pessoa(tpFisica);
    1 : FPessoa := TControllerPessoa.New.Pessoa(tpJuridica);
  end;
end;

end.
