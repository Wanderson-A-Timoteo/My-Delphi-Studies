unit Unit1;
{

 PROPERTY s�o como os gethers e sethers do JAVA, ou seja, s�o propriedades
 de alguns atributos que permitem a altera��o de seu valor de forma
 implicita.

}

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Memo.Types, FMX.ScrollBox,
  FMX.Memo, Cliente, FMX.Edit;

type

  TForm1 = class(TForm)
    Button2: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

{ TForm1 }

procedure TForm1.Button2Click(Sender: TObject);
var
  Cliente : TCliente;

begin
  Cliente := TCliente.Create;
  try
    Cliente.Nome := 'Wanderson';
    Cliente.Telefone := '6532489444';
    Cliente.Endereco := 'Rua da saudade ';
    Cliente.Cidade := 'Cuiab�';
    cliente.DataNascimento := StrToDateTime(Edit1.Text);

    Cliente.CadastrarCliente;
    Cliente.CriarFinanceiro;

    ShowMessage(Cliente.Endereco);
  finally
    Cliente.Free;
  end;
end;

end.
