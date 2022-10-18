unit mkm_qrcode; // v. 4.0.0.0

interface

uses
    System.SysUtils, System.Classes , System.TypInfo, JSON, DBXJSON, DBXJSONReflect,  // v. 4.0.0.0
    System.DateUtils,
    // feedback: Mesut from Turkey
    {$ifdef MSWINDOWS}
    Winapi.Windows,
    {$endif}
    math, System.Rtti, System.StrUtils, Vcl.Graphics, Data.Db, pngimage, uniImage,
    UniGuiClasses, uniGUIApplication;

    function CRC16CCITT(texto: string): WORD;
    function PayLoadEstatico( pKey, pBenef, pCity: string; pValue : Currency; pHeight, pWidth : Integer ; pCodTransph: String = '' ): String;
    procedure rc_QRCode(pImg : TObject; pUrl: string; pForm:TObject = nil);
    procedure rc_QRCodePIX(pImg : TUniImage; pKey, pBenef, pCity: string; pValue : Currency; pHeight, pWidth : Integer);
implementation

uses uniGUIVars, MainModule, ServerModule, DelphiZXIngQRCode, mkm_layout, str_func;

procedure rc_QRCode(pImg : TObject; pUrl: string; pForm:TObject);

  procedure ResizeBitmap(Bitmap: TBitmap; const NewWidth, NewHeight: integer);
  var
    buffer: TBitmap;
  begin
    buffer := TBitmap.Create;
    try
      buffer.SetSize(NewWidth, NewHeight);
      buffer.Canvas.StretchDraw(Rect(0, 0, NewWidth, NewHeight), Bitmap);
      Bitmap.SetSize(NewWidth, NewHeight);
      Bitmap.Canvas.Draw(0, 0, buffer);
    finally
      buffer.Free;
    end;
  end;

var
  QRCodeBitmap: TBitmap;
  QRCode: TDelphiZXingQRCode;
  Row, Column: Integer;
  PNG: TPNGImage;
  pImgQrCode : TUniImage;
begin
  //if UniServerModule.ConfigINI.QRCodeSaveDir = '' then
  //  Exit;

  QRCodeBitmap := nil;
  QRCode := nil;
  PNG := nil;
  try
    QRCodeBitmap := TBitmap.Create;
    QRCode := TDelphiZXingQRCode.Create;
    QRCode.Data := pUrl;
    QRCodeBitmap.SetSize(QRCode.Rows, QRCode.Columns);
    for Row := 0 to QRCode.Rows - 1 do
    begin
      for Column := 0 to QRCode.Columns - 1 do
      begin
        if (QRCode.IsBlack[Row, Column]) then
        begin
          QRCodeBitmap.Canvas.Pixels[Column, Row] := clBlack;
        end else
        begin
          QRCodeBitmap.Canvas.Pixels[Column, Row] := clWhite;
        end;
      end;
    end;
    ResizeBitmap(QRCodeBitmap, QRCode.Rows*5, QRCode.Columns*5);
    PNG := TPNGImage.Create;
    PNG.Assign(QRCodeBitmap);
    //PNG.SaveToFile( '.\files\' +  LowerCase( ATicketId ) + '.png' ) ;
    if pImg.ClassName = 'TUniImage' then
       TUniImage(pImg).Picture.Bitmap.Assign( PNG )
    else
    begin
       pImgQrCode := TUniImage( rc_FindControl( 'rcQrCode_' + TUniControl(pImg).Name, pForm ) );
       if pImgQrCode <> nil then
          TUniImage( pImgQrCode ).Picture.Bitmap.Assign( PNG );
    end;
  finally
    QRCodeBitmap.Free;
    QRCode.Free;
    PNG.Free;
  end;
end;

procedure rc_QRCodePIX(pImg : TUniImage; pKey, pBenef, pCity: string; pValue : Currency; pHeight, pWidth : Integer);

  procedure ResizeBitmap(Bitmap: TBitmap; const NewWidth, NewHeight: integer);
  var
    buffer: TBitmap;
  begin
    buffer := TBitmap.Create;
    try
      buffer.SetSize(NewWidth, NewHeight);
      buffer.Canvas.StretchDraw(Rect(0, 0, NewWidth, NewHeight), Bitmap);
      Bitmap.SetSize(NewWidth, NewHeight);
      Bitmap.Canvas.Draw(0, 0, buffer);
    finally
      buffer.Free;
    end;
  end;

