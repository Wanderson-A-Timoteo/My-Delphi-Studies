unit classe.agendamento;

interface

uses
  FireDAC.Comp.Client, classe_conexao, System.SysUtils, Vcl.Forms;

type
  TAgendamentos = class
    private
    FConexao: TFDConnection;
    Fcli_id_cliente: Integer;
    Fhr_hora: String;
    Fpro_id_profissional: Integer;
    Fid_agendamento: Integer;
    Fds_obs: String;
    Fdt_data: TDate;
    Fusu_id_usuarios: Integer;

    public
      property Conexao             : TFDConnection read FConexao       write FConexao;
      property id_agendamento      : Integer read Fid_agendamento      write Fid_agendamento;
      property cli_id_cliente      : Integer read Fcli_id_cliente      write Fcli_id_cliente;
      property pro_id_profissional : Integer read Fpro_id_profissional write Fpro_id_profissional;
      property usu_id_usuarios     : Integer read Fusu_id_usuarios     write Fusu_id_usuarios;
      property dt_data             : TDate   read Fdt_data             write Fdt_data;
      property hr_hora             : String  read Fhr_hora             write Fhr_hora;
      property ds_obs              : String  read Fds_obs              write Fds_obs;

      constructor Create (Conexao  : TFDConnection);
      destructor Destroy; Override;
  end;

implementation

{ TAgendamentos }

constructor TAgendamentos.Create(Conexao: TFDConnection);
begin
  FConexao := Conexao;
end;

destructor TAgendamentos.Destroy;
begin

  inherited;
end;

end.
