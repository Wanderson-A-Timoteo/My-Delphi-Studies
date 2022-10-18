unit str_func; // v. 4.0.0.0

interface

uses             //{$IFDEF WINDOWS}windows,{$ELSE} LCLIntf, LCLType,{$ENDIF}
SysUtils, Types, windows,Classes, Math;


Const
  RepHead =0;
  RepTrail=1;
  RepBoth =2;
  RepEvery=3;
  ReplaceLeft = 0;
  ReplaceRight = 1;
  ReplaceBoth = 2;
  ReplaceAll = 3;

  mdAscend = 0;
  mdDescend = 1;

  EspacoBranco = #32;
  EspacoNulo = #0;

function rc_CamelCase(const s: string): string;

function GetRandomPassword(Size: Integer; Tipo : Integer = 1): String;

function StrSepara(const S: string; const Separador: char; const Posicao: integer): string;

function varIIF( aTest: Boolean; TrueValue, FalseValue : Variant): Variant;

function  strEncrypt(const S: String; Key: Word): String;
function  strDecrypt(const S: String; Key: Word): String;

function DomingoPascoaGregoriano(AAno: SmallInt): TDateTime;

function Corrige_SituacaoTributaria( _Sit : String ) : String;
function AliquotaToStr(const ATipo: String; AALiquota: Double): String;

function HexToDec(const S: string): Longint;

function DecToHex(N: LongInt; A: Byte): string;

Function Zeros (S :String; N : Byte) : String;

function  StrZero(Num : Real;Tam : integer) : String; {Zeros a esqueda}

{Prenche uma String de tamanho "N" com o caractere "Ch"}
Function Copies (Ch : Char; N : Byte) : String;

{Prenche, … direita, uma string "S" com caracteres "P" at‚ o tamanho total
"N"}
Function PadLeft (S :String; N : Byte; P : Char) : String;

{Prenche, … esquerda, uma string "S" com caracteres "P" at‚ o tamanho total
"N"}
Function PadRight (S :String; N : Byte; P : Char) : String;

{Prenche, … direita e … esquerda, uma string "S" com caracteres "P" at‚ o
tamanho total "N"}
Function Middle (S : String; N : SmallInt; P : Char) : String;

{ Substitui um caracter "FromChar" por outro "ToChar" em uma string
"SourceStr" }
Function ReplaceChar (SourceStr : String; FromChar, ToChar : Char;
Mode : Byte) : String;

{Substitui uma String "FromStr" por outra "ToStr" em uma String "Source"}
//Function ReplaceStr (Source, FromStr, ToStr : String; Mode : Byte = ReplaceAll ) :String;


{Remove as duplicidades de uma substring "T" em uma string "S"}
Function StripRepeat (S, T : String) : String;

{Inverte uma string}
Function ReverseStr (S : String) : String;

{Retorna SubString de uma String "S" a partir da ocorrˆncia da String "T"}
Function CopyFrom (S, T : String) : String;

{Retorna SubString de uma String "S" at‚ a ocorrˆncia da String "T"}
Function CopyUntil (S, T : String) : String;

{Retorna a £ltima ocorrˆncia de uma string "T" em uma string "S"}
Function LastPos (T, S : String) : Integer;

{Retorna a posicao do primeiro caracter ap¢s a ocorrˆncia de todas strings
"T" consecutivas}
Function NoPos (T, S : String) : Integer;

{Retorna o n£mero de ocorrˆncias de uma string "T" dentro de outra "S"}
Function Occurs(T, S : String) : Integer;

{Retorna a posi‡Æo da en‚sima ocorrˆncia da string "T" na string "S"}
Function OccurPos (T, S : String; N : Integer) : Integer;

{Preenche variavel com "IntX" vezes uma string passada}
Function Replicate (StrX : string; IntX : Integer) : string;

{Preenche variavel com seu conte£do mais 'n' caracteres passados por
parametro}
//Function FillStr (StrX : string; tamanho : integer; caracter : string) : string;

{Preenche string com n espa‡os}
Function Space (const IntX : ShortInt) : string;

{Centraliza string}
Function Center (StrX : string; IntX : ShortInt) : string;

{Retira os n caracteres a esquerda}
Function LeftStr (StrX : string; const IntX : ShortInt) : string;

{Retira os n caracteres a direita}
Function RightStr (StrX : string; const IntX : ShortInt) : string;


{Retorna a Posi‡Æo Inicial da Pr¢xima palavra ap¢s o caracter indicado por
"InitPos"}
Function NextPosWord (S : String; InitPos, Mode : Byte) : Byte;

function RemoveAccents(Str:String): string;
function DtDDMMAA(Const Data : String):Boolean; {data é valida ?}
function CPFOk(Const CPF : String):Boolean; {Cpf é valido ?}
function CGCOk(Const CGC : String):Boolean; {Cgc é válido ?}

function Criptografar( wStri : String): String;

//nova funcao 2017
function Criptografia( wStri : String): String;

function mkmCriptografia( wStri : String): String;

function UF_CEP(CEPDigitado: String): String;

//function PortTCP_IsOpen(dwPort : Word; ipAddressStr:String) : boolean;
function ComparaValores(_val1: Variant; _operacao: string;  _val2: Variant; _tipo : String = 'F'  ): Boolean;

function ABNTround(valor:extended;decimals:smallint):Extended;

function strToken(var S: String; Seperator: Char): String;
function strTokenCount(S: String; Seperator: Char): Integer;

function StrToFloat_Universal( pText : string ): Extended;

implementation

// v. 4.0.0.0
function rc_CamelCase(const s: string): string;
var
   i : integer;
begin
   if s = '' then
     Result := ''
   else
   begin
     Result := AnsiUppercase(s[1]);
     for i := 2 to Length(s) do
       if s[i - 1] = ' ' then
         Result := Result + AnsiUppercase(s[i])
       else
         Result := Result + AnsiLowercase(s[i]);
   end;
end;

function GetRandomPassword(Size: Integer; Tipo : Integer = 1): String;
var
  I: Integer;
  Chave: String;
