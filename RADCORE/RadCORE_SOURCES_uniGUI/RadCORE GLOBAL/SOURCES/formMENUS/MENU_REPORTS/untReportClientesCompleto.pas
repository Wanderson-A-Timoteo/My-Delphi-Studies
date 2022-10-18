unit untReportClientesCompleto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, FireDAC.Stan.Intf, //untFrmBaseRELbasico_Padrao, 
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, RLFilters, RLPDFFilter,
  RLParser, RLReport, untfrmBaseReportDefault;

type
  TfrmReportClientesCompleto = class(TfrmBaseReportDefault)
    bandDetailMaster: TRLBand;
    RLDBText6: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText8: TRLDBText;
    RLLabel10: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel1: TRLLabel;
    RLDBText1: TRLDBText;
    RLLabel2: TRLLabel;
    RLDBText3: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText7: TRLDBText;
    RLLabel3: TRLLabel;
    RLDBText9: TRLDBText;
    labEnd: TRLLabel;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLDBText12: TRLDBText;
    RLLabel5: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    RLLabel6: TRLLabel;
    RLDBText13: TRLDBText;
    RLLabel11: TRLLabel;
    RLDBText14: TRLDBText;
    RLDBText15: TRLDBText;
    RLLabel12: TRLLabel;
    RLDBText17: TRLDBText;
    RLLabel21: TRLLabel;
    labConsultor: TRLLabel;
    edConsultor: TRLDBText;
    edVendedor: TRLDBText;
    labVendedor: TRLLabel;
    procedure bandDetailMasterBeforePrint(Sender: TObject;
      var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmReportClientesCompleto: TfrmReportClientesCompleto;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function frmReportClientesCompleto: TfrmReportClientesCompleto;
begin
  Result := TfrmReportClientesCompleto(mm.GetFormInstance(TfrmReportClientesCompleto));
end;

procedure TfrmReportClientesCompleto.bandDetailMasterBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;

     with sqlMaster do
     begin

          labEnd.Caption := FieldByName('TipoEndereco').AsString + ' ' +
                            FieldByName('Endereco').AsString     + ', ' +
                            FieldByName('Numero').AsString       ;

     end;


end;

initialization
  RegisterClass(TfrmReportClientesCompleto);

end.
