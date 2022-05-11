unit unitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmPrincipal = class(TForm)
    RadioGroupOpcoes: TRadioGroup;
    LabelPesquisa: TLabel;
    EditPesquisa: TEdit;
    Button1: TButton;
    DBGrid1: TDBGrid;
    procedure RadioGroupOpcoesClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  unitDM;

{$R *.dfm}

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
  DataModule1.QryConsulta.Close;
  DataModule1.QryConsulta.SQL.Clear;

  if RadioGroupOpcoes.ItemIndex = 0 then
  begin
    DataModule1.QryConsulta.SQL.Add('SELECT * FROM clientes WHERE nome LIKE :pConsulta');
    DataModule1.QryConsulta.ParamByName('pConsulta').AsString := EditPesquisa.Text+'%';
  end;

  if RadioGroupOpcoes.ItemIndex = 1 then
    begin
      DataModule1.QryConsulta.SQL.Add('SELECT * FROM clientes WHERE bairro LIKE :pConsulta');
      DataModule1.QryConsulta.ParamByName('pConsulta').AsString := EditPesquisa.Text+'%';
    end;

  DataModule1.QryConsulta.Open;

end;

procedure TfrmPrincipal.RadioGroupOpcoesClick(Sender: TObject);
begin
  if RadioGroupOpcoes.ItemIndex = 0 then
    begin
      LabelPesquisa.Caption := 'Figite o Nome';
    end;

  if RadioGroupOpcoes.ItemIndex = 1 then
    begin
      LabelPesquisa.Caption := 'Digite o Bairro';
    end;
end;

end.
