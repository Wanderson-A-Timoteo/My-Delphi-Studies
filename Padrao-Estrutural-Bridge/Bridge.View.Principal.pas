unit Bridge.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Bridge.Model.Interfaces,
  Bridge.Model.SPED.C100, Bridge.Model.SPED.C190, Bridge.Model.Venda,
  Vcl.StdCtrls, Bridge.Model.SPED.C140;

type
  TForm2 = class(TForm)
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

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  TModelVenda.New
    .Exportar(
      TModelSPEDC100.New
    )
    .Exportar(
      TModelSPEDC140.New
    )
    .Exportar(
      TModelSPEDC190.New
    );
end;

end.
