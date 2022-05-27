program DesignCriativo;

uses
  Vcl.Forms,
  designCriativo.view.index in 'src\view\designCriativo.view.index.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
