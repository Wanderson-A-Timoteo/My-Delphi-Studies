unit unit_agendamento_consulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Buttons, Vcl.DBCtrls,
  Vcl.Mask, unit_dados, classe.profissionais, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.WinXCalendars;

type
  Tform_agendamento_consulta = class(TForm)
    shape_fundo_form_agendamento: TShape;
    PanelAgrupaCamposAgendamento: TPanel;
    PanelContainer: TPanel;
    LabelNoemProfissional: TLabel;
    LabelTituloCadastrarProfissional: TLabel;
    PanelBotoesAgendarCancelar: TPanel;
    PanelBotaoAgendar: TPanel;
    PanelBotaoCancelar: TPanel;
    SpeedButtonAgendarHorario: TSpeedButton;
    SpeedButtonCancelar: TSpeedButton;
    PanelBordaNomeProfissional: TPanel;
    PanelBordaEspecialidade: TPanel;
    EditObservacoes: TEdit;
    LabelEspecialidade: TLabel;
    dbg_registros: TDBGrid;
    Label1: TLabel;
    dbl_cmb_Consulta_Profissional: TDBLookupComboBox;
    CalendarPickerSelecionarData: TCalendarPicker;
    ComboBoxHora: TComboBox;
    ComboBoxMinuto: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    PanelBordaDBGrid: TPanel;
    ds_consulta: TDataSource;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure SpeedButtonCancelarClick(Sender: TObject);
    procedure CalendarPickerSelecionarDataChange(Sender: TObject);
    procedure dbg_registrosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure SpeedButtonAgendarHorarioClick(Sender: TObject);
    procedure ComboBoxHoraChange(Sender: TObject);
    procedure ComboBoxMinutoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_agendamento_consulta: Tform_agendamento_consulta;

implementation

{$R *.dfm}

uses unit_funcoes, unit_agendamento, unit_profissionais, classe.agendamento;


procedure Tform_agendamento_consulta.CalendarPickerSelecionarDataChange(Sender: TObject);
begin
  if CalendarPickerSelecionarData.IsEmpty then
    Exit;

  if (dbl_cmb_Consulta_Profissional.KeyValue = null) then
  begin
    fnc_criar_mensagem('VALIDANDO DADOS',
                       'Dados obrigatórios não preenchidos',
                       'Selecione um Profissional!',
                       ExtractFilePath(Application.ExeName) + 'imagens\aviso.png',
                       'OK');

    CalendarPickerSelecionarData.IsEmpty := True;
    dbl_cmb_Consulta_Profissional.SetFocus;
    Abort;
  end
  else begin
    ds_consulta.DataSet := form_agendamento.Agendamento.fnc_consulta(
      dbl_cmb_Consulta_Profissional.KeyValue, CalendarPickerSelecionarData.Date);

    //prcAjustaTamanhoLinha ( dbg_registros, 28 );
  end;
end;

procedure Tform_agendamento_consulta.ComboBoxHoraChange(Sender: TObject);
begin
  if (dbl_cmb_Consulta_Profissional.KeyValue = null) then
  begin
    fnc_criar_mensagem('VALIDANDO DADOS',
                       'Dados obrigatórios não preenchidos',
                       'Selecione um Profissional!',
                       ExtractFilePath(Application.ExeName) + 'imagens\aviso.png',
                       'OK');

    ComboBoxHora.ItemIndex := -1;
    dbl_cmb_Consulta_Profissional.SetFocus;
    Abort;
  end;
  if CalendarPickerSelecionarData.IsEmpty then
   begin
    fnc_criar_mensagem('VALIDANDO DADOS',
                       'Dados obrigatórios não preenchidos',
                       'Data do agendamento não selecionada!',
                       ExtractFilePath(Application.ExeName) + 'imagens\aviso.png',
                       'OK');

    ComboBoxHora.ItemIndex := -1;
    CalendarPickerSelecionarData.SetFocus;
    Abort;
  end;

end;

