unit Flyweigth.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Flyweigth.Model.Interfaces,
  Flyweigth.Model.Flyweight, Flyweigth.Model.Cliente, Vcl.StdCtrls,
  System.Generics.Collections;

type
  TClientes = record
    Nome : String;
    Email : String;
    Nacionalidade : String;
  end;

  TForm2 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    FFlyweight : iFlyWeight;
    FLista : TList<TClientes>;
  public
    { Public declarations }
    procedure Exibir(Value : String);
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var
  CLiente : TClientes;
  I: Integer;
begin
  CLiente.Nome := 'Wanderson';
  Cliente.Email := 'wandersontimoteo@gmail.com';
  CLiente.Nacionalidade := 'Brasil';
  FLista.Add(Cliente);

  CLiente.Nome := 'Ryan';
  Cliente.Email := 'ryantimoteo@gmail.com';
  CLiente.Nacionalidade := 'USA';
  FLista.Add(Cliente);

  CLiente.Nome := 'Jeane';
  Cliente.Email := 'jeanetimoteo@gmail.com';
  CLiente.Nacionalidade := 'Espanha';
  FLista.Add(Cliente);

  CLiente.Nome := 'Lisandra';
  Cliente.Email := 'wandersontimoteo@gmail.com';
  CLiente.Nacionalidade := 'Brasil';
  FLista.Add(Cliente);

  CLiente.Nome := 'Thamires';
  Cliente.Email := 'wandersontimoteo@gmail.com';
  CLiente.Nacionalidade := 'USA';
  FLista.Add(Cliente);

  CLiente.Nome := 'Romulo';
  Cliente.Email := 'wandersontimoteo@gmail.com';
  CLiente.Nacionalidade := 'Brasil';
  FLista.Add(Cliente);


  for I := 0 to Pred(FLista.Count) do
    FFlyweight
      .GetCliente(FLista[I].Nacionalidade)
      .Display(Exibir)
      .SetEmail(FLista[I].Email)
      .SetNome(FLista[I].Nome)
      .EnviarEmail;

end;

procedure TForm2.Exibir(Value: String);
begin
  Memo1.Lines.Add(Value);
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  FFlyweight := TModelFlyweight.New;
  FLista := TList<TClientes>.Create;
end;

procedure TForm2.FormDestroy(Sender: TObject);
begin
  FLista.Free;
end;

end.
