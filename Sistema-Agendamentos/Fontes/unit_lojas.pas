unit unit_lojas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Buttons, Vcl.DBCtrls,
  Vcl.Mask, ACBrValidador, ACBrEnterTab, ACBrBase, ACBrSocket, ACBrCEP, classe.lojas;

type
  Tform_lojas = class(TForm)
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
    EditRazaoSocial: TEdit;
    PanelBordaNomeCliente: TPanel;
    PanelBordaEndereco: TPanel;
    EditEndereco: TEdit;
    MaskEditTelefoneFixo: TMaskEdit;
    PanelBordaComplemento: TPanel;
    EditComplemento: TEdit;
    PanelBordaObservacoes: TPanel;
    EditObservacoes: TEdit;
    PanelBordaTelefoneFixo: TPanel;
    PanelBordaCidade: TPanel;
    MaskEditDataAbertura: TMaskEdit;
    PanelBordaNumero: TPanel;
    EditNumero: TEdit;
    MaskEditInscricaoEstadual: TMaskEdit;
    LabelInscricaoEstadual: TLabel;
    PanelBordaRG: TPanel;
    MaskEditCNPJ: TMaskEdit;
    LabelCNPJ: TLabel;
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
    ACBrEnterTab2: TACBrEnterTab;
    Label14: TLabel;
    Label15: TLabel;
    EditNomeFantasia: TEdit;
    PanelBordaFantasia: TPanel;
    PanelBordaCodIBGE: TPanel;
    EditCodigoIBGE: TEdit;
    Label16: TLabel;
    Label17: TLabel;
    PanelBordaEmail: TPanel;
    EditEmail: TEdit;
    Label18: TLabel;
    Panel1: TPanel;
    procedure SpeedButtonSalvarClick(Sender: TObject);
    procedure MaskEditCNPJExit(Sender: TObject);
    procedure MaskEditDataAberturaExit(Sender: TObject);
    procedure SpeedButtonLupaPesquisaCEP(Sender: TObject);
    procedure MaskEditCEPExit(Sender: TObject);
    procedure SpeedButtonLimparClick(Sender: TObject);
    procedure SpeedButtonCancelarClick(Sender: TObject);
    procedure SpeedButtonSalvarMouseEnter(Sender: TObject);
    procedure SpeedButtonSalvarMouseLeave(Sender: TObject);
    procedure SpeedButtonCancelarMouseLeave(Sender: TObject);
    procedure SpeedButtonCancelarMouseEnter(Sender: TObject);
    procedure SpeedButtonLimparMouseEnter(Sender: TObject);
    procedure SpeedButtonLimparMouseLeave(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_lojas: Tform_lojas;

implementation

{$R *.dfm}

uses unit_funcoes, unit_consulta_lojas, unit_clientes, unit_cliente_consulta;

procedure Tform_lojas.MaskEditCEPExit(Sender: TObject);
begin
  if (fncRomoveCaracteres ( MaskEditCEP.Text ) <> '') then
  begin
    if ACBrCEP1.BuscarPorCEP( MaskEditCEP.Text) > 0 then
    begin
      EditEndereco.Text   := ACBrCEP1.Enderecos[0].Logradouro;
      EditBairro.Text     := ACBrCEP1.Enderecos[0].Bairro;
      EditCidade.Text     := ACBrCEP1.Enderecos[0].Municipio;
      EditUF.Text         := ACBrCEP1.Enderecos[0].UF;
      EditCodigoIBGE.Text := ACBrCEP1.Enderecos[0].IBGE_Municipio;

      EditNumero.SetFocus;
    end else
    begin
      fnc_criar_mensagem('VALIDANDO DADOS',
                         'Erro ao validar CEP',
                         'Cep Inv�lida',
                         ExtractFilePath( Application.ExeName ) + 'imagens\erro.png',
                         'OK');

      MaskEditCEP.SetFocus;
    end;
  end;
end;

procedure Tform_lojas.MaskEditCNPJExit(Sender: TObject);
begin
  if (fncRomoveCaracteres ( MaskEditCNPJ.Text ) <> '') then
  begin
    ACBrValidador1.TipoDocto := docCNPJ;
    ACBrValidador1.Documento := MaskEditCNPJ.Text;

    if not ACBrValidador1.Validar then
    begin
      fnc_criar_mensagem('VALIDANDO DADOS',
                         'Erro ao validar CPF',
                         'CPF Inv�lido',
                         ExtractFilePath( Application.ExeName ) + 'imagens\erro.png',
                         'OK');

      MaskEditCNPJ.SetFocus;
    end;
  end;

end;

procedure Tform_lojas.MaskEditDataAberturaExit(Sender: TObject);
begin
  if (fncRomoveCaracteres ( MaskEditDataAbertura.Text ) <> '') and
                          ( MaskEditDataAbertura.Text <> '  /  /    ') then
  begin
    try
      MaskEditDataAbertura.Text := FormatDateTime('DD/MM/YYYY', StrToDate( MaskEditDataAbertura.Text));
    except
      fnc_criar_mensagem('VALIDANDO DADOS',
                         'Erro ao validar DATA',
                         'Data Inv�lida',
                         ExtractFilePath( Application.ExeName ) + 'imagens\erro.png',
                         'OK');

      MaskEditDataAbertura.SetFocus;
    end;
  end;
end;

procedure Tform_lojas.SpeedButtonCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure Tform_lojas.SpeedButtonCancelarMouseEnter(Sender: TObject);
begin
  SpeedButtonCancelar.Font.Color := $00591A05;
end;

procedure Tform_lojas.SpeedButtonCancelarMouseLeave(Sender: TObject);
begin
  SpeedButtonCancelar.Font.Color := clWhite;
end;

procedure Tform_lojas.SpeedButtonLimparClick(Sender: TObject);
begin
  EditRazaoSocial.SetFocus;
end;

procedure Tform_lojas.SpeedButtonLimparMouseEnter(Sender: TObject);
begin
  SpeedButtonLimpar.Font.Color := $00591A05;
end;

procedure Tform_lojas.SpeedButtonLimparMouseLeave(Sender: TObject);
begin
  SpeedButtonLimpar.Font.Color := clWhite;
end;

procedure Tform_lojas.SpeedButtonLupaPesquisaCEP(Sender: TObject);
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
                         'Cep Inv�lida',
                         ExtractFilePath( Application.ExeName ) + 'imagens\erro.png',
                         'OK');

      MaskEditCEP.SetFocus;
    end;
  end;
