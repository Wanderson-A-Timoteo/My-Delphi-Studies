unit untFrmWIZARDDEMO; 

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniBitBtn, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDateTimePicker, uniDBDateTimePicker, uniLabel, uniEdit,
  uniDBEdit, uniPanel, uniGUIBaseClasses, uniScrollBox, uniSpinEdit;

type
  TfrmWIZARDDEMO = class(TUniForm)
    UniScrollBox1: TUniScrollBox;
    UniContainerPanel1: TUniContainerPanel;
    rcBlock10: TUniContainerPanel;
    edCodigo: TUniDBEdit;
    UniLabel3: TUniLabel;
    rcBlock20: TUniContainerPanel;
    UniLabel66: TUniLabel;
    edDtCad: TUniDBDateTimePicker;
    rcBlock30: TUniContainerPanel;
    UniLabel5: TUniLabel;
    UniDBDateTimePicker1: TUniDBDateTimePicker;
    rcBlock50: TUniContainerPanel;
    UniLabel10: TUniLabel;
    edCnpjCpf: TUniDBEdit;
    rcBlock40: TUniContainerPanel;
    UniLabel67: TUniLabel;
    edTipoPessoa: TUniDBComboBox;
    rcBlock70: TUniContainerPanel;
    UniLabel68: TUniLabel;
    UniDBEdit21: TUniDBEdit;
    rcBlock80: TUniContainerPanel;
    UniLabel6: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    rcBlock90: TUniContainerPanel;
    UniLabel56: TUniLabel;
    UniDBEdit13: TUniDBEdit;
    rcBlock100: TUniContainerPanel;
    UniLabel57: TUniLabel;
    UniDBEdit19: TUniDBEdit;
    rcBlock110: TUniContainerPanel;
    UniLabel58: TUniLabel;
    UniDBEdit20: TUniDBEdit;
    paFooter: TUniContainerPanel;
    btnCancel: TUniBitBtn;
    paHeader: TUniContainerPanel;
    step1: TUniContainerPanel;
    UniLabel1: TUniLabel;
    step2: TUniContainerPanel;
    UniLabel2: TUniLabel;
    step3: TUniContainerPanel;
    UniLabel4: TUniLabel;
    step4: TUniContainerPanel;
    UniLabel7: TUniLabel;
    procedure btnCancelClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmWIZARDDEMO: TfrmWIZARDDEMO;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untdm_rc, mkm_layout, Main;

function frmWIZARDDEMO: TfrmWIZARDDEMO;
begin
  Result := TfrmWIZARDDEMO(mm.GetFormInstance(TfrmWIZARDDEMO));
end;

procedure TfrmWIZARDDEMO.btnCancelClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmWIZARDDEMO.UniFormCreate(Sender: TObject);
begin

//    // para quando um FORM MODAL estiver ativo, não executar o "dbGridUpdate" no
//    // que estiver "abaixo" do MODAL
//    mm.varC_Form_Modal := Self;
    // para formulários, deve-se efetuar o ResizeBlocks
    rc_RenderLayout( Self, true, true, true );
end;

procedure TfrmWIZARDDEMO.UniFormDestroy(Sender: TObject);
begin
    // para quando um FORM MODAL estiver ativo, não executar o "dbGridUpdate" no
    // que estiver "abaixo" do MODAL
    mm.varC_Form_Modal := nil;
end;

procedure TfrmWIZARDDEMO.UniFormReady(Sender: TObject);
begin
     
     dm_rc.rc_ResizeBlocks( Self, true, true );
end;

Initialization
   RegisterClass( TfrmWIZARDDEMO );

end.