const
  str1 = '1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
  str2 = '1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  str3 = '1234567890abcdefghijklmnopqrstuvwxyz';
  str4 = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
  str5 = '1234567890';
  str6 = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  str7 = 'abcdefghijklmnopqrstuvwxyz';
begin
  Chave := '';

  for I := 1 to Size do
  begin
    case Tipo of
      1 : Chave := Chave + str1[Random(Length(str1)) + 1];
      2 : Chave := Chave + str2[Random(Length(str2)) + 1];
      3 : Chave := Chave + str3[Random(Length(str3)) + 1];
      4 : Chave := Chave + str4[Random(Length(str4)) + 1];
      5 : Chave := Chave + str5[Random(Length(str5)) + 1];
      6 : Chave := Chave + str6[Random(Length(str6)) + 1];
      7 : Chave := Chave + str7[Random(Length(str7)) + 1];
    end;
  end;

  Result := Chave;
end;

function StrSepara(const S: string; const Separador: char; const Posicao: integer): string;
var
  I, Contador, P: integer;
begin
  Result := '';
  P := Posicao;
  if (P < 1) then
    P := 1;
  Contador := 1;
  for I := low(s) to Length(S) do // v. 3.3.1.0
    if S[I] = Separador then
    begin
      if Contador = P then
        Break;
      Inc(Contador);
      Result := '';
    end
    else
      Result := Result + S[I];
  if P > Contador then
    Result := '';
end;
// v. 3.3.1.0
function StrToFloat_Universal( pText : string ): Extended;
const
   EUROPEAN_ST = ',';
   AMERICAN_ST = '.';
var
  lformatSettings : TFormatSettings;
  lFinalValue     : string;
  lAmStDecimalPos : integer;
  lIndx           : Byte;
  lIsAmerican     : Boolean;
  lIsEuropean     : Boolean;

begin
  lIsAmerican := False;
  lIsEuropean := False;
  lFinalValue := pText; //
  // v. 3.4.0.0
  if trim(pText) = '' then
     pText := '0.0';

  for lIndx := Length( pText ) - 1 downto 0 do
  begin
    if ( pText[ lIndx ] = AMERICAN_ST ) then
    begin
      lIsAmerican := True;
      pText := StringReplace( pText, ',', '', [ rfIgnoreCase, rfReplaceAll ]);  //get rid of thousand incidental separators
      Break;
    end;
    if ( pText[ lIndx ] = EUROPEAN_ST ) then
    begin
      lIsEuropean := True;
      pText := StringReplace( pText, '.', '', [ rfIgnoreCase, rfReplaceAll ]);  //get rid of thousand incidental separators
      Break;
    end;
  end;
  GetLocaleFormatSettings( LOCALE_SYSTEM_DEFAULT, lformatSettings );
  if ( lformatSettings.DecimalSeparator = EUROPEAN_ST ) then
  begin
    if lIsAmerican then
    begin
      lFinalValue := StringReplace( pText, '.', ',', [ rfIgnoreCase, rfReplaceAll ] );
    end;
  end;
  if ( lformatSettings.DecimalSeparator = AMERICAN_ST ) then
  begin
    if lIsEuropean then
    begin
      lFinalValue := StringReplace( pText, ',', '.', [ rfIgnoreCase, rfReplaceAll ] );
    end;
  end;
  pText  := lFinalValue;
  Result := StrToFloat( pText, lformatSettings );
end;

function strToken(var S: String; Seperator: Char): String;
var
  I               : Word;
begin
  I:=Pos(Seperator,S);
  if I<>0 then
  begin
    Result:=System.Copy(S,1,I-1);
    System.Delete(S,1,I);
  end else
  begin
    Result:=S;
    S:='';
  end;
end;

function strTokenCount(S: String; Seperator: Char): Integer;
begin
  Result:=0;
  while S<>'' do begin            { 29.10.96 sb }
    StrToken(S,Seperator);
    Inc(Result);
  end;
end;

function ABNTround(valor:extended;decimals:smallint):Extended;
var vm:extended;
        p,f,p2,f2:extended;
Begin
   //Result := SimpleRoundTo(valor, - decimals);
   //Exit;

   (* Nova função de arredondamento *)
   vm:=Power(10,Decimals);
   p:=int(valor);
   { A conversão para string e depois para float evita
        erros indesejáveis. Que apareceria na comparação f2=0.5 }
   f:=StrToFloat(FloatToStr(Frac(valor)*vm));
   p2:=int(f);
   f2:=Frac(f);
   if f2>0.5 then
          p2:=p2+1
   else
          if f2=0.5 then
            //if frac(p2/2)>0 then p2:=p2+1;
            p2:=p2+1;

   p2:=p2/vm;
   result:=p+p2;

end;


