unit View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Classe.Pessoa,
  Classe.Vendedor, Classe.Administrativo;

type
  TEnumFuncao = (tpAdministrativo, tpVendedor, tpFuncionario);

type
  TForm1 = class(TForm)
    Label1: TLabel;
    cbFuncao: TComboBox;
    Label2: TLabel;
    edtNome: TEdit;
    Label3: TLabel;
    edtSalario: TEdit;
    Label4: TLabel;
    edtBonus: TEdit;
    btnCadastrar: TButton;
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    btnCalcular: TButton;
    procedure btnCadastrarClick(Sender: TObject);
    procedure btnCalcularClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure fnc_IncluirAdministrativo;
    procedure fnc_IncluirVendedor;
    procedure fnc_IncluirFuncionario;
    { Private declarations }
  public

    Funcionario: Array [1 .. 100] of TPessoa; { Polimorfismo -> Herença }
    QtdFuncionario: Integer;

  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnCadastrarClick(Sender: TObject);
begin
  try
    case TEnumFuncao(cbFuncao.ItemIndex) of
      tpAdministrativo:
        begin
          fnc_IncluirAdministrativo;
        end;
      tpVendedor:
        begin
          fnc_IncluirVendedor;
        end;
      tpFuncionario:
        begin
          fnc_IncluirFuncionario;
        end;
    end;
    Inc(QtdFuncionario);
  except
    raise Exception.Create('Error ao cadastrar funcionário');
  end;

end;

procedure TForm1.btnCalcularClick(Sender: TObject);
var
  i: Integer;
begin
  i := 0;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  QtdFuncionario := 0;
end;

procedure TForm1.fnc_IncluirAdministrativo;
begin
  Funcionario[QtdFuncionario] := TAdministrativo.Create;
  TAdministrativo(Funcionario[QtdFuncionario]).Bonus :=
    StrToCurr(edtBonus.Text);
  TAdministrativo(Funcionario[QtdFuncionario]).Nome := edtNome.Text;
  TAdministrativo(Funcionario[QtdFuncionario]).Salario :=
    StrToCurr(edtSalario.Text);
end;

procedure TForm1.fnc_IncluirVendedor;
begin
  Funcionario[QtdFuncionario] := TVendedor.Create;
  TVendedor(Funcionario[QtdFuncionario]).Comissao := StrToCurr(edtBonus.Text);
  TVendedor(Funcionario[QtdFuncionario]).Nome := edtNome.Text;
  TVendedor(Funcionario[QtdFuncionario]).Salario := StrToCurr(edtSalario.Text);
end;

procedure TForm1.fnc_IncluirFuncionario;
begin
  Funcionario[QtdFuncionario] := TPessoa.Create;
  (Funcionario[QtdFuncionario]).Nome := edtNome.Text;
  (Funcionario[QtdFuncionario]).Salario := StrToCurr(edtSalario.Text);
end;

end.
