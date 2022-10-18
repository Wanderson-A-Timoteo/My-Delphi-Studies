unit untFrmBaseReportDefault; // v. 3.2.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, RLReport, RLFilters, RLPDFFilter,
  RLParser, uniButton, uniBitBtn, uniLabel, uniPanel, uniGUIBaseClasses,
  uniURLFrame;

type
  TfrmBaseReportDefault = class(TUniForm)
    RLExpressionParser: TRLExpressionParser;
    RLPDFFilter: TRLPDFFilter;
    RLReport: TRLReport;
    bandHeader: TRLBand;
    bandColumnHeader: TRLBand;
    bandFooter: TRLBand;
    labAppName: TRLLabel;
    labSite: TRLLabel;
    rlSysInfo1: TRLSystemInfo;
    RLLabel4: TRLLabel;
    rlSysInfo2: TRLSystemInfo;
    sqlMaster: TFDQuery;
    sqlSearchMaster: TFDQuery;
    dsMaster: TDataSource;
    dsSearchMaster: TDataSource;
    paTitle: TRLPanel;
    paDataCompany: TRLPanel;
    paTituloRel: TRLPanel;
    labEmail: TRLLabel;
    labPhone: TRLLabel;
    labAddress: TRLLabel;
    labCnpj: TRLLabel;
    labRazSoc: TRLLabel;
    labCompanyName: TRLLabel;
    paLogo: TRLPanel;
    imgLogoReport: TRLImage;
    labTitleRep: TRLLabel;
    labReportPeriod: TRLLabel;
    RLPanel1: TRLPanel;
    labDatePrint: TRLLabel;
    sysDatePrint: TRLSystemInfo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmBaseReportDefault: TfrmBaseReportDefault;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, uconsts;

function frmBaseReportDefault: TfrmBaseReportDefault;
begin
  Result := TfrmBaseReportDefault(mm.GetFormInstance(TfrmBaseReportDefault));
end;

end.
