unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls;

type

  TGarrafa = class
    Cor: String;
    Modelo: String;
    Tampa: String;
    procedure ArmazenarLiquido(Liquido: String);
  end;

  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TLivro = class
  public
    Autor: String;
    Titulo: String;
    function Paginacao(Pagina: Integer): String;
  end;

  TAutor = class
  public
    Livro: Unit1.TLivro;
  end;

  TGibi = class(TLivro)
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}
{ TGarrafa }

procedure TGarrafa.ArmazenarLiquido(Liquido: String);
begin
end;

function TLivro.Paginacao(Pagina: Integer): String;
begin
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  MinhaGarrafa : TGarrafa;

begin
  MinhaGarrafa := TGarrafa.Create;
  try
    MinhaGarrafa.Modelo := 'Vidro';
    MinhaGarrafa.Cor := 'Vermelha';
  finally
    MinhaGarrafa.Free;
  end;
end;

end.
