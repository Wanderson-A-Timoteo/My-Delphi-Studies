unit TemplateMethod.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TForm2 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TAbstractClass = class abstract
  protected
    FValor : Integer;
  public
    procedure PrimitiveOperation; virtual; abstract;
    function PrimitiveOperation1: Integer; virtual; abstract;
    procedure TemplateMethod;
  end;

  TConcreteClass = class(TAbstractClass)
  public
    procedure PrimitiveOperation; override;
    function PrimitiveOperation1: Integer; override;
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TAbstractClass.TemplateMethod;
begin
  FValor := 10;
  // something happens here...
  PrimitiveOperation();
  // ...
  // later we need another step
  PrimitiveOperation1();
end;

procedure TConcreteClass.PrimitiveOperation;
begin
  { put implementation of particular step of template method here }
  FValor := FValor + 20;
end;

function TConcreteClass.PrimitiveOperation1: Integer;
begin
  { put implementation of particular step of template method here }
  Result := 0;
  FValor := FValor + 10;
end;


procedure TForm2.FormCreate(Sender: TObject);
var
  Classe1 : TConcreteClass;
begin
  Classe1 := TConcreteClass.Create;
  Classe1.TemplateMethod;
  ShowMessage(IntToStr(Classe1.FValor));
end;

end.
