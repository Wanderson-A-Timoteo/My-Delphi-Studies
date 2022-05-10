unit unitCadastroPaciente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Mask,
  Vcl.ExtCtrls;

type
  TfrmCadastroPaciente = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    DBEditCPF: TDBEdit;
    DBEditNome: TDBEdit;
    DBEditTelefone: TDBEdit;
    DBEditDataCadastro: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Label7: TLabel;
    EditBuscarPaciente: TEdit;
    procedure EditBuscarPacienteChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroPaciente: TfrmCadastroPaciente;

implementation

{$R *.dfm}

uses unitDM;

procedure TfrmCadastroPaciente.EditBuscarPacienteChange(Sender: TObject);
begin
  DataModule1.tbPaciente.Locate('nome', EditBuscarPaciente.Text, [loPartialKey]);
end;

end.
