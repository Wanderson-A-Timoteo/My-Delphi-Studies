unit unit_clientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Buttons, Vcl.DBCtrls,
  Vcl.Mask, ACBrValidador, ACBrEnterTab, ACBrBase, ACBrSocket, ACBrCEP;

type
  Tform_clientes = class(TForm)
    shape_fundo_form_agendamento: TShape;
    PanelAgrupaCamposAgendamento: TPanel;
    PanelContainer: TPanel;
    PanelGrupoCampos: TPanel;
    LabelNomeCliente: TLabel;
    LabelCelular: TLabel;
    Label9: TLabel;
    LabelEndereco: TLabel;
    LabelTelefoneFixo: TLabel;
    LabelComplemento: TLabel;
    Label13: TLabel;
    LabelDataNascimento: TLabel;
    LabelNumero: TLabel;
    MaskEditCelular: TMaskEdit;
    PanelBotoesSalvarCancelar: TPanel;
    PanelBotaoSalvar: TPanel;
    SpeedButtonSalvar: TSpeedButton;
    PanelBotaoCancelar: TPanel;
    SpeedButtonCancelar: TSpeedButton;
    EditNomeCliente: TEdit;
    PanelBordaNomeCliente: TPanel;
    PanelBordaEndereco: TPanel;
    EditEndereco: TEdit;
    PanelBordaCelular: TPanel;
    MaskEditTelefoneFixo: TMaskEdit;
    PanelBordaComplemento: TPanel;
    EditComplemento: TEdit;
    PanelBordaObservacoes: TPanel;
    EditObservacoes: TEdit;
    PanelBordaTelefoneFixo: TPanel;
    PanelBordaCidade: TPanel;
    MaskEditDataNascimento: TMaskEdit;
    PanelBordaNumero: TPanel;
    EditNumero: TEdit;
    MaskEditRG: TMaskEdit;
    LabelRG: TLabel;
    PanelBordaRG: TPanel;
    MaskEditCPF: TMaskEdit;
    LabelCPF: TLabel;
    PanelBordaCPF: TPanel;
    MaskEditCEP: TMaskEdit;
    LabelCEP: TLabel;
    PanelBordaCEP: TPanel;
    PanelBordaBairro: TPanel;
    EditBairro: TEdit;
    LabelBairro: TLabel;
    LabelCidade: TLabel;
    EditCidade: TEdit;
    PanelBordaUF: TPanel;
    EditUF: TEdit;
    LabelUF: TLabel;
    PanelBordaDataNascimento: TPanel;
    ACBrCEP1: TACBrCEP;
    ACBrEnterTab1: TACBrEnterTab;
    ACBrValidador1: TACBrValidador;
    SpeedButtonLupaPesquisaNomeCliente: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    PanelBotaoLimpar: TPanel;
    SpeedButtonLimpar: TSpeedButton;
    procedure SpeedButtonSalvarClick(Sender: TObject);
    procedure MaskEditCPFExit(Sender: TObject);
    procedure MaskEditDataNascimentoExit(Sender: TObject);
    procedure SpeedButtonLupaPesquisaCEP(Sender: TObject);
    procedure MaskEditCEPExit(Sender: TObject);
    procedure SpeedButtonLimparClick(Sender: TObject);
    procedure SpeedButtonCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_clientes: Tform_clientes;

implementation

{$R *.dfm}

uses unit_funcoes, unit_cliente_consulta;

procedure Tform_clientes.MaskEditCEPExit(Sender: TObject);
begin
  if (fncRomoveCaracteres ( MaskEditCEP.Text ) <> '') then
  begin
    if ACBrCEP1.BuscarPorCEP( MaskEditCEP.Text) > 0 then
    begin
      EditEndereco.Text := ACBrCEP1.Enderecos[0].Logradouro;
      EditBairro.Text   := ACBrCEP1.Enderecos[0].Bairro;
      EditCidade.Text   := ACBrCEP1.Enderecos[0].Municipio;
      EditUF.Text       := ACBrCEP1.Enderecos[0].UF;

      EditNumero.SetFocus;
    end else
    begin
      fnc_criar_mensagem('VALIDANDO DADOS',
                         'Erro ao validar CEP',
                         'Cep Inválida',
                         ExtractFilePath( Application.ExeName ) + 'imagens\erro.png',
                         'OK');

      MaskEditCEP.SetFocus;
    end;
  end;
end;

