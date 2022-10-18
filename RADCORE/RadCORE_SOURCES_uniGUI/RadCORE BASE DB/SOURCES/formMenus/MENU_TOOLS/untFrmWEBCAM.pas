unit untFrmWEBCAM; // v. 4.0.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, // v. 4.0.0.0
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses, Soap.EncdDecd,
  uniGUIClasses, uniGUIForm, untGenericModalForm, uniGUIBaseClasses, uniTimer, uniLabel,
  GIFImg, JPEG, PngImage, // v. 4.0.0.0
  uniImage, uniButton, uniPanel, uniHTMLFrame, uniSweetAlert;

type
  TfrmWEBCAM = class(TfrmGenericModalForm)
    paBackground: TUniContainerPanel;
    paCamera: TUniContainerPanel;
    htmlWEBCAM: TUniHTMLFrame;
    btnCamPower: TUniButton;
    btnSelPhoto: TUniButton;
    btnCamShot: TUniButton;
    paBaseTopTitle: TUniContainerPanel;
    labTitleForm: TUniLabel;
    labExit: TUniLabel;
    btnCamSwitch: TUniButton;
    paPhoto: TUniContainerPanel;
    imgCap: TUniImage;
    procedure labExitClick(Sender: TObject);
    procedure btnCamPowerClick(Sender: TObject);
    procedure btnCamShotClick(Sender: TObject);
    procedure btnSelPhotoClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure htmlWEBCAMAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
    procedure UniFormReady(Sender: TObject);
    procedure btnCamSwitchClick(Sender: TObject);
  private
    { Private declarations }
    MS: TMemoryStream; //Memory-/Binary-Stream
    vFileName, vDestFileName : String;
  public
    { Public declarations }
    // v. 3.3.1.0
    procedure rc_Exit;

  end;

function frmWEBCAM: TfrmWEBCAM;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, mkm_layout, untDM_RC, ServerModule, mkm_func_web, str_func; // v. 4.0.0.0

function frmWEBCAM: TfrmWEBCAM;
begin
  Result := TfrmWEBCAM(mm.GetFormInstance(TfrmWEBCAM));
end;

procedure TfrmWEBCAM.btnCamPowerClick(Sender: TObject);
begin
  inherited;
  imgCap.Visible := false;
  htmlWEBCAM.Visible := true;

  if TUniButton( sender ).tag = 0 then
  begin
     paPhoto.Visible := false;

     rc_RemoveCssClass( TUniButton( sender ), 'ButtonGreen' );

     TUniButton( sender ).tag := 1;
     TUniButton( sender ).Caption := 'CAM OFF' ;
     TUniButton( sender ).Hint    := '[[cls:ButtonRed]]' ;
     // v. 3.4.0.0
     UniSession.AddJS( 'rc_cameraOn("environment");' );
     //UniSession.AddJS( 'rc_cameraOn();' );
  end
  else
  begin
     rc_RemoveCssClass( TUniButton( sender ), 'ButtonRed' );

     TUniButton( sender ).tag := 0;
     TUniButton( sender ).Caption := 'CAM ON' ;
     TUniButton( sender ).Hint    := '[[cls:ButtonGreen]]' ;
     UniSession.AddJS( 'rc_cameraOff();' );
  end;

  dm_rc.rc_RenderControls( self );
end;

procedure TfrmWEBCAM.btnCamShotClick(Sender: TObject);
begin
  inherited;
     UniSession.AddJS( 'rc_cameraSnapshot();' );

     //paPhoto.Left := paCamera.Left;
     //paPhoto.Top  := paCamera.Top;
     paPhoto.Align := alClient;

     paPhoto.Visible := not paPhoto.Visible;

     btnCamPower.Click;
end;

procedure TfrmWEBCAM.btnSelPhotoClick(Sender: TObject);
begin
  inherited;
  mm.varB_Yes := True;
  Self.ModalResult := mrOk;//mrNone; // v. 3.4.0.0
  //rc_Exit;
end;
// v. 4.0.0.0
procedure TfrmWEBCAM.htmlWEBCAMAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
Var
  SS: TStringStream; //String-Stream (base64 encoded)
  MS  : TMemoryStream;
  PngImage : TPngImage;
  JpegImage: TJPEGImage;
  FSize  : Longint;
  f      : file of Byte;
  iCompress : Integer;
