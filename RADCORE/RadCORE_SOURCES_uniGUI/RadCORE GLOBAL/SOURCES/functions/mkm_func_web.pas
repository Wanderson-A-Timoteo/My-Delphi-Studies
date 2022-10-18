unit mkm_func_web; // v. 4.0.0.0

interface

uses
    System.SysUtils, System.Classes , System.TypInfo, JSON, DBXJSON, DBXJSONReflect,
    System.DateUtils,
    // feedback: Mesut from Turkey
    {$ifdef MSWINDOWS}
    Winapi.Windows,
    {$endif}
    jpeg, pngimage, // v. 4.0.0.0
    math, System.Rtti, System.StrUtils, Vcl.Graphics, Data.Db, uconsts, uniComboBox, // v. 4.0.0.0
    UniGuiClasses;

function rc_StrCaptalize( pStr : string ) : string;
function CloneComponent(aValue: TObject): TObject;
function FindAnyClass(const Name: string): TClass;
// webbroker uses GMT
function OffsetFromUTC: TDateTime;
function varIIF( aTest: Boolean; TrueValue, FalseValue : Variant): Variant;
//criptografia pelo codiuser
function Crypto(Action, Src, Key : WideString ): WideString;
Function Crypta(S , key2 :String):String;
Function DeCrypta(S, key2 :String):String;
{ Retorna o texto dentro de 2 tags (open & close Tag's) }
function GetTagContent(aText, OpenTag, CloseTag : String) : String;
function SetTagContent(aText, aTextReplace, OpenTag, CloseTag : String) : String;
function GetTagParams(S : String ): TStringList; // entrada de dados //para função “S” recebe string, “separador” recebe caracter de separação da string.
Function LoadHTMLFile(FileName : String) : String;
Function FormatDelphiDate(Value : String) : String;
//remover '.', '-', '_'
Function StrTokenClear( pText : String) : String;
Function StrTokenClearSql( pText : String;pRemoveAccents:boolean = false) : String; // v. 3.2.0.1
function StrPageName( pText : string ) : string;
function ReturnNumbers(pText:string):string;
function ReturnLetters(pText:string):string;
function RemoveInvalidChar( InputText: string): string;
function RemoveLineBreaks( InputText: string): string;
function FixDecimals( Value: Extended; Decimals: Integer): Extended;
function rc_HtmlToColor(s:string;aDefault:Tcolor = clBlack ):TColor; // v. 3.3.3.1
function GetWebColor( pColor: string ): string;
function ColorToHtml(Clr: TColor): string;
function strTokenCount(S: string; Seperator: Char): Integer;
function strToken(var S: string; Seperator: Char): string;
function DataTypeIsNumber( pDtype : TFieldType ) : Boolean;
function DataTypeIsString( pDtype : TFieldType ) : Boolean;
function DataTypeIsDateTime( pDtype : TFieldType ) : Boolean;
function DataTypeStrIsNumber( pDtype : string ) : Boolean;
function DataTypeStrIsString( pDtype : string ) : Boolean;
function DataTypeStrIsDateTime( pDtype : string ) : Boolean;
// v. 3.3.1.0
function DataTypeIsFloat( pDtype : TFieldType ) : Boolean;
function DataTypeIsInt( pDtype : TFieldType ) : Boolean;
function DataTypeStrIsFloat( pDtype : string ) : Boolean;
function DataTypeStrIsInt( pDtype : string ) : Boolean;
// v. 3.3.3.2
function rc_NumberExtension (valor: real; pLang : TRCLanguagesType = ltpt_BR; pCurr_Name : string =  'Real'; pCurr_NamePlural : string = 'Reais'; pCurr_Symbol : string = 'R$' ): string;
// v. 4.0.0.0
procedure rc_ConvertPNGToJPG(const Source, Dest: String; Quality : integer = 70 );
procedure rc_ComboBoxGetFiles( pCbx : TUniCombobox; pFolder : string; pFiletypes : string = '*.*' );

implementation

uses str_func;

// v. 4.0.0.0
procedure rc_ComboBoxGetFiles( pCbx : TUniCombobox; pFolder : string; pFiletypes : string );
var
   i, iIndex : integer;
   cText  : string;
   cTemp, cType : string;
   vSR: TSearchRec;
begin
    cText := TUniComboBox( pCbx ).Text;
    cTemp := pFolder;
    if Copy( pFiletypes, Length( pFiletypes ), 1 ) <> ';' then
       pFiletypes := pFiletypes + ';';

    TUniComboBox( pCbx ).Items.Clear;
    TUniComboBox( pCbx ).ItemIndex := -1;

    while Pos( ';', pFiletypes ) > 0 do
    begin
       cType := Copy( pFiletypes, 1 , Pos( ';', pFiletypes ) );
       pFiletypes := stringreplace( pFiletypes, cType, '', [rfReplaceAll] );
       cType := Copy( cType, 1, length( cType ) - 1 );
       I := FindFirst( cTemp + BACKSLASH + cType , faAnyFile, vSR );
       while ( I = 0 ) do
       begin
         TUniComboBox( pCbx ).Items.Add( vSR.Name );
         I := FindNext( vSR );
       end;
       System.SysUtils.FindClose(vSR);
    end;

    TUniComboBox( pCbx ).ItemIndex := 0;
end;
// v. 4.0.0.0
procedure rc_ConvertPNGToJPG(const Source, Dest: String; Quality : integer);
var
   png : TPNGImage;
   bmp : TBitmap;
   jpg : TJPEGImage;
begin
   png := TPNGImage.Create;
   bmp := TBitmap.Create;
   jpg := TJPEGImage.Create;
   jpg.CompressionQuality := Quality;
   try
     png.LoadFromFile (Source);

     bmp.Width  := png.Width;
     bmp.Height := png.Height;
     // you can set any special handling here...
     png.Draw (bmp.Canvas, bmp.Canvas.ClipRect);

     jpg.Assign (bmp);
     jpg.SaveToFile (Dest);
   finally
     png.Free;
     bmp.Free;
     jpg.Free;
   end;
end;
// v. 3.3.3.2
function rc_NumberExtension (valor: real; pLang : TRCLanguagesType = ltpt_BR; pCurr_Name : string =  'Real'; pCurr_NamePlural : string = 'Reais'; pCurr_Symbol : string = 'R$' ): string;
var
  Centavos, Centena, Milhar, Milhao, Texto, msg: string;
  cCents, cCentsPlural, cThousand : string;
//const
//  Unidades: array[1..9] of string = ('Um', 'Dois', 'Tres', 'Quatro', 'Cinco', 'Seis', 'Sete', 'Oito', 'Nove');
//  Dez: array[1..9] of string = ('Onze', 'Doze', 'Treze', 'Quatorze', 'Quinze', 'Dezesseis', 'Dezessete', 'Dezoito', 'Dezenove');
//  Dezenas: array[1..9] of string = ('Dez', 'Vinte', 'Trinta', 'Quarenta', 'Cinquenta', 'Sessenta', 'Setenta', 'Oitenta', 'Noventa');
//  Centenas: array[1..9] of string = ('Cento', 'Duzentos', 'Trezentos', 'Quatrocentos', 'Quinhentos', 'Seiscentos', 'Setecentos', 'Oitocentos', 'Novecentos');
  Unidades: array[1..9] of string ;
  Dez: array[1..9] of string;
  Dezenas: array[1..9] of string;
  Centenas: array[1..9] of string;

  function ifs(Expressao: Boolean; CasoVerdadeiro, CasoFalso: String): String;
  begin
    if Expressao
    then Result:=CasoVerdadeiro
    else Result:=CasoFalso;
  end;

  function MiniExtenso (trio: string): string;
  var
     Unidade, Dezena, Centena: string;
  begin
    case pLang of
         ltpt_BR : begin
                     cCents      := 'Centavo';
                     cCentsPlural:= 'Centavos';
                     cThousand   := 'Mil';
                     Unidades[1] := 'Um';
                     Unidades[2] := 'Dois';
                     Unidades[3] := 'Tres';
                     Unidades[4] := 'Quatro';
                     Unidades[5] := 'Cinco';
                     Unidades[6] := 'Seis';
                     Unidades[7] := 'Sete';
                     Unidades[8] := 'Oito';
                     Unidades[9] := 'Nove';

                     Dez[1]      := 'Onze';
                     Dez[2]      := 'Doze';
                     Dez[3]      := 'Treze';
                     Dez[4]      := 'Quatorze';
                     Dez[5]      := 'Quinze';
                     Dez[6]      := 'Dezesseis';
                     Dez[7]      := 'Dezessete';
                     Dez[8]      := 'Dezoito';
                     Dez[9]      := 'Dezenove';

                     Dezenas[1]  := 'Dez';
                     Dezenas[2]  := 'Vinte';
                     Dezenas[3]  := 'Trinta';
                     Dezenas[4]  := 'Quarenta';
                     Dezenas[5]  := 'Cinquenta';
                     Dezenas[6]  := 'Sessenta';
                     Dezenas[7]  := 'Setenta';
                     Dezenas[8]  := 'Oitenta';
                     Dezenas[9]  := 'Noventa';

                     Centenas[1] := 'Cento';
                     Centenas[2] := 'Duzentos';
                     Centenas[3] := 'Trezentos';
                     Centenas[4] := 'Quatrocentos';
                     Centenas[5] := 'Quinhentos';
                     Centenas[6] := 'Seiscentos';
                     Centenas[7] := 'Setecentos';
                     Centenas[8] := 'Oitocentos';
                     Centenas[9] := 'Novecentos';
                   end;
          lten_US,
          lten_GB : begin
                       if pLang = lten_GB then
                          cCents      := 'Penny'
                       else
                          cCents      := 'Cent';
                       cCentsPlural:= 'Cents';
                       cThousand   := 'Thousand';
                       Unidades[1] := 'One';
                       Unidades[2] := 'Two';
                       Unidades[3] := 'Three';
                       Unidades[4] := 'Four';
                       Unidades[5] := 'Five';
                       Unidades[6] := 'Six';
                       Unidades[7] := 'Seven';
                       Unidades[8] := 'Eight';
                       Unidades[9] := 'Nine';

                       Dez[1] := 'Eleven';
                       Dez[2] := 'Twelve';
                       Dez[3] := 'Thirteen';
                       Dez[4] := 'Fourteen';
                       Dez[5] := 'Fifteen';
                       Dez[6] := 'Sixteen';
                       Dez[7] := 'Seventeen';
                       Dez[8] := 'Eighteen';
                       Dez[9] := 'Nineteen';

                       Dezenas[1] := 'Ten';
                       Dezenas[2] := 'Twenty';
                       Dezenas[3] := 'Thirty';
                       Dezenas[4] := 'Forty';
                       Dezenas[5] := 'Fifty';
                       Dezenas[6] := 'Sixty';
                       Dezenas[7] := 'Seventy';
                       Dezenas[8] := 'Eighty';
                       Dezenas[9] := 'Ninety';

                       Centenas[1] := 'Hundred';
                       Centenas[2] := 'Two hundred';
                       Centenas[3] := 'Three hundred';
                       Centenas[4] := 'Four hundred';
                       Centenas[5] := 'Five hundred';
                       Centenas[6] := 'Six hundred';
                       Centenas[7] := 'Seven hundred';
                       Centenas[8] := 'Eight hundred';
                       Centenas[9] := 'Nine hundred';
                    end;
          ltes_ES : begin
                       cCents      := 'Centavo';
                       cCentsPlural:= 'Centavos';
                       cThousand   := 'Mil';
                       Unidades[1] := 'One';
                       Unidades[2] := 'Two';
                       Unidades[3] := 'Three';
                       Unidades[4] := 'Four';
                       Unidades[5] := 'Five';
                       Unidades[6] := 'Six';
                       Unidades[7] := 'Seven';
                       Unidades[8] := 'Eight';
                       Unidades[9] := 'Nine';

                       Dez[1] := 'Eleven';
                       Dez[2] := 'Twelve';
                       Dez[3] := 'Thirteen';
                       Dez[4] := 'Fourteen';
                       Dez[5] := 'Fifteen';
                       Dez[6] := 'Sixteen';
                       Dez[7] := 'Seventeen';
                       Dez[8] := 'Eighteen';
                       Dez[9] := 'Nineteen';

                       Dezenas[1] := 'Ten';
                       Dezenas[2] := 'Twenty';
                       Dezenas[3] := 'Thirty';
                       Dezenas[4] := 'Forty';
                       Dezenas[5] := 'Fifty';
                       Dezenas[6] := 'Sixty';
                       Dezenas[7] := 'Seventy';
                       Dezenas[8] := 'Eighty';
                       Dezenas[9] := 'Ninety';

                       Centenas[1] := 'Hundred';
                       Centenas[2] := 'Two hundred';
                       Centenas[3] := 'Three hundred';
                       Centenas[4] := 'Four hundred';
                       Centenas[5] := 'Five hundred';
                       Centenas[6] := 'Six hundred';
                       Centenas[7] := 'Seven hundred';
                       Centenas[8] := 'Eight hundred';
                       Centenas[9] := 'Nine hundred';
                    end;
          ltfr_FR : begin
                       cCents      := 'Penny';
                       cCentsPlural:= 'Centimes';
                       cThousand   := 'Mille';
                       Unidades[1] := 'One';
                       Unidades[2] := 'Two';
                       Unidades[3] := 'Three';
                       Unidades[4] := 'Four';
                       Unidades[5] := 'Five';
                       Unidades[6] := 'Six';
                       Unidades[7] := 'Seven';
                       Unidades[8] := 'Eight';
                       Unidades[9] := 'Nine';

                       Dez[1] := 'Eleven';
                       Dez[2] := 'Twelve';
                       Dez[3] := 'Thirteen';
                       Dez[4] := 'Fourteen';
                       Dez[5] := 'Fifteen';
                       Dez[6] := 'Sixteen';
                       Dez[7] := 'Seventeen';
                       Dez[8] := 'Eighteen';
                       Dez[9] := 'Nineteen';

                       Dezenas[1] := 'Ten';
                       Dezenas[2] := 'Twenty';
                       Dezenas[3] := 'Thirty';
                       Dezenas[4] := 'Forty';
                       Dezenas[5] := 'Fifty';
                       Dezenas[6] := 'Sixty';
                       Dezenas[7] := 'Seventy';
                       Dezenas[8] := 'Eighty';
                       Dezenas[9] := 'Ninety';

                       Centenas[1] := 'Hundred';
                       Centenas[2] := 'Two hundred';
                       Centenas[3] := 'Three hundred';
                       Centenas[4] := 'Four hundred';
                       Centenas[5] := 'Five hundred';
                       Centenas[6] := 'Six hundred';
                       Centenas[7] := 'Seven hundred';
                       Centenas[8] := 'Eight hundred';
                       Centenas[9] := 'Nine hundred';
                    end;
          ltde_DE : begin
                       cCents      := 'Penny';
                       cCentsPlural:= 'Cent';
                       cThousand   := 'Tausend';
                       Unidades[1] := 'One';
                       Unidades[2] := 'Two';
                       Unidades[3] := 'Three';
                       Unidades[4] := 'Four';
                       Unidades[5] := 'Five';
                       Unidades[6] := 'Six';
                       Unidades[7] := 'Seven';
                       Unidades[8] := 'Eight';
                       Unidades[9] := 'Nine';

                       Dez[1] := 'Eleven';
                       Dez[2] := 'Twelve';
                       Dez[3] := 'Thirteen';
                       Dez[4] := 'Fourteen';
                       Dez[5] := 'Fifteen';
                       Dez[6] := 'Sixteen';
                       Dez[7] := 'Seventeen';
                       Dez[8] := 'Eighteen';
                       Dez[9] := 'Nineteen';

                       Dezenas[1] := 'Ten';
                       Dezenas[2] := 'Twenty';
                       Dezenas[3] := 'Thirty';
                       Dezenas[4] := 'Forty';
                       Dezenas[5] := 'Fifty';
                       Dezenas[6] := 'Sixty';
                       Dezenas[7] := 'Seventy';
                       Dezenas[8] := 'Eighty';
                       Dezenas[9] := 'Ninety';

                       Centenas[1] := 'Hundred';
                       Centenas[2] := 'Two hundred';
                       Centenas[3] := 'Three hundred';
                       Centenas[4] := 'Four hundred';
                       Centenas[5] := 'Five hundred';
                       Centenas[6] := 'Six hundred';
                       Centenas[7] := 'Seven hundred';
                       Centenas[8] := 'Eight hundred';
                       Centenas[9] := 'Nine hundred';
                    end;
          ltit_IT : begin
                       cCents      := 'Centesimo';
                       cCentsPlural:= 'Centesimi';
                       cThousand   := 'Mille';
                       Unidades[1] := 'One';
                       Unidades[2] := 'Two';
                       Unidades[3] := 'Three';
                       Unidades[4] := 'Four';
                       Unidades[5] := 'Five';
                       Unidades[6] := 'Six';
                       Unidades[7] := 'Seven';
                       Unidades[8] := 'Eight';
                       Unidades[9] := 'Nine';

                       Dez[1] := 'Eleven';
                       Dez[2] := 'Twelve';
                       Dez[3] := 'Thirteen';
                       Dez[4] := 'Fourteen';
                       Dez[5] := 'Fifteen';
                       Dez[6] := 'Sixteen';
                       Dez[7] := 'Seventeen';
                       Dez[8] := 'Eighteen';
                       Dez[9] := 'Nineteen';

                       Dezenas[1] := 'Ten';
                       Dezenas[2] := 'Twenty';
                       Dezenas[3] := 'Thirty';
                       Dezenas[4] := 'Forty';
                       Dezenas[5] := 'Fifty';
                       Dezenas[6] := 'Sixty';
                       Dezenas[7] := 'Seventy';
                       Dezenas[8] := 'Eighty';
                       Dezenas[9] := 'Ninety';

                       Centenas[1] := 'Hundred';
                       Centenas[2] := 'Two hundred';
                       Centenas[3] := 'Three hundred';
                       Centenas[4] := 'Four hundred';
                       Centenas[5] := 'Five hundred';
                       Centenas[6] := 'Six hundred';
                       Centenas[7] := 'Seven hundred';
                       Centenas[8] := 'Eight hundred';
                       Centenas[9] := 'Nine hundred';
                    end;
          lttr_TR : begin
                       cCents      := 'Penny';
                       cCentsPlural:= 'Cents';
                       cThousand   := 'Thousand';
                       Unidades[1] := 'One';
                       Unidades[2] := 'Two';
                       Unidades[3] := 'Three';
                       Unidades[4] := 'Four';
                       Unidades[5] := 'Five';
                       Unidades[6] := 'Six';
                       Unidades[7] := 'Seven';
                       Unidades[8] := 'Eight';
                       Unidades[9] := 'Nine';

                       Dez[1] := 'Eleven';
                       Dez[2] := 'Twelve';
                       Dez[3] := 'Thirteen';
                       Dez[4] := 'Fourteen';
                       Dez[5] := 'Fifteen';
                       Dez[6] := 'Sixteen';
                       Dez[7] := 'Seventeen';
                       Dez[8] := 'Eighteen';
                       Dez[9] := 'Nineteen';

                       Dezenas[1] := 'Ten';
                       Dezenas[2] := 'Twenty';
                       Dezenas[3] := 'Thirty';
                       Dezenas[4] := 'Forty';
                       Dezenas[5] := 'Fifty';
                       Dezenas[6] := 'Sixty';
                       Dezenas[7] := 'Seventy';
                       Dezenas[8] := 'Eighty';
                       Dezenas[9] := 'Ninety';

                       Centenas[1] := 'Hundred';
                       Centenas[2] := 'Two hundred';
                       Centenas[3] := 'Three hundred';
                       Centenas[4] := 'Four hundred';
                       Centenas[5] := 'Five hundred';
                       Centenas[6] := 'Six hundred';
                       Centenas[7] := 'Seven hundred';
                       Centenas[8] := 'Eight hundred';
                       Centenas[9] := 'Nine hundred';
                    end;
          ltru_RU : begin
                       cCents      := 'Penny';
                       cCentsPlural:= 'Cents';
                       cThousand   := 'Thousand';
                       Unidades[1] := 'One';
                       Unidades[2] := 'Two';
                       Unidades[3] := 'Three';
                       Unidades[4] := 'Four';
                       Unidades[5] := 'Five';
                       Unidades[6] := 'Six';
                       Unidades[7] := 'Seven';
                       Unidades[8] := 'Eight';
                       Unidades[9] := 'Nine';

                       Dez[1] := 'Eleven';
                       Dez[2] := 'Twelve';
                       Dez[3] := 'Thirteen';
                       Dez[4] := 'Fourteen';
                       Dez[5] := 'Fifteen';
                       Dez[6] := 'Sixteen';
                       Dez[7] := 'Seventeen';
                       Dez[8] := 'Eighteen';
                       Dez[9] := 'Nineteen';

                       Dezenas[1] := 'Ten';
                       Dezenas[2] := 'Twenty';
                       Dezenas[3] := 'Thirty';
                       Dezenas[4] := 'Forty';
                       Dezenas[5] := 'Fifty';
                       Dezenas[6] := 'Sixty';
                       Dezenas[7] := 'Seventy';
                       Dezenas[8] := 'Eighty';
                       Dezenas[9] := 'Ninety';

                       Centenas[1] := 'Hundred';
                       Centenas[2] := 'Two hundred';
                       Centenas[3] := 'Three hundred';
                       Centenas[4] := 'Four hundred';
                       Centenas[5] := 'Five hundred';
                       Centenas[6] := 'Six hundred';
                       Centenas[7] := 'Seven hundred';
                       Centenas[8] := 'Eight hundred';
                       Centenas[9] := 'Nine hundred';
                    end;
          ltzn_CH : begin
                       cCents      := 'Penny';
                       cCentsPlural:= 'Cents';
                       cThousand   := 'Thousand';
                       Unidades[1] := 'One';
                       Unidades[2] := 'Two';
                       Unidades[3] := 'Three';
                       Unidades[4] := 'Four';
                       Unidades[5] := 'Five';
                       Unidades[6] := 'Six';
                       Unidades[7] := 'Seven';
                       Unidades[8] := 'Eight';
                       Unidades[9] := 'Nine';

                       Dez[1] := 'Eleven';
                       Dez[2] := 'Twelve';
                       Dez[3] := 'Thirteen';
                       Dez[4] := 'Fourteen';
                       Dez[5] := 'Fifteen';
                       Dez[6] := 'Sixteen';
                       Dez[7] := 'Seventeen';
                       Dez[8] := 'Eighteen';
                       Dez[9] := 'Nineteen';

                       Dezenas[1] := 'Ten';
                       Dezenas[2] := 'Twenty';
                       Dezenas[3] := 'Thirty';
                       Dezenas[4] := 'Forty';
                       Dezenas[5] := 'Fifty';
                       Dezenas[6] := 'Sixty';
                       Dezenas[7] := 'Seventy';
                       Dezenas[8] := 'Eighty';
                       Dezenas[9] := 'Ninety';

                       Centenas[1] := 'Hundred';
                       Centenas[2] := 'Two hundred';
                       Centenas[3] := 'Three hundred';
                       Centenas[4] := 'Four hundred';
                       Centenas[5] := 'Five hundred';
                       Centenas[6] := 'Six hundred';
                       Centenas[7] := 'Seven hundred';
                       Centenas[8] := 'Eight hundred';
                       Centenas[9] := 'Nine hundred';
                    end;
          ltin_ID : begin
                       cCents      := 'Penny';
                       cCentsPlural:= 'Cents';
                       cThousand   := 'Thousand';
                       Unidades[1] := 'One';
                       Unidades[2] := 'Two';
                       Unidades[3] := 'Three';
                       Unidades[4] := 'Four';
                       Unidades[5] := 'Five';
                       Unidades[6] := 'Six';
                       Unidades[7] := 'Seven';
                       Unidades[8] := 'Eight';
                       Unidades[9] := 'Nine';

                       Dez[1] := 'Eleven';
                       Dez[2] := 'Twelve';
                       Dez[3] := 'Thirteen';
                       Dez[4] := 'Fourteen';
                       Dez[5] := 'Fifteen';
                       Dez[6] := 'Sixteen';
                       Dez[7] := 'Seventeen';
                       Dez[8] := 'Eighteen';
                       Dez[9] := 'Nineteen';

                       Dezenas[1] := 'Ten';
                       Dezenas[2] := 'Twenty';
                       Dezenas[3] := 'Thirty';
                       Dezenas[4] := 'Forty';
                       Dezenas[5] := 'Fifty';
                       Dezenas[6] := 'Sixty';
                       Dezenas[7] := 'Seventy';
                       Dezenas[8] := 'Eighty';
                       Dezenas[9] := 'Ninety';

                       Centenas[1] := 'Hundred';
                       Centenas[2] := 'Two hundred';
                       Centenas[3] := 'Three hundred';
                       Centenas[4] := 'Four hundred';
                       Centenas[5] := 'Five hundred';
                       Centenas[6] := 'Six hundred';
                       Centenas[7] := 'Seven hundred';
                       Centenas[8] := 'Eight hundred';
                       Centenas[9] := 'Nine hundred';
                    end;
          ltth_TH : begin
                       cCents      := 'Penny';
                       cCentsPlural:= 'Cents';
                       cThousand   := 'Thousand';
                       Unidades[1] := 'One';
                       Unidades[2] := 'Two';
                       Unidades[3] := 'Three';
                       Unidades[4] := 'Four';
                       Unidades[5] := 'Five';
                       Unidades[6] := 'Six';
                       Unidades[7] := 'Seven';
                       Unidades[8] := 'Eight';
                       Unidades[9] := 'Nine';

                       Dez[1] := 'Eleven';
                       Dez[2] := 'Twelve';
                       Dez[3] := 'Thirteen';
                       Dez[4] := 'Fourteen';
                       Dez[5] := 'Fifteen';
                       Dez[6] := 'Sixteen';
                       Dez[7] := 'Seventeen';
                       Dez[8] := 'Eighteen';
                       Dez[9] := 'Nineteen';

                       Dezenas[1] := 'Ten';
                       Dezenas[2] := 'Twenty';
                       Dezenas[3] := 'Thirty';
                       Dezenas[4] := 'Forty';
                       Dezenas[5] := 'Fifty';
                       Dezenas[6] := 'Sixty';
                       Dezenas[7] := 'Seventy';
                       Dezenas[8] := 'Eighty';
                       Dezenas[9] := 'Ninety';

                       Centenas[1] := 'Hundred';
                       Centenas[2] := 'Two hundred';
                       Centenas[3] := 'Three hundred';
                       Centenas[4] := 'Four hundred';
                       Centenas[5] := 'Five hundred';
                       Centenas[6] := 'Six hundred';
                       Centenas[7] := 'Seven hundred';
                       Centenas[8] := 'Eight hundred';
                       Centenas[9] := 'Nine hundred';
                    end;
          lthi_IN : begin
                       cCents      := 'Penny';
                       cCentsPlural:= 'Cents';
                       cThousand   := 'Thousand';
                       Unidades[1] := 'One';
                       Unidades[2] := 'Two';
                       Unidades[3] := 'Three';
                       Unidades[4] := 'Four';
                       Unidades[5] := 'Five';
                       Unidades[6] := 'Six';
                       Unidades[7] := 'Seven';
                       Unidades[8] := 'Eight';
                       Unidades[9] := 'Nine';

                       Dez[1] := 'Eleven';
                       Dez[2] := 'Twelve';
                       Dez[3] := 'Thirteen';
                       Dez[4] := 'Fourteen';
                       Dez[5] := 'Fifteen';
                       Dez[6] := 'Sixteen';
                       Dez[7] := 'Seventeen';
                       Dez[8] := 'Eighteen';
                       Dez[9] := 'Nineteen';

                       Dezenas[1] := 'Ten';
                       Dezenas[2] := 'Twenty';
                       Dezenas[3] := 'Thirty';
                       Dezenas[4] := 'Forty';
                       Dezenas[5] := 'Fifty';
                       Dezenas[6] := 'Sixty';
                       Dezenas[7] := 'Seventy';
                       Dezenas[8] := 'Eighty';
                       Dezenas[9] := 'Ninety';

                       Centenas[1] := 'Hundred';
                       Centenas[2] := 'Two hundred';
                       Centenas[3] := 'Three hundred';
                       Centenas[4] := 'Four hundred';
                       Centenas[5] := 'Five hundred';
                       Centenas[6] := 'Six hundred';
                       Centenas[7] := 'Seven hundred';
                       Centenas[8] := 'Eight hundred';
                       Centenas[9] := 'Nine hundred';
                    end;
          ltar_SA : begin
                       cCents      := 'Penny';
                       cCentsPlural:= 'Cents';
                       cThousand   := 'Thousand';
                       Unidades[1] := 'One';
                       Unidades[2] := 'Two';
                       Unidades[3] := 'Three';
                       Unidades[4] := 'Four';
                       Unidades[5] := 'Five';
                       Unidades[6] := 'Six';
                       Unidades[7] := 'Seven';
                       Unidades[8] := 'Eight';
                       Unidades[9] := 'Nine';

                       Dez[1] := 'Eleven';
                       Dez[2] := 'Twelve';
                       Dez[3] := 'Thirteen';
                       Dez[4] := 'Fourteen';
                       Dez[5] := 'Fifteen';
                       Dez[6] := 'Sixteen';
                       Dez[7] := 'Seventeen';
                       Dez[8] := 'Eighteen';
                       Dez[9] := 'Nineteen';

                       Dezenas[1] := 'Ten';
                       Dezenas[2] := 'Twenty';
                       Dezenas[3] := 'Thirty';
                       Dezenas[4] := 'Forty';
                       Dezenas[5] := 'Fifty';
                       Dezenas[6] := 'Sixty';
                       Dezenas[7] := 'Seventy';
                       Dezenas[8] := 'Eighty';
                       Dezenas[9] := 'Ninety';

                       Centenas[1] := 'Hundred';
                       Centenas[2] := 'Two hundred';
                       Centenas[3] := 'Three hundred';
                       Centenas[4] := 'Four hundred';
                       Centenas[5] := 'Five hundred';
                       Centenas[6] := 'Six hundred';
                       Centenas[7] := 'Seven hundred';
                       Centenas[8] := 'Eight hundred';
                       Centenas[9] := 'Nine hundred';
                    end;
    end;

    Unidade:='';
    Dezena:='';
    Centena:='';
    if (trio[2]='1') and (trio[3]<>'0') then
    begin
      Unidade:=Dez[strtoint(trio[3])];
      Dezena:='';
    end
    else
    begin
      if trio[2]<>'0' then Dezena:=Dezenas[strtoint(trio[2])];
      if trio[3]<>'0' then Unidade:=Unidades[strtoint(trio[3])];
    end;
    if (trio[1]='1') and (Unidade='') and (Dezena='') then
       Centena:='cem'
    else
    if trio[1]<>'0' then
       Centena:=Centenas[strtoint(trio[1])]
    else
       Centena:='';
    Result:= Centena + ifs((Centena<>'') and ((Dezena<>'') or (Unidade<>'')), ' e ', '') + Dezena + ifs((Dezena<>'') and (Unidade<>''),' e ', '') + Unidade;
  end;

begin
  if (valor>999999.99) or (valor<0) then
  begin
    msg:='O valor está fora do intervalo permitido.';
    msg:=msg+'O número deve ser maior ou igual a zero e menor que 999.999,99.';
    msg:=msg+' Se não for corrigido o número não será escrito por extenso.';
    //ShowMessage(msg);
    Result:='';
    exit;
  end;
  if valor=0 then
  begin
    Result:='';
    Exit;
  end;
  Texto:=formatfloat('000000.00',valor);
  Milhar:=MiniExtenso(Copy(Texto,1,3));
  Centena:=MiniExtenso(Copy(Texto,4,3));
  Centavos:=MiniExtenso('0'+Copy(Texto,8,2));
  Result:=Milhar;
  if Milhar<>'' then
    if copy(texto,4,3)='000' then
       Result:=Result + ' ' + cThousand + ' ' + pCurr_NamePlural //Reais'
    else
       Result:=Result + ' ' + cThousand + ', ';
  if (((copy(texto,4,2)='00') and (Milhar<>'') and (copy(texto,6,1)<>'0')) or (centavos='')) and (Centena<>'') then
     Result:=Result+' e ';
  if (Milhar+Centena <>'') then Result:=Result+Centena;
  if (Milhar='') and (copy(texto,4,3)='001') then
     Result:=Result + ' ' + pCurr_Name //' Real'
  else
  if (copy(texto,4,3)<>'000') then
     Result:=Result + ' ' + pCurr_NamePlural ;// ' Reais';
  if Centavos='' then
  begin
    Result:=Result+'.';
    Exit;
  end
  else
  begin
    if Milhar+Centena='' then
       Result:=Centavos
    else
       Result:=Result+', e '+Centavos;
    if (copy(texto,8,2)='01') and (Centavos<>'') then
       Result:=Result + ' ' + cCents + '.' // ' Centavo.'
    else
       Result:=Result + ' ' + cCentsPlural + '.';// ' Centavos.';
  end;
end;

// origem: http://www.activedelphi.com.br/forum/viewtopic.php?t=94782&sid=6a5ae0eae276519e978ed275ed62a1e6
function rc_StrCaptalize( pStr : string ) : string;
var
  flag: Boolean;
  i: Byte;
  t: string;
begin
  flag := True;
  pStr := AnsiLowerCase(pStr);
  t := EmptyStr;

  for i := low(pStr) to Length(pStr) do // v. 3.3.1.0
  begin
    if flag then
      t := t + AnsiUpperCase(pStr[i])
    else
      t := t + pStr[i];

    flag := CharInSet( pStr[i] , [' ', '[',']', '(', ')'] );
  end;
  Result := t;
end;
// v. 3.3.1.0
function DataTypeStrIsInt( pDtype : string ) : Boolean;
begin
     Result := ( pDtype  = 'ftinteger' ) or
               ( pDtype  = 'ftautoinc' ) or
               ( pDtype  = 'ftlargeint' )or
               ( pDtype  = 'ftsmallint' )or
               ( pDtype  = 'bigint' ) or
               ( pDtype  = 'ftsingle' );
end;
// v. 3.3.1.0
function DataTypeStrIsFloat( pDtype : string ) : Boolean;
begin
     Result := ( pDtype  = 'ftbcd' ) or
               ( pDtype  = 'ftfmtbcd' ) or
               ( pDtype  = 'ftfloat' )   or
               ( pDtype  = 'ftcurrency' );
end;

function DataTypeStrIsNumber( pDtype : string ) : Boolean;
begin
     Result := ( pDtype  = 'ftinteger' ) or
               ( pDtype  = 'ftautoinc' ) or
               ( pDtype  = 'ftbcd' ) or
               ( pDtype  = 'ftfmtbcd' ) or
               ( pDtype  = 'ftfloat' )   or
               ( pDtype  = 'ftcurrency' )or
               ( pDtype  = 'ftlargeint' )or
               ( pDtype  = 'ftsmallint' )or
               ( pDtype  = 'bigint' ) or // v. 3.2.0.0 ( feedback Sergio para sqlserver)
               ( pDtype  = 'ftsingle' )or // v. 3.2.0.0
               ( pDtype  = 'ftword' );
end;

function DataTypeStrIsString( pDtype : string ) : Boolean;
begin


     Result := ( pDtype  = 'ftstring' ) or
               ( pDtype  = 'ftwidestring' ) or
               ( pDtype  = 'ftmemo' ) or
               ( pDtype  = 'ftwidememo' )  ;

end;

function DataTypeStrIsDateTime( pDtype : string ) : Boolean;
begin

     Result := ( pDtype  = 'ftdate' ) or
               ( pDtype  = 'fttime' ) or
               ( pDtype  = 'ftdatetime' ) or
               ( pDtype  = 'fttimestamp' )   or
               ( pDtype  = 'fttimestampoffset' );

end;
// v. 3.3.1.0
function DataTypeIsInt( pDtype : TFieldType ) : Boolean;
begin
     Result := ( pDtype  = ftInteger ) or
               ( pDtype  = ftSingle ) or
               ( pDtype  = ftAutoInc ) or
               ( pDtype  = ftLargeint )or
               ( pDtype  = ftSmallint );
end;
// v. 3.3.1.0
function DataTypeIsFloat( pDtype : TFieldType ) : Boolean;
begin
     Result := ( pDtype  = ftBCD ) or
               ( pDtype  = ftFMTBcd ) or
               ( pDtype  = ftFloat )   or
               ( pDtype  = ftCurrency );
end;

function DataTypeIsNumber( pDtype : TFieldType ) : Boolean;
begin

     Result := ( pDtype  = ftInteger ) or
               ( pDtype  = ftSingle ) or // v. 3.1.0.60
               ( pDtype  = ftAutoInc ) or
               ( pDtype  = ftBCD ) or
               ( pDtype  = ftFMTBcd ) or
               ( pDtype  = ftFloat )   or
               ( pDtype  = ftCurrency )or
               ( pDtype  = ftLargeint )or
               ( pDtype  = ftSmallint )or
               ( pDtype  = ftLongWord ) or // v. 3.2.0.4
               ( pDtype  = ftWord );
end;

function DataTypeIsString( pDtype : TFieldType ) : Boolean;
begin

     Result := ( pDtype  = ftString ) or
               ( pDtype  = ftWideString ) or
               ( pDtype  = ftMemo ) or
               ( pDtype  = ftWideMemo )  ;

end;

function DataTypeIsDateTime( pDtype : TFieldType ) : Boolean;
begin

     Result := ( pDtype  = ftDate ) or
               ( pDtype  = ftTime ) or
               ( pDtype  = ftDateTime ) or
               ( pDtype  = ftTimeStamp )   or
               ( pDtype  = ftTimeStampOffset );

end;


function strToken(var S: string; Seperator: Char): string;
var
  I: Word;
begin
  I := Pos(Seperator, S);
  if I <> 0 then
  begin
    Result := System.Copy(S, 1, I - 1);
    System.Delete(S, 1, I);
  end
  else
  begin
    Result := S;
    S := '';
  end;
end;

function strTokenCount(S: string; Seperator: Char): Integer;
begin
  Result := 0;
  while S <> '' do
  begin            { 29.10.96 sb }
    StrToken(S, Seperator);
    Inc(Result);
  end;
end;

function FixDecimals( Value: Extended; Decimals: Integer): Extended;
begin

  Result := SimpleRoundTo( Value, Decimals * (-1) );

end;
// v. 3.3.3.1
function rc_HtmlToColor(s:string;aDefault:Tcolor):TColor;
begin
  if copy(s,1,1)='#' then begin
    s:='$'+copy(s,6,2)+copy(s,4,2)+copy(s,2,2);
  end
  else
    s:='clNone';
  try
    result:=StringToColor(s);
  except
    result:=aDefault;
  end;
end;
//showdelphi
function ColorToHtml(Clr: TColor): string;
begin
  Result := IntToHex(clr, 6);
  Result := '#' + Copy(Result, 5, 2) + Copy(Result, 3, 2) + Copy(Result, 1, 2);
end;
// v. 4.0.0.0
function GetWebColor( pColor: string ): string;
var
   s1, s2, s3, s4 : string;
begin

  Result := ColorToHtml( StringToColor( pColor) );
  Exit;

  // $00334455
  s1 := Copy( pColor, 2, 2 );
  s2 := Copy( pColor, 4, 2 );
  s3 := Copy( pColor, 6, 2 );

  if Length( pColor ) >= 8 then
     s4 := Copy( pColor, 8, 2 )
  else
     s4 := '00';

  Result := '#' + s4 + s3 + s2;

end;


function RemoveInvalidChar( InputText: string): string;
begin
  InputText := StringReplace(InputText,#$D,'',[rfReplaceAll]);
  InputText := StringReplace(InputText,#$A,'',[rfReplaceAll]);
  InputText := StringReplace(InputText,#$D#$A,'',[rfReplaceAll]);
  InputText := StringReplace(InputText,#13,'',[rfReplaceAll]);
  InputText := StringReplace(InputText,#13#10,'',[rfReplaceAll]);
  InputText := StringReplace(InputText,'"','',[rfReplaceAll]);
  InputText := StringReplace(InputText,'''','',[rfReplaceAll]);
  Result := InputText;
end;

function RemoveLineBreaks( InputText: string): string;
begin
  InputText := StringReplace(InputText,#$D,' ',[rfReplaceAll]);
  InputText := StringReplace(InputText,#$A,' ',[rfReplaceAll]);
  InputText := StringReplace(InputText,#$D#$A,' ',[rfReplaceAll]);
  InputText := StringReplace(InputText,#13,' ',[rfReplaceAll]);
  InputText := StringReplace(InputText,#13#10,' ',[rfReplaceAll]);

  Result := InputText;
end;

function  ReturnNumbers(pText:string):string;
var ind : integer;
begin
   result := '';
   if pText <> '' then
   begin
     for ind := low(pText) to length(pText) do // v. 3.3.1.0
     begin
         if CharInSet( pText[ind] , ['0'..'9'] ) then
            result := result + pText[ind];
     end;
   end;
end;

function  ReturnLetters(pText:string):string;
var ind : integer;
begin
   result := '';
   for ind := low(pText) to length(pText) do // v. 3.3.1.0
   begin
       if ( CharInSet( pText[ind] , ['a'..'z'] ) ) or
          ( CharInSet( pText[ind] , ['A'..'Z'] ) ) then

          result := result + pText[ind];
   end;
end;

function Crypto(Action, Src, Key : WideString ): WideString;
var
   KeyLen    : Integer;
   KeyPos    : Integer;
   offset    : Integer;
   dest      : string;
   SrcPos    : Integer;
   SrcAsc    : Integer;
   TmpSrcAsc : Integer;
   Range     : Integer;
   s         : string[255];
   c         : array[0..255] of Byte absolute s;
begin
     dest:='';
     KeyLen:=Length(Key);
     KeyPos:=0;
     SrcPos:=0;
     SrcAsc:=0;
     Range:=256;
     if Action = UpperCase('E') then
     begin
          Randomize;
          offset := Random(Range);
          dest   := format('%1.2x',[offset]);
          for SrcPos := low(Src) to Length(Src) do // v. 3.3.1.0
          begin
               SrcAsc:=(Ord(Src[SrcPos]) + offset) MOD 255;
               if KeyPos < KeyLen then KeyPos:= KeyPos + 1 else KeyPos:=1;
               SrcAsc:= SrcAsc xor Ord(Key[KeyPos]);
               dest:=dest + format('%1.2x',[SrcAsc]); //¬
               offset:=SrcAsc;
          end;
     end;
     if Action = UpperCase('D') then
     begin
          offset:=StrToIntDef('$'+ copy(src,1,2),0);
          SrcPos:=3;
          repeat
                SrcAsc:=StrToIntDef('$'+ copy(src,SrcPos,2),0);
                if KeyPos < KeyLen Then KeyPos := KeyPos + 1 else KeyPos := 1;
                TmpSrcAsc := SrcAsc xor Ord(Key[KeyPos]);
                if TmpSrcAsc <= offset then
                     TmpSrcAsc := 255 + TmpSrcAsc - offset
                else
                     TmpSrcAsc := TmpSrcAsc - offset;
                dest := dest + chr(TmpSrcAsc);
                offset:=srcAsc;
                SrcPos:=SrcPos + 2;
          until SrcPos >= Length(Src);
     end;
     Crypto := dest;
end;

// não altere a chave pois é usada no cad. de usuários
// do not change the key as it is used in the cad. of users
Function Crypta(S , key2 :String):String;
begin

     Result := Crypto( 'E', S, key2 + 'M1kromundoR@dc0r3' ) ;//   StrEncrypt( s, 1974 );

end;

Function DeCrypta(S, key2 :String):String;
begin

     Result := Crypto( 'D', S, Key2 + 'M1kromundoR@dc0r3' ) ;//   StrDecrypt( s, 1974 );

end;

Function LoadHTMLFile(FileName : String) : String;
Var
 vStringCad : TStringList;
begin
   vStringCad := TStringList.Create;
   Try
      vStringCad.LoadFromFile(FileName);
      //Result := utf8decode(vStringCad.Text);
      Result := UTF8ToString(vStringCad.Text);
   Finally
      vStringCad.Free;
   End;
end;

Function FormatDelphiDate(Value : String) : String;
Begin

 Result := Value;

 If Pos('-', Value) > 0 Then
 Begin
    Result := Copy(Value, 1, Pos('-', Value) -1);
    Delete(Value, 1, Pos('-', Value));
    Result := Copy(Value, 1, Pos('-', Value) -1) + '/' + Result;
    Delete(Value, 1, Pos('-', Value));
    Result := Copy(Value, 1, Length(Value)) + '/' + Result;
 End;

End;

function varIIF( aTest: Boolean; TrueValue, FalseValue : Variant): Variant;
begin
  if aTest then  Result := TrueValue else Result := FalseValue;
end;

{ Retorna o pText dentro de 2 tags (open & close Tag's) }
//
// função original: ExtractText retirada do SHOW DELPHI
//
function GetTagContent(aText, OpenTag, CloseTag : String) : String;
var
  iAux, kAux : Integer;
begin
  Result := '';

  if (Pos(CloseTag, aText) <> 0) and (Pos(OpenTag, aText) <> 0) then
  begin
    iAux := Pos(OpenTag, aText) ;// + Length(OpenTag);
    kAux := Pos(CloseTag, aText) + 3;
    Result := Copy(aText, iAux, kAux-iAux);
    Result := StringReplace( Result , '<# ' , '' , [rfReplaceAll] );
    Result := StringReplace( Result , ' #>' , '' , [rfReplaceAll] );
  end;
end;

{ Insere o pText entre 2 tags (open & close Tag's) }

function SetTagContent( aText, aTextReplace, OpenTag, CloseTag : String) : String;
var
  iAux, kAux : Integer;
begin
  Result := '';

  if (Pos(CloseTag, aText) <> 0) and (Pos(OpenTag, aText) <> 0) then
  begin
    iAux := Pos(OpenTag, aText) ;// + Length(OpenTag);
    kAux := Pos(CloseTag, aText) + 3;
    Delete( aText , iAux , Length( Copy(aText, iAux, kAux-iAux) ) );

    Insert( aTextReplace , aText , iAux );

    Result := aText;

  end;
end;

function FindAnyClass(const Name: string): TClass;
var
  ctx: TRttiContext;
  typ: TRttiType;
  list: TArray<TRttiType>;
begin
  Result := nil;
  ctx := TRttiContext.Create;
  list := ctx.GetTypes;
  for typ in list do
    begin
      if typ.IsInstance and (EndsText(Name, typ.Name)) then
        begin
          Result := typ.AsInstance.MetaClassType;
          break;
        end;
    end;
  ctx.Free;
end;

function GetTagParams(S : String ): TStringList;

  var

  iCount : integer;
  cResult : TStringList;
  cSeparator,
  Saux : string;


begin

    cSeparator := ' ';
    cResult := TStringList.Create;

    iCount := pos( cSeparator , S ); //pega posição do cSeparator

    if iCount <> 0 then             // verifica se existe o cSeparator caso contrario trata apenas como uma única linha
    begin

        while trim(S) <> '' do // enquanto S não for nulo executa
        begin

            Saux := copy( S , 1 , iCount-1 ); // Variável Saux recebe primeiro valor
            delete( S , 1 , iCount );         // deleta primeiro valor

            if iCount = 0 then                // se não ouver mais cSeparator Saux equivale ao resto da linha
            begin

                Saux := S.Replace( '"' , '' );
                S := '';

            end;

            //cResult.AddPair( Copy( Saux , 1, Pos( '=' , Saux ) - 1 ), AnsiDequotedStr( Copy( Saux, Pos( '=' , Saux ) + 1  ) , '''') );// Add( Saux ); // adiciona linhas na string lista
            cResult.Add( Copy( Saux , 1, Pos( '=' , Saux ) - 1 ) + '=' + AnsiDequotedStr( Copy( Saux, Pos( '=' , Saux ) + 1  ) , '''') );// Add( Saux ); // adiciona linhas na string lista
            iCount := pos( cSeparator , S ); //pega posição do cSeparator

        end;

    end
    else
    begin

        Saux := S.Replace( '"' , '' );
        //cResult.AddPair( Copy( Saux , 1, Pos( '=' , Saux ) - 1 ), AnsiDequotedStr( Copy( Saux, Pos( '=' , Saux ) + 1  ) , '''') );//Add(Saux);
        cResult.Add( Copy( Saux , 1, Pos( '=' , Saux ) - 1 ) + '=' + AnsiDequotedStr( Copy( Saux, Pos( '=' , Saux ) + 1  ) , '''') );//Add(Saux);

    end;

    Result := cResult; // retorna cResult como uma lista indexada

end;
// v. 3.2.0.1
// necessidade do OSMAR / enviado p FABIO testar com SQLSERVER - 24.05.21 16:15 p.m.
Function StrTokenClearSql( pText : String; pRemoveAccents:boolean ) : String;
Const
   cAccents = 'àâêôûãõáéíóúçüÀÂÊÔÛÃÕÁÉÍÓÚÇÜ';
var
   cTokens : string;
   i : integer;
Begin
    if pRemoveAccents then
       cTokens := '&ºª' + cAccents
    else
       cTokens := '&ºª';

    for I := low(cTokens) to Length( cTokens ) do // v. 3.3.1.0
        pText := StringReplace( pText, cTokens[ I ] , '_' , [rfReplaceAll] ); // verificar se "" é igual pra todos( pgsql, sqlserver... )

    if pRemoveAccents then
       Result := RemoveAccents( pText )
    else
       Result := pText;
End;

Function StrTokenClear( pText : String) : String;
var
   cTokens : string;
   i : integer;
Begin

    cTokens := '-.,:;<>/|\()[]{}_#';

    for I := low(cTokens) to Length( cTokens ) do // v. 3.3.1.0
        pText := StringReplace( pText, cTokens[ I ] , '' , [rfReplaceAll] );


    Result := pText;

End;

function StrPageName( pText : string ) : string;
begin
     Result := Trim( lowercase( StringReplace( pText, '.' , '' , [rfReplaceAll] ) ) );
     Result := lowercase( StringReplace( Result, ' ' , '_' , [rfReplaceAll] ) );
end;


// feedback: Mesut from Turkey
{$ifdef LINUX}
function OffsetFromUTC: TDateTime;
begin
Result := idGlobal.OffsetFromUTC;
end;
{$endif}
{$ifdef MSWINDOWS}
function OffsetFromUTC: TDateTime;
(*
Use it as: Expires := Now + (however long in TDateTimeFormat)+OffsetFromUTC;

such as: Expires := IncMinute(Now, DefaultTimeout) + OffsetFromUTC;
Responder

*)
//{$IFDEF LINUX}
//var
//T: TTime_T;
//TV: TTimeVal;
//UT: TUnixTime;
//begin
//gettimeofday(TV, nil);
//T := TV.tv_sec;
//localtime_r(@T, UT);
//// __tm_gmtoff is the bias in seconds from the UTC to the current time.
//// so I multiply by -1 to compensate for this.
//Result := -1*(UT.__tm_gmtoff / 60 / 60 / 24);
//end;
//{$ENDIF}
//{$IFDEF MSWINDOWS}
var
iBias: Integer;
tmez: TTimeZoneInformation;
begin
// Copied from IdGlobal.pas
case

     GetTimeZoneInformation(tmez) of TIME_ZONE_ID_INVALID: raise Exception.Create('FailedTimeZoneInfo');   //EFailedToRetreiveTimeZoneInfo.Create(RSFailedTimeZoneInfo);

     TIME_ZONE_ID_UNKNOWN  : iBias := tmez.Bias;

     TIME_ZONE_ID_DAYLIGHT : iBias := tmez.Bias + tmez.DaylightBias;

     TIME_ZONE_ID_STANDARD : iBias := tmez.Bias + tmez.StandardBias;
else
    raise Exception.Create('FailedTimeZoneInfo');   //EFailedToRetreiveTimeZoneInfo.Create(RSFailedTimeZoneInfo);
end;
{We use ABS because EncodeTime will only accept positve values}
Result := EncodeTime(Abs(iBias) div 60, Abs(iBias) mod 60, 0, 0);
end;
{$endif}

function CloneComponent(aValue: TObject): TObject;
var
  MarshalObj: TJSONMarshal;
  UnMarshalObj: TJSONUnMarshal;
  JSONValue: TJSONValue;
begin
  Result:= nil;
  MarshalObj := TJSONMarshal.Create;
  UnMarshalObj := TJSONUnMarshal.Create;
  try
    JSONValue := MarshalObj.Marshal(aValue);
    try
      if Assigned(JSONValue) then
        Result:= UnMarshalObj.Unmarshal(JSONValue);
    finally
      JSONValue.Free;
    end;
  finally
    MarshalObj.Free;
    UnMarshalObj.Free;
  end;
end;

end.
