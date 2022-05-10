unit unitDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDataModule1 = class(TDataModule)
    ConexaoPostgres: TFDConnection;
    tbPaciente: TFDTable;
    DataSourcePaciente: TDataSource;
    tbAgendamento: TFDTable;
    DataSourceAgendamento: TDataSource;
    tbPacienteid: TIntegerField;
    tbPacientecpf: TWideStringField;
    tbPacientenome: TWideStringField;
    tbPacientetelefone: TWideStringField;
    tbPacientedata_cadastro: TDateField;
    tbAgendamentoid: TIntegerField;
    tbAgendamentoid_paciente: TIntegerField;
    tbAgendamentodata_agendada: TDateField;
    tbAgendamentohora: TWideStringField;
    tbAgendamentoespecialidade: TWideStringField;
    tbAgendamentomedico: TWideStringField;
    procedure tbPacienteAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDataModule1.tbPacienteAfterInsert(DataSet: TDataSet);
begin
  tbPacientedata_cadastro.Value := Date();
end;

end.