begin
  inherited;
  // Read fro AjaxEvent Click to save image
  if SameText(EventName, 'saveimg') then
  begin
      vFileName := sm.TempFolderPath + '_' + UniSession.SessionId+'.jpg';

      SS       := TStringStream.Create(Params.Values['img']);
      MS       := TMemoryStream.Create();
      JpegImage:= TJPEGImage.Create();
      DecodeStream(SS, MS);
      MS.Position := 0;
      try
         JpegImage.LoadFromStream(MS);
         JpegImage.SaveToFile(vFileName);
      finally
        SS.Free;
        MS.Free;
      end;
      iCompress := 70;
      vDestFileName := StringReplace( vFileName , '-', '_', [rfReplaceAll]);
      //rc_ConvertPNGToJPG(vFileName, vDestFileName, iCompress);
      mm.varC_TempFile := vDestFileName;

      JpegImage.LoadFromFile( vDestFileName );
      imgCap.Picture.Graphic := JpegImage;
      imgCap.Visible := true;
      htmlWEBCAM.Visible := false;
      JpegImage.Free;
  end;
  exit;
  if SameText(EventName, 'saveimg') then
  begin
      vFileName := sm.TempFolderPath + '_' + UniSession.SessionId + '.jpg';
      //vFileName := 'temp/' + '_' + UniSession.SessionId + '.jpg';

      SS        := TStringStream.Create(Params.Values['img']);
      MS        := TMemoryStream.Create();
      PngImage  := TPngImage.Create();
      JpegImage := TJPEGImage.Create();
      try
         DecodeStream(SS, MS);
         MS.Position := 0;
         try
           PngImage.LoadFromStream(MS);
           PngImage.SaveToFile(vFileName);

           AssignFile(f, vFileName);
           Reset(f);
           FSize   := FileSize(f);
           CloseFile(f);
           iCompress := 70;
           if FSize >1024 then
              FSize := Trunc(FSize / 1024); // Resultado em KB
           case FSize of
              -9999999..0  : begin
                                dm_rc.rc_ShowSweetAlertSimple( 'Tamanho da imagem =' + IntToStr( FSize ) + 'kb é inválido!' );
                                Abort;
                             end;
              001..100     : iCompress := 70;
              101..200     : iCompress := 60;
              201..300     : iCompress := 50;
              301..500     : iCompress := 50;
              501..1024    : iCompress := 40;
              1025..5120   : iCompress := 10;
              5121..10240  : iCompress := 01;
              10241..102400: begin
                                dm_rc.rc_ShowSweetAlertSimple( 'Tamanho da imagem =' + IntToStr( FSize ) + 'kb é maior que o permitido!' );
                                Abort;
                             end;
           end;

           vDestFileName := StringReplace( vFileName , '-', '_', [rfReplaceAll]);
           mm.varC_TempFile := vDestFileName;
           //vDestFileName := vFileName;
           rc_ConvertPNGToJPG(vFileName, vDestFileName, iCompress);
         finally
           try
             JpegImage.LoadFromFile(vDestFileName);
             imgCap.Picture.Graphic := JpegImage;
           except
             PngImage.LoadFromFile(vDestFileName);
             imgCap.Picture.Graphic := PngImage;
           end;
         end;
      finally
        SS.Free;
        MS.Free;
      end;
      dm_rc.rc_ShowToaster( 'info', 'Imagem capturada com sucesso!', True, 'slideLeftRightFade' ); //slideLeftRightFade
      //btnSalvarImagem.Enabled := True;
      //frmCapCam.Caption := 'Imagem capturada!';
      //pgCamera.ActivePageIndex := 0;
  end;
  Exit;

end;

procedure TfrmWEBCAM.labExitClick(Sender: TObject);
begin
  inherited;
    mm.varB_Yes                 := False;
    mm.varB_No                  := True;
    Self.ModalResult            := mrNone;
    Close;
    //rc_Exit;
end;

// v. 3.3.1.0
procedure TfrmWEBCAM.rc_Exit;
begin
  rc_AddCssClass( self, 'drop_out' );
  if btnCamPower.tag = 1 then
     UniSession.AddJS( 'rc_cameraOff();' );
  timerClose.Enabled := true;
end;
// v. 3.4.0.0
procedure TfrmWEBCAM.btnCamSwitchClick(Sender: TObject);
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

procedure TfrmWEBCAM.UniFormReady(Sender: TObject);
begin
  inherited;
    Self.Top := ( UniSession.UniApplication.ScreenHeight  div 2 ) - ( self.Height div 2  );
end;
// v. 4.0.0.0
procedure TfrmWEBCAM.UniFormShow(Sender: TObject);
var
   iW, iH : integer;
begin
  inherited;
