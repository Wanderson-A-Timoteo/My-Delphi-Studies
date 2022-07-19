unit CadastrarCrianca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitNossoMdi, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons;

type
  TFormCadastrarCrianca = class(TNossoMdi)
    PanelContainer: TPanel;
    PanelBarraTitulo: TPanel;
    PanelBarraPulseira: TPanel;
    PanelBarraNomeCrianca: TPanel;
    PanelBarraNomeMae: TPanel;
    PanelBarraNomePai: TPanel;
    Label8: TLabel;
    Label4: TLabel;
    PanelBarraCodigo: TPanel;
    EditCodigo: TEdit;
    SpbCodigo: TSpeedButton;
    DtpDataEntrada: TDateTimePicker;
    Label5: TLabel;
    DtpHorarioEntrada: TDateTimePicker;
    Label7: TLabel;
    Label6: TLabel;
    EditNumeroPulseira: TEdit;
    Label1: TLabel;
    EditNomeCrianca: TEdit;
    Label2: TLabel;
    EditNomeMae: TEdit;
    Label3: TLabel;
    EditNomePai: TEdit;
    RadioGroupSairSozinho: TRadioGroup;
    SpbFechar: TSpeedButton;
    StatusBar: TStatusBar;
    PanelBtnExcluir: TPanel;
    SpbExcluir: TSpeedButton;
    PanelBtnLimpar: TPanel;
    SpbLimpar: TSpeedButton;
    PanelBtnSair: TPanel;
    SpbSair: TSpeedButton;
    PanelBtnSalvar: TPanel;
    SpbSalvar: TSpeedButton;
    procedure SpbFecharClick(Sender: TObject);
    procedure SpbFecharMouseEnter(Sender: TObject);
    procedure SpbFecharMouseLeave(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure EditCodigoEnter(Sender: TObject);
    procedure EditCodigoExit(Sender: TObject);
    procedure EditCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure SpbCodigoClick(Sender: TObject);
    procedure SpbSalvarClick(Sender: TObject);
    procedure SpbLimparClick(Sender: TObject);
    procedure SpbSairClick(Sender: TObject);
    procedure SpbSalvarMouseEnter(Sender: TObject);
    procedure SpbSalvarMouseLeave(Sender: TObject);
    procedure SpbExcluirMouseEnter(Sender: TObject);
    procedure SpbExcluirMouseLeave(Sender: TObject);
    procedure SpbLimparMouseEnter(Sender: TObject);
    procedure SpbLimparMouseLeave(Sender: TObject);
    procedure SpbSairMouseEnter(Sender: TObject);
    procedure SpbSairMouseLeave(Sender: TObject);
    procedure SpbExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastrarCrianca: TFormCadastrarCrianca;

implementation

{$R *.dfm}

uses DMDados, Fontdata.Utils, Fontdata.MessageDialog, BibPesquisa, Login, BibVariavel, BibMarco;

procedure TFormCadastrarCrianca.EditCodigoEnter(Sender: TObject);
begin
  inherited;
  TUtilsVCL.LimparPanel(PanelContainer);
  with DataModuleDados.QueryPesquisa do
  begin
    SQL.Clear;
    SQL.Add('SELECT MAX(codigo) AS ultimo       ');
    SQL.Add('FROM paraisokids.controle_criancas ');
    Open;
    if FieldByName('ULTIMO').AsInteger = 0 then
    begin
      EditCodigo.Text := '0001'
    end
    else
    begin
      EditCodigo.Text := TUtils.CompletarZeros(FieldByName('ULTIMO').AsInteger + 1, 4);
    end;
  end;
  DtpDataEntrada.Date    := DataModuleDados.DataServidor(False);
  DtpHorarioEntrada.Time := DataModuleDados.DataServidor(False);;
  EditCodigo.SelectAll;
end;

procedure TFormCadastrarCrianca.EditCodigoExit(Sender: TObject);
begin
  inherited;
  if EditCodigo.Text <> '' then
  begin
    with DataModuleDados.QryCrianca do
    begin
      EditCodigo.Text := TUtils.CompletarZeros(EditCodigo.Text,4);
      Close;
      Params.ParamByName('codigo').AsInteger  := StrToInt(EditCodigo.Text);
      Open;
      if IsEmpty then
      begin
        Insert;
      end
      else begin
        Edit;
        if FieldByName('ativo').AsString = 'N' then
        begin
          Mensagem('Crian�a desativada no sistema, para reativ�-la clique em Salvar.',mtWarning,[mbOK],0);
        end;
        EditNumeroPulseira.Text             := FieldByName('numero_pulseira').AsString;
        EditNomeCrianca.Text                := FieldByName('nome_crianca').AsString;
        EditNomeMae.Text                    := FieldByName('nome_mae').AsString;
        EditNomePai.Text                    := FieldByName('nome_pai').AsString ;
        DtpDataEntrada.DateTime             := FieldByName('data_hora_entrada').AsDateTime;

        if FieldByName('sair_sozinho').AsString = 'S' then
        begin
          RadioGroupSairSozinho.ItemIndex   := 0;
        end else
          RadioGroupSairSozinho.ItemIndex   := 1;
        end;
    end;
  end;
end;

procedure TFormCadastrarCrianca.EditCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  Key := TUtils.FiltrarNumeros(Key);
end;

procedure TFormCadastrarCrianca.FormActivate(Sender: TObject);
begin
  inherited;
  PanelContainer.Left := Round( (Self.Width - PanelContainer.Width) / 2);
  PanelContainer.Top  := Round( (Self.Height - PanelContainer.Height) / 2);
end;

procedure TFormCadastrarCrianca.SpbCodigoClick(Sender: TObject);
begin
  inherited;
  Pesquisa2('Controle de Crian�as','paraisokids.controle_criancas',['CODIGO', 'NUMERO_PULSEIRA', 'NOME_CRIANCA'],['Codigo', 'N� da Pulseira', 'Nome da Crian�a'],'','',['NOME_CRIANCA', 'NUMERO_PULSEIRA'],['CODIGO'],[EditCodigo],'');
end;

procedure TFormCadastrarCrianca.SpbExcluirClick(Sender: TObject);
begin
  inherited;
  if Mensagem('Deseja excluir este cadastro?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    with DataModuleDados.QryCrianca do
    begin
      FieldByName('cod_usuario_atualizacao').AsInteger := StrToInt(Codigo_Usuario);
      FieldByName('data_hora_atualizacao').AsDateTime  := DataModuleDados.DataServidor(False);
      FieldByName('ativo').AsString                    := 'N';
      Post;
      if ApplyUpdates(-1) <> 0 then raise Exception.Create('Ocorreu um problema na exclus�o do cadastro.');
    end;
  end;
  EditCodigo.SetFocus;
end;

procedure TFormCadastrarCrianca.SpbExcluirMouseEnter(Sender: TObject);
begin
  inherited;
  SpbExcluir.Font.Color := clBlack;
end;

procedure TFormCadastrarCrianca.SpbExcluirMouseLeave(Sender: TObject);
begin
  inherited;
  SpbExcluir.Font.Color := clWhite;
end;

procedure TFormCadastrarCrianca.SpbFecharClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFormCadastrarCrianca.SpbFecharMouseEnter(Sender: TObject);
begin
  inherited;
  SpbFechar.Font.Color := clRed;
end;

procedure TFormCadastrarCrianca.SpbFecharMouseLeave(Sender: TObject);
begin
  inherited;
  SpbFechar.Font.Color := $00DFDFDF;
end;

procedure TFormCadastrarCrianca.SpbLimparClick(Sender: TObject);
begin
  inherited;
  EditCodigo.SetFocus;
end;

procedure TFormCadastrarCrianca.SpbLimparMouseEnter(Sender: TObject);
begin
  inherited;
  SpbLimpar.Font.Color := clBlack;
end;

procedure TFormCadastrarCrianca.SpbLimparMouseLeave(Sender: TObject);
begin
  inherited;
  SpbLimpar.Font.Color := clWhite;
end;

procedure TFormCadastrarCrianca.SpbSairClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFormCadastrarCrianca.SpbSairMouseEnter(Sender: TObject);
begin
  inherited;
  SpbSair.Font.Color := clBlack;
end;

procedure TFormCadastrarCrianca.SpbSairMouseLeave(Sender: TObject);
begin
  inherited;
  SpbSair.Font.Color := clWhite;
end;

procedure TFormCadastrarCrianca.SpbSalvarClick(Sender: TObject);
begin
  inherited;
  if EditNumeroPulseira.Text = '' then
  begin
    TMessageDialog.Warning('N�mero da pulseira � obrigat�rio!');
    EditNumeroPulseira.SetFocus;
    Exit;
  end;
  with DataModuleDados.QueryPesquisa do
  begin
    SQL.Clear;
    SQL.Add('SELECT null FROM paraisokids.controle_criancas WHERE numero_pulseira = :numero_pulseira');
    ParamByName('numero_pulseira').AsString := EditNumeroPulseira.Text;
    Open;
    if not IsEmpty then
    begin
      TMessageDialog.Warning('N�mero de pulseira j� cadastrada!');
      EditNumeroPulseira.SetFocus;
      Exit;
    end;
  end;
  with DataModuleDados.QryCrianca do
  begin
    FieldByName('codigo').AsString                   := EditCodigo.Text;
    FieldByName('numero_pulseira').AsString          := EditNumeroPulseira.Text;
    FieldByName('nome_crianca').AsString             := EditNomeCrianca.Text;
    FieldByName('nome_mae').AsString                 := EditNomeMae.Text;
    FieldByName('nome_pai').AsString                 := EditNomePai.Text;
    FieldByName('data_hora_entrada').AsDateTime      := DtpDataEntrada.Date + DtpHorarioEntrada.Time;
    FieldByName('cod_usuario_atualizacao').AsInteger := StrToInt(Codigo_Usuario);
    FieldByName('data_hora_atualizacao').AsDateTime  := DataModuleDados.DataServidor(False);
    FieldByName('ativo').AsString                    := 'S';

    case RadioGroupSairSozinho.ItemIndex of
      0:FieldByName('sair_sozinho').AsString         := 'S';
      1:FieldByName('sair_sozinho').AsString         := 'N';
    end;

    Post;

    if ApplyUpdates(-1) <> 0 then
      raise Exception.Create('Ocorreu um problema na grava��o dos dados...');

  end;

  TMessageDialog.Info('Cadastro realizado com sucesso!');
  EditCodigo.SetFocus;
end;

procedure TFormCadastrarCrianca.SpbSalvarMouseEnter(Sender: TObject);
begin
  inherited;
  SpbSalvar.Font.Color := clBlack;
end;

procedure TFormCadastrarCrianca.SpbSalvarMouseLeave(Sender: TObject);
begin
  inherited;
  SpbSalvar.Font.Color := clWhite;
end;

end.
