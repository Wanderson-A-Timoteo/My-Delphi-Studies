unit classe.cliente;

interface

uses FireDAC.Comp.Client, classe_conexao, System.SysUtils, Vcl.Forms;

type
  TCliente = class

    private
      FConecao       : TFDConnection;

      Fid_cliente    : Integer;
      Fdt_nascimento : TDateTime;

      Fds_cliente,
      Fnr_cpf,
      Fnr_rg,
      Fnr_cep,
      Fds_endereco,
      Fnr_numero,
      Fds_complemento,
      Fds_bairro,
      Fds_cidade,
      Fds_uf,
      Fnr_telefone,
      Fnr_telefone2,
      Fds_obs        : String;

    public
      property Conexao        : TFDConnection read FConecao        write FConecao;
      property id_cliente     : Integer       read Fid_cliente     write Fid_cliente;
      property dt_nascimento  : TDateTime     read Fdt_nascimento  write Fdt_nascimento;
      property ds_cliente     : String        read Fds_cliente     write Fds_cliente;
      property nr_cpf         : String        read Fnr_cpf         write Fnr_cpf;
      property nr_rg          : String        read Fnr_rg          write Fnr_rg;
      property nr_cep         : String        read Fnr_cep         write Fnr_cep;
      property ds_endereco    : String        read Fds_endereco    write Fds_endereco;
      property nr_numero      : String        read Fnr_numero      write Fnr_numero;
      property ds_complemento : String        read Fds_complemento write Fds_complemento;
      property ds_bairro      : String        read Fds_bairro      write Fds_bairro;
      property ds_cidade      : String        read Fds_cidade      write Fds_cidade;
      property ds_uf          : String        read Fds_uf          write Fds_uf;
      property nr_telefone    : String        read Fnr_telefone    write Fnr_telefone;
      property nr_telefone2   : String        read Fnr_telefone2   write Fnr_telefone2;
      property ds_obs         : String        read Fds_obs         write Fds_obs;

      constructor Create (Conexao : TFDConnection);
      destructor Destroy; Override;

      function fnc_inserir_alterar (TipoOperacao: String; out Erro : String) : boolean;
      function fnc_consulta (Texto : String) : TFDQuery;

      procedure prc_deleta (id_chave : Integer);
  end;

implementation

{ TCliente }

constructor TCliente.Create(Conexao: TFDConnection);
begin
  FConecao := Conexao;
end;

destructor TCliente.Destroy;
begin

  inherited;
end;

function TCliente.fnc_consulta(Texto: String): TFDQuery;
begin

end;

function TCliente.fnc_inserir_alterar(TipoOperacao: String; out Erro: String): boolean;
begin

end;

procedure TCliente.prc_deleta(id_chave: Integer);
begin

end;

end.