//  if mm.varB_Mobile_Screen then
//  begin
//       iW := 400;
//       iH := 300;
//  end
//  else
  begin
       iW := 320;
       iH := 240;
  end;
  paPhoto.Width  := iW;// paCamera.Width;
  paPhoto.Height := iH;//paCamera.Height;
  paPhoto.Left   := 0;//( paCamera.Left div 2 ) - ( paPhoto.Left div 2 );
  paPhoto.Top    := 0;//( paCamera.Top div 2 ) - ( paPhoto.Top div 2 );
       htmlWEBCAM.HTML.Text :=

        '<style>' +
        '.commandArea{' +
        '    width: 320px;' +
        '    height: 48px;' +
        '}' +
        '.camArea{' +
        '    width: ' + iW.ToString + 'px;' +
        '    height: ' + iH.ToString + 'px;' +
        //'    background: red;' +
        '}' +
        '</style>' +

        '<div id="viddiv" style="display:block; width:100%; height:100%">' +
        //'<div id="viddiv" style="display:block; width:320;height:240;">' +
        '  <video id="player" width="100%" height="100%" autoplay></video>' +
        '</div>' +

        '<div id="picdivcanvas" style="width:100%;">'+
        //'<div id="picdivcanvas" style="width:320;height:240;">'+
        '  <canvas id="snapshot"></canvas>'+
        '</div>'+



(*

        //'<iframe allow="camera;microphone">'+
        '<div class="camArea">' +
        //'     <div>' +
        '        <video id="player" width=' + iW.ToString + ' height=' + iH.ToString + ' class=''center'' autoplay></video>' +
        '        <canvas hidden id="snapshot" width=' + iW.ToString + ' height=' + iH.ToString + '></canvas>' +
        //'     </div>        ' +
        '</div>' +
//        '<div class="commandArea">' +
//        '     <button class="rc_btn rc_btnGreen" type="button" id="btnOn">On</button>' +
//        '     <button class="rc_btn rc_btnBlue" type="button" id="btnCapture">Captura Foto</button>' +
//        '     <button class="rc_btn rc_btnRed" type="button" id="btnOff">Off</button>' +
//        '</div>' +
        //'<iframe>' +

//        '        <video id="player" width=' + iW.ToString + ' height=' + iH.ToString + ' class=''center'' autoplay></video>' +
//        '        <canvas hidden id="snapshot" width=' + iW.ToString + ' height=' + iH.ToString + '></canvas>' +
*)
        '<script type="text/javascript" src="files/js/rc_webcam/rc_webcam.js"></script>' ;

       mm.varC_TempFile := '';
       mm.varB_Yes      := false;
       (*
<div id="viddiv" style="display:block; width:100%; height:100%">
  <video id="livevideo" width="100%" height="100%" autoplay></video>
</div>
<div id="picdiv" style="display:none;">
  <div id="picdivbuttons" style="width:100%">
    <button onclick="upload();">Upload</button>
    <button onclick="tryagain();">Try again</button>
    <button onclick="closeapp();">Close</button>
    <span id="resolution">WxH:</span>
  </div>
  <div id="picdivcanvas" style="width:100%;">
    <canvas id="takenpic"></canvas>
  </div>
</div>

<script type="text/javascript">
  var video = document.getElementById("livevideo");
  var canvas = document.getElementById("takenpic");
  var context = canvas.getContext("2d");

  navigator.getMedia = (
    navigator.getUserMedia ||
    navigator.webkitGetUserMedia ||
    navigator.mozGetUserMedia ||
    navigator.msGetUserMedia
  );

  navigator.getMedia(
    {video: true},
    function(stream) {
      video.src = window.URL.createObjectURL(stream);
    },
    function(err) {
      alert("No camera access!");
    }
  );

  video.addEventListener('click', takepic, false);

  function takepic() {
    var vw = video.videoWidth;
    var vh = video.videoHeight;
    document.getElementById("resolution").innerHTML = ("Width x Height: " + vw + " x " + vh);
    canvas.width = vw;
    canvas.height = vh;
    context.drawImage(video, 0, 0);
    document.getElementById("picdiv").style.display = "block";
    document.getElementById("viddiv").style.display = "none";
  }

  function upload() {
    var d = document.getElementById("takenpic").toDataURL("image/jpeg");
    d = d.slice(d.indexOf(",") + 1);
    ajaxRequest(frmMain.hfrWebCamPic, "saveimg", ["img="+d]);
  }

  function tryagain() {
    document.getElementById("picdiv").style.display = "none";
    document.getElementById("viddiv").style.display = "block";
  }

  function closeapp() {
    ajaxRequest(frmMain.hfrWebCamPic, "closeapp", []);
  }
</script>


       *)
end;

initialization
  RegisterClass(TfrmWEBCAM);

end.
