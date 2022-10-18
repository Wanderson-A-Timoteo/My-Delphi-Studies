unit Main; // 3.3.2.0
// UniScrollBox1 renamed to sboxGridBlock

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniEdit, uniLabel,
  uniGUIBaseClasses, uniPanel, uniButton, uniBitBtn, uniMultiItem, uniComboBox, uniHTMLFrame, uniScrollBox;

type
  TMainForm = class(TUniForm)
    sboxGridBlock: TUniScrollBox;
    procedure UniFormScreenResize(Sender: TObject; AWidth, AHeight: Integer);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormAfterShow(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    // v. 3.2.0.3
    procedure rc_UpdateMainControls;
  end;

function MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication, untRCMinimal;

function MainForm: TMainForm;
begin
  Result := TMainForm(mm.GetFormInstance(TMainForm));
end;
// v. 3.2.0.3
// resolver o conflito com "DELPHI align" e "UNIGUI alignClient"
// to solve a conflict with "DELPHI align" and "UNIGUI alignClient"
procedure TMainForm.rc_UpdateMainControls;
var
   oObj1, oObj2 : TObject;
begin
    oObj1 := rc_FindControl( 'paLayoutMainMenu' );
    if oObj1 <> nil then
    begin
       TUnicontrol( oObj1 ).Left  := 0;
       TUnicontrol( oObj1 ).Height:= Self.Height;
       oObj2 := rc_FindControl( 'paBackGround' );
       if oObj2 <> nil then
       begin
          TUnicontrol( oObj2 ).Left      := TUnicontrol( oObj1 ).Width;
          TUnicontrol( oObj2 ).Height    := Self.Height;
          TUnicontrol( oObj2 ).Width     := Self.Width - TUnicontrol( oObj1 ).Width;
       end;
    end
    else
    begin
       oObj1 := rc_FindControl( 'paBackGround' );
       if oObj1 <> nil then
       begin
          TUnicontrol( oObj1 ).Left      := 0;
          TUnicontrol( oObj1 ).Top       := 0;
          TUnicontrol( oObj1 ).Height    := Self.Height;
          TUnicontrol( oObj1 ).Width     := Self.Width;
       end;
    end;
end;
// v. 3.3.2.0
procedure TMainForm.UniFormBeforeShow(Sender: TObject);
begin
     rc_RenderLayout( Self, true, true, true );
end;
// v. 3.3.2.0
procedure TMainForm.UniFormAfterShow(Sender: TObject);
begin
     sboxGridBlock.ScrollTo(0,0);
end;

procedure TMainForm.UniFormCreate(Sender: TObject);
begin
  // v. 3.3.2.0
  // screenwidth está disponivel apenas no screenresize mas precismos tratar mm.varB_MobileScreen no dm_rc.rc_GetDeviceType( STARTER / MINIMAL )...
  // screenwidth is only available in screenresize but we need to handle mm.varB_MobileScreen in dm_rc.rc_GetDeviceType( STARTER / MINIMAL )...
  mm.varI_ScreenWidth := UniApplication.ScreenWidth;
  mm.varI_ScreenHeight := UniApplication.ScreenHeight;
  if mm.varI_ScreenWidth = 0 then
     mm.varI_ScreenWidth := Self.Width;
  if mm.varI_ScreenHeight = 0 then
     mm.varI_ScreenHeight := Self.Height;
  rc_GetDeviceType;

  Self.Script.Text :=
      'Ext.QuickTips.init();' +
      'function launchIntoFullscreen(element) {' +
      '    if (element.requestFullscreen) {' +
      '        element.requestFullscreen();' +
      '    } else if (element.mozRequestFullScreen) {' +
      '        element.mozRequestFullScreen();' +
      '    } else if (element.webkitRequestFullscreen) {' +
      '        element.webkitRequestFullscreen();' +
      '    } else if (element.msRequestFullscreen) {' +
      '        element.msRequestFullscreen();' +
      '    }' +
      (*<prj-orientation*)'    screen.orientation.lock("portrait");' + // v. 3.2.0.0
      '}' +
      'function exitFullscreen() {' +
      '    if (document.exitFullscreen) {' +
      '        document.exitFullscreen();' +
      '    } else if (document.mozCancelFullScreen) {' +
      '        document.mozCancelFullScreen();' +
      '    } else if (document.webkitExitFullscreen) {' +
      '        document.webkitExitFullscreen();' +
      '    }' +
      '}' ;
end;
// v. 3.3.2.0
procedure TMainForm.UniFormReady(Sender: TObject);
begin
     //rc_RenderLayout( Self );
end;

procedure TMainForm.UniFormScreenResize(Sender: TObject;
  AWidth, AHeight: Integer);
var
   pMainMenu, oObj : TUniControl;
begin
  try
    mm.varI_ScreenWidth := AWidth;
    mm.varI_ScreenHeight := AHeight;

    pMainMenu := TUniControl(rc_ScreenUpdate(true));

    if (mm.varB_Mobile_Screen_Landscape) and (mm.varI_ScreenHeight < 480) then
      Self.Height := 480
    else
      Self.Height := mm.varI_ScreenHeight;
    // v. 3.3.3.0
    if mm.varB_Mobile_Screen_Landscape then
       Self.Width  := mm.varI_ScreenWidth - 5
    else
       Self.Width  := mm.varI_ScreenWidth;
    Self.Left   := ( mm.varI_ScreenWidth div 2 ) - (  Self.Width div 2 );
    Self.Top    := ( mm.varI_ScreenHeight div 2 ) - (  Self.Height div 2 );
    // v. 3.2.0.3
    rc_UpdateMainControls;

    if mm.oPgGeneral <> nil then
    begin
      oObj := rc_FindControl(Copy(mm.oPgGeneral.ActivePage.Name, 5, 100));

      rc_AdjustFormsSize(pMainMenu);
      rc_ResizeBlocks(oObj);
    end
    else
    begin
      rc_AdjustFormsSize(pMainMenu);
      rc_ResizeBlocks(Self);
    end;
  except
    on e: exception do
    begin
      ShowMessage('ScreenResize ' + sLineBreak + sLineBreak + e.Message);
    end;
  end;
end;

initialization

RegisterAppFormClass(TMainForm);

end.
