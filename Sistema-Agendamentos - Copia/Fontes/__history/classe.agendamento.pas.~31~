unit classe.agendamento;

interface

uses
  FireDAC.Comp.Client, classe_conexao, System.SysUtils, Vcl.Forms,
  Datasnap.DBClient;

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

      function fnc_consulta(id_profissional: Integer; Data: TDate): TFDQuery;
      function fnc_consultar_por_cliente(NomeCliente: String): TFDQuery;
      function fnc_validar_agendamento(id_profissional: Integer; Data: TDate; hr_hora: String): Boolean;
      function fnc_inserir : String;

      procedure fnc_montar_agenda(dt_data : TDate; cds_agenda : TClientDataSet);

  end;


var
  QryConsulta : TFDQuery;

implementation

{ TAgendamentos }

uses unit_funcoes, unit_dados;


constructor TAgendamentos.Create(Conexao: TFDConnection);
begin
  FConexao               := Conexao;
  QryConsulta            := TFDQuery.Create(nil);
  QryConsulta.Connection := FConexao;
end;

destructor TAgendamentos.Destroy;
begin
  QryConsulta.Free;
  inherited;
end;

function TAgendamentos.fnc_consulta( id_profissional : Integer; Data : TDate ) : TFDQuery;
begin

  FConexao.Connected := True;

  try
    QryConsulta.Close;
    QryConsulta.SQL.Clear;
    QryConsulta.SQL.Add('SELECT   agendamentos.id_agendamento,                                    ');
    QryConsulta.SQL.Add('         agendamentos.cli_id_cliente,                                    ');
    QryConsulta.SQL.Add('         clientes.ds_cliente,                                            ');
    QryConsulta.SQL.Add('         agendamentos.pro_id_profissional,                               ');
    QryConsulta.SQL.Add('         profissionais.ds_profissional,                                  ');
    QryConsulta.SQL.Add('         agendamentos.usu_id_usuarios,                                   ');
    QryConsulta.SQL.Add('         agendamentos.dt_data,                                           ');
    QryConsulta.SQL.Add('         agendamentos.hr_hora,                                           ');
    QryConsulta.SQL.Add('         agendamentos.ds_obs                                             ');
    QryConsulta.SQL.Add('FROM     agendamentos agendamentos                                       ');
    QryConsulta.SQL.Add('INNER JOIN clientes clientes                                             ');
    QryConsulta.SQL.Add('ON       agendamentos.cli_id_cliente      = clientes.id_cliente          ');
    QryConsulta.SQL.Add('INNER JOIN profissionais profissionais                                   ');
    QryConsulta.SQL.Add('ON       agendamentos.pro_id_profissional = profissionais.id_profissional');
    QryConsulta.SQL.Add('WHERE    agendamentos.pro_id_profissional = :p_id_profissional           ');
    QryConsulta.SQL.Add('AND      agendamentos.dt_data             = :p_data                      ');
    QryConsulta.SQL.Add('ORDER BY agendamentos.hr_hora                                            ');
    QryConsulta.ParamByName('p_id_profissional').AsInteger := id_profissional;
    QryConsulta.ParamByName('p_data').AsDate               := Data;
    QryConsulta.Open;
  finally
    Result := QryConsulta;
  end;

end;

function TAgendamentos.fnc_consultar_por_cliente( NomeCliente : String ) : TFDQuery;
begin

  FConexao.Connected := True;

  try
    QryConsulta.Close;
    QryConsulta.SQL.Clear;
    QryConsulta.SQL.Add('SELECT   agendamentos.id_agendamento,                                    ');
    QryConsulta.SQL.Add('         agendamentos.cli_id_cliente,                                    ');
    QryConsulta.SQL.Add('         clientes.ds_cliente,                                            ');
    QryConsulta.SQL.Add('         agendamentos.pro_id_profissional,                               ');
    QryConsulta.SQL.Add('         profissionais.ds_profissional,                                  ');
    QryConsulta.SQL.Add('         agendamentos.usu_id_usuarios,                                   ');
    QryConsulta.SQL.Add('         agendamentos.dt_data,                                           ');
    QryConsulta.SQL.Add('         agendamentos.hr_hora,                                           ');
    QryConsulta.SQL.Add('         agendamentos.ds_obs                                             ');
    QryConsulta.SQL.Add('FROM     agendamentos agendamentos                                       ');
    QryConsulta.SQL.Add('INNER JOIN clientes clientes                                             ');
    QryConsulta.SQL.Add('ON       agendamentos.cli_id_cliente      = clientes.id_cliente          ');
    QryConsulta.SQL.Add('INNER JOIN profissionais profissionais                                   ');
    QryConsulta.SQL.Add('ON       agendamentos.pro_id_profissional = profissionais.id_profissional');
    QryConsulta.SQL.Add('WHERE    clientes.ds_cliente LIKE :p_nome_cliente                        ');
    QryConsulta.SQL.Add('ORDER BY clientes.ds_cliente                                             ');
    QryConsulta.ParamByName('p_nome_cliente').AsString := '%' + NomeCliente + '%';
    QryConsulta.Open;
  finally
    Result := QryConsulta;
  end;

