unit FactoryMethod.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FactoryMethod.Model.Factory,
  Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    ComboBox1: TComboBox;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses
  FactoryMethod.Model.Interfaces;

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  ShowMessage(
    TModelFactory
      .New
      .Refrigerante(
        TTipoRefrigerante(ComboBox1.ItemIndex)
        )
      .GetNome
    );
end;

end.
