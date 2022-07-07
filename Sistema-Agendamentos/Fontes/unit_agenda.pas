unit unit_agenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Buttons, Vcl.DBCtrls,
  Vcl.Mask, unit_dados, classe.profissionais, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.WinXCalendars, classe.agendamento;

type
  Tform_agenda = class(TForm)
    shape_fundo_form_agendamento: TShape;
    PanelAgrupaCamposAgendamento: TPanel;
    PanelContainer: TPanel;
    LabelNoemProfissional: TLabel;
    LabelTituloCadastrarProfissional: TLabel;
    PanelBotoesAgendarCancelar: TPanel;
    PanelBotaoAgendar: TPanel;
    PanelBotaoCancelar: TPanel;
    SpeedButtonNovoAgendamento: TSpeedButton;
    SpeedButtonCancelar: TSpeedButton;
    PanelBordaNomeProfissional: TPanel;
    PanelBordaEspecialidade: TPanel;
    EditNomeCliente: TEdit;
    LabelEspecialidade: TLabel;
    dbg_registros: TDBGrid;
    Label1: TLabel;
    dbl_cmb_consulta_profissional: TDBLookupComboBox;
    CalendarPickerSelecionarData: TCalendarPicker;
    PanelBordaDBGrid: TPanel;
    ds_consulta: TDataSource;
    Label7: TLabel;
    SpeedButtonConsultarCliente: TSpeedButton;
    Label3: TLabel;
    SpeedButtonConsultarProfissional: TSpeedButton;
    ds_profissionais: TDataSource;
    procedure SpeedButtonCancelarClick(Sender: TObject);
    procedure CalendarPickerSelecionarDataChange(Sender: TObject);
    procedure dbg_registrosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure SpeedButtonNovoAgendamentoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButtonConsultarProfissionalClick(Sender: TObject);
    procedure SpeedButtonConsultarClienteClick(Sender: TObject);
    procedure SpeedButtonNovoAgendamentoMouseEnter(Sender: TObject);
    procedure SpeedButtonNovoAgendamentoMouseLeave(Sender: TObject);
    procedure SpeedButtonCancelarMouseEnter(Sender: TObject);
    procedure SpeedButtonCancelarMouseLeave(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    Agendamento : TAgendamentos;
  end;

var
  form_agenda: Tform_agenda;

implementation

{$R *.dfm}

uses unit_funcoes, unit_agendamento, unit_profissionais, unit_principal;


procedure Tform_agenda.CalendarPickerSelecionarDataChange(Sender: TObject);
begin
//  if CalendarPickerSelecionarData.IsEmpty then
//    Exit;
//
//  if (dbl_cmb_Consulta_Profissional.KeyValue = null) then
//  begin
//    fnc_criar_mensagem('VALIDANDO DADOS',
//                       'Dados obrigat�rios n�o preenchidos',
//                       'Selecione um Profissional!',
//                       ExtractFilePath(Application.ExeName) + 'imagens\aviso.png',
//                       'OK');
//
//    CalendarPickerSelecionarData.IsEmpty := True;
//    dbl_cmb_Consulta_Profissional.SetFocus;
//    Abort;
//  end
//  else begin
//    ds_consulta.DataSet := form_agendamento.Agendamento.fnc_consulta(
//      dbl_cmb_Consulta_Profissional.KeyValue, CalendarPickerSelecionarData.Date);
//
//    //prcAjustaTamanhoLinha ( dbg_registros, 28 );
//  end;
end;

procedure Tform_agenda.dbg_registrosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
begin
  //prcDrawColumnCell( dbg_registros, Rect, DataCol, Column, State );

end;

procedure Tform_agenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Agendamento.Free;
end;

procedure Tform_agenda.FormCreate(Sender: TObject);
begin
  Agendamento := TAgendamentos.Create(DataModule1.FDConnection);
end;

procedure Tform_agenda.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   if key = VK_RETURN then
  begin
    ds_consulta.DataSet := Agendamento.fnc_consultar_por_cliente(EditNomeCliente.Text);
  end;
end;

procedure Tform_agenda.FormShow(Sender: TObject);
begin
  ds_profissionais.DataSet := DataModule1.Profissional.fnc_consulta('');
  //prcAjustaTamanhoLinha ( dbg_registros, 28 );
end;

procedure Tform_agenda.SpeedButtonCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure Tform_agenda.SpeedButtonCancelarMouseEnter(Sender: TObject);
begin
  SpeedButtonCancelar.Font.Color := $00591A05;
end;

procedure Tform_agenda.SpeedButtonCancelarMouseLeave(Sender: TObject);
begin
  SpeedButtonCancelar.Font.Color := clWhite;
end;

procedure Tform_agenda.SpeedButtonConsultarClienteClick(Sender: TObject);
begin
  if EditNomeCliente.Text = '' then
  begin
    fnc_criar_mensagem('VALIDANDO DADOS',
                       'Dados obrigat�rios n�o preenchidos',
                       'Selecione um Cliente!',
                       ExtractFilePath(Application.ExeName) + 'imagens\erro.png',
                       'OK');

    EditNomeCliente.SetFocus;
    Abort;
  end;

  ds_consulta.DataSet := Agendamento.fnc_consultar_por_cliente(EditNomeCliente.Text);
  //prcAjustaTamanhoLinha ( dbg_registros, 28 );
end;

procedure Tform_agenda.SpeedButtonConsultarProfissionalClick(Sender: TObject);
begin
  if CalendarPickerSelecionarData.IsEmpty then
  begin
    fnc_criar_mensagem('VALIDANDO DADOS',
                       'Dados obrigat�rios n�o preenchidos',
                       'Selecione uma Data!',
                       ExtractFilePath(Application.ExeName) + 'imagens\erro.png',
                       'OK');

    CalendarPickerSelecionarData.SetFocus;
    Abort;
  end;

  if dbl_cmb_consulta_profissional.KeyValue = null then
  begin
    fnc_criar_mensagem('VALIDANDO DADOS',
                       'Dados obrigat�rios n�o preenchidos',
                       'Selecione um Profissional!',
                       ExtractFilePath(Application.ExeName) + 'imagens\erro.png',
                       'OK');

    dbl_cmb_consulta_profissional.SetFocus;
    Abort;
  end;

  ds_consulta.DataSet := Agendamento.fnc_consulta( dbl_cmb_consulta_profissional.KeyValue,
                                                   CalendarPickerSelecionarData.Date);

    //prcAjustaTamanhoLinha ( dbg_registros, 28 );
end;

procedure Tform_agenda.SpeedButtonNovoAgendamentoClick(Sender: TObject);
begin
  form_agendamento := Tform_agendamento.Create(Self);
  try
    form_agendamento.ShowModal;
  finally
    form_agendamento.Free;
  end;
end;

procedure Tform_agenda.SpeedButtonNovoAgendamentoMouseEnter(Sender: TObject);
begin
  SpeedButtonNovoAgendamento.Font.Color := $00591A05;
end;

procedure Tform_agenda.SpeedButtonNovoAgendamentoMouseLeave(Sender: TObject);
begin
  SpeedButtonNovoAgendamento.Font.Color := clWhite;
end;

end.