end;

procedure Tform_lojas.SpeedButtonSalvarClick(Sender: TObject);
var
  Operacao,
  Erro: string;
begin
  Erro := '';
  prcValidarCamposObrigatorios( form_lojas );

  with form_consulta_lojas.LLojas do
  begin
    dt_abertura           := StrToDate(MaskEditDataAbertura.Text);
    ds_razao_social       := EditRazaoSocial.Text;
    ds_fantasia           := EditNomeFantasia.Text;
    nr_cnpj               := MaskEditCNPJ.Text;
    nr_inscricao_estadual := MaskEditInscricaoEstadual.Text;
    nr_cep                := MaskEditCEP.Text;
    ds_endereco           := EditEndereco.Text;
    nr_numero             := EditNumero.Text;
    ds_complemento        := EditComplemento.Text;
    ds_bairro             := EditBairro.text;
    ds_cidade             := EditCidade.text;
    ds_uf                 := EditUF.text;
    nr_telefone1          := MaskEditTelefoneFixo.Text;
    nr_telefone2          := MaskEditCelular.Text;
    ds_obs                := EditObservacoes.Text;
    ds_email              := EditEmail.Text;
    nr_ibge_cidade        := StrToInt(EditCodigoIBGE.Text);

    if form_consulta_lojas.LLojas.id_loja > 0 then
     Operacao := 'ALTERAR'
    else
      Operacao := 'INSERIR';

    if form_consulta_lojas.LLojas.fnc_inserir_alterar(Operacao, Erro) then
    begin
      fnc_criar_mensagem('INSERINDO DADOS',
                         'Cadastrar/Alterar Loja',
                         'Cadastro/Altera��o Realizado com Sucesso! ' +
                         '',
                         ExtractFilePath(Application.ExeName) + 'imagens\sucesso.png',
                         'OK');
      Close;
    end else
    begin
      fnc_criar_mensagem('INSERINDO DADOS',
                         'Erro ao Cadastrar/Alterar Loja',
                         'N�o foi poss�vel Cadastrar/Alterar Loja, poss�vel causa: ' +
                         Erro,
                         ExtractFilePath(Application.ExeName) + 'imagens\erro.png',
                         'OK');

      EditRazaoSocial.SetFocus;
    end;
  end;
end;

procedure Tform_lojas.SpeedButtonSalvarMouseEnter(Sender: TObject);
begin
  SpeedButtonSalvar.Font.Color := $00591A05;
end;

procedure Tform_lojas.SpeedButtonSalvarMouseLeave(Sender: TObject);
begin
  SpeedButtonSalvar.Font.Color := clWhite;
end;

end.
