unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Memo.Types, FMX.ScrollBox,
  FMX.Memo;

type
{
  RECORDS assim como as classes são registros que podemos estruturar
}
  // Criando um RECORD de configuração
  TConfiguracao = record
    Host : String;
    Path : String;
    Usuario : String;
    Senha : String;
  end;


  TRoda = class
    Tamanho :  Integer;
    Material : String;
  end;

  TMotor = class
    Potencia : Integer;


  end;

  // Classe composta
  TCarro = class
    Cor : String;
    Modelo : String;
    Marca : String;
    Roda : TRoda;    // Podemos criar uma Caneca do tipo classe TCaneca
    motor : TMotor;  // Porém ela precisa ser criada e destruida

    constructor Create;
    destructor Destroy; override;
  end;


  // Criando uma classe
  TGarrafa = class
    Cor: String;
    Modelo: String;
    Tampa: String;
    procedure ArmazenarLiquido(Liquido: String);
  end;

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
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
{ TGarrafa }

procedure TGarrafa.ArmazenarLiquido(Liquido: String);
begin
end;


procedure TForm1.Button1Click(Sender: TObject);
var
  MinhaGarrafa : TGarrafa;

begin
  MinhaGarrafa := nil;  // nil poderá dar erro em mobile devido ao ARC
  if Assigned(MinhaGarrafa) then
    ShowMessage('Estou instanciado')
  else
    //ShowMessage('Não estou instanciado');
    MinhaGarrafa := TGarrafa.Create;   // Instanciando
  try
    MinhaGarrafa.Modelo := 'Vidro';
    MinhaGarrafa.Cor := 'Vermelha';
  finally
// Quando usar nil para mobile, executar FreeAndNil para o ARC limpar a memoria
    FreeAndNil(MinhaGarrafa);
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
{
  RECORD usa memoria local, dessa forma já podemos usa-la, pois não precisamos
   executar o create e sem precisar limpar a memoria, ele trabalha com valor e
    não por referencia como a classe, e isso é ruin para a memoria pois cria
    uma copia do registro e isso gera lixo na memoria.
}
  Configuracao : TConfiguracao;
begin
  Configuracao.Host    := 'testeHost';
  Configuracao.Path    := 'testePath';
  Configuracao.Usuario := 'testeUsuario';
  Configuracao.Senha   := 'testeSenha';

  Memo1.Lines.Add(Configuracao.Host);
  Memo1.Lines.Add(Configuracao.Path);
  Memo1.Lines.Add(Configuracao.Usuario);
  Memo1.Lines.Add(Configuracao.Senha);
end;

{ TCarro }
// Instanciando as classes
constructor TCarro.Create;
begin
  Roda := TRoda.Create;
  Motor := TMotor.Create;
end;
// Destruindo as classes para limpar a memoia
destructor TCarro.Destroy;
begin
  Motor.Free;
  Roda.Free;
  inherited;
end;

end.
