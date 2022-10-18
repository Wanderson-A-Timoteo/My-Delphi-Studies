unit untFrmInputBox; // v. 3.3.0.4

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, untFormBase, uniGUIBaseClasses, uniTimer, uniLabel, uniPanel, uniButton, uniBitBtn, uniImage, uniEdit;

type
  TfrmInputBox = class(TformBase)
    paComandos: TUniContainerPanel;
    lab1: TUniLabel;
    ed2: TUniEdit;
    ed1: TUniEdit;
    lab2: TUniLabel;
    imgTipo: TUniImage;
    btnNo: TUniBitBtn;
    btnOk: TUniBitBtn;
    procedure btnNoClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmInputBox: TfrmInputBox;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untDM_RC, mkm_layout;

function frmInputBox: TfrmInputBox;
begin
  Result := TfrmInputBox(mm.GetFormInstance(TfrmInputBox));
end;

procedure TfrmInputBox.btnNoClick(Sender: TObject);
begin
  inherited;
     Self.ModalResult := mrCancel;
     //Close; // v. 3.3.0.4
end;

procedure TfrmInputBox.btnOkClick(Sender: TObject);
begin
  inherited;
     mm.varC_InputBox_Result1 := ed1.Text;
     mm.varC_InputBox_Result2 := ed2.Text;

     Self.ModalResult := mrOk;
     //Close; // v. 3.3.0.4
end;

procedure TfrmInputBox.UniFormCreate(Sender: TObject);
begin
  inherited;
  // v. 3.3.0.4
  rc_AddCssClass( imgTipo , 'rc-zoomer' );
end;

procedure TfrmInputBox.UniFormShow(Sender: TObject);
begin
  inherited;
  ed1.SetFocus;
end;

end.