//devolve a UF correspndente ao cep
function UF_CEP(CEPDigitado: String): String;
var cep : integer; //guarda o cep sem mascara como inteiro
begin
  Result := '';

  cep := StrToIntDef(CEPDigitado,0);
  //converte a variavel mascara para inteiro e a guarda na var. cep

 //verifica o cep digitado em relacao ao estado escolhido
 if cep=0 then exit;
 if  ((cep>=10000000) and (cep<=19999999)) then Result := 'SP';
 if  ((cep>=20000000) and (cep<=28999999)) then Result := 'RJ';
 if  ((cep>=79000000) and (cep<=79999999)) then Result := 'MS';
 if  ((cep>=30000000) and (cep<=39999999)) then Result := 'MG';
 if  ((cep>=78000000) and (cep<=78899999)) then Result := 'MT';
 if  ((cep>=69900000) and (cep<=69999999)) then Result := 'AC';
 if  ((cep>=57000000) and (cep<=57999999)) then Result := 'AL';
 if  ((cep>=69000000) and (cep<=69899999)) then Result := 'AM';
 if  ((cep>=68900000) and (cep<=69999999)) then Result := 'AP';
 if  ((cep>=40000000) and (cep<=48999999)) then Result := 'BA';
 if  ((cep>=60000000) and (cep<=63999999)) then Result := 'CE';
 if  ((cep>=70000000) and (cep<=73699999)) then Result := 'DF';
 if  ((cep>=29000000) and (cep<=29999999)) then Result := 'ES';
 if  ((cep>=73700000) and (cep<=76999999)) then Result := 'GO';
 if  ((cep>=65000000) and (cep<=65999999)) then Result := 'MA';
 if  ((cep>=66000000) and (cep<=68899999)) then Result := 'PA';
 if  ((cep>=58000000) and (cep<=58999999)) then Result := 'PB';
 if  ((cep>=50000000) and (cep<=56999999)) then Result := 'PE';
 if  ((cep>=64000000) and (cep<=64999999)) then Result := 'PI';
 if  ((cep>=80000000) and (cep<=87999999)) then Result := 'PR';
 if  ((cep>=59000000) and (cep<=59999999)) then Result := 'RN';
 if  ((cep>=78900000) and (cep<=78999999)) then Result := 'RO';
 if  ((cep>=69300000) and (cep<=69399999)) then Result := 'RR';
 if  ((cep>=90000000) and (cep<=99999999)) then Result := 'RS';
 if  ((cep>=88000000) and (cep<=89999999)) then Result := 'SC';
 if  ((cep>=49000000) and (cep<=49999999)) then Result := 'SE';
 if  ((cep>=77000000) and (cep<=77999999)) then Result := 'TO';

end;

function mkmCriptografia(wStri: String): String;
var
   Simbolos : array [0..6] of String; // 0..6
   cHora,
   turnoCript,
   turno    : string;
   iHora,
   iTurno,
   x        : Integer;
   criptografou : Boolean;
begin
    criptografou := false;
    wStri        := UpperCase( wStri );
    turnoCript   := Copy( wStri, 1 , 5 );
    cHora        := TimeToStr( time );
    iHora        := StrToInt( Copy( cHora, 1, Pos( ':' , cHora ) -1 ) );

    if iHora <= 6 then
       turno := '2'
    else
    if iHora <= 12 then
       turno := '3'
    else
    if iHora <= 18 then
       turno := '4'
    else
        turno := '5';

    // tá criptografada, pegar o turno e desCriptografia
    if ( turnoCript = 'TN.2|' ) or
       ( turnoCript = 'TN.3|' ) or
       ( turnoCript = 'TN.4|' ) or
       ( turnoCript = 'TN.5|' ) then
    begin

         turno := Trim( Copy( wStri, 4, 1 ) );
         wStri := LowerCase( Trim( Copy( wStri, 6, 50 ) ) );

    end
    else
    //Criptografia
    begin

         turnoCript := '';

    end;

    iTurno := StrToInt( Turno);

    Simbolos[1]:= 'ABCDEFGHIJLMNOPQRSTUVXZYWK0123456789';

    Simbolos[2]:= '!@#$%&*()-=[{]}/?;:.>,<\|_qpwtyghfjd';
    Simbolos[3]:= 'alskdj>,<\-=[{vbcnzmk]}/|q_irutypwoe';
    Simbolos[4]:= 'hg?;:.!@#$]<\|%&f*[{_utycvwx>oeiruls';
    Simbolos[5]:= 'tudm!@#%&*()$-=[{]}/?\|_qma;:.>,<rnh';

    for x := low( trim( wStri ) ) to Length( Trim( wStri ) ) do // v. 3.3.1.0
		begin
        if pos( copy( wStri , x , 1 ) , Simbolos[1] ) > 0 then
        begin
           Result := Result + copy( Simbolos[ iTurno ] , pos( copy( wStri , x , 1) , Simbolos[1] ) , 1);
           criptografou := true;
        end
        else
        if pos( copy( wStri , x , 1 ) , Simbolos[ iTurno ] ) > 0 then
        begin
           Result := Result + copy( Simbolos[1] , pos( copy( wStri , x , 1 ) , Simbolos[ iTurno ] ) , 1 );
           criptografou := false;
        end;
    end;

    if criptografou then
       Result := 'TN.' + IntToStr( iTurno ) + '|' + Result;
end;

function Criptografia(wStri: String): String;
var
   Simbolos : array [0..6] of String; // 0..6
   cHora,
   turnoCript,
   turno    : string;
   iHora,
   iTurno,
   x        : Integer;

   criptografou : Boolean;

begin
    criptografou := false;
    wStri := UpperCase( wStri );

    turnoCript := Copy( wStri, 1 , 5 );


    cHora := TimeToStr( time );
    iHora := StrToInt( Copy( cHora, 1, Pos( ':' , cHora ) -1 ) );

    if iHora <= 6 then
       turno := '2'
    else
    if iHora <= 12 then
       turno := '3'
    else
    if iHora <= 18 then
       turno := '4'
    else
        turno := '5';


    // tá criptografada, pegar o turno e desCriptografia
    if ( turnoCript = 'TN.2|' ) or
       ( turnoCript = 'TN.3|' ) or
       ( turnoCript = 'TN.4|' ) or
       ( turnoCript = 'TN.5|' ) then
    begin

         turno := Trim( Copy( wStri, 4, 1 ) );
         wStri := LowerCase( Trim( Copy( wStri, 6, 50 ) ) );

    end
    else
    //Criptografia
    begin

         turnoCript := '';

    end;

    iTurno := StrToInt( Turno);


    Simbolos[1]:= 'ABCDEFGHIJLMNOPQRSTUVXZYWK0123456789';

    Simbolos[2]:= '!@#$%&*()-=[{]}/?;:.>,<\|_qpwtyghfjd';
    Simbolos[3]:= 'alskdj>,<\-=[{vbcnzmk]}/|q_irutypwoe';
    Simbolos[4]:= 'hg?;:.!@#$]<\|%&f*[{_ktycvwx>oeiruls';
    Simbolos[5]:= 'tudm!@#%&*()$-=[{]}/?\|_q=a;:.>,<rnh';

    for x := low( trim( wStri ) ) to Length( Trim( wStri ) ) do // v. 3.3.1.0
		begin

        if pos( copy( wStri , x , 1 ) , Simbolos[1] ) > 0 then
        begin
           Result := Result + copy( Simbolos[ iTurno ] , pos( copy( wStri , x , 1) , Simbolos[1] ) , 1);
           criptografou := true;
        end
        else
        if pos( copy( wStri , x , 1 ) , Simbolos[ iTurno ] ) > 0 then
        begin
           Result := Result + copy( Simbolos[1] , pos( copy( wStri , x , 1 ) , Simbolos[ iTurno ] ) , 1 );
           criptografou := false;
        end;

    end;

    if criptografou then
       Result := 'TN.' + IntToStr( iTurno ) + '|' + Result;
       //Result := 'original: ' + wStri + '     TN.' + IntToStr( iTurno ) + '|' + Result;

