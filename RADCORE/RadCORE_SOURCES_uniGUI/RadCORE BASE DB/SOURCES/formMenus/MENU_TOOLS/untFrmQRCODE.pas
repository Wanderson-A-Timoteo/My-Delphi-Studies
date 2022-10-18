unit untFrmQRCODE; // v. 3.4.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses, Soap.EncdDecd,
  uniGUIClasses, uniGUIForm, untGenericModalForm, uniGUIBaseClasses, uniTimer, uniLabel, Vcl.Imaging.jpeg, uniImage, uniButton, uniPanel, uniHTMLFrame, uniSweetAlert;

type
  TfrmQRCODE = class(TfrmGenericModalForm)
    paBackground: TUniContainerPanel;
    paCamera: TUniContainerPanel;
    htmlWEBCAM: TUniHTMLFrame;
    btnCamPower: TUniButton;
    btnSelPhoto: TUniButton;
    btnCamShot: TUniButton;
    paPhoto: TUniContainerPanel;
    imgCap: TUniImage;
    paBaseTopTitle: TUniContainerPanel;
    labTitleForm: TUniLabel;
    labExit: TUniLabel;
    btnCamSwitch: TUniButton;
    procedure labExitClick(Sender: TObject);
    procedure btnCamPowerClick(Sender: TObject);
    procedure btnCamShotClick(Sender: TObject);
    procedure btnSelPhotoClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure htmlWEBCAMAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
    procedure UniFormReady(Sender: TObject);
    procedure btnCamSwitchClick(Sender: TObject);
    procedure timerCloseTimer(Sender: TObject);
  private
    { Private declarations }
    MS: TMemoryStream; //Memory-/Binary-Stream
    vFileName, vDestFileName : String;
    bReadOn : boolean;
  public
    { Public declarations }
    // v. 3.3.1.0
    procedure rc_Exit;

  end;

function frmQRCODE: TfrmQRCODE;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, mkm_layout, untDM_RC, ServerModule;

function frmQRCODE: TfrmQRCODE;
begin
  Result := TfrmQRCODE(mm.GetFormInstance(TfrmQRCODE));
end;

procedure TfrmQRCODE.btnCamPowerClick(Sender: TObject);
begin
  inherited;
  imgCap.Visible := false;
//  htmlWEBCAM.Visible := true;

  if TUniButton( sender ).tag = 0 then
  begin
     paPhoto.Visible := false;

     rc_RemoveCssClass( TUniButton( sender ), 'ButtonGreen' );

     TUniButton( sender ).tag := 1;
     TUniButton( sender ).Caption := 'READ OFF' ;
     TUniButton( sender ).Hint    := '[[cls:ButtonRed]]' ;
     // v. 3.4.0.0
     //UniSession.AddJS( 'rc_cameraOn("environment");' );
     //UniSession.AddJS( 'rc_cameraOn();' );
     bReadOn := True;
     htmlWEBCAM.Visible := true;
  end
  else
  begin
     rc_RemoveCssClass( TUniButton( sender ), 'ButtonRed' );

     TUniButton( sender ).tag := 0;
     TUniButton( sender ).Caption := 'READ ON' ;
     TUniButton( sender ).Hint    := '[[cls:ButtonGreen]]' ;
     //UniSession.AddJS( 'rc_cameraOff();' );
     bReadOn := False;
     htmlWEBCAM.Visible := false;
  end;

  dm_rc.rc_RenderControls( self );
end;

procedure TfrmQRCODE.btnCamShotClick(Sender: TObject);
begin
  inherited;
     UniSession.AddJS( 'rc_cameraSnapshot();' );

     paPhoto.Left := paCamera.Left;
     paPhoto.Top  := paCamera.Top;

     paPhoto.Visible := not paPhoto.Visible;

     btnCamPower.Click;
end;

procedure TfrmQRCODE.btnSelPhotoClick(Sender: TObject);
begin
  inherited;
  mm.varB_Yes := True;
  Self.ModalResult := mrOk;//mrNone; // v. 3.4.0.0
  //rc_Exit;
end;

procedure TfrmQRCODE.htmlWEBCAMAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
Var
  SS: TStringStream; //String-Stream (base64 encoded)
  MS  : TMemoryStream;
  //PngImage : TPngImage;
  JpegImage: TJPEGImage;
