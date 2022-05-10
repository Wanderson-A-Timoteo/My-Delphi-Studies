unit unitCadastroAgendamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask, Data.DB, Vcl.Grids,
  Vcl.DBGrids;

type
  TfrmCadastroAgendamento = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    DBLookupComboBoxNomeCompleto: TDBLookupComboBox;
    DBEditDataAgendada: TDBEdit;
    Label2: TLabel;
    DBEditHoraAgendada: TDBEdit;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBComboBoxEspecialidade: TDBComboBox;
    DBNavigator1: TDBNavigator;
    DBEditNomeMedico: TDBEdit;
    DBGridAgendamentos: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroAgendamento: TfrmCadastroAgendamento;

implementation

uses
  unitDM;

{$R *.dfm}

end.