end;

function Criptografar(wStri: String): String;

var
   Simbolos : array [0..6] of String;
   cHora,
   turnoCript,
   turno    : string;
   iHora,
   iTurno,
   x        : Integer;
begin

    wStri := UpperCase( wStri );

    turnoCript := Copy( wStri, 1 , 5 );

    cHora := TimeToStr( time );
    iHora := StrToInt( Copy( cHora, 1, Pos( ':' , cHora ) -1 ) );

    if iHora <= 6 then
       turno := '2'
    else
    if iHora <= 12 then
       turno := '3'
    else
    if iHora <= 18 then
       turno := '4'
    else
        turno := '5';


    // tá criptografada, pegar o turno e descriptografar
    if ( turnoCript = 'TN.2|' ) or
       ( turnoCript = 'TN.3|' ) or
       ( turnoCript = 'TN.4|' ) or
       ( turnoCript = 'TN.5|' ) then
    begin

         turno := Trim( Copy( wStri, 4, 1 ) );
         wStri := LowerCase( Trim( Copy( wStri, 6, 50 ) ) );

    end
    else
    //criptografar
    begin

         turnoCript := '';

    end;

    iTurno := StrToInt( Turno);

    Simbolos[1]:= 'ABCDEFGHIJLMNOPQRSTUVXZYWK0123456789';

    Simbolos[2]:= '!@#$%&*()-=[{]}/?;:.>,<\|_qpwtyghfjd';
    Simbolos[3]:= 'alskdj>,<\-=[{vbcnzmk]}/|_qirutypwoe';
    Simbolos[4]:= 'hg?;:.!@#$]<\|%&f*[{_uty?;:.>oeiruls';
    Simbolos[5]:= 'tudm!@#%&*()$-=[{]}/?\|_qma;:.>,<rnh';

    for x := low( trim( wStri ) ) to Length( Trim( wStri ) ) do // v. 3.3.1.0
		begin

        if pos( copy( wStri , x , 1 ) , Simbolos[1] ) > 0 then
           Result := Result + copy( Simbolos[ iTurno ] , pos( copy( wStri , x , 1) , Simbolos[1] ) , 1)
           //Result := Result + copy( Simbolos[ 2 ] , pos( copy( wStri , x , 1) , Simbolos[1] ) , 1)
        else
				//if pos( copy( wStri , x , 1 ) , Simbolos[ 2 ] ) > 0 then
        if pos( copy( wStri , x , 1 ) , Simbolos[ iTurno ] ) > 0 then
           Result := Result + copy( Simbolos[1] , pos( copy( wStri , x , 1 ) , Simbolos[ iTurno ] ) , 1 );
           //Result := Result + copy( Simbolos[1] , pos( copy( wStri , x , 1 ) , Simbolos[ 2 ] ) , 1 );

    end;

    Result := 'TN.' + IntToStr( iTurno ) + '|' + Result;

end;



function varIIF( aTest: Boolean; TrueValue, FalseValue : Variant): Variant;
begin
  if aTest then  Result := TrueValue else Result := FalseValue;
end;

Function DtDDMMAA(Const Data : String):Boolean;
Var
  Dado,
  Separador,
  SalvaFormato,
  DataExterna : String;
  DataInterna : TDateTime;

Begin
  DataInterna := date;
  Result := True;
  Dado   := Data;
  Separador := FormatSettings.DateSeparator;
  While Pos(Separador,Dado) > 0 do
    Delete (Dado,Pos(Separador,Dado),1);
  If Length(Dado) = 6 Then
    Dado := Copy(Dado,1,2)+Separador+
            Copy(Dado,3,2)+Separador+
            Copy(Dado,5,2)
  Else
    If Length(Dado)=8 Then
      Dado := Copy(Dado,1,2)+Separador+
              Copy(Dado,3,2)+Separador+
              Copy(Dado,5,4)
    Else Result := False;

  If Result Then Begin
    SalvaFormato := FormatSettings.ShortDateFormat;
    Try
      FormatSettings.ShortDateFormat := 'd'+Separador+'m'+separador+'y';
      DataInterna := StrToDate(Dado);
    Except
      On EConvertError do
      Begin
        Result := False;
        FormatSettings.ShortDateFormat := SalvaFormato;
      End;
    End;
    If Result Then Begin
      try
        FormatSettings.ShortDateFormat := 'dd'+Separador+'mm'+Separador+'yyyy';
        DataExterna := DateToStr(DataInterna);
      Except
        on EConvertError do
        Begin
          Result := False;
          FormatSettings.ShortDateFormat := SalvaFormato;
        End;
      End;
      {
      If Result And (DataExterna <> Dado) Then Result := False;
      }
    End;
    FormatSettings.ShortDateFormat := SalvaFormato;
  End;
End;

Function CPFOk(Const CPF : String):Boolean;
Var
  Dado : String;
  D1   : Array [1..9] of Byte;
  I,
  C,
  Resto,
  PrimeiroDigito,
  SegundoDigito : Integer;
