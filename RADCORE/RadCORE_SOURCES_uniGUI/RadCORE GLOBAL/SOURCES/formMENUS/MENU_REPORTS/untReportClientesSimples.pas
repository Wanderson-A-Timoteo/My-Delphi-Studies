unit untReportClientesSimples;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, FireDAC.Stan.Intf, //untFrmBaseRELbasico_Padrao,  
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, RLFilters, RLPDFFilter,
  RLParser, RLReport, Vcl.Imaging.jpeg, untfrmBaseReportDefault;

type
  TfrmReportClientesSimples = class(TfrmBaseReportDefault)
    bandDetailMaster: TRLBand;
    RLDBText6: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText8: TRLDBText;
    RLLabel10: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel1: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText4: TRLDBText;
    rlimg_canto_se: TRLImage;
    rlimg_canto_ie: TRLImage;
    rlimg_canto_sd: TRLImage;
    rlimg_canto_id: TRLImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmReportClientesSimples: TfrmReportClientesSimples;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function frmReportClientesSimples: TfrmReportClientesSimples;
begin
  Result := TfrmReportClientesSimples(mm.GetFormInstance(TfrmReportClientesSimples));
end;

initialization
  RegisterClass(TfrmReportClientesSimples);

end.
