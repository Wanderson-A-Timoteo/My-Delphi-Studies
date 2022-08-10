unit unit_relatorio_agendamento_periodo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Buttons, Vcl.DBCtrls,
  Vcl.Mask, classe.profissionais, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, ACBrBase, ACBrEnterTab, RLReport;

type
  Tform_relatorio_agendamento_periodo = class(TForm)
    shape_fundo_form_agendamento: TShape;
    PanelContainer: TPanel;
    PanelAgrupaCamposAgendamento: TPanel;
    RLReportAgendamentoPeriodo: TRLReport;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLBand4: TRLBand;
    RLLabel1: TRLLabel;
    lblPeriodo: TRLLabel;
    RLLabelData: TRLLabel;
    RLLabelHora: TRLLabel;
    RLLabelNomeProfissional: TRLLabel;
    RLLabelNomeCliente: TRLLabel;
    RLLabelAgendadoPor: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLLabelTotalAgendamentosPeriodo: TRLLabel;
    lblTotal: TRLLabel;
    RLSystemInfoNumeroPagina: TRLSystemInfo;
    RLSystemInfoDataEmissao: TRLSystemInfo;
    RLLabel2: TRLLabel;
    RLLabel9: TRLLabel;
    ds_padrao: TDataSource;

  private
    { Private declarations }
  public
    { Public declarations }
    senha_original : String;
  end;

var
  form_relatorio_agendamento_periodo: Tform_relatorio_agendamento_periodo;

implementation

{$R *.dfm}

uses unit_dados, unit_funcoes;

end.