Begin
  Result := True;
  Dado := CPF;
  While Pos('.',Dado) > 0 do
    Delete (Dado,Pos('.',Dado),1);
  While Pos('-',Dado) > 0 do
    Delete (Dado,Pos('-',Dado),1);
  While Length(Dado) < 11 Do
    Dado := '0' + Dado;
  For I := 1 to 9 do Begin
    Try
      D1[I] := StrToInt( Copy( Dado, I, 1 ) ); //StrToInt(Dado[I]);
    Except
      Result := False;
    End;
  End;
  If Result Then Begin
    C := 0;
    Resto := 0;
    PrimeiroDigito := 0;
    SegundoDigito  := 0;

    C := 10 * StrToInt( Copy( Dado,  1, 1 ) ) + 9 * StrToInt( Copy( Dado,  2, 1 ) ) + 8 * StrToInt( Copy( Dado,  3, 1 ) ) + 7 * StrToInt( Copy( Dado,  4, 1 ) ) +
          6 * StrToInt( Copy( Dado,  5, 1 ) ) + 5 * StrToInt( Copy( Dado,  6, 1 ) ) + 4 * StrToInt( Copy( Dado,  7, 1 ) ) + 3 * StrToInt( Copy( Dado,  8, 1 ) ) +
          2 * StrToInt( Copy( Dado,  9, 1 ) );

    Resto := C Mod 11;
    If (Resto = 0) Or (Resto = 1) Then
      PrimeiroDigito := 0
    Else
      PrimeiroDigito := 11 - Resto;

    C := 11 * StrToInt( Copy( Dado,  1, 1 ) ) + 10 * StrToInt( Copy( Dado,  2, 1 ) ) + 9 * StrToInt( Copy( Dado,  3, 1 ) ) + 8 * StrToInt( Copy( Dado,  4, 1 ) ) +
          7 * StrToInt( Copy( Dado,  5, 1 ) ) +  6 * StrToInt( Copy( Dado,  6, 1 ) ) + 5 * StrToInt( Copy( Dado,  7, 1 ) ) + 4 * StrToInt( Copy( Dado,  8, 1 ) ) +
          3 * StrToInt( Copy( Dado,  9, 1 ) ) +  2 * PrimeiroDigito;

    Resto := C Mod 11;
    If (Resto = 0) Or (Resto = 1) Then
      SegundoDigito := 0
    Else
      SegundoDigito := 11 - Resto;
    Try
      If (( PrimeiroDigito <> StrToInt( Copy( Dado,  10, 1 ) )) Or
          ( SegundoDigito  <> StrToInt( Copy( Dado,  11, 1 ) )))
        Then Result := False;
    Except
      Result := False;
    End;
  End;

End;

Function CGCOk(Const CGC : String):Boolean;
Var
  Dado : String;
  D1   : Array [1..12] of Byte;
  I,
  C,
  Resto,
  PrimeiroDigito,
  SegundoDigito : Integer;
Begin
  Result := True;
  Dado := CGC;
  While Pos('.',Dado) > 0 do
    Delete (Dado,Pos('.',Dado),1);
  While Pos('/',Dado) > 0 do
    Delete (Dado,Pos('/',Dado),1);
  While Pos('-',Dado) > 0 do
    Delete (Dado,Pos('-',Dado),1);
  While Length(Dado) < 14 Do
    Dado := '0' + Dado;

  For I := 1 to 12 do Begin
    Try
      D1[I] := StrToInt( Copy( Dado, I, 1 ) ); //StrToInt( Dado[I] );
    Except
      Result := False;
    End;
  End;
  If Result Then Begin
    C := 0;
    Resto := 0;
    PrimeiroDigito := 0;
    SegundoDigito  := 0;

    C := 5 * StrToInt( Copy( Dado, 1, 1 ) ) + 4 * StrToInt( Copy( Dado,  2, 1 ) ) + 3 * StrToInt( Copy( Dado,  3, 1 ) ) + 2 * StrToInt( Copy( Dado,  4, 1 ) ) +
         9 * StrToInt( Copy( Dado, 5, 1 ) ) + 8 * StrToInt( Copy( Dado,  6, 1 ) ) + 7 * StrToInt( Copy( Dado,  7, 1 ) ) + 6 * StrToInt( Copy( Dado,  8, 1 ) ) +
         5 * StrToInt( Copy( Dado, 9, 1 ) ) + 4 * StrToInt( Copy( Dado, 10, 1 ) ) + 3 * StrToInt( Copy( Dado, 11, 1 ) ) + 2 * StrToInt( Copy( Dado, 12, 1 ) );

    Resto := C Mod 11;
    If (Resto = 0) Or (Resto = 1) Then
      PrimeiroDigito := 0
    Else
      PrimeiroDigito := 11 - Resto;

    C := 6 * StrToInt( Copy( Dado,  1, 1 ) ) + 5 * StrToInt( Copy( Dado,  2, 1 ) ) + 4 * StrToInt( Copy( Dado,  3, 1 ) ) + 3 * StrToInt( Copy( Dado,  4, 1 ) ) +
         2 * StrToInt( Copy( Dado,  5, 1 ) ) + 9 * StrToInt( Copy( Dado,  6, 1 ) ) + 8 * StrToInt( Copy( Dado,  7, 1 ) ) + 7 * StrToInt( Copy( Dado,  8, 1 ) ) +
         6 * StrToInt( Copy( Dado,  9, 1 ) ) + 5 * StrToInt( Copy( Dado, 10, 1 ) ) + 4 * StrToInt( Copy( Dado, 11, 1 ) ) + 3 * StrToInt( Copy( Dado, 12, 1 ) ) +
         2 * PrimeiroDigito;

    Resto := C Mod 11;
    If (Resto = 0) Or (Resto = 1) Then
      SegundoDigito := 0
    Else
      SegundoDigito := 11 - Resto;
    Try
      If (( PrimeiroDigito <> StrToInt( Copy( Dado,  13, 1 ) )) Or
          ( SegundoDigito  <> StrToInt( Copy( Dado,  14, 1 ) )))
        Then Result := False;
    Except
      Result := False;
    End;
  End;
End;

function RemoveAccents(Str:String): String;

