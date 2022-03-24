unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Classe.Calculadora;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    btnSomar: TButton;
    btnSubtrair: TButton;
    btnDividir: TButton;
    btnMultiplicar: TButton;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure btnSomarClick(Sender: TObject);
    procedure btnSubtrairClick(Sender: TObject);
    procedure btnDividirClick(Sender: TObject);
    procedure btnMultiplicarClick(Sender: TObject);
  private
    FCalculadora: ICalculadora;
    procedure SetCalculadora(const Value: ICalculadora);
    procedure Operacao;
    { Private declarations }
  public
    { Public declarations }
    property Calculadora : ICalculadora read FCalculadora write SetCalculadora;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }

procedure TForm1.btnDividirClick(Sender: TObject);
begin
  Calculadora := TDividir.New;
  Operacao;
end;

procedure TForm1.btnMultiplicarClick(Sender: TObject);
begin
  Calculadora := TMultiplicar.New;
  Operacao;
end;

procedure TForm1.btnSomarClick(Sender: TObject);
begin
  Calculadora := TSomar.New;
  Operacao;
end;

procedure TForm1.btnSubtrairClick(Sender: TObject);
begin
  Calculadora := TSubtrair.New;
  Operacao;
end;

procedure TForm1.Operacao;
begin
  Edit3.Text := FloatToStr(Calculadora.Operacao(StrToFloat(Edit1.Text), StrToFloat(Edit2.Text)));
end;

procedure TForm1.SetCalculadora(const Value: ICalculadora);
begin
  FCalculadora := Value;
end;

end.
