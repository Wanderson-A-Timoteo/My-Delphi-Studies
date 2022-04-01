unit Observer.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Observer.Model.Interfaces,
  Observer.Model.Garcom, Observer.Model.Cozinha, Observer.Model.Observer,
  Observer.Model.Pedido, Observer.View.Producao;

type
  TForm2 = class(TForm)
    Memo1: TMemo;
    Memo2: TMemo;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    FGarcom : iPedidoOrigem;
    FCozinha : iPedidoDestino;
    FPedido : iPedido;

    FIniciaPedido : iSubject;
    FFinilizaPedido : iSubject;

  public
    { Public declarations }
    procedure ExibirGarcom(Value : String);
    procedure ExibirCozinha(Value : String);
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

{ TForm2 }

procedure TForm2.Button1Click(Sender: TObject);
var
  Pedido : TPedido;
begin
  Pedido.Produto := Edit1.Text;
  Pedido.Setor := 'Garçom';

  TModelPedido.New
    .Observer(FIniciaPedido)
    .Origem(FGarcom)
    .Pedido(Pedido)
    .FazerPedido;
end;

procedure TForm2.Button2Click(Sender: TObject);
var
  Pedido : TPedido;
begin
  Pedido.Produto := Edit1.Text;
  Pedido.Setor := 'Cozinha';

  TModelPedido.New
    .Observer(FFinilizaPedido)
    .Origem(FGarcom)
    .Pedido(Pedido)
    .FinalizarPedido;

end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  Form1.ExibirProducao(FIniciaPedido);
end;

procedure TForm2.ExibirCozinha(Value: String);
begin
  Memo2.Lines.Add(Value);
end;

procedure TForm2.ExibirGarcom(Value: String);
begin
  Memo1.Lines.Add(Value);
end;


procedure TForm2.FormCreate(Sender: TObject);
begin
  FGarcom := TModelGarcom.New.Display(ExibirGarcom);
  FCozinha := TModelCozinha.New.Display(ExibirCozinha);

  FIniciaPedido := TModelObserver.New.AddObserver(FCozinha.Observer);
  FFinilizaPedido := TModelObserver.New.AddObserver(FGarcom.Observer);
end;

end.