Const ComAcento = 'àâêôûãõáéíóúçüÀÂÊÔÛÃÕÁÉÍÓÚÇÜ';
      SemAcento = 'aaeouaoaeioucuAAEOUAOAEIOUCU';
var
   x : Integer;
begin
     For x := low( str ) to Length(Str) do // v. 3.3.1.0
     begin
          if Pos(Str[x],ComAcento)<>0 Then
          begin
               Str[x] := SemAcento[Pos(Str[x],ComAcento)];
          end;
     end;
     Result := ( Str );//Trim
end;

function Corrige_SituacaoTributaria( _Sit : String ) : String;
begin

     Result   := _Sit;

     if _Sit = 'CC' then
        Result   := 'TT'
     else
     if _Sit = '' then
        Result   := 'II'
     else
     if ( _Sit <> 'T' )  and
        ( _Sit <> 'TT' ) and
        ( _Sit <> 'FF' ) and
        ( _Sit <> 'S' )  and
        ( _Sit <> 'SS' ) and
        ( _Sit <> 'II' ) and
        ( _Sit <> 'NN' ) and
        ( _Sit <> 'SI' ) and
        ( _Sit <> 'SF' ) and
        ( _Sit <> 'SN' ) then
        Result   := 'II';

end;

function AliquotaToStr(const ATipo: String; AALiquota: Double): String;
var
  Tipo: String;
begin

  Tipo := Corrige_SituacaoTributaria( ATipo );

  if Tipo = '' then
     Tipo := 'N'
  else
     Tipo := Tipo[1];

  // loucura. o sistema estava gravando CC quando incide ICMS
  if Tipo = 'C' then
     Tipo := 'T';

  if ( Tipo = 'T' ) or ( Tipo = 'S' ) then
    Result := Tipo + FormatFloat('0000', (AAliquota * 100))
  else
    Result := Tipo;

end;


function HexToDec(const S: string): Longint;
var
  HexStr: string;
begin
  if Pos('$', S) = 0 then HexStr := '$' + S
  else HexStr := S;
  Result := StrToIntDef(HexStr, 0);
end;

function DecToHex(N: LongInt; A: Byte): string;
begin
  Result := IntToHex(N, A);
end;

//------------------------------------------------------------------------
{Prenche uma String de tamanho "N" com o caractere "Ch"}
Function Copies (Ch : Char; N : Byte) : String;
begin
  if N < 1 Then
    Result := ''
  else begin
    FillChar (Result[1], N, Ch);
    //Result[0] := Char(N);
  end;
end;

//------------------------------------------------------------------------
{Prenche, … direita, uma string "S" com caracteres "P" at‚ o
tamanho total "N"}
Function PadLeft (S :String; N : Byte; P : Char) : String;
begin
if N < 1 Then
Result := ''
else
if N > Length(S) Then
Result := S + Copies (P, N - Length(S))
else
Result := Copy (S, 1, N);
end;
//------------------------------------------------------------------------

{Prenche, … esquerda, uma string "S" com caracteres "P" at‚ o
tamanho total "N"}
Function PadRight (S :String; N : Byte; P : Char) : String;
begin
if N < 1 Then
Result := ''
else
if N > Length(S) Then
Result := Copies (P, N - Length(S)) + S
else
Result := Copy (S, Length(S) - N + 1, N);
end;

//------------------------------------------------------------------------
{Prenche, … direita e … esquerda, uma string "S" com
caracteres "P" at‚ o tamanho total "N"}
Function Middle (S : String; N : SmallInt; P : Char) : String;
var
Spare, NDiv : Byte;
begin
if N < 1 Then
Result := ''
else begin
Spare := Abs (N - Length (S));
NDiv := Spare Div 2;
if N > Length(S) Then
Result := Copies (P, NDiv) + S + Copies (P, Spare - NDiv)
else
Result := Copy (S, NDiv + 1, N);
end;
end;

//------------------------------------------------------------------------
{ Substitui um caracter "FromChar" por outro "ToChar" em uma
string "SourceStr" }
Function ReplaceChar (SourceStr : String; FromChar, ToChar : Char;
Mode : Byte) : String;
var
I : Integer;
begin
Result := '';
if Mode <> ReplaceLeft Then
For I := Length (SourceStr) DownTo low(SourceStr) Do // v. 3.3.1.0
if SourceStr[I] = Char(FromChar) Then
SourceStr[I] := Char(ToChar)
else
Break;
if Mode <> ReplaceRight Then
For I := low(SourceStr) To Length (SourceStr) Do // v. 3.3.1.0
If SourceStr[I] = Char(FromChar) Then
SourceStr[I] := Char(ToChar)
else
if Mode <> ReplaceAll Then
Break;
Result := SourceStr;
end;

//------------------------------------------------------------------------
{Substitui uma String "FromStr" por outra "ToStr" em uma
String "Source"}

//Function ReplaceStr (Source, FromStr, ToStr : String; Mode : Byte) :String;
//Var
//P : Byte;
//Begin
//if Mode <> ReplaceRight Then
//if Pos (FromStr, Source) = 1 Then
//Source := ToStr + Copy (Source, Length (ToStr) + 1, 255);
//if Mode <> ReplaceLeft Then begin
//Source := ReverseStr (Source);
//if Pos (ReverseStr (FromStr), Source) = 1 Then
//Source := ReverseStr (ToStr) + Copy (Source, Length (ToStr) + 1, 255);
//Source := ReverseStr (Source);
//end;
//if Mode = ReplaceAll Then begin
//P := Pos (FromStr, Source);
//while P > 0 do begin
//Source := Copy (Source, 1, P - 1) + ToStr + Copy (Source, P + Length (ToStr),
//255);
//P := Pos (FromStr, Source);
//end;
//end;
//ReplaceStr := Source;
//End;


//------------------------------------------------------------------------
{Remove as duplicidades de uma substring "T" em uma string "S"}
Function StripRepeat (S, T : String) : String;
Var P : Byte;
Begin
P := Pos (T + T, S);
while P > 0 Do begin
Delete (S, P, Length(T));
P := Pos (T + T, S);
end;
StripRepeat := S;
End;

