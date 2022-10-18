unit untFormBase; // v. 4.0.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniBasicGrid, uniSpeedButton,
  uniDBGrid, uniEdit, uniLabel, uniButton, uniBitBtn, uniTimer,
  uniMemo, uniMultiItem, uniComboBox, uniDBComboBox, uniDBLookupComboBox;

type
  TformBase = class(TUniForm)
    timerClose: TUniTimer;
    paBackground: TUniContainerPanel;
    paBaseTopTitle: TUniContainerPanel;
    labTitleForm: TUniLabel;
    procedure UniFormShow(Sender: TObject);
    procedure UniFormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure UniFormCreate(Sender: TObject);
    procedure timerCloseTimer(Sender: TObject);
    procedure UniFormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    procedure rc_Exit;
  end;


function formBase: TformBase;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untdm_rc, str_func,
  uconsts, Main, mkm_layout, mkm_translate, mkm_anim;

function formBase: TformBase;
begin
  Result := TformBase(mm.GetFormInstance(TformBase));
end;
// v. 3.3.3.0
procedure TformBase.rc_Exit;
begin
      rc_AddCssClass( self, 'drop_out' );
      timerClose.Enabled := true;
end;

procedure TformBase.timerCloseTimer(Sender: TObject);
begin
     timerClose.Enabled := false;
     close;
end;

procedure TformBase.UniFormBeforeShow(Sender: TObject);
begin
    rc_RenderLayout( Self, true, true, false );
end;

procedure TformBase.UniFormClose(Sender: TObject; var Action: TCloseAction);
begin
     //Self.Destroy;  // v. 3.3.3.0
end;

procedure TformBase.UniFormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = 27 then
     begin
        mm.varB_Yes                 := False;
        mm.varB_No                  := True;
        Self.ModalResult            := mrNone;
        rc_Exit;
     end;
end;

procedure TformBase.UniFormCreate(Sender: TObject);
begin
    rc_AlignLabel( labTitleForm, 'left-center' );
end;

procedure TformBase.UniFormReady(Sender: TObject);
begin
    Self.Top := ( UniSession.UniApplication.ScreenHeight div 2 ) - ( self.Height div 2  );
    rc_AddCssClass( self, 'drop_in' );
    // in development
    rc_Translate( Self, nil , '' , mm.CONFIG_LANGUAGE );
end;

procedure TformBase.UniFormDestroy(Sender: TObject);
begin
    // para quando um FORM MODAL estiver ativo, não executar o "dbGridUpdate" no
    // que estiver "abaixo" do MODAL
    mm.varC_Form_Modal := nil;
end;

procedure TformBase.UniFormShow(Sender: TObject);
begin
  inherited;
     if Self.Tag = 0 then
     begin
         Self.Visible := True;
         Self.Top  := 0;
     end
     else
     begin
       Self.Visible := False;
       Self.Top  := -1000;
     end;
end;
end.