procedure Tform_agendamento_consulta.ComboBoxMinutoChange(Sender: TObject);
begin
  if (dbl_cmb_Consulta_Profissional.KeyValue = null) then
  begin
    fnc_criar_mensagem('VALIDANDO DADOS',
                       'Dados obrigatórios não preenchidos',
                       'Selecione um Profissional!',
                       ExtractFilePath(Application.ExeName) + 'imagens\aviso.png',
                       'OK');

    ComboBoxMinuto.ItemIndex := -1;
    dbl_cmb_Consulta_Profissional.SetFocus;
    Abort;
  end;
  if CalendarPickerSelecionarData.IsEmpty then
   begin
    fnc_criar_mensagem('VALIDANDO DADOS',
                       'Dados obrigatórios não preenchidos',
                       'Data do agendamento não selecionada!',
                       ExtractFilePath(Application.ExeName) + 'imagens\aviso.png',
                       'OK');

    ComboBoxMinuto.ItemIndex := -1;
    CalendarPickerSelecionarData.SetFocus;
    Abort;
  end;
  if ComboBoxHora.ItemIndex < 0 then
   begin
    fnc_criar_mensagem('VALIDANDO DADOS',
                       'Dados obrigatórios não preenchidos',
                       'Selecione a Hora!',
                       ExtractFilePath(Application.ExeName) + 'imagens\aviso.png',
                       'OK');

    ComboBoxMinuto.ItemIndex := -1;
    CalendarPickerSelecionarData.SetFocus;
    Abort;
  end;

end;

procedure Tform_agendamento_consulta.dbg_registrosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
begin
  //prcDrawColumnCell( dbg_registros, Rect, DataCol, Column, State );

end;

procedure Tform_agendamento_consulta.FormShow(Sender: TObject);
begin
  //prcAjustaTamanhoLinha ( dbg_registros, 28 );
end;

procedure Tform_agendamento_consulta.SpeedButtonAgendarHorarioClick(Sender: TObject);
begin
  prcValidarCamposObrigatorios( form_agendamento_consulta );

  if CalendarPickerSelecionarData.IsEmpty then
  begin
    fnc_criar_mensagem('VALIDANDO DADOS',
                       'Dados obrigatórios não preenchidos',
                       'Data do agendamento não selecionada!',
                       ExtractFilePath(Application.ExeName) + 'imagens\aviso.png',
                       'OK');
    Abort;
  end;

  try
    StrToTime(ComboBoxHora.Text + ':' + ComboBoxMinuto.Text);
  except
    fnc_criar_mensagem('VALIDANDO DADOS',
                       'Dados obrigatórios não preenchidos',
                       'Hora do agendamento não selecionada!',
                       ExtractFilePath(Application.ExeName) + 'imagens\aviso.png',
                       'OK');
    ComboBoxHora.SetFocus;
    Abort;
  end;

  if form_agendamento.Agendamento.fnc_validar_agendamento(
      dbl_cmb_Consulta_Profissional.KeyValue, CalendarPickerSelecionarData.Date,
      ( ComboBoxHora.Text + ':' + ComboBoxMinuto.Text ) ) then
  begin
    form_agendamento.dbl_cmb_profissionais.KeyValue := dbl_cmb_Consulta_Profissional.KeyValue;
    form_agendamento.MaskEditData.Text              := DateToStr( CalendarPickerSelecionarData.Date );
    form_agendamento.MaskEditHora.Text              := ( ComboBoxHora.Text + ':' + ComboBoxMinuto.Text );

    form_agendamento.EditObservacoes.Text := EditObservacoes.Text;

    Close;
  end else
  begin
    fnc_criar_mensagem('VALIDANDO DADOS',
                       'Erro ao agendar horário!',
                       'Dia e Hora do agendamento indisponível! Selecione outra data.',
                       ExtractFilePath(Application.ExeName) + 'imagens\erro.png',
                       'OK');

    ComboBoxHora.SetFocus;
  end;
end;

procedure Tform_agendamento_consulta.SpeedButtonCancelarClick(Sender: TObject);
begin
  Close;
end;

end.
