unit untFrmBaseREL; // v. 3.0.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, RLReport, RLFilters, RLPDFFilter, uniURLFrame,
  uniButton, uniGUIBaseClasses, uniPanel, uniEdit, RLParser, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniBitBtn, uniLabel;

type
  TfrmBaseRel = class(TUniForm)
    RLPDFFilter1: TRLPDFFilter;
    UniURLFrame1: TUniURLFrame;
    ed_Table_ItemSel: TUniEdit;
    ed_FormOrigin: TUniEdit;
    ed_FormOrigin_Tab: TUniEdit;
    ed_Table_Status: TUniEdit;
    ed_Order_Search: TUniEdit;
    ed_Where_Search: TUniEdit;
    ed_CodMaster: TUniEdit;
    RLExpressionParser1: TRLExpressionParser;
    sqlMaster: TFDQuery;
    dsMaster: TDataSource;
    sqlSearchMaster: TFDQuery;
    dsSearchMaster: TDataSource;
    paTitleRegDetail: TUniContainerPanel;
    labTitleFrm: TUniLabel;
    UniPanel1: TUniPanel;
    btnExit: TUniBitBtn;
    btnGerarPDF: TUniBitBtn;
    RLReport: TRLReport;
    procedure UniFormCreate(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure btnGerarPDFClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }


  end;

function frmBaseRel: TfrmBaseRel;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, ServerModule, untdm_rc,
  uMenu_REPORTS, mkm_func_report, mkm_layout;

function frmBaseRel: TfrmBaseRel;
begin
  Result := TfrmBaseRel(mm.GetFormInstance(TfrmBaseRel));
end;

procedure TfrmBaseRel.btnGerarPDFClick(Sender: TObject);
var
  AUrl: string;
begin
  // Desativa a Barra de Progresso do RLPDFFilter
  RLPDFFilter1.ShowProgress := False;

  // Desativa a Barra de Progresso e o Dialog do RLReport
  TRLReport( Self.FindComponent( 'RLReport' ) ).ShowProgress := False;
  TRLReport( Self.FindComponent( 'RLReport' ) ).PrintDialog := False;

  // Oculta o RLReport no Form
  TRLReport( Self.FindComponent( 'RLReport' ) ).Visible := False;

  // Informa o caminho temporario do PDF
  TRLReport( Self.FindComponent( 'RLReport' ) ).SaveToFile(sm.NewCacheFileUrl(False, 'pdf', '', '', AUrl, True));

  // Gera o PDF
  TRLReport( Self.FindComponent( 'RLReport' ) ).Prepare;

  // Mostra o PDF
  UniURLFrame1.URL := AUrl;
end;

procedure TfrmBaseRel.btnExitClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmBaseRel.UniFormCreate(Sender: TObject);
begin

    dm_rc.rc_RenderControls( Self );

end;

procedure TfrmBaseRel.UniFormShow(Sender: TObject);
begin

     btnGerarPDFClick(self);

end;

end.
