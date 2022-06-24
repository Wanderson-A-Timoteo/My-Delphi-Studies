unit classe.profissionais;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, Vcl.Forms;

type
  TProfissionais = class
    private
      FConexao          : TFDConnection;
      FId_Profissional  : Integer;
      Fds_profissional  : String;
      Fds_especialidade : String;
      Fnr_contato       : String;
    public
      constructor Create (Conexao : TFDConnection);
      destructor Destroy; Override;

      property Conexao          : TFDConnection read FConexao          write FConexao;
      property Id_Profissional  : Integer       read FId_Profissional  write FId_Profissional;
      property ds_profissional  : String        read Fds_profissional  write Fds_profissional;
      property ds_especialidade : String        read Fds_especialidade write Fds_especialidade;
      property nr_contato       : String        read Fnr_contato       write Fnr_contato;

      procedure prc_deleta( id_chave: Integer);
      function fnc_inserir_altear (TipoOperacao: String; out Erro: String) : Boolean;
      function fnc_consulta(texto: String) : TFDQuery;

  end;

var
  QueryConsulta : TFDQuery;

implementation

{ TProfissionais }

uses unit_funcoes, unit_dados, unit_profissionais;

constructor TProfissionais.Create(Conexao: TFDConnection);
begin
  FConexao                 :=  Conexao;

  QueryConsulta            := TFDQuery.Create(nil);
  QueryConsulta.Connection := FConexao;
end;

destructor TProfissionais.Destroy;
begin
  QueryConsulta.Destroy;
  inherited;
end;

function TProfissionais.fnc_consulta(texto: String): TFDQuery;
begin
  try
    FConexao.Connected := False;
    FConexao.Connected := True;

    QueryConsulta.Close;
    QueryConsulta.SQL.Clear;
    QueryConsulta.SQL.Add('SELECT id_profissional, ds_profissional, ds_especialidade, nr_contato  ');
    QueryConsulta.SQL.Add('FROM profissionais WHERE ds_profissional LIKE :p_texto ');
    QueryConsulta.ParamByName('p_texto').AsString := '%'+texto+'%';
    QueryConsulta.Open;
  finally
    Result             := QueryConsulta;
  end;

end;

function TProfissionais.fnc_inserir_altear(TipoOperacao: String; out Erro: String): Boolean;
var
  QueryInserir : TFDQuery;
begin
  try
    try
      FConexao.Connected      := False;
      FConexao.Connected      := True;

      QueryInserir            := TFDQuery.Create(nil);
      QueryInserir.Connection := FConexao;

      QueryInserir.Close;
      QueryInserir.SQL.Clear;

      if TipoOperacao = 'INSERIR' then
      begin
        QueryInserir.SQL.Add('INSERT INTO profissionais (id_profissional,     ');
        QueryInserir.SQL.Add('                           ds_profissional,     ');
        QueryInserir.SQL.Add('                           ds_especialidade,    ');
        QueryInserir.SQL.Add('                           nr_contato)          ');
        QueryInserir.SQL.Add('VALUES                     (:p_id_profissional, ');
        QueryInserir.SQL.Add('                            :p_ds_profissional, ');
        QueryInserir.SQL.Add('                            :p_ds_especialidade,');
        QueryInserir.SQL.Add('                            :p_nr_contato)      ');

        QueryInserir.ParamByName('p_id_profissional').AsInteger :=
          fnc_proximo_codigo('profissionais', 'id_profissional');
      end else
      begin
        QueryInserir.SQL.Add('UPDATE profissionais                             ');
        QueryInserir.SQL.Add('SET     ds_profissional  = :p_ds_profissional,   ');
        QueryInserir.SQL.Add('        ds_especialidade = :p_ds_especialidade,  ');
        QueryInserir.SQL.Add('        nr_contato       = :p_nr_contato         ');
        QueryInserir.SQL.Add('WHERE   id_profissional  = :p_id_profissional    ');

        QueryInserir.ParamByName('p_id_profissional').AsInteger := FId_Profissional;
      end;
      QueryInserir.ParamByName('p_ds_profissional').AsString  := Fds_profissional;
      QueryInserir.ParamByName('p_ds_especialidade').AsString := Fds_especialidade;
      QueryInserir.ParamByName('p_nr_contato').AsString       := Fnr_contato;
      QueryInserir.ExecSQL;

      Result := true;

      fnc_consulta('');
    except
      on E: Exception do
      begin
        Erro   := E.Message;
        Result := False;
      end;

    end;
  finally
    QueryInserir.Destroy;
  end;

end;

procedure TProfissionais.prc_deleta(id_chave: Integer);
begin
  if fnc_criar_mensagem('CONFIRMA��O', 'Excluir Dados',
                        'Tem certeza que deseja EXCLUIR os dados deste Profissional?',
                        ExtractFilePath (Application.ExeName)+ '\images\aviso.png',
                        'CONFIRMAR') then
  begin
    FConexao.Connected := False;
    FConexao.Connected := True;

    FConexao.ExecSQL('DELETE FROM profissionais WHERE id_profissional = :id_chave', [id_chave]);

    fnc_consulta('');
  end;

end;

end.