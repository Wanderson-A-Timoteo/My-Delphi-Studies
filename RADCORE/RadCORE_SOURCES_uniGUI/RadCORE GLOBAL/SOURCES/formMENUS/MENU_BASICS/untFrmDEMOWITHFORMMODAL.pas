unit untFrmDEMOWITHFORMMODAL; // v. 3.3.1.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniBitBtn, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDateTimePicker, uniDBDateTimePicker, uniLabel, uniEdit,
  uniDBEdit, uniPanel, uniGUIBaseClasses, uniScrollBox, uniSpinEdit;

type
  TfrmDEMOWithFormMODAL = class(TUniForm)
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
    rcBlock50: TUniContainerPanel;
    UniLabel1: TUniLabel;
    edCnpjCpf: TUniDBEdit;
    rcBlock120: TUniContainerPanel;
    edCodigoClone: TUniDBEdit;
    UniLabel3Clone: TUniLabel;
    rcBlock130: TUniContainerPanel;
    UniLabel66Clone: TUniLabel;
    edDtCadClone: TUniDBDateTimePicker;
    rcBlock140: TUniContainerPanel;
    UniLabel5Clone: TUniLabel;
    UniDBDateTimePicker1Clone: TUniDBDateTimePicker;
    rcBlock150: TUniContainerPanel;
    UniLabel67Clone: TUniLabel;
    edTipoPessoaClone: TUniDBComboBox;
    rcBlock160: TUniContainerPanel;
    UniLabel68Clone: TUniLabel;
    UniDBEdit21Clone: TUniDBEdit;
    rcBlock170: TUniContainerPanel;
    UniLabel6Clone: TUniLabel;
    UniDBEdit1Clone: TUniDBEdit;
    rcBlock180: TUniContainerPanel;
    UniLabel56Clone: TUniLabel;
    UniDBEdit13Clone: TUniDBEdit;
    rcBlock190: TUniContainerPanel;
    UniLabel57Clone: TUniLabel;
    UniDBEdit19Clone: TUniDBEdit;
    rcBlock200: TUniContainerPanel;
    UniLabel58Clone: TUniLabel;
    UniDBEdit20Clone: TUniDBEdit;
    rcBlock210: TUniContainerPanel;
    UniLabel1Clone: TUniLabel;
    edCnpjCpfClone: TUniDBEdit;
    rcBlock220: TUniContainerPanel;
    edCodigoCloneClone: TUniDBEdit;
    UniLabel3CloneClone: TUniLabel;
    rcBlock230: TUniContainerPanel;
    UniLabel66CloneClone: TUniLabel;
    edDtCadCloneClone: TUniDBDateTimePicker;
    rcBlock240: TUniContainerPanel;
    UniLabel5CloneClone: TUniLabel;
    UniDBDateTimePicker1CloneClone: TUniDBDateTimePicker;
    rcBlock250: TUniContainerPanel;
    UniLabel67CloneClone: TUniLabel;
    edTipoPessoaCloneClone: TUniDBComboBox;
    rcBlock260: TUniContainerPanel;
    UniLabel68CloneClone: TUniLabel;
    UniDBEdit21CloneClone: TUniDBEdit;
    rcBlock270: TUniContainerPanel;
    UniLabel6CloneClone: TUniLabel;
    UniDBEdit1CloneClone: TUniDBEdit;
    rcBlock280: TUniContainerPanel;
    UniLabel56CloneClone: TUniLabel;
    UniDBEdit13CloneClone: TUniDBEdit;
    rcBlock290: TUniContainerPanel;
    UniLabel57CloneClone: TUniLabel;
    UniDBEdit19CloneClone: TUniDBEdit;
    rcBlock300: TUniContainerPanel;
    UniLabel58CloneClone: TUniLabel;
    UniDBEdit20CloneClone: TUniDBEdit;
    rcBlock310: TUniContainerPanel;
    UniLabel1CloneClone: TUniLabel;
    edCnpjCpfCloneClone: TUniDBEdit;
    procedure btnCancelClick(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure UniFormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmDEMOWithFormMODAL: TfrmDEMOWithFormMODAL;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untdm_rc, mkm_layout, Main;

function frmDEMOWithFormMODAL: TfrmDEMOWithFormMODAL;
begin
  Result := TfrmDEMOWithFormMODAL(mm.GetFormInstance(TfrmDEMOWithFormMODAL));
end;

procedure TfrmDEMOWithFormMODAL.btnCancelClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmDEMOWithFormMODAL.UniFormBeforeShow(Sender: TObject);
begin
     rc_RenderLayout( Self, true, true, false );
end;

procedure TfrmDEMOWithFormMODAL.UniFormDestroy(Sender: TObject);
begin
    // para quando um FORM MODAL estiver ativo, não executar o "dbGridUpdate" no
    // que estiver "abaixo" do MODAL
    mm.varC_Form_Modal := nil;
end;

procedure TfrmDEMOWithFormMODAL.UniFormReady(Sender: TObject);
begin
    Self.Top := ( UniSession.UniApplication.ScreenHeight  div 2 ) - ( self.Height div 2  );
    rc_AddCssClass( self, 'drop_in' );
end;
// [PT]
// se precisar usar o FORM com BorderStyle = bsSizeable você precisa mudar o
// AlignmentControl para uniAlignmentServer e descomentar a linha abaixo
// [EN]
// if you need to use the FORM with BorderStyle = bsSizeable you need to change the
// AlignmentControl to uniAlignmentServer and uncomment the line below
procedure TfrmDEMOWithFormMODAL.UniFormResize(Sender: TObject);
begin
   //dm_rc.rc_ResizeBlocks( self );
end;

Initialization
   RegisterClass( TfrmDEMOWithFormMODAL );

end.
