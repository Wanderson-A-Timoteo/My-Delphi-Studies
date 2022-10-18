unit untFrmBARCODE; // v. 3.4.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses, Soap.EncdDecd,
  uniGUIClasses, uniGUIForm, untGenericModalForm, uniGUIBaseClasses, uniTimer, uniLabel, Vcl.Imaging.jpeg, uniImage, uniButton, uniPanel, uniHTMLFrame, uniSweetAlert;

type
  TfrmBARCODE = class(TfrmGenericModalForm)
    paBackground: TUniContainerPanel;
    paCamera: TUniContainerPanel;
    htmlBarCode: TUniHTMLFrame;
    btnInit: TUniButton;
    btnSelPhoto: TUniButton;
    btnReset: TUniButton;
    paPhoto: TUniContainerPanel;
    imgCap: TUniImage;
    paBaseTopTitle: TUniContainerPanel;
    labTitleForm: TUniLabel;
    labExit: TUniLabel;
    btnStart: TUniButton;
    procedure labExitClick(Sender: TObject);
    procedure btnInitClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure btnSelPhotoClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure htmlBarCodeAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
    procedure UniFormReady(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
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

function frmBARCODE: TfrmBARCODE;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, mkm_layout, untDM_RC, ServerModule;

function frmBARCODE: TfrmBARCODE;
begin
  Result := TfrmBARCODE(mm.GetFormInstance(TfrmBARCODE));
end;

procedure TfrmBARCODE.btnInitClick(Sender: TObject);
begin
  inherited;

  imgCap.Visible := false;
//  htmlWEBCAM.Visible := true;

  if TUniButton( sender ).tag = 0 then
  begin
     paPhoto.Visible := false;

     rc_RemoveCssClass( TUniButton( sender ), 'ButtonGreen' );

     TUniButton( sender ).tag := 1;
     //TUniButton( sender ).Caption := 'READ OFF' ;
     TUniButton( sender ).Hint    := '[[cls:ButtonRed]]' ;
     // v. 3.4.0.0
     //UniSession.AddJS( 'rc_cameraOn("environment");' );
     //UniSession.AddJS( 'rc_cameraOn();' );
     bReadOn := True;
     htmlBarCode.Visible := true;
     //
     UniSession.AddJS(

          htmlBarCode.JSName +'._ael=document.getElementById("player");'+ htmlBarCode.JSName +'._ael.load();'+
          htmlBarCode.JSName + '.oldResultText="";'+
          '            let selectedDeviceId;' +
          '            const codeReader = new ZXing.BrowserBarcodeReader();' +
          '            console.log(''ZXing code reader initialized'');' +
          '            codeReader.getVideoInputDevices()' +
          '                .then((videoInputDevices) => {' +
          '                    const sourceSelect = document.getElementById(''sourceSelect'');' +
          '                    selectedDeviceId = videoInputDevices[0].deviceId;' +
          '                    if (videoInputDevices.length > 1) {' +
          '                        videoInputDevices.forEach((element) => {' +
          '                            const sourceOption = document.createElement(''option'');' +
          '                            sourceOption.text = element.label;' +
          '                            sourceOption.value = element.deviceId;' +
          '                            sourceSelect.appendChild(sourceOption);' +
          '                        })' +

          '                        sourceSelect.onchange = () => {' +
          '                            selectedDeviceId = sourceSelect.value;' +
          '                        }' +

          '                        const sourceSelectPanel = document.getElementById(''sourceSelectPanel'');' +
          '                        sourceSelectPanel.style.display = ''block'';' +
          '                    }' +

          '                    document.getElementById(''startButton'').addEventListener(''click'', () => {' +
          //'                    document.getElementById('+ btnStart.JSId +').addEventListener(''click'', () => {' +
          '                        codeReader.decodeOnceFromVideoDevice(selectedDeviceId, ''video'').then((result) => {' +
          '                            console.log(result);' +
          '                            document.getElementById(''result'').textContent = result.text;' +
          '                        }).catch((err) => {' +
          '                            console.error(err);' +
          '                            document.getElementById(''result'').textContent = err;' +
          '                        })' +
          '                        console.log(''Started continous decode from camera with id ${selectedDeviceId}'');' +
          '                    })' +

          '                    document.getElementById(''resetButton'').addEventListener(''click'', () => {' +
          //'                    document.getElementById('+ btnReset.JSId +').addEventListener(''click'', () => {' +
          '                        document.getElementById(''result'').textContent = '''';' +
          '                        codeReader.reset();' +
          '                        console.log(''Reset.'')' +
          '                    })' +

          '                })' +
          '                .catch((err) => {' +
          '                    console.error(err)' +
          '                })' );


//        htmlBarCode.JSName +'._ael=document.getElementById("player");'+ htmlBarCode.JSName +'._ael.load();'+
//        htmlBarCode.JSName + '.oldResultText="";'+
//        'let selectedDeviceId;'+
//        '    const codeReader = new ZXing.BrowserMultiFormatReader();'+
//        '    codeReader.getVideoInputDevices()'+
//        '      .then((videoInputDevices) => {'+
//        '        const sourceSelect = document.getElementById("sourceSelect");'+
//        '        selectedDeviceId = videoInputDevices[0].deviceId;'+
//        '        if (videoInputDevices.length >= 1) {'+
//        '          videoInputDevices.forEach((element) => {'+
//        '            const sourceOption = document.createElement("option");'+
//        '            sourceOption.text = element.label;'+
//        '            sourceOption.value = element.deviceId;'+
//        '            sourceSelect.appendChild(sourceOption);'+
//        '          });'+
//
//        '          sourceSelect.onchange = () => {'+
//        '            selectedDeviceId = sourceSelect.value;'+
//        '          };'+
//
//        '          const sourceSelectPanel = document.getElementById("sourceSelectPanel");'+
//        '          sourceSelectPanel.style.display = "block";'+
//        '        }' +
//
//        '        document.getElementById("'+ btnStart.JSId +'").addEventListener("click", () => {'+
//        '          codeReader.decodeFromVideoDevice(selectedDeviceId, "video", (result, err) => {'+
//        '            if (result&&result.text!='+htmlBarCode.JSName+'.oldResultText) {'+
//        '              window.ajaxRequest('+ htmlBarCode.JSName +', "getResult", ["result="+result.text]);'+
//                       htmlBarCode.JSName + '.oldResultText=result.text;'+
//        '            }'+
//        '            if (err && !(err instanceof ZXing.NotFoundException)) {'+
//        //'              console.error(err);'+
//        //'              document.getElementById("result").textContent = err;'+
//        '            }'+
//        '          });'+
//        //'          console.log("Started continous decode from camera with id ${selectedDeviceId}")'+
//        '        });'+
//
//        '        document.getElementById("'+ btnReset.JSId +'").addEventListener("click", () => {'+
//        '          codeReader.reset();'+
//        '          ajaxRequest('+ htmlBarCode.JSName +', "getResult", ["result="+""]);'+
//        //'          console.log("Reset.")'+
//        '        })'+
//
//        '      })'+
//        '      .catch((err) => {'+
//        '        alert(err)'+
//        '      })'
//
//        );


  end
  else
  begin
     rc_RemoveCssClass( TUniButton( sender ), 'ButtonRed' );

     TUniButton( sender ).tag := 0;
     //TUniButton( sender ).Caption := 'READ ON' ;
     TUniButton( sender ).Hint    := '[[cls:ButtonGreen]]' ;
     //UniSession.AddJS( 'rc_cameraOff();' );
     bReadOn := False;
     //htmlBarCode.Visible := false;
  end;

  dm_rc.rc_RenderControls( self );
end;

procedure TfrmBARCODE.btnSelPhotoClick(Sender: TObject);
begin
  inherited;
  mm.varB_Yes := True;
  Self.ModalResult := mrOk;//mrNone; // v. 3.4.0.0
  //rc_Exit;
end;

procedure TfrmBARCODE.htmlBarCodeAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
Var
  SS: TStringStream; //String-Stream (base64 encoded)
  MS  : TMemoryStream;
  //PngImage : TPngImage;
  JpegImage: TJPEGImage;
begin
  inherited;
  if (EventName = 'getResult') then //and ( bReadOn ) then //and ( Params.Values['result'] <> Trim( mResult.Text ) ) then
  begin
    //mResult.Clear;
    //mResult.Lines.Add(Params.Values['result']);
    //htmlBarCode.JSInterface.JSCall('_ael.play', []);
    mm.varC_TempFile := Params.Values['result'];
    dm_rc.rc_ShowToaster( 'info', 'BarCode Captured:' + mm.varC_TempFile , false, 'pinItUp' );
    bReadOn := false;
    //btnCamPowerClick( btnCamPower );
  end;
end;

procedure TfrmBARCODE.labExitClick(Sender: TObject);
begin
  inherited;
    mm.varB_Yes                 := False;
    mm.varB_No                  := True;
    Self.ModalResult            := mrNone;
    Close;
    //rc_Exit;
end;

// v. 3.3.1.0
procedure TfrmBARCODE.rc_Exit;
begin
  rc_AddCssClass( self, 'drop_out' );
  if btnInit.tag = 1 then
     UniSession.AddJS( 'rc_reset();' );
  timerClose.Enabled := true;
end;
procedure TfrmBARCODE.btnStartClick(Sender: TObject);
begin
  inherited;
   //(Sender as TUniButton).JSInterface.JSCall('element.dom.click', []);
   UniSession.AddJS( 'document.getElementById("'+ btnStart.JSId +'").click();');
   //UniSession.AddJS( 'rc_start();' );

end;

procedure TfrmBARCODE.btnResetClick(Sender: TObject);
begin
  inherited;
  //   (Sender as TUniButton).JSInterface.JSCall('click()', []);
  UniSession.AddJS( 'document.getElementById("'+ btnReset.JSId +'").click();');
  //UniSession.AddJS( 'rc_reset();' );
end;

procedure TfrmBARCODE.UniFormReady(Sender: TObject);
begin
  inherited;
    Self.Top := ( UniSession.UniApplication.ScreenHeight  div 2 ) - ( self.Height div 2  );
    //btnInitClick( btnInit );
end;
// v. 3.4.0.0
procedure TfrmBARCODE.UniFormShow(Sender: TObject);
begin
  inherited;
  bReadOn := True;
  paPhoto.Width  := paCamera.Width;
  paPhoto.Height := paCamera.Height;

       htmlBarCode.HTML.Text :=
         //'<audio id="player" height="0px" src="files\audio\beep.mp3" style="display:none"></audio>' +

//         '<div>' +
//         '  <video id="video" width="100%" height="100%" style="border: 1px solid gray"></video>' +
//         '</div>' +
//
//         '<div id="sourceSelectPanel" style="display:none">' +
//         '  <label for="sourceSelect">Change video source:</label>' +
//         '  <select id="sourceSelect" style="max-width:400px">' +
//         '  </select>' +
//         '  <label>Result:</label>' +
//         '  <pre><code id="result"></code></pre>' +
//         '</div>' ;

          '<!doctype html>' +
          '<html lang="en">' +

          '<head>' +
          '    <meta charset="utf-8">' +
          '    <meta name="viewport" content="width=device-width, initial-scale=1">' +
          '    <meta name="author" content="ZXing for JS">' +

          '    <title>ZXing TypeScript | Demo &amp; Examples</title>' +

          '    <link rel="stylesheet" rel="preload" as="style" onload="this.rel=''stylesheet'';this.onload=null" href="https://fonts.googleapis.com/css?family=Roboto:300,300italic,700,700italic">' +
          '    <link rel="stylesheet" rel="preload" as="style" onload="this.rel=''stylesheet'';this.onload=null" href="https://unpkg.com/normalize.css@8.0.0/normalize.css">' +
          '    <link rel="stylesheet" rel="preload" as="style" onload="this.rel=''stylesheet'';this.onload=null" href="https://unpkg.com/milligram@1.3.0/dist/milligram.min.css">' +
          '</head>' +

          '<body>' +

          '    <main class="wrapper" style="padding-top:2em">' +

          '        <section class="container" id="demo-content">' +
          '            <h1 class="title">Scan barcode from Video Camera</h1>' +

          '            <p>' +
          '                <a class="button-small button-outline" href="../../index.html">HOME 🏡</a>' +
          '            </p>' +

          '            <p>' +
          '                This example shows how to scan a barcode with ZXing javascript library from the device video camera. If more' +
          '                than one video input devices are available (for example front and back camera) the example shows how to read' +
          '                them and use a select to change the input device.' +
          '            </p>' +

          '            <div>' +
          '                <a class="button" id="startButton">Start</a>' +
          '                <a class="button" id="resetButton">Reset</a>' +
          '            </div>' +

          '            <div>' +
          '                <video id="video" width="600" height="400" style="border: 1px solid gray"></video>' +
          '            </div>' +

          '            <div id="sourceSelectPanel" style="display:none">' +
          '                <label for="sourceSelect">Change video source:</label>' +
          '                <select id="sourceSelect" style="max-width:400px">' +
          '                </select>' +
          '            </div>' +

          '            <label>Result:</label>' +
          '            <pre><code id="result"></code></pre>' +

          '            <p>See the <a href="https://github.com/zxing-js/library/tree/master/docs/examples/barcode-camera/">source code</a>  for this example.</p>' +

          '        </section>' +

          '        <footer class="footer">' +
          '            <section class="container">' +
          '                <p>ZXing TypeScript Demo. Licensed under the <a target="_blank" href="https://github.com/zxing-js/library#license" title="MIT">MIT</a>.</p>' +
          '            </section>' +
          '        </footer>' +

          '    </main>' +

//          '    <script type="text/javascript" src="https://unpkg.com/@zxing/library@latest"></script>' +

//          '    <script type="text/javascript">' +
//          //'        window.addEventListener(''load'', function () {' +
//          '            let selectedDeviceId;' +
//          '            const codeReader = new ZXing.BrowserBarcodeReader();' +
//          '            console.log(''ZXing code reader initialized'');' +
//          '            codeReader.getVideoInputDevices()' +
//          '                .then((videoInputDevices) => {' +
//          '                    const sourceSelect = document.getElementById(''sourceSelect'');' +
//          '                    selectedDeviceId = videoInputDevices[0].deviceId;' +
//          '                    if (videoInputDevices.length > 1) {' +
//          '                        videoInputDevices.forEach((element) => {' +
//          '                            const sourceOption = document.createElement(''option'');' +
//          '                            sourceOption.text = element.label;' +
//          '                            sourceOption.value = element.deviceId;' +
//          '                            sourceSelect.appendChild(sourceOption);' +
//          '                        })' +
//
//          '                        sourceSelect.onchange = () => {' +
//          '                            selectedDeviceId = sourceSelect.value;' +
//          '                        }' +
//
//          '                        const sourceSelectPanel = document.getElementById(''sourceSelectPanel'');' +
//          '                        sourceSelectPanel.style.display = ''block'';' +
//          '                    }' +
//
//          '                    document.getElementById(''startButton'').addEventListener(''click'', () => {' +
//          '                        codeReader.decodeOnceFromVideoDevice(selectedDeviceId, ''video'').then((result) => {' +
//          '                            console.log(result);' +
//          '                            document.getElementById(''result'').textContent = result.text;' +
//          '                        }).catch((err) => {' +
//          '                            console.error(err);' +
//          '                            document.getElementById(''result'').textContent = err;' +
//          '                        })' +
//          '                        console.log(`Started continous decode from camera with id ${selectedDeviceId}`);' +
//          '                    })' +
//
//          '                    document.getElementById(''resetButton'').addEventListener(''click'', () => {' +
//          '                        document.getElementById(''result'').textContent = '''';' +
//          '                        codeReader.reset();' +
//          '                        console.log(''Reset.'');' +
//          '                    })' +
//
//          '                })' +
//          '                .catch((err) => {' +
//          '                    console.error(err);' +
//          '                })' +
//          //'        })' +
//          '    </script>' +

          '</body>' +

          '</html>' ;



//         '<audio id="player" height="0px" src="files\audio\beep.mp3" style="display:none"></audio>' +
//         '<div>' +
//         '  <video id="video" width="100%" height="100%" style="border: 1px solid gray"></video>' +
//         '</div>' +
//
//         '<div id="sourceSelectPanel" style="display:none">' +
//         '  <label for="sourceSelect">Change video source:</label>' +
//         '  <select id="sourceSelect" style="max-width:400px">' +
//         '  </select>' +
//         '</div>' ;

       mm.varC_TempFile := '';
       mm.varB_Yes      := false;
end;

initialization
  RegisterClass(TfrmBARCODE);

end.
