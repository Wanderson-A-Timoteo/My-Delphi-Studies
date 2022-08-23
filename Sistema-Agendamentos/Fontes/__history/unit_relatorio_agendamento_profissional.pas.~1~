unit unit_relatorio_agendamento_cliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Buttons, Vcl.DBCtrls,
  Vcl.Mask, classe.profissionais, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, ACBrBase, ACBrEnterTab, RLReport;

type
  Tform_relatorio_agendamento_cliente = class(TForm)
    shape_fundo_form_agendamento: TShape;
    PanelContainer: TPanel;
    PanelAgrupaCamposAgendamento: TPanel;
    RLReportAgendamentoCliente: TRLReport;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLBand4: TRLBand;
    RLLabelData: TRLLabel;
    RLLabelHora: TRLLabel;
    RLLabelNomeProfissional: TRLLabel;
    RLLabelAgendadoPor: TRLLabel;
    RLDBTextData: TRLDBText;
    RLDBTextHora: TRLDBText;
    RLDBTextNomeProfissional: TRLDBText;
    RLDBTextAgendadoPorNomeUsuario: TRLDBText;
    RLLabelTotalAgendamentosPeriodo: TRLLabel;
    lblTotal: TRLLabel;
    ds_padrao: TDataSource;
    RLBand5: TRLBand;
    RLLabelTituloRelatorio: TRLLabel;
    RLLabelPeriodo: TRLLabel;
    RLLabelDataEmissao: TRLLabel;
    RLSystemInfoDataEmissao: TRLSystemInfo;
    RLLabelHorarioEmissao: TRLLabel;
    RLSystemInfoHorarioEmissao: TRLSystemInfo;
    RLLabelRazaoSocial: TRLLabel;
    RLLabelNomeSistema: TRLLabel;
    RLLabelPagina: TRLLabel;
    RLSystemInfoPagina: TRLSystemInfo;
    RLLabelEmitidoPor: TRLLabel;
    RLLabelEmitidoPorNomeUsuario: TRLLabel;
    RLLabelNomeCliente: TRLLabel;

  private
    { Private declarations }
  public
    { Public declarations }
    senha_original : String;
  end;

var
  form_relatorio_agendamento_cliente: Tform_relatorio_agendamento_cliente;

implementation

{$R *.dfm}

uses unit_dados, unit_funcoes;

end.
