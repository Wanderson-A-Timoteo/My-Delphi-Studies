unit untFrmBasePDF; 

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniURLFrame,
  uniButton, uniGUIBaseClasses, uniPanel, uniEdit, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniBitBtn, uniLabel;

type
  TfrmBasePDF = class(TUniForm)
    UniURLFrame1: TUniURLFrame;
    sqlMaster: TFDQuery;
    dsMaster: TDataSource;
    sqlSearchMaster: TFDQuery;
    dsSearchMaster: TDataSource;
    paTitleRegDetail: TUniContainerPanel;
    labTitleFrm: TUniLabel;
    UniPanel1: TUniPanel;
    btnExit: TUniBitBtn;
    btnPDF: TUniBitBtn;
    procedure UniFormCreate(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnPDFClick(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmBasePDF: TfrmBasePDF;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, ServerModule, untdm_rc,
  uMenu_REPORTS, mkm_func_report, mkm_layout;

function frmBasePDF: TfrmBasePDF;
begin
  Result := TfrmBasePDF(mm.GetFormInstance(TfrmBasePDF));
end;

procedure TfrmBasePDF.btnPDFClick(Sender: TObject);
var
  AUrl: string;
begin
  // Mostra o PDF
  UniURLFrame1.URL := AUrl;
end;

procedure TfrmBasePDF.btnExitClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmBasePDF.UniFormCreate(Sender: TObject);
begin
    {$IFDEF RELEASE}
    dm_rc.rc_ProtectForm( Self );
    {$ENDIF}
    dm_rc.rc_RenderControls( Self );
end;

procedure TfrmBasePDF.UniFormReady(Sender: TObject);
begin
     // to solve issue with VertScrollBar Position ( ScrollBox )
     dm_rc.rc_ResizeBlocks( Self );
end;

end.