end;

function TAgendamentos.fnc_inserir: String;
var
  QryInserir : TFDQuery;
begin
  try
    try
      FConexao.Connected    := False;
      FConexao.Connected    := True;

      QryInserir            := TFDQuery.Create(nil);
      QryInserir.Connection := FConexao;

      QryInserir.Close;
      QryInserir.SQL.Clear;

      QryInserir.SQL.Add('INSERT INTO agendamentos ');
      QryInserir.SQL.Add(' ( id_agendamento,       ');
      QryInserir.SQL.Add('   cli_id_cliente,       ');
      QryInserir.SQL.Add('   pro_id_profissional,  ');
      QryInserir.SQL.Add('   usu_id_usuarios,      ');
      QryInserir.SQL.Add('   dt_data,              ');
      QryInserir.SQL.Add('   hr_hora,              ');
      QryInserir.SQL.Add('   ds_obs     )          ');
      QryInserir.SQL.Add('VALUES (                 ');
      QryInserir.SQL.Add('   :id_agendamento,      ');
      QryInserir.SQL.Add('   :cli_id_cliente,      ');
      QryInserir.SQL.Add('   :pro_id_profissional, ');
      QryInserir.SQL.Add('   :usu_id_usuarios,     ');
      QryInserir.SQL.Add('   :dt_data,             ');
      QryInserir.SQL.Add('   :hr_hora,             ');
      QryInserir.SQL.Add('   :ds_obs    )          ');

      QryInserir.ParamByName('id_agendamento').AsInteger      := fnc_proximo_codigo('agendamentos', 'id_agendamento');
      QryInserir.ParamByName('cli_id_cliente').AsInteger      := Fcli_id_cliente;
      QryInserir.ParamByName('pro_id_profissional').AsInteger := Fpro_id_profissional;
      QryInserir.ParamByName('usu_id_usuarios').AsInteger     := 1;
      QryInserir.ParamByName('dt_data').AsDate                := Fdt_data;
      QryInserir.ParamByName('hr_hora').AsString              := Fhr_hora;
      QryInserir.ParamByName('ds_obs').AsString               := Fds_obs;
      QryInserir.ExecSQL;

      Result := '';
    except
      On E: Exception Do
        Result := E.Message;
    end;
  finally
    QryInserir.Free;
  end;
end;

procedure TAgendamentos.fnc_montar_agenda(dt_data : TDate; cds_agenda: TClientDataSet);
var
  I, Hora, Minutos : Word;   // Word é um inteiro porém reserva menos espaço na menoria que o tipo Integer
begin
  Minutos := 0;

  for Hora := 6 to 22 do
  begin
    for I := 0 to 3 do
    begin
      cds_agenda.Append;
      cds_agenda.FieldByName('dt_data').AsDateTime := dt_data;
      cds_agenda.FieldByName('hr_hora').AsString   := FormatFloat('00', Hora) + ':' + FormatFloat('00', Minutos);
      Minutos := Minutos + 15;
      //cds_agenda.FieldByName('ds_cliente').AsString := ds_cliente;
      //cds_agenda.FieldByName('ds_profissional').AsString := ds_profissional;
      cds_agenda.Post;
    end;
    Minutos := 0;  // Volta os minutos para zero para contagem da proxima hora
  end;

end;

function TAgendamentos.fnc_validar_agendamento( id_profissional : Integer; Data : TDate; hr_hora : String ) : Boolean;
var
  QryValidar : TFDQuery;
begin

  FConexao.Connected := True;

  try
    QryValidar := TFDQuery.Create(nil);
    QryValidar.Connection :=  FConexao;

    QryValidar.Close;
    QryValidar.SQL.Clear;
    QryValidar.SQL.Add('SELECT   id_agendamento                           ');
    QryValidar.SQL.Add('FROM     agendamentos                              ');
    QryValidar.SQL.Add('WHERE    pro_id_profissional = :p_id_profissional  ');
    QryValidar.SQL.Add('AND      dt_data             = :p_data             ');
    QryValidar.SQL.Add('AND      hr_hora             = :p_hora             ');
    QryValidar.SQL.Add('ORDER BY agendamentos.hr_hora                      ');
    QryValidar.ParamByName('p_id_profissional').AsInteger := id_profissional;
    QryValidar.ParamByName('p_data').AsDate               := Data;
    QryValidar.ParamByName('p_hora').AsString             := hr_hora;
    QryValidar.Open;

    Result := QryValidar.IsEmpty;

  finally
    QryValidar.Free;
  end;

end;

end.
