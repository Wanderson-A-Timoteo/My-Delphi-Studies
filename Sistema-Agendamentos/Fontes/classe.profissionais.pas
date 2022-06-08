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

implementation

{ TProfissionais }

uses unit_funcoes, unit_dados;

constructor TProfissionais.Create(Conexao: TFDConnection);
begin
  FConexao :=  Conexao;
end;

destructor TProfissionais.Destroy;
begin

  inherited;
end;

function TProfissionais.fnc_consulta(texto: String): TFDQuery;
begin

end;

function TProfissionais.fnc_inserir_altear(TipoOperacao: String; out Erro: String): Boolean;
begin

end;

procedure TProfissionais.prc_deleta(id_chave: Integer);
begin
  if fnc_criar_mensagem('CONFIRMAÇÃO', 'Excluir Dados',
                        'Tem certeza que deseja EXCLUIR os dados deste Profissional?',
                        ExtractFilePath (Application.ExeName)+ '\images\aviso.png',
                        'CONFIRMAR') then
  begin
    FConexao.Connected := False;
    FConexao.Connected := True;

  end;

end;

end.
