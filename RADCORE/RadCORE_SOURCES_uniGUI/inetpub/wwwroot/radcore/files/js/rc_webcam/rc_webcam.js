//Ultima atualização - 29/10/2020 - 14:39 - Sincronização da versão WideView e PostoServ
var video;
var snapshotCanvas;
var videoTracks;		
var currentStream;
var canvasElement = document.getElementById("canvas");
var canvas = canvasElement.getContext("2d");
var loadingMessage = document.getElementById("loadingMessage");
var outputContainer = document.getElementById("output");
var outputMessage = document.getElementById("outputMessage");
var outputData = document.getElementById("outputData");


function rc_cameraOff() {
    console.log( "function...camera: OFF.." );
    currentStream.getTracks().forEach(track => {
        track.stop();
        });  
    //  videoTracks.stop();			 
};

function rc_cameraOn(CamFrontRear){
     console.log( "function...camera: ON.." );
     video = document.getElementById("player");
     video.videoWidth = 320;
     video.videoHeight = 240;
     snapshotCanvas = document.getElementById( "snapshot" );

     // v. 3.4.1.0
     var vw = video.videoWidth;
     var vh = video.videoHeight;
     //document.getElementById("resolution").innerHTML = ("Width x Height: " + vw + " x " + vh);
     snapshotCanvas.width = vw;// 320;//vw;
     snapshotCanvas.height = vh;//240;//vh;

     const supports = navigator.mediaDevices.getSupportedConstraints();
     if (!supports['facingMode']) {
         console.log('This browser does not support facingMode!');
         alert('This browser does not support facingMode!');
        }
     else {	
       console.log( "facingMode = "+CamFrontRear);
     };			 
     
    if(navigator.mediaDevices && navigator.mediaDevices.getUserMedia) {				
        navigator.mediaDevices.getUserMedia({video: {facingMode: CamFrontRear }}).then(function(stream) {	
            currentStream = stream;
           video.srcObject = stream;
             video.setAttribute("playsinline", true); // Adicionado em 04/05/2021 - required to tell iOS safari we don't want fullscreen
            videoTracks = stream.getTracks()[0];                    					
            //Alert("video.play() 1");										
            video.play();
            requestAnimationFrame(CapturaQRCode);
            console.log( "video.play() 1");
        });
    } // Até onde testei esses ELSES abaixo não estavam sendo usados - 25/10/2020 - Fábio.
    else if(navigator.getUserMedia) { // Standard			    
         navigator.getUserMedia({video: {facingMode: CamFrontRear }}, function(stream) {
              currentStream = stream;
            video.src = stream;
            videoTracks = stream.getTracks()[0];					                   					
            //Alert("video.play() Standard code");
              video.play();
            requestAnimationFrame(CapturaQRCode);
            console.log( "video.play() Standard code");
         }, errBack);
    } else if(navigator.webkitGetUserMedia) { // WebKit-prefixed
           console.log( "video.play() WebKit-prefixed");					 
           navigator.webkitGetUserMedia({video: {facingMode: CamFrontRear }}, function(stream){
                 currentStream = stream;
              video.src = window.webkitURL.createObjectURL(stream);
              videoTracks = stream.getTracks()[0];					                      
                 //Alert("video.play() WebKit-prefixed");
              video.play();
              requestAnimationFrame(CapturaQRCode);
            }, errBack);
    } else if(navigator.mozGetUserMedia) { // Mozilla-prefixed			       				
            navigator.mozGetUserMedia({video: {facingMode: CamFrontRear }}, function(stream){
               currentStream = stream;
              video.srcObject = stream;
              video.setAttribute("playsinline", true); // Adicionado em 04/05/2021 - required to tell iOS safari we don't want fullscreen
              videoTracks = stream.getTracks()[0];					                      
                 //Alert("video.play() Mozilla-prefixed");
              video.play();
              requestAnimationFrame(CapturaQRCode);
               console.log( "video.play() Mozilla-prefixed");	
            }, errBack);
    }

};