//------------------------------------------------------------------------
{Inverte uma string}
Function ReverseStr (S : String) : String;
var I : Integer;
begin
Result := '';
For I := Length(S) DownTo low(s) Do // v. 3.3.1.0
Result := Result + S[I];
end;

//------------------------------------------------------------------------
{Retorna SubString de uma String "S" a partir da ocorrˆncia da String "T"}

Function CopyFrom (S, T : String) : String;
Var P : Integer;
Begin
P := Pos (T, S);
if P > 0 Then
CopyFrom := Copy (S, P + Length(T), 65535)
else
CopyFrom := '';
End;

//------------------------------------------------------------------------
{Retorna SubString de uma String "S" at‚ a ocorrˆncia da String "T"}
Function CopyUntil (S, T : String) : String;
Var P : Byte;
Begin
P := Pos (T, S);
if P > 0 Then
CopyUntil := Copy (S, 1, Pred(P))
else
CopyUntil := S;
End;

//------------------------------------------------------------------------
{Retorna a £ltima ocorrˆncia de uma string "T" em uma string "S"}

Function LastPos (T, S : String) : Integer;
Var P : Integer;
Begin
P := Pos (ReverseStr (T), ReverseStr (S));
if P > 0 Then
LastPos := Length(S) - P
Else
LastPos := 0;
End;

//------------------------------------------------------------------------
{Retorna a posicao do primeiro caracter ap¢s a ocorrˆncia de todas strings
"T" consecutivas}

Function NoPos (T, S : String) : Integer;
Var Tam : Integer;
Begin
Tam := Length(T);
Result := 1;
While Pos (T, S) = 1 Do Begin
Inc (Result, Tam);
S := Copy (S, Tam + 1, 65535);
end;
End;

//------------------------------------------------------------------------
{Retorna o n£mero de ocorrˆncias de uma string "T" dentro de outra "S"}

Function Occurs(T, S : String) : Integer;
Var P : Integer;
Begin
Result := 0;
P := Pos (T, S);
while P > 0 do begin
Inc (Result);
S := Copy (S, P + Length (T), 65535);
P := Pos (T, S);
end;
End;

//------------------------------------------------------------------------
{Retorna a posi‡Æo da en‚sima ocorrˆncia da string "T" na string "S"}

Function OccurPos (T, S : String; N : Integer) : Integer;
Var Op, P, I : Integer;
Begin
I := 0;
Op := 0;
P := Pos (T, S);
While P > 0 Do Begin
Inc (Op);
if Op = N Then Begin
OccurPos := I + P;
Exit;
End;
Inc(I, P + Length(T) - 1);
P := Pos (T, Copy (S, I + 1, 65535));
End;
OccurPos := 0;
End;


//------------------------------------------------------------------------
{Preenche variavel com "IntX" vezes uma string passada}
Function Replicate (StrX : string; IntX : Integer ) : string;
begin
Result := '';
while Length (Result) < IntX do
Result := Result + StrX;
end;

//------------------------------------------------------------------------
{Preenche string com n espa‡os}
Function Space (const IntX : ShortInt) : string;
begin
Space := Copies (EspacoBranco, IntX);
end;

//------------------------------------------------------------------------
{Centraliza string}
Function Center(StrX : string; IntX : ShortInt ) : string;
begin
Center := Middle (StrX, IntX, EspacoBranco);
end;

//------------------------------------------------------------------------
{Retira os n caracteres a esquerda}
Function LeftStr (StrX : string; const IntX : ShortInt) : string;
begin
// LeftStr := Copy (StrX, IntX + 1, Length (StrX) - IntX);
LeftStr := Copy (StrX, 1, IntX);
end;

//------------------------------------------------------------------------
{Retira os n caracteres a direita}
Function RightStr (StrX : string; const IntX : ShortInt ) : string;
begin
     RightStr := Copy( StrX, Length( StrX ) - ( IntX - 1 ) , IntX );//   ReverseStr(Copy(ReverseStr(StrX), 1, Intx));
end;

//------------------------------------------------------------------------
{ Pinga uma porta e ip }
{
function PortTCP_IsOpen(dwPort : Word; ipAddressStr:String) : boolean;
var
  client : sockaddr_in;
  sock   : Integer;

  ret    : Integer;
  wsdata : WSAData;
begin
 Result:=False;
 ret := WSAStartup($0002, wsdata); //initiates use of the Winsock DLL
  if ret<>0 then exit;
  try
    client.sin_family      := AF_INET;  //Set the protocol to use , in this case (IPv4)
    client.sin_port        := htons(dwPort); //convert to TCP/IP network byte order (big-endian)
    client.sin_addr.s_addr := inet_addr(PAnsiChar(ipAddressStr));  //convert to IN_ADDR  structure
    sock  :=socket(AF_INET, SOCK_STREAM, 0);    //creates a socket
    Result:=connect(sock,client,SizeOf(client))=0;  //establishes a connection to a specified socket
  finally
  WSACleanup;
  end;
end;
    }
//------------------------------------------------------------------------
{compara valores/strings/datas etc }
function ComparaValores(_val1: Variant; _operacao: string;  _val2: Variant; _tipo : String = 'F'  ): Boolean;

begin

     Result := False;

     //try

         if Pos( 'F', _tipo ) > 0 then
         begin

//              if _Val1 = '' then
//                 _Val1 := 0;
//
//              if _Val2 = '' then
//                 _Val2 := 0;

             _Val1 := StrToFloatDef( FloatToStr( _Val1 ), 0 );
             _Val2 := StrToFloatDef( FloatToStr( _Val2 ), 0 );
         end;

         // o tipo DD e FF só é chamado na rotina de salvar registro, como a data é convertida em STRING
         // a comparacao deve ser feita como sTRINGS
         if _tipo = 'DD' then
         begin
              _tipo := 'S';
         end
         else
         if _tipo = 'FF' then
         begin
              _tipo := 'S';
             _Val1  := ( FloatToStr( _Val1 ) );
             _Val2  := ( FloatToStr( _Val2 ) );
         end;

         if ( _tipo = 'F' ) or ( _tipo = 'I' ) or ( _tipo = 'D' ) then
         begin

             if _Operacao = '>' then Result := ( _Val1 > _Val2 )
             else
             if _Operacao = '<' then Result := ( _Val1 < _Val2 )
             else
             if _Operacao = '=' then Result := ( _Val1 = _Val2 )
             else
             if _Operacao = '>=' then Result := ( _Val1 >= _Val2 )
             else
             if _Operacao = '<=' then Result := ( _Val1 <= _Val2 )
             else
             if _Operacao = '<>' then Result := ( _Val1 <> _Val2 );

         end
         else
         begin

              if _Operacao = '<>' then Result := ( _Val1 <> _Val2 )
              else
              if _Operacao = '=' then Result := ( _Val1 = _Val2 );

         end;
      {
     except

           on e:Exception do
           begin

                //frmMain.rc_ShowError( 'Geração da Query: ' + sLineBreak +
                //                 'Erro.: ' + e.Message + sLineBreak + sLineBreak +
                //                 'mm.varC_FieldName: ' + mm.varC_FieldName + sLineBreak + sLineBreak +
                //                 'mm.varC_ContentField: ' + mm.varC_ContentField + sLineBreak + sLineBreak +
                //                 //'Insert: ' + varC_SQL_Insert + sLineBreak + sLineBreak +
                //                 //'Values: ' + varC_SQL_Insert_Values );
                //                 varIIF( varC_ExisteRegistro = 'S' , , varC_SQL_Insert + sLineBreak + varC_SQL_Insert_Values ) );
                //raise;

           end;
     end;
     }
end;




//------------------------------------------------------------------------
{Retorna a Posi‡Æo Inicial da Pr¢xima palavra ap¢s o caracter indicado por
"InitPos"}
Function NextPosWord (S : String; InitPos, Mode : Byte) : Byte;
Var I : Integer;
Begin
//InitPos := Min (Max (InitPos, 1), Length(S));
if Mode = mdDescend Then
I := -1
else
I := 1;
while ((InitPos <= Length(S)) And (InitPos > 0) And (S[InitPos] <> ' ')) Do
Inc (InitPos, I);
while ((InitPos <= Length(S)) And (InitPos > 0) And (S[InitPos] = ' ')) Do
Inc (InitPos, I);
if InitPos > Length (S) Then
InitPos := 0;
NextPosWord := InitPos;
End;

//---------------------------------------------------------------

Function StrZero(Num : Real;Tam : integer) : String;
var x,T : integer;
    N,D : String;

begin
  N := FloatToStr(Num);
  T := Pos('.',N);
  D := '';
  if T <> 0 then
  begin
     N := Copy(N,1,T-1);
     D := Copy(N,T,3)
  end;
  for x := 1 to Tam-length(N) do
     n:= '0'+n;
  result := N+D;
end;

Function Zeros (S :String; N : Byte) : String;

begin

if N < 1 Then
   Result := ''
else
   While Length( S ) < N do
         S := '0'+S;

Result := S;

end;


{-------------------------------------------------------------------------}
{  Método para cálculo manual, sem limitação de tempo, ou seja, para      }
{  qualquer ano do Calendário Gregoriano, a partir de 1583. Desenvolvido  }
{  pelo astrônomo francês Jean Baptiste Joseph Delambre, publicado no     }
{  livro "The Time in the History", de Gerald James Withrow.              }
{-------------------------------------------------------------------------}
function DomingoPascoaGregoriano(AAno: SmallInt): TDateTime;
var
  A, B, C, D, E: Integer;
  F, G, H, I, K: Integer;
  L, M, P, Q: Integer;
begin
  A := AAno mod 19;
  B := AAno div 100;
  C := AAno mod 100;
  D := B div 4;
  E := B mod 4;
  F := (B + 8) div 25;
  G := (B - F + 1) div 3;
  H := ((19 * A) + B - D - G + 15) mod 30;
  I := C div 4;
  K := C mod 4;
  L := (32 + (2 * E) + (2 * I) - H - K) mod 7;
  M := (A + (11 * H) + (22 * L)) div 451;
  P := (H + L - (7 * M) + 114) div 31;
  Q := (H + L - (7 * M) + 114) mod 31;
  Result := EncodeDate(AAno, P, Q + 1);
end;

const
  C1 = 52845;
  C2 = 22719;

function strEncrypt(const S: String; Key: Word): String;
var
  I: Integer;
begin
 (*
 {$IFDEF Win32}
  SetLength(Result,Length(S));
 {$ELSE}
   Result[0]:=Chr(Length(S));
 {$ENDIF}
 *)
 Result := '';//Replicate(' ', Length(S) );

  for I := low(s) to Length(S) do // v. 3.3.1.0
  begin
    Result[I] := Char( Ord(S[I]) xor (Key shr 8) );
    //Result := Result + Char( Ord( Ansichar( Copy( S, I, 1 ) ) ) xor (Key shr 8) );
    Key := (Ord( Result[I] ) + Key) * C1 + C2;
    //Key := (Ord( Copy( Result, I, 1 ) ) + Key) * C1 + C2;
  end;
end;

function strDecrypt(const S: String; Key: Word): String;
var
  I: Integer;
begin
 (*
 {$IFDEF Win32}
  SetLength(Result,Length(S));
 {$ELSE}
   Result[0]:=Chr(Length(S));
 {$ENDIF}
 *)
 Result := '';//Replicate(' ', Length(S) );

  for I := low(s) to Length(S) do
  begin
    Result[I] := Char(Ord(S[I]) xor (Key shr 8));
    //Result := Result + Char( Ord( Copy( S, I, 1 ) ) xor (Key shr 8));
    Key := ( Ord( S[I] ) + Key ) * C1 + C2;
    //Key := ( Ord( Copy( S, I, 1 ) ) + Key ) * C1 + C2;
  end;
end;

//------------------------------------------------------------------------

end.


