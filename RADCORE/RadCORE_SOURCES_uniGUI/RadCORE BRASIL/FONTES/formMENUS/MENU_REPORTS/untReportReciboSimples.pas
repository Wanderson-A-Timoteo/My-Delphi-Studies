unit untReportReciboSimples;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, untFrmBaseReport, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  RLReport, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, RLParser,
  RLFilters, RLPDFFilter, uniPanel, uniButton, uniBitBtn, uniLabel, uniEdit,
  uniGUIBaseClasses, uniURLFrame;

type
  TfrmReportReciboSimples = class(TfrmBaseReport)
    RLBand1: TRLBand;
    RLDraw6: TRLDraw;
    RLDraw11: TRLDraw;
    RLDraw19: TRLDraw;
    RLDraw15: TRLDraw;
    RLDraw7: TRLDraw;
    RLDraw8: TRLDraw;
    RLDraw9: TRLDraw;
    RLDraw10: TRLDraw;
    RLDraw12: TRLDraw;
    RLDraw13: TRLDraw;
    RLDraw14: TRLDraw;
    RLDraw16: TRLDraw;
    RLDraw17: TRLDraw;
    RLDraw18: TRLDraw;
    RLLabel2: TRLLabel;
    RLDBText1: TRLDBText;
    RLLabel1: TRLLabel;
    RLLabel3: TRLLabel;
    RLDBText2: TRLDBText;
    RLLabel4: TRLLabel;
    RLDBText4: TRLDBText;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    labExtenso: TRLLabel;
    RLLabel7: TRLLabel;
    RLDBText3: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLDBText7: TRLDBText;
    RLLabel10: TRLLabel;
    RLDBText8: TRLDBText;
    RLLabel11: TRLLabel;
    edDoc: TRLDBText;
    RLLabel12: TRLLabel;
    RLBand2: TRLBand;
    RLDraw1: TRLDraw;
    RLDraw5: TRLDraw;
    RLDraw4: TRLDraw;
    RLDraw2: TRLDraw;
    RLDraw3: TRLDraw;
    RLLabel13: TRLLabel;
    RLDBText9: TRLDBText;
    labValor: TRLLabel;
    labRecibo: TRLLabel;
    imgLogo: TRLImage;
    labNumero: TRLLabel;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    procedure RLDBText10BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmReportReciboSimples: TfrmReportReciboSimples;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, mkm_func_web;

function frmReportReciboSimples: TfrmReportReciboSimples;
begin
  Result := TfrmReportReciboSimples(mm.GetFormInstance(TfrmReportReciboSimples));
end;
// v. 3.3.3.2
procedure TfrmReportReciboSimples.RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  inherited;
     If sqlMaster.FieldByName('Valor').AsFloat > 0 then
     begin
        labExtenso.Caption := rc_NumberExtension( sqlMaster.FieldByName('Valor').AsFloat );

        if Copy( labExtenso.Caption, 1, 2 ) = ' e' then
           labExtenso.Caption := Copy( labExtenso.Caption, 3, 200 );
     end;
end;
// ATÉ O MOMENTO, NÃO CONSEGUI ACHAR UM MEIO DINAMICO DE AJUSTAR AS MASCARAS
//
// JA QUE NAO ADICIONO OS FIELDS NA QUERY
//
procedure TfrmReportReciboSimples.RLDBText10BeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  inherited;
  AText := FormatCurr( '#,##0.00' , StrToFloatDef( AText , -12345678 ) );
end;

end.
