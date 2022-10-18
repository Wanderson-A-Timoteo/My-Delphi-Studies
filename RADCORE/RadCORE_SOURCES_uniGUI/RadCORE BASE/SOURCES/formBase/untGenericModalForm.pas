unit untGenericModalForm; // v. 3.3.3.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniBasicGrid, uniSpeedButton,
  uniDBGrid, uniEdit, uniLabel, uniButton, uniBitBtn, uniTimer,
  uniMemo, uniMultiItem, uniComboBox, uniDBComboBox, uniDBLookupComboBox, uniSweetAlert;

type
  TfrmGenericModalForm = class(TUniForm)
    timerClose: TUniTimer;
    rcSweetAlert: TUniSweetAlert;
    procedure UniFormShow(Sender: TObject);
    procedure UniFormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;


function frmGenericModalForm: TfrmGenericModalForm;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untdm_rc, str_func,
  uconsts, Main, mkm_layout, mkm_translate, mkm_anim;

function frmGenericModalForm: TfrmGenericModalForm;
begin
  Result := TfrmGenericModalForm(mm.GetFormInstance(TfrmGenericModalForm));
end;

procedure TfrmGenericModalForm.UniFormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = 27 then
     begin
        mm.varB_Yes                 := False;
        mm.varB_No                  := True;
        Self.ModalResult            := mrNone;
        Close; // v. 4.0.0.4
     end;
end;

procedure TfrmGenericModalForm.UniFormBeforeShow(Sender: TObject);
begin
   rc_RenderLayout( Self, true, true, true );
end;
// v. 3.3.1.1
procedure TfrmGenericModalForm.UniFormReady(Sender: TObject);
begin
    // in development
    rc_Translate( Self, nil , '' , mm.CONFIG_LANGUAGE );
end;

procedure TfrmGenericModalForm.UniFormDestroy(Sender: TObject);
begin
    // para quando um FORM MODAL estiver ativo, não executar o "dbGridUpdate" no
    // que estiver "abaixo" do MODAL
    mm.varC_Form_Modal := nil;
end;
// v. 3.3.1.1
procedure TfrmGenericModalForm.UniFormShow(Sender: TObject);
begin
  inherited;
    Self.Top := ( UniSession.UniApplication.ScreenHeight div 2 ) - ( self.Height div 2  );
    rc_AddCssClass( self, 'drop_in' );
end;
end.
