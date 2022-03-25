unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Classe.Calculadora,
  Calculadora.Interfaces;

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
    procedure FormCreate(Sender: TObject);

  private
    FCalculadora: ICalculadora;


  public

    property Calculadora : ICalculadora read FCalculadora write FCalculadora;

  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }

procedure TForm1.btnDividirClick(Sender: TObject);
begin
  Edit3.Text := Calculadora.Add(Edit1.Text).Add(Edit2.Text).Dividir.Executar;
end;

procedure TForm1.btnMultiplicarClick(Sender: TObject);
begin
  Edit3.Text := Calculadora.Add(Edit1.Text).Add(Edit2.Text).Multiplicar.Executar;
end;

procedure TForm1.btnSomarClick(Sender: TObject);
begin
  Edit3.Text :=  Calculadora.Add(Edit1.Text).Add(Edit2.Text).Somar.Executar;
end;

procedure TForm1.btnSubtrairClick(Sender: TObject);
begin
  Edit3.Text := Calculadora.Add(Edit1.Text).Add(Edit2.Text).Subtrair.Executar;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Calculadora := TCalculadora.New;
end;

end.
