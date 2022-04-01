unit Observer.View.Producao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Observer.Model.Interfaces, Vcl.StdCtrls,
  Observer.Model.Cozinha;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
  private
    { Private declarations }
    FDestino : iPedidoDestino;
  public
    { Public declarations }
    procedure ExibirProducao(var Observer : iSubject);
    procedure ExibirPedido(Value : String);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }

procedure TForm1.ExibirPedido(Value: String);
begin
  Memo1.Lines.Add(Value);
end;

procedure TForm1.ExibirProducao(var Observer: iSubject);
begin
  FDestino := TModelCozinha.New.Display(ExibirPedido);
  Observer.AddObserver(FDestino.Observer);
  Self.Show;
end;

end.
