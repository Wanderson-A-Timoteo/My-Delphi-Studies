program Project2;

uses
  Vcl.Forms,
  Unit6 in 'Unit6.pas' {Form6},
  Entidade.Pedido in 'Entidades\Entidade.Pedido.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm6, Form6);
  Application.Run;
end.