procedure Tform_clientes.MaskEditCPFExit(Sender: TObject);
begin
  if (fncRomoveCaracteres ( MaskEditCPF.Text ) <> '') then
  begin
    ACBrValidador1.TipoDocto := docCPF;
    ACBrValidador1.Documento := MaskEditCPF.Text;

    if not ACBrValidador1.Validar then
    begin
      fnc_criar_mensagem('VALIDANDO DADOS',
                         'Erro ao validar CPF',
                         'CPF Inválido',
                         ExtractFilePath( Application.ExeName ) + 'imagens\erro.png',
                         'OK');

      MaskEditCPF.SetFocus;
    end;
  end;

end;

procedure Tform_clientes.MaskEditDataNascimentoExit(Sender: TObject);
begin
  if (fncRomoveCaracteres ( MaskEditDataNascimento.Text ) <> '') and
                          ( MaskEditDataNascimento.Text <> '  /  /    ') then
  begin
    try
      MaskEditDataNascimento.Text := FormatDateTime('DD/MM/YYYY', StrToDate( MaskEditDataNascimento.Text));
    except
      fnc_criar_mensagem('VALIDANDO DADOS',
                         'Erro ao validar DATA',
                         'Data Inválida',
                         ExtractFilePath( Application.ExeName ) + 'imagens\erro.png',
                         'OK');

      MaskEditDataNascimento.SetFocus;
    end;
  end;
end;

procedure Tform_clientes.SpeedButtonCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure Tform_clientes.SpeedButtonLimparClick(Sender: TObject);
begin
  EditNomeCliente.SetFocus;
end;

procedure Tform_clientes.SpeedButtonLupaPesquisaCEP(Sender: TObject);
begin
  if (fncRomoveCaracteres ( MaskEditCEP.Text ) <> '') then
  begin
    if ACBrCEP1.BuscarPorCEP( MaskEditCEP.Text) > 0 then
    begin
      EditEndereco.Text := ACBrCEP1.Enderecos[0].Logradouro;
      EditBairro.Text   := ACBrCEP1.Enderecos[0].Bairro;
      EditCidade.Text   := ACBrCEP1.Enderecos[0].Municipio;
      EditUF.Text       := ACBrCEP1.Enderecos[0].UF;

      EditNumero.SetFocus;
    end else
    begin
      fnc_criar_mensagem('VALIDANDO DADOS',
                         'Erro ao validar CEP',
                         'Cep Inválida',
                         ExtractFilePath( Application.ExeName ) + 'imagens\erro.png',
                         'OK');

      MaskEditCEP.SetFocus;
    end;
  end;
end;

procedure Tform_clientes.SpeedButtonSalvarClick(Sender: TObject);
var
  Operacao,
  Erro: string;
begin
  Erro := '';
  prcValidarCamposObrigatorios( form_clientes );

  with form_cliente_consulta.LClientes do
  begin
    dt_nascimento  := StrToDate(MaskEditDataNascimento.Text);
    ds_cliente     := EditNomeCliente.Text;
    nr_cpf         := MaskEditCPF.Text;
    nr_rg          := MaskEditRG.Text;
    nr_cep         := MaskEditCEP.Text;
    ds_endereco    := EditEndereco.Text;
    nr_numero      := EditNumero.Text;
    ds_complemento := EditComplemento.Text;
    ds_bairro      := EditBairro.text;
    ds_cidade      := EditCidade.text;
    ds_uf          := EditUF.text;
    nr_telefone    := MaskEditTelefoneFixo.Text;
    nr_telefone2   := MaskEditCelular.Text;
    ds_obs         := EditObservacoes.Text;

    if form_cliente_consulta.LClientes.id_cliente > 0 then
     Operacao := 'ALTERAR'
    else
      Operacao := 'INSERIR';

    if form_cliente_consulta.LClientes.fnc_inserir_alterar(Operacao, Erro) then
    begin
      fnc_criar_mensagem('INSERINDO DADOS',
                         'Cadastrar/Alterar Cliente',
                         'Cadastro/Alteração Realizado com Sucesso! ' +
                         '',
                         ExtractFilePath(Application.ExeName) + 'imagens\aviso.png','OK');
      Close;
    end else
    begin
      fnc_criar_mensagem('INSERINDO DADOS',
                         'Erro ao Cadastrar/Alterar Cliente',
                         'Não foi possível Cadastrar/Alterar Cliente, possível causa: ' +
                         Erro,
                         ExtractFilePath(Application.ExeName) + 'imagens\erro.png','OK');

      EditNomeCliente.SetFocus;
    end;
  end;
end;

end.