function rc_cameraSnapshot(){
    console.log( "rc_cameraSnapshot...camera: frmWEBCAM..3.4.1.0" );
    // v. 3.4.1.0
    snapshotCanvas = document.getElementById( "snapshot" );
    // v. 3.4.1.0
    var vw = video.videoWidth;
    var vh = video.videoHeight;
    //document.getElementById("resolution").innerHTML = ("Width x Height: " + vw + " x " + vh);
    snapshotCanvas.width = vw;
    snapshotCanvas.height = vh;

    var context = snapshot.getContext( "2d" );
    
    // Draw the video frame to the canvas.
    context.drawImage(video, 0, 0, snapshotCanvas.width, snapshotCanvas.height);
    //context.drawImage(video, 0, 0, video.videoWidth, video.videoHeight);
    console.log( "video w:" + vw );
    console.log( "video h:" + vh );
    console.log( "canvas w:" + snapshotCanvas.width );
    console.log( "canvas h:" + snapshotCanvas.height );
    console.log( "Draw the video frame to the canvas.." );
        
    //var d = document.getElementById( "snapshot" ).toDataURL( "image/png" );
    var d = document.getElementById( "snapshot" ).toDataURL( "image/jpeg" );

    d = d.slice(d.indexOf( "," )+1);
    
    // Send image to Delphi...
    //ajaxRequest( frmCapCam.htmlWebCam, "saveimg", ["img=" + d ]);  
    console.log( "before ajax..htmlWEBCAM" );
    ajaxRequest( frmWEBCAM.htmlWEBCAM, "saveimg", ["img=" + d ]);  
    console.log( "after ajax.." );    
};

document.getElementById( "btnOn" ).addEventListener( "click", function() {
    console.log( "camera: ON.." );
    rc_cameraOn();
});

document.getElementById( "btnOff" ).addEventListener( "click", function() {
    console.log( "camera: OFF.." );
    rc_cameraOff();
});

document.getElementById( "btnCapture" ).addEventListener( "click", function() {
    console.log( "camera: taked !!!" );
    rc_cameraSnapshot();
});

document.getElementById( "btnQRCode" ).addEventListener( "click", function() {
    //console.log( "QRCode Ativado !!!" );
    CapturaQRCode();
});
 

function drawLine(begin, end, color) {
canvas.beginPath();
canvas.moveTo(begin.x, begin.y);
canvas.lineTo(end.x, end.y);
canvas.lineWidth = 4;
canvas.strokeStyle = color;
canvas.stroke();
}

function CapturaQRCode() {
loadingMessage.innerText = "⌛ Loading video..."
if (video.readyState === video.HAVE_ENOUGH_DATA) {
loadingMessage.hidden = true;
canvasElement.hidden = false;
outputContainer.hidden = false;

canvasElement.height = video.videoHeight;
canvasElement.width = video.videoWidth;
canvas.drawImage(video, 0, 0, canvasElement.width, canvasElement.height);
var imageData = canvas.getImageData(0, 0, canvasElement.width, canvasElement.height);
var code = jsQR(imageData.data, imageData.width, imageData.height, {
  inversionAttempts: "dontInvert",
});
if (code) {
  drawLine(code.location.topLeftCorner, code.location.topRightCorner, "#FF3B58");
  drawLine(code.location.topRightCorner, code.location.bottomRightCorner, "#FF3B58");
  drawLine(code.location.bottomRightCorner, code.location.bottomLeftCorner, "#FF3B58");
  drawLine(code.location.bottomLeftCorner, code.location.topLeftCorner, "#FF3B58");
  outputMessage.hidden = true;
  outputData.parentElement.hidden = false;
  outputData.innerText = code.data;
  ajaxRequest(frmWEBCAM.htmlWEBCAM, "qrcodedata",["CODE="+outputData.innerText]);  
  beep();
} else {
  outputMessage.hidden = false;
  outputData.parentElement.hidden = true;
}
}
requestAnimationFrame(CapturaQRCode);
}