var
  QRCodeBitmap: TBitmap;
  QRCode: TDelphiZXingQRCode;
  Row, Column: Integer;
  PNG: TPNGImage;
begin
  //if UniServerModule.ConfigINI.QRCodeSaveDir = '' then
  //  Exit;

  QRCodeBitmap := nil;
  QRCode := nil;
  PNG := nil;
  try
    QRCodeBitmap := TBitmap.Create;
    QRCode := TDelphiZXingQRCode.Create;
    QRCode.Data := PayLoadEstatico( pKey, pBenef, pCity, pValue, pHeight, pWidth, '***' );
    QRCode.Encoding := TQRCodeEncoding(qrUTF8BOM);
    QRCode.QuietZone := 2;
    QRCodeBitmap.SetSize(QRCode.Rows, QRCode.Columns);
    for Row := 0 to QRCode.Rows - 1 do
    begin
      for Column := 0 to QRCode.Columns - 1 do
      begin
        if (QRCode.IsBlack[Row, Column]) then
        begin
          QRCodeBitmap.Canvas.Pixels[Column, Row] := clBlack;
        end else
        begin
          QRCodeBitmap.Canvas.Pixels[Column, Row] := clWhite;
        end;
      end;
    end;
    ResizeBitmap(QRCodeBitmap, QRCode.Rows*5, QRCode.Columns*5);
    PNG := TPNGImage.Create;
    PNG.Assign(QRCodeBitmap);
    //PNG.SaveToFile( '.\files\' +  LowerCase( ATicketId ) + '.png' ) ;
    pImg.Picture.Bitmap.Assign( PNG );
  finally
    QRCodeBitmap.Free;
    QRCode.Free;
    PNG.Free;
  end;
end;

function CRC16CCITT(texto: string): WORD;
const
  polynomial = $1021;
var
  crc: WORD;
  i, j: Integer;
  b: Byte;
  bit, c15: Boolean;
begin
  crc := $FFFF;
  for i := 1 to length(texto) do
  begin
    b := Byte(texto[i]);
    for j := 0 to 7 do
    begin
      bit := (((b shr (7 - j)) and 1) = 1);
      c15 := (((crc shr 15) and 1) = 1);
      crc := crc shl 1;
      if (c15 xor bit) then
        crc := crc xor polynomial;
    end;
  end;
 Result := crc and $FFFF;
end;

function PayLoadEstatico(pKey, pBenef, pCity: string; pValue : Currency; pHeight, pWidth : Integer; pCodTransph : string ): String;
const
  Payload_Format_Indicator: String = '000201';
  Merchant_Account_Information: String = '26';
  Merchant_Category_Code :  String = '52040000';
  Transaction_Currency  : String = '530398654';
  Country_Code : String = '5802BR';
  Merchant_Name : String = '59';
  Merchant_City : String = '60';
  Additional_Data_Field_Template : String = '62';
  CRC162 : String = '6304';
Var
 CODPayLoad,Merchant_Account_Information_String,Valor_Total,txid,CRC: String;
begin
  Merchant_Account_Information_String := '0014BR.GOV.BCB.PIX01' + Length( pKey ).ToString + pKey;
  Valor_Total := FormatFloat( '#####0.00;00.00' , pValue);
  Valor_Total := StringReplace( Valor_Total , ',' , '.' , [] );
  txid        := '05' + FormatFloat( '00' , LengTh( pCodTransph)) + pCodTransph;
  CODPayLoad  := Payload_Format_Indicator +
                 Merchant_Account_Information + Length( Merchant_Account_Information_String).ToString +
                 Merchant_Account_Information_String + Merchant_Category_Code + Transaction_Currency +
                 FormatFloat( '00' , Length(Valor_Total)) + Valor_Total + Country_Code + Merchant_Name +
                 FormatFloat( '00' , LengTh(pBenef)) + pBenef + Merchant_City + FormatFloat( '00' , Length(pCity)) +
                 pCity + Additional_Data_Field_Template + FormatFloat( '00' , LengTh(txid)) + txid + '6304';
  CRC := inttohex( CRC16CCITT( CODPayLoad ) , 4);
  result := CODPayLoad + CRC;
  //ShowMessageN( result );
end;

end.