begin
  inherited;
  if ( SameText(EventName, 'qrcodedata') ) and ( bReadOn ) then
  Begin
      mm.varC_TempFile := Params.Values['CODE'];
      dm_rc.rc_ShowToaster( 'info', 'QrCODE Captured:' + mm.varC_TempFile , false, 'pinItUp' );
      bReadOn := false;
      btnCamPowerClick( btnCamPower );
  End;
end;

procedure TfrmQRCODE.labExitClick(Sender: TObject);
begin
  inherited;
    mm.varB_Yes                 := False;
    mm.varB_No                  := True;
    Self.ModalResult            := mrNone;
    Close;
    //rc_Exit;
end;

// v. 3.3.1.0
procedure TfrmQRCODE.rc_Exit;
begin
  rc_AddCssClass( self, 'drop_out' );
  if btnCamPower.tag = 1 then
     UniSession.AddJS( 'rc_cameraOff();' );
  timerClose.Enabled := true;
end;
procedure TfrmQRCODE.timerCloseTimer(Sender: TObject);
begin
  inherited;

end;

// v. 3.4.0.0
procedure TfrmQRCODE.btnCamSwitchClick(Sender: TObject);
begin
  inherited;
   if btnCamPower.Tag = 1 then
      UniSession.AddJS( 'rc_cameraOff();' );

   if btnCamSwitch.Tag = 0 then
   begin
      btnCamSwitch.Tag := 1;
      UniSession.AddJS( 'rc_cameraOn("environment");' );
   end
   else
   begin;
      btnCamSwitch.Tag := 0;
      UniSession.AddJS( 'rc_cameraOn("user");' );
   end;
end;

procedure TfrmQRCODE.UniFormReady(Sender: TObject);
begin
  inherited;
    Self.Top := ( UniSession.UniApplication.ScreenHeight  div 2 ) - ( self.Height div 2  );
end;
// v. 3.4.0.0
procedure TfrmQRCODE.UniFormShow(Sender: TObject);
begin
  inherited;
  bReadOn := True;
  paPhoto.Width  := paCamera.Width;
  paPhoto.Height := paCamera.Height;

       htmlWEBCAM.HTML.Text :=
        '<style>' +
        '.commandArea{' +
        '    width: 640px;' +
        '    height: 48px;' +
        '}' +
        '.camArea{' +
        '    width: 640px;' +
        '    height: 240px;' +
        '}' +
        //
        '.commandArea{' +
        '   width: 640px;' +
        '   height: 48px;' +
        '}' +
        '#loadingMessage {' +
        '      text-align: center;' +
        '      padding: 40px;' +
        '      background-color: #eee;' +
        '    }' +
        '#canvas {' +
        '      width: 100%;' +
        '    }' +
        '#output {' +
        '      text-align: center;' +
        '      margin-top: 20px;' +
        '      background: #eee;' +
        '      padding: 10px;' +
        '      padding-bottom: 0;' +
        '    }' +
        '#output div {' +
        '      padding-bottom: 10px;' +
        '      word-wrap: break-word;' +
        '    }' +
        '#noQRFound {' +
        '      text-align: center;' +
        '    }' +
        '#canvas-container {' +
        '   width: 100%;' +
        '   text-align:center;' +
        '}' +
        'canvas {' +
        '      display: inline;' +
        '}' +

        '</style>' +
        '<div id="loadingMessage">🎥 WebCam Unavailable <br> (see security authorization)</div>' +
        '  <div id="canvas-container">' +
        '     <canvas id="canvas" hidden  ></canvas> ' +
        '  </div>' +
        '  <div id="output" hidden>  ' +
        '    <div id="outputMessage">QRCode Scanner Enabled<BR>Place QrCode facing WEBCam</div>' +
        '    <div hidden   ><b>Code:</b> <span id="outputData"></span></div>' +
        '  </div>' +
        '	<div class="commandArea" hidden>     ' +
        '	   <button class="rc_btn rc_btnGreen" type="button" id="btnOn">On</button>' +
        '	   <button class="rc_btn rc_btnRed"   type="button" id="btnOff">Off</button>' +
        '	</div>  ' +
        '<script type="text/javascript" src="files/js/rc_webcam/rc_webcam_qrcode.js"></script>' ;

       mm.varC_TempFile := '';
       mm.varB_Yes      := false;
end;

initialization
  RegisterClass(TfrmQRCODE);

end.
