unit mkm_validate; // v. 4.1.0.0


interface

uses
    System.SysUtils, System.Classes , System.TypInfo, JSON, DBXJSON, DBXJSONReflect,
    System.DateUtils, math, System.Rtti, System.StrUtils, Vcl.Graphics, RegularExpressions,
    // feedback: Mesut from Turkey
    {$ifdef LINUX}
    System.UIConsts,
    {$endif}
    uconsts,
    uniGUIBaseClasses, uniGUIClasses, uniGUITypes, uniGUIJSUtils, Vcl.forms,
    uniComboBox, uniDBComboBox,uniDBLookupComboBox, uniDateTimePicker, uniDBDateTimePicker,  uniListBox,
    uniBitBtn, uniButton, uniEdit, UniDBEdit, UniSpeedButton, uniGUIFrame, uniGUIForm,  uniGUIDialogs, Messages,
    uniGUIAbstractClasses,  uniGUIApplication, uniPanel, IniFiles, UniImage, uniLabel,  Unipagecontrol,
    uniMemo, uniDBMemo, uniGUIRegClasses, uniDBNavigator, uniScrollBox,
    UniDBRadioGroup, uniDBCheckBox, uniDBImage, uniDBText, uniHTMLFrame,
    FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
    FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
    FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
    FireDAC.Comp.Client;

function rc_TypeIsValid( pType : TRCValidateTypes; pContent : Variant ) : boolean;
function rc_FormValidate( pFormFrame : TObject; pClear : boolean = false ) : boolean;
function rc_RecordExists( pFormFrame, pObj : TObject; pShowMsg : boolean = false ) : boolean; // v. 4.0.0.5

implementation

uses untdm_rc, str_func, mkm_func_web, MainModule, mkm_layout;
// v. 4.1.0.0
function rc_RecordExists( pFormFrame, pObj : TObject; pShowMsg : boolean = false ) : boolean;
var
   cTable, cField, cWhere, cOrder, cAnd, cContent,
   cHint , cDS , cState, cPk, cSql : string;
   oDs : TDataSource;
   oQuery : TFDQuery;
begin
    oDs      := nil;
    oQuery   := nil;
    cTable   := '';
    cField   := '';
    cWhere   := '';
    cOrder   := '';
    cAnd     := '';
    cContent := '';
    cState   := '';
    cPk      := '';
    cHint := TUniControl(pObj).hint;
    cDS   := rc_GetHintProperty( 'ds:', cHint );
    if ( cDS.IsEmpty ) then
    begin
       cDS := 'dsmaster';
    end;
    cTable := rc_GetHintProperty( 'table:', cHint );
    if ( cTable.IsEmpty ) then
    begin
       cTable := TUniEdit( Tcomponent(pFormFrame).FindComponent( 'ed_Table_ItemSel' ) ).Text;
    end;
    cWhere := rc_GetHintProperty( 'where:', cHint );
    if ( cWhere.IsEmpty ) then
    begin
       cWhere := TUniEdit( Tcomponent(pFormFrame).FindComponent( 'ed_Where_Search' ) ).Text;
    end;
//    cOrder := rc_GetHintProperty( 'order:', cHint );
//    if ( cOrder.IsEmpty ) then
//    begin
//       cOrder := TUniEdit( Tcomponent(pFormFrame).FindComponent( 'ed_Order_Search' ) ).Text;
//    end;
    cField := rc_GetHintProperty( 'field:', cHint );
    if ( cField.IsEmpty ) then
    begin
       If GetPropInfo( pObj.ClassInfo, 'Datasource') <> nil then
       begin
          if pObj is TUniDBEdit then
          begin
             cField   := TUniDBEdit(pObj).DataField;
             cContent := TUniDBEdit(pObj).Text;
          end;
          cState := TUniEdit( Tcomponent(pFormFrame).FindComponent( 'ed_Table_Status' ) ).Text;
          cPk    := TUniEdit( Tcomponent(pFormFrame).FindComponent( 'ed_Pk' ) ).Text;
//          else
//          if pObj is TUniDBDateTimePicker then
//             cField :=  TUniDBEdit(pObj).DataField
//          else
           oDS := TDataSource( Tcomponent(pFormFrame).FindComponent( cDS ) );
           if ( oDS <> nil ) and ( cDS = lowercase( oDs.Name ) )then
           begin
               oQuery := TFDQuery( Tcomponent(pFormFrame).FindComponent( oDS.DataSet.Name ) ) ;
           end;

       end;
    end
    else
    if pObj is TUniEdit then
    begin
       cContent := TUniEdit(pObj).Text;
    end;
    // v. 4.1.0.0
    Result := false;
    if not ( ( cTable + cField ).IsEmpty ) then
    begin
       if cState = 'I' then
          cSql := ' select tab.' + cField +
                  ' from  ' + cTable + ' tab ' +
                  ' where tab.' + cField + ' = ' + varIIF( Pos( 'not-exists<str>', cHint ) > 0 , QuotedStr( cContent ), cContent )
       else
       if cState = 'E' then
          cSql := ' select tab.' + cField +
                  ' from  ' + cTable + ' tab ' +
                  ' where tab.' + cField + ' = ' + varIIF( Pos( 'not-exists<str>', cHint ) > 0 , QuotedStr( cContent ), cContent ) +
                  ' and tab.' + cPk + ' <> ' + oQuery.FieldByName( cPK ).AsString;

       cSql := cSql + varIIF( cWhere <> '', ' and ' + StringReplace(cWhere, '''''', '''',[rfReplaceAll] ) , '' );
       if ( cOrder.IsEmpty ) then
          cOrder := ' tab.' + cField;
       cSql := cSql + ' order by ' + cOrder;

       if cContent <> '' then
       begin
          dm_rc.memTemp.Close;
          dm_rc.memTemp.Data := dm_rc.rc_GetRecord( mm.varB_Use_FireDac ,
                                                    false,
                                                    cSql );
          if mm.varC_LastErrorMsg <> '' then
          begin
             dm_rc.rc_ShowWarning( mm.MSG_CONTACT_SUPPORT + sLineBreak + sLineBreak + // v. 4.1.0.0
                                  'Registro já existe' + sLineBreak + sLineBreak +
                                   mm.varC_LastErrorMsg );
             Abort;
          end;
          Result := dm_rc.memTemp.RecordCount > 0;
       end;

       //ueryConsultas.SQL.Add('select NOME from lojas where (NOME=''' + edNome.Text + ''');');
//       If GetPropInfo( pObj.ClassInfo, 'Datasource') <> nil then
//       begin
//
//       end;
    end;
end;
//showdelphi
function IsValidEmail(const Value: string): Boolean;
  function CheckAllowed(const s: string): Boolean;
  var
    i: Integer;
  begin
    Result := False;
    for i := 1 to Length(s) do
      if not CharInSet( s[i] , ['a' .. 'z', 'A' .. 'Z', '0' .. '9', '_', '-', '.'] ) then
        Exit;
    Result := true;
  end;
var
  i: Integer;
  NamePart, ServerPart: string;
begin
  Result := False;
  i := Pos('@', Value);
  if i = 0 then
    Exit;
  NamePart := Copy(Value, 1, i - 1);
  ServerPart := Copy(Value, i + 1, Length(Value));
  if (Length(NamePart) = 0) or ((Length(ServerPart) < 5)) then
    Exit;
  i := Pos('.', ServerPart);
  if (i = 0) or (i > (Length(ServerPart) - 2)) then
    Exit;
  Result := CheckAllowed(NamePart) and CheckAllowed(ServerPart);
end;

function IsValidCpfCnpj( pCpf : boolean; Numero : String) : Boolean;
Var
  i,d,b,
  Digito : Byte;
  Soma : Integer;
  CNPJ : Boolean;
  DgPass,
  DgCalc : String;
begin
  Result := False;
  Numero := ReturnNumbers(Numero);
  // Caso o número não seja 11 (CPF) ou 14 (CNPJ), aborta
//  Case Length(Numero) of
//    11: CNPJ := False;
//    14: CNPJ := True;
//  else Exit;
//  end;
  CNPJ := not pCpf;
  // Separa o número do digito
  DgCalc := '';
  DgPass := Copy(Numero,Length(Numero)-1,2);
  Numero := Copy(Numero,1,Length(Numero)-2);
  // Calcula o digito 1 e 2
  For d := 1 to 2 do begin
    B := varIIF(D=1,2,3); // BYTE
    SOMA := varIIF(D=1,0,STRTOINTDEF(DGCALC,0)*2);
    for i := Length(Numero) downto 1 do begin
      Soma := Soma + (Ord(Numero[I])-Ord('0'))*b;
      Inc(b);
      If (b > 9) And CNPJ Then
        b := 2;
    end;
   Digito := 11 - Soma mod 11;
   If Digito >= 10 then
     Digito := 0;
   DgCalc := DgCalc + Chr(Digito + Ord('0'));
  end;
  Result := DgCalc = DgPass;
end;

function IsValidIP( pIP : string ) : boolean;
var
   ipRegExp : string;
begin
    ipRegExp := '\b(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b';

    Result := TRegEx.IsMatch( pIP, ipRegExp ) ;
end;

function rc_TypeIsValid( pType : TRCValidateTypes; pContent : Variant ) : boolean;
var
   FS: TFormatSettings;
   dDt : TDateTime;
begin
  Result := false;

  Case pType of
       vtNotBlank : Result := pContent <> EmptyStr;

       vtNumbers  : Result := ReturnLetters( pContent ) = ''; // v. 4.0.0.6

       vtLetters  : Result := ReturnNumbers( pContent ) = ''; // v. 4.0.0.6

       vtIP       : Result := TRegEx.IsMatch( pContent, RegEx_IP4 ) ;//IsValidIP( pContent );

       vtEmail    : Result := TRegEx.IsMatch( pContent, RegEx_EMAIL ) ;//IsValidEmail( pContent );

       vtPASS     : Result := TRegEx.IsMatch( pContent, RegEx_PASS ) ;//IsValidEmail( pContent );

       vtCPF,
       vtCNPJ     : Result := IsValidCpfCnpj( pType = vtCPF, pContent );
       // v. 3.3.1.0
       vtDATE     : begin
                       case mm.varLT_Lang of
                            ltpt_BR : Result := TryStrToDate( pContent , dDt);
                            lten_US : begin
                                        FS := TFormatSettings.Create('en-US');
                                        Result := TryStrToDate( pContent , dDt, FS );
                                      end;
                            lten_GB : begin
                                        FS := TFormatSettings.Create('en-GB');
                                        Result := TryStrToDate( pContent , dDt, FS );
                                      end;
                            ltes_ES : Result := TryStrToDate( pContent , dDt);
                            ltfr_FR : Result := TryStrToDate( pContent , dDt);
                            ltde_DE : Result := TryStrToDate( pContent , dDt);
                            ltit_IT : Result := TryStrToDate( pContent , dDt);
                            lttr_TR : Result := TryStrToDate( pContent , dDt);
                            ltru_RU : Result := TryStrToDate( pContent , dDt);
                            ltzn_CH : Result := TryStrToDate( pContent , dDt);
                            ltin_ID : Result := TryStrToDate( pContent , dDt);
                            ltth_TH : Result := TryStrToDate( pContent , dDt);
                            lthi_IN : Result := TryStrToDate( pContent , dDt);
                            ltar_SA : Result := TryStrToDate( pContent , dDt);
                       end;

                    end;
  End;
end;
// v. 4.0.0.5
function rc_FormValidate(pFormFrame: TObject; pClear : boolean = false ) : boolean;
var
   i, l1, l2 : integer;
   oObj, oObj2, oObj3 : TUniControl;
   bValid, bTrue : boolean;
   // v. 3.3.1.0
   oFieldType : TFieldType;
   cPF, cPJ,
   cValid, cValid2, cValidType, cValidExpression, cV1, cV2, cV2And, cV2Or, cV2Eq, cV2Dif, cV2Gt, cV2GtE, cV2Lt, cV2LtE,
   cHint, cValidProccess, cTmp, cTmp2, cTmp3, cTmp4, cTmp5, cMsg, cMsgOr : string; // v. 4.0.0.5
   procedure rc_ExpressionValidate( pType : string );
   begin
       cMsgOr := '';
       if pType = '>=' then
       begin
          if cValidType = '<int>' then
          begin
             if ( not ( StrToIntDef( cTmp, 0 ) >= StrToIntDef( cV1, 0 ) ) ) then
                cMsg := '1';
          end
          else
          if cValidType = '<str>' then
          begin
             if ( not ( cTmp >= cV1 ) ) then
                cMsg := '1';
          end
          else
          if cValidType = '<float>' then
          begin
             if ( not ( StrToFloat_Universal( cTmp ) >= StrToFloat_Universal( cV1 ) ) ) then
                cMsg := '1';
          end
          else
          if cValidType = '<date>' then
          begin
             if ( not ( StrToDateDef( cTmp, 0 ) >= StrToDateDef( cV1, 0 ) ) ) then
                cMsg := '1';
          end;
       end
       else
       if pType = '<=' then
       begin
          if cValidType = '<int>' then
          begin
             if ( not ( StrToIntDef( cTmp, 0 ) <= StrToIntDef( cV1, 0 ) ) ) then
                cMsg := '1';
          end
          else
          if cValidType = '<str>' then
          begin
             if ( not ( cTmp <= cV1 ) ) then
                cMsg := '1';
          end
          else
          if cValidType = '<float>' then
          begin
             if ( not ( StrToFloat_Universal( cTmp ) <= StrToFloat_Universal( cV1 ) ) ) then
                cMsg := '1';
          end
          else
          if cValidType = '<date>' then
          begin
             if ( not ( StrToDateDef( cTmp, 0 ) <= StrToDateDef( cV1, 0 ) ) ) then
                cMsg := '1';
          end;
       end
       else
       if pType = '=' then
       begin
          if cValidType = '<int>' then
          begin
             if ( not ( StrToIntDef( cTmp, 0 ) = StrToIntDef( cV1, 0 ) ) ) then
                cMsg := '1';
          end
          else
          if cValidType = '<str>' then
          begin
             if ( not ( cTmp = cV1 ) ) then
                cMsg := '1';
          end
          else
          if cValidType = '<float>' then
          begin
             if ( not ( StrToFloat_Universal( cTmp ) = StrToFloat_Universal( cV1 ) ) ) then
                cMsg := '1';
          end
          else
          if cValidType = '<date>' then
          begin
             if ( not ( StrToDateDef( cTmp, 0 ) = StrToDateDef( cV1, 0 ) ) ) then
                cMsg := '1';
          end;
       end
       else
       if pType = '<>' then
       begin
          if cValidType = '<int>' then
          begin
             if ( not ( StrToIntDef( cTmp, 0 ) <> StrToIntDef( cV1, 0 ) ) ) then
                cMsg := '1';
          end
          else
          if cValidType = '<str>' then
          begin
             if ( not ( cTmp <> cV1 ) ) then
                cMsg := '1';
          end
          else
          if cValidType = '<float>' then
          begin
             if ( not ( StrToFloat_Universal( cTmp ) <> StrToFloat_Universal( cV1 ) ) ) then
                cMsg := '1';
          end
          else
          if cValidType = '<date>' then
          begin
             if ( not ( StrToDateDef( cTmp, 0 ) <> StrToDateDef( cV1, 0 ) ) ) then
                cMsg := '1';
          end;
       end
       else
       if pType = '<' then
       begin
          if cValidType = '<int>' then
          begin
             if ( not ( StrToIntDef( cTmp, 0 ) < StrToIntDef( cV1, 0 ) ) ) then
                cMsg := '1';
          end
          else
          if cValidType = '<str>' then
          begin
             if ( not ( cTmp < cV1 ) ) then
                cMsg := '1';
          end
          else
          if cValidType = '<float>' then
          begin
             if ( not ( StrToFloat_Universal( cTmp ) < StrToFloat_Universal( cV1 ) ) ) then
                cMsg := '1';
          end
          else
          if cValidType = '<date>' then
          begin
             if ( not ( StrToDateDef( cTmp, 0 ) < StrToDateDef( cV1, 0 ) ) ) then
                cMsg := '1';
          end;
       end
       else
       if pType = '>' then
       begin
          if cValidType = '<int>' then
          begin
             if ( not ( StrToIntDef( cTmp, 0 ) > StrToIntDef( cV1, 0 ) ) ) then
                cMsg := '1';
          end
          else
          if cValidType = '<str>' then
          begin
             if ( not ( cTmp > cV1 ) ) then
                cMsg := '1';
          end
          else
          if cValidType = '<float>' then
          begin
             if ( not ( StrToFloat_Universal( cTmp ) > StrToFloat_Universal( cV1 ) ) ) then
                cMsg := '1';
          end
          else
          if cValidType = '<date>' then
          begin
             if ( not ( StrToDateDef( cTmp, 0 ) > StrToDateDef( cV1, 0 ) ) ) then
                cMsg := '1';
          end;
       end;
   end;

   procedure rc_Expression_AndOr_Validate;//( pV1, pV2 : Variant ) ;
   begin
      if not cV2Eq.IsEmpty then
      begin
         if cV2And = '1' then
         begin
            if cValidType = '<int>' then
            begin
               if ( cMsg = '1' ) or not ( StrToIntDef( cTmp, 0 ) = StrToIntDef( cV2Eq, 0 ) ) then
                  cMsg := '1';
            end
            else
            if cValidType = '<str>' then
            begin
               if ( cMsg = '1' ) or not ( cTmp = cV2Eq ) then
                  cMsg := '1';
            end
            else
            if cValidType = '<float>' then
            begin
               if ( cMsg = '1' ) or not ( StrToFloat_Universal( cTmp ) = StrToFloat_Universal( cV2Eq ) ) then
                  cMsg := '1';
            end
            else
            if cValidType = '<date>' then
            begin
               if ( cMsg = '1' ) or not ( StrToDateDef( cTmp, 0 ) = StrToDateDef( cV2Eq, 0 ) ) then
                  cMsg := '1';
            end;
         end
         else
         begin
            if cValidType = '<int>' then
            begin
               if not ( StrToIntDef( cTmp, 0 ) = StrToIntDef( cV2Eq, 0 ) ) then
                  cMsgOr := '1';
            end
            else
            if cValidType = '<str>' then
            begin
               if not ( cTmp = cV2Eq ) then
                  cMsgOr := '1';
            end
            else
            if cValidType = '<float>' then
            begin
               if not ( StrToFloat_Universal( cTmp ) = StrToFloat_Universal( cV2Eq ) ) then
                  cMsgOr := '1';
            end
            else
            if cValidType = '<date>' then
            begin
               if not ( StrToDateDef( cTmp, 0 ) = StrToDateDef( cV2Eq, 0 ) ) then
                  cMsgOr := '1';
            end;
         end;
      end
      else
      if not cV2Dif.IsEmpty then
      begin
         if cV2And = '1' then
         begin
            if cValidType = '<int>' then
            begin
               if ( cMsg = '1' ) or not ( StrToIntDef( cTmp, 0 ) <> StrToIntDef( cV2Dif, 0 ) ) then
                  cMsg := '1';
            end
            else
            if cValidType = '<str>' then
            begin
               if ( cMsg = '1' ) or not ( cTmp <> cV2Dif ) then
                  cMsg := '1';
            end
            else
            if cValidType = '<float>' then
            begin
               if ( cMsg = '1' ) or not ( StrToFloat_Universal( cTmp ) <> StrToFloat_Universal( cV2Dif ) ) then
                  cMsg := '1';
            end
            else
            if cValidType = '<date>' then
            begin
               if ( cMsg = '1' ) or not ( StrToDateDef( cTmp, 0 ) <> StrToDateDef( cV2Dif, 0 ) ) then
                  cMsg := '1';
            end;
         end
         else
         begin
            if cValidType = '<int>' then
            begin
               if not ( StrToIntDef( cTmp, 0 ) <> StrToIntDef( cV2Dif, 0 ) ) then
                  cMsgOr := '1';
            end
            else
            if cValidType = '<str>' then
            begin
               if not ( cTmp <> cV2Dif ) then
                  cMsgOr := '1';
            end
            else
            if cValidType = '<float>' then
            begin
               if not ( StrToFloat_Universal( cTmp ) <> StrToFloat_Universal( cV2Dif ) ) then
                  cMsgOr := '1';
            end
            else
            if cValidType = '<date>' then
            begin
               if not ( StrToDateDef( cTmp, 0 ) <> StrToDateDef( cV2Dif, 0 ) ) then
                  cMsgOr := '1';
            end;
         end;
      end
      else
      if not cV2GtE.IsEmpty then
      begin
         if cV2And = '1' then
         begin
            if cValidType = '<int>' then
            begin
               if ( cMsg = '1' ) or not ( StrToIntDef( cTmp, 0 ) <> StrToIntDef( cV2GtE, 0 ) ) then
                  cMsg := '1';
            end
            else
            if cValidType = '<str>' then
            begin
               if ( cMsg = '1' ) or not ( cTmp <> cV2GtE ) then
                  cMsg := '1';
            end
            else
            if cValidType = '<float>' then
            begin
               if ( cMsg = '1' ) or not ( StrToFloat_Universal( cTmp ) <> StrToFloat_Universal( cV2GtE ) ) then
                  cMsg := '1';
            end
            else
            if cValidType = '<date>' then
            begin
               if ( cMsg = '1' ) or not ( StrToDateDef( cTmp, 0 ) <> StrToDateDef( cV2GtE, 0 ) ) then
                  cMsg := '1';
            end;
         end
         else
         begin
            if cValidType = '<int>' then
            begin
               if not ( StrToIntDef( cTmp, 0 ) <> StrToIntDef( cV2GtE, 0 ) ) then
                  cMsgOr := '1';
            end
            else
            if cValidType = '<str>' then
            begin
               if not ( cTmp <> cV2GtE ) then
                  cMsgOr := '1';
            end
            else
            if cValidType = '<float>' then
            begin
               if not ( StrToFloat_Universal( cTmp ) <> StrToFloat_Universal( cV2GtE ) ) then
                  cMsgOr := '1';
            end
            else
            if cValidType = '<date>' then
            begin
               if not ( StrToDateDef( cTmp, 0 ) <> StrToDateDef( cV2GtE, 0 ) ) then
                  cMsgOr := '1';
            end;
         end;
      end
      else
      if not cV2LtE.IsEmpty then
      begin
         if cV2And = '1' then
         begin
            if cValidType = '<int>' then
            begin
               if ( cMsg = '1' ) or not ( StrToIntDef( cTmp, 0 ) <= StrToIntDef( cV2LtE, 0 ) ) then
                  cMsg := '1';
            end
            else
            if cValidType = '<str>' then
            begin
               if ( cMsg = '1' ) or not ( cTmp <= cV2LtE )  then
                  cMsg := '1';
            end
            else
            if cValidType = '<float>' then
            begin
               if ( cMsg = '1' ) or not ( StrToFloat_Universal( cTmp ) <= StrToFloat_Universal( cV2LtE ) ) then
                  cMsg := '1';
            end
            else
            if cValidType = '<date>' then
            begin
               if ( cMsg = '1' ) or not ( StrToDateDef( cTmp, 0 ) <= StrToDateDef( cV2LtE, 0 ) ) then
                  cMsg := '1';
            end;
         end
         else
         begin
            if cValidType = '<int>' then
            begin
               if not ( StrToIntDef( cTmp, 0 ) <= StrToIntDef( cV2LtE, 0 ) ) then
                  cMsgOr := '1';
            end
            else
            if cValidType = '<str>' then
            begin
               if not ( cTmp <= cV2LtE ) then
                  cMsgOr := '1';
            end
            else
            if cValidType = '<float>' then
            begin
               if not ( StrToFloat_Universal( cTmp ) <= StrToFloat_Universal( cV2LtE ) ) then
                  cMsgOr := '1';
            end
            else
            if cValidType = '<date>' then
            begin
               if not ( StrToDateDef( cTmp, 0 ) <= StrToDateDef( cV2LtE, 0 ) ) then
                  cMsgOr := '1';
            end;
         end;
      end
      else
      if not cV2Gt.IsEmpty then
      begin
         if cV2And = '1' then
         begin
            if cValidType = '<int>' then
            begin
               if ( cMsg = '1' ) or not ( StrToIntDef( cTmp, 0 ) > StrToIntDef( cV2Gt, 0 ) ) then
                  cMsg := '1';
            end
            else
            if cValidType = '<str>' then
            begin
               if ( cMsg = '1' ) or not ( cTmp > cV2Gt ) then
                  cMsg := '1';
            end
            else
            if cValidType = '<float>' then
            begin
               if ( cMsg = '1' ) or not ( StrToFloat_Universal( cTmp ) > StrToFloat_Universal( cV2Gt ) ) then
                  cMsg := '1';
            end
            else
            if cValidType = '<date>' then
            begin
               if ( cMsg = '1' ) or not ( StrToDateDef( cTmp, 0 ) > StrToDateDef( cV2Gt, 0 ) ) then
                  cMsg := '1';
            end;
         end
         else
         begin
            if cValidType = '<int>' then
            begin
               if not ( StrToIntDef( cTmp, 0 ) > StrToIntDef( cV2Gt, 0 ) ) then
                  cMsgOr := '1';
            end
            else
            if cValidType = '<str>' then
            begin
               if not ( cTmp <> cV2Gt ) then
                  cMsgOr := '1';
            end
            else
            if cValidType = '<float>' then
            begin
               if not ( StrToFloat_Universal( cTmp ) > StrToFloat_Universal( cV2Gt ) ) then
                  cMsgOr := '1';
            end
            else
            if cValidType = '<date>' then
            begin
               if not ( StrToDateDef( cTmp, 0 ) > StrToDateDef( cV2Gt, 0 ) ) then
                  cMsgOr := '1';
            end;
         end;
      end
      else
      if not cV2Lt.IsEmpty then
      begin
         if cV2And = '1' then
         begin
            if cValidType = '<int>' then
            begin
               if ( cMsg = '1' ) or not ( StrToIntDef( cTmp, 0 ) < StrToIntDef( cV2Lt, 0 ) ) then
                  cMsg := '1';
            end
            else
            if cValidType = '<str>' then
            begin
               if ( cMsg = '1' ) or not( cTmp < cV2Lt ) then
                  cMsg := '1';
            end
            else
            if cValidType = '<float>' then
            begin
               if ( cMsg = '1' ) or not ( StrToFloat_Universal( cTmp ) < StrToFloat_Universal( cV2Lt ) ) then
                  cMsg := '1';
            end
            else
            if cValidType = '<date>' then
            begin
               if ( cMsg = '1' ) or not ( StrToDateDef( cTmp, 0 ) < StrToDateDef( cV2Lt, 0 ) ) then
                  cMsg := '1';
            end;
         end
         else
         begin
            if cValidType = '<int>' then
            begin
               if not ( StrToIntDef( cTmp, 0 ) < StrToIntDef( cV2Lt, 0 ) ) then
                  cMsgOr := '1';
            end
            else
            if cValidType = '<str>' then
            begin
               if not ( cTmp < cV2Lt ) then
                  cMsgOr := '1';
            end
            else
            if cValidType = '<float>' then
            begin
               if not ( StrToFloat_Universal( cTmp ) < StrToFloat_Universal( cV2Lt ) ) then
                  cMsgOr := '1';
            end
            else
            if cValidType = '<date>' then
            begin
               if not ( StrToDateDef( cTmp, 0 ) < StrToDateDef( cV2Lt, 0 ) ) then
                  cMsgOr := '1';
            end;
         end;
      end;

      if cV2Or <> '' then
      begin
           if ( cMsg <> '1' ) or ( cMsgOr <> '1' ) then
              cMsg := '';
      end;
   end;

begin
  Result := True;

  for I := 1 to TComponent( pFormFrame ).ComponentCount - 1 do
  begin
     if ( TComponent( pFormFrame ).Components[I] is TUniControl ) then
     begin
        oObj  := TUniControl ( TComponent( pFormFrame ).Components[I] );

        If GetPropInfo( oObj.ClassInfo, 'Hint') <> nil then
        begin
           cHint := oObj.Hint;
           while Pos( 'valid:', cHint ) > 0 do
           begin
              //unisession.Log('I:' + i.ToString + ' oObj:' + oObj.Name + ' cHint:' + cHint );
              if rc_PosHintProperty( 'valid:', cHint ) > 0 then
              begin
                 if pClear then
                    rc_RemoveCssClass( oObj , 'rc-invalid' )
                 else
                 begin
                    cValid := rc_GetHintProperty( 'valid:', cHint ) + ' ';
                    cValidProccess := cValid;
                    cMsg := '';
                    cTmp := '@#$%¨&*-+!';
                    If GetPropInfo( oObj.ClassInfo, 'DataSource') <> nil then
                    begin
                       // v. 4.1.0.1 - thanks for bug tracker - Mr. JOSAURO
                       cTmp := TUniDBEdit( oObj ).Text;
                       if oObj.ClassNameIs( 'TUniDBDateTimePicker' ) then
                          oFieldType := TDataSet( TUniDBDateTimePicker( oObj ).DataSource.DataSet ).FieldByName( TUniDBDateTimePicker( oObj ).DataField ).DataType
                       else
                       if oObj.ClassNameIs( 'TUniDBComboBox' ) then
                          oFieldType := TDataSet( TUniDBComboBox( oObj ).DataSource.DataSet ).FieldByName( TUniDBComboBox( oObj ).DataField ).DataType
                       else
                       if oObj.ClassNameIs( 'TUniDBLookupComboBox' ) then
                          oFieldType := TDataSet( TUniDBLookupComboBox( oObj ).DataSource.DataSet ).FieldByName( TUniDBLookupComboBox( oObj ).DataField ).DataType
                       else
                       if oObj.ClassNameIs( 'TUniDBMemo' ) then
                          oFieldType := TDataSet( TUniDBMemo( oObj ).DataSource.DataSet ).FieldByName( TUniDBMemo( oObj ).DataField ).DataType
                       else
                       if oObj.ClassNameIs( 'TUniDBNumberEdit' ) then
                          oFieldType := TDataSet( TUniDBNumberEdit( oObj ).DataSource.DataSet ).FieldByName( TUniDBNumberEdit( oObj ).DataField ).DataType
                       else
                       if oObj.ClassNameIs( 'TUniDBFormattedNumberEdit' ) then
                          oFieldType := TDataSet( TUniDBFormattedNumberEdit( oObj ).DataSource.DataSet ).FieldByName( TUniDBFormattedNumberEdit( oObj ).DataField ).DataType
                       else
                       if oObj.ClassNameIs( 'TUniDBEdit' ) then
                          oFieldType := TDataSet( TUniDBEdit( oObj ).DataSource.DataSet ).FieldByName( TUniDBEdit( oObj ).DataField ).DataType
                       else
                          oFieldType := ftUnknown;
                    end
                    // v. 4.1.0.1
                    else
                    If GetPropInfo( oObj.ClassInfo, 'Text') <> nil then
                    begin
                       cTmp := TUniEdit( oObj ).Text;
                       oFieldType := ftUnknown;
                    end
                    else
                    If GetPropInfo( oObj.ClassInfo, 'Lines') <> nil then
                    begin
                       cTmp := TUniMemo( oObj ).Lines.Text;
                       oFieldType := ftUnknown;
                    end;

                    if cTmp <> '@#$%¨&*-+!' then
                    begin
                       // v. 3.3.1.0
                       cV1    := '';
                       cV2And := '';
                       cV2Or  := '';
                       cV2Eq  := '';
                       cV2Dif := '';
                       cV2Gt  := '';
                       cV2GtE := '';
                       cV2Lt  := '';
                       cV2LtE := '';
                       //cValid := rc_GetHintProperty( 'valid:', cHint ) + ' ';
                       cValidExpression := cValid;
                       cValid2:= '';
                       cValidType := '';

                       if ( Pos( '<int>' , cValid ) > 0 ) or ( DataTypeIsInt( oFieldType ) ) then
                          cValidType := '<int>'
                       else
                       if ( Pos( '<str>' , cValid ) > 0 ) or ( oFieldType = ftString ) then
                          cValidType := '<str>'
                       else
                       if ( Pos( '<float>' , cValid ) > 0 ) or ( DataTypeIsFloat( oFieldType ) ) then
                          cValidType := '<float>'
                       else
                       if ( Pos( '<date>' , cValid ) > 0 ) or ( ( oFieldType = ftDate ) or ( oFieldType = ftDateTime ) ) then
                          cValidType := '<date>';
                       if cValidType <> '' then
                          cValid := StringReplace( cValid, cValidType, '', [rfReplaceAll] );

                       if Pos( ' and ' , cValid ) > 0 then
                       begin
                          cV2And  := '1';
                          cValid2 := Trim( Copy( cValid  , Pos( ' and ' , cValid ) + 5 ) );
                          cValid  := StringReplace( cValid, ' and ' + cValid2, '', [rfReplaceAll] );

                          if Copy( cValid2, 1, 1 ) = '=' then
                             cV2Eq := Trim( Copy( cValid2 , 2 ) )
                          else
                          if Copy( cValid2, 1, 2 ) = '<>' then
                             cV2Dif := Trim( Copy( cValid2 , 3 ) )
                          else
                          if Copy( cValid2, 1, 2 ) = '>=' then
                             cV2GtE := Trim( Copy( cValid2 , 3 ) )
                          else
                          if Copy( cValid2, 1, 2 ) = '<=' then
                             cV2LtE := Trim( Copy( cValid2 , 3 ) )
                          else
                          if Copy( cValid2, 1, 1 ) = '>' then
                             cV2Gt := Trim( Copy( cValid2 , 2 ) )
                          else
                          if Copy( cValid2, 1, 1 ) = '<' then
                             cV2Lt := Trim( Copy( cValid2 , 2 ) );
                       end
                       else
                       if Pos( ' or ' , cValid ) > 0 then
                       begin
                          cV2Or  := '1';
                          cValid2 := Trim( Copy( cValid  , Pos( ' or ' , cValid ) + 4 ) );
                          cValid  := StringReplace( cValid, ' or ' + cValid2, '', [rfReplaceAll] );
                          if Copy( cValid2, 1, 1 ) = '=' then
                             cV2Eq := Trim( Copy( cValid2 , 2 ) )
                          else
                          if Copy( cValid2, 1, 2 ) = '<>' then
                             cV2Dif := Trim( Copy( cValid2 , 3 ) )
                          else
                          if Copy( cValid2, 1, 2 ) = '>=' then
                             cV2GtE := Trim( Copy( cValid2 , 3 ) )
                          else
                          if Copy( cValid2, 1, 2 ) = '<=' then
                             cV2LtE := Trim( Copy( cValid2 , 3 ) )
                          else
                          if Copy( cValid2, 1, 1 ) = '>' then
                             cV2Gt := Trim( Copy( cValid2 , 2 ) )
                          else
                          if Copy( cValid2, 1, 1 ) = '<' then
                             cV2Lt := Trim( Copy( cValid2 , 2 ) );
                       end;
                       // v. 3.3.1.0
                       cMsg   := '';
                       cMsgOr := '';
                       if cValidType <> '' then
                       begin
                          cMsg := '0';
                          if Copy( cValid, 1, 2 ) = '<>' then
                          begin
                               cV1 := Trim( Copy( cValid, 3, Pos( ' ' , cValid ) - 1 ) );

                               rc_ExpressionValidate( '<>' );
                          end
                          else
                          if Copy( cValid, 1, 1 ) = '=' then
                          begin
                               cV1 := Trim( Copy( cValid, 2, Pos( ' ' , cValid ) - 1 ) );

                               rc_ExpressionValidate( '=' );
                          end
                          else
                          if Copy( cValid, 1, 2 ) = '>=' then
                          begin
                               cV1 := Trim( Copy( cValid, 3, Pos( ' ' , cValid ) - 1 ) );

                               rc_ExpressionValidate( '>=' );
                          end
                          else
                          if Copy( cValid, 1, 2 ) = '<=' then
                          begin
                               cV1 := Trim( Copy( cValid, 3, Pos( ' ' , cValid ) - 1 ) );

                               rc_ExpressionValidate( '<=' );
                          end
                          else
                          if Copy( cValid, 1, 1 ) = '<' then
                          begin
                               cV1 := Trim( Copy( cValid, 2, Pos( ' ' , cValid ) - 1 ) );

                               rc_ExpressionValidate( '<' );
                          end
                          else
                          if Copy( cValid, 1, 1 ) = '>' then
                          begin
                               cV1 := Trim( Copy( cValid, 2, Pos( ' ' , cValid ) - 1 ) );

                               rc_ExpressionValidate( '>' );
                          end;
                          if ( not cValid2.IsEmpty ) then
                             rc_Expression_AndOr_Validate;
                          // expression validate results
                          if ( cMsg = '1' ) then // or ( cMsgOr = '1' ) then
                          begin
                               cMsg := mm.MSG_VALIDATE_INVALID_VALUE + '<br>( ' + cValidExpression + ' )' ;
                               rc_AddCssClass( oObj , 'rc-invalid' );
                               oObj.Hint := rc_SetHintProperty( 'true' , {v. 4.0.0.5}'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro
                          end
                          else
                          if cMsg = '0' then
                          begin
                              cMsg   := '';
                              rc_RemoveCssClass( oObj , 'rc-invalid' );
                              oObj.Hint := rc_SetHintProperty( 'false' , {v. 4.0.0.5}'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro
                          end;
                       end;
                       if cValid = 'YN' then
                       begin
                            if ( Pos( mm.VALUE_YES, cTmp ) = 0 ) and ( Pos( mm.VALUE_NO, cTmp ) = 0 ) then
                            begin
                                 cMsg := mm.MSG_VALIDATE_INVALID_VALUE +  '<br>( ' + mm.VALUE_YES + '/' + mm.VALUE_NO + ' )' ;

                                 rc_AddCssClass( oObj , 'rc-invalid' );
                                 oObj.Hint := rc_SetHintProperty( 'true' , {v. 4.0.0.5}'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro
                            end
                            else
                            begin
                                rc_RemoveCssClass( oObj , 'rc-invalid' );
                                oObj.Hint := rc_SetHintProperty( 'false' , {v. 4.0.0.5}'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro
                            end;
                       end;
                       // v. 4.0.0.5
                       cTmp2 := rc_GetHintProperty( 'valid:', cHint );
                       if Pos( 'valid:blank', cHint ) > 0 then
                       begin
                            bValid := true;
                            bTrue  := false;
                            oObj3  := nil;
                            cTmp3  := rc_GetHintProperty( 'ifvisible:', cHint );
                            if cTmp3 <> '' then
                            begin
                                 oObj3 := TUniControl( TComponent(pFormFrame).FindComponent( cTmp3 ) );
                                 if ( oObj3 <> nil ) then
                                    bTrue := oObj3.Visible ;
                            end
                            else
                            begin
                               cTmp3  := rc_GetHintProperty( 'ifenabled:', cHint );
                               if cTmp3 <> '' then
                               begin
                                    oObj3 := TUniControl( TComponent(pFormFrame).FindComponent( cTmp3 ) );
                                    if ( oObj3 <> nil ) then
                                       bTrue := oObj3.Enabled ;
                               end;
                            end;
                            if ( oObj3 = nil ) or ( ( oObj3 <> nil ) and ( bTrue ) ) then
                               bValid := ( rc_TypeIsValid( vtNotBlank, cTmp ) );

                            if ( not bValid ) then
                            begin
                                 //v. 4.1.0.0
                                 if Pos( '=', cHint ) > 0 then
                                 begin
                                    if Pos( ':', cTmp2 ) > 0 then
                                       cTmp2 := rc_GetHintProperty( 'valid:', cHint , true);
                                 end;

                                 // v. 4.1.0.0 bug fix #1 ( thanks GUSTAVO from GRSOFT )
                                 cTmp2 := StringReplace( cTmp2, 'blank=', '', [rfReplaceAll] );
                                 if cTmp2 <> '' then
                                    cMsg := Format( mm.MSG_VALIDATE_BLANK_FIELD, [' [' + cTmp2 + '] '] )
                                 else
                                    cMsg := Format( mm.MSG_VALIDATE_BLANK_FIELD, ['']  );

                                 rc_AddCssClass( oObj , 'rc-invalid' );
                                 oObj.Hint := rc_SetHintProperty( 'true' , {v. 4.0.0.5}'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro
                            end
                            else
                            begin
                                rc_RemoveCssClass( oObj , 'rc-invalid' );
                                oObj.Hint := rc_SetHintProperty( 'false' , {v. 4.0.0.5}'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro
                            end;
                       end;
                       // v. 4.0.0.5
                       if Pos( 'valid:not-exists', cHint ) > 0 then
                       begin
                            //if not ( rc_TypeIsValid( vtIP, cTmp ) ) then
                            if rc_RecordExists( pFormFrame, oObj, false ) then
                            begin
                                 cMsg := Format( mm.MSG_VALIDATE_INVALID_EXISTS, ['']  );
                            end
                            else
                            begin
                                rc_RemoveCssClass( oObj , 'rc-invalid' );
                                oObj.Hint := rc_SetHintProperty( 'false' , {v. 4.0.0.5}'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro
                            end;
                       end;

                       if Pos( 'valid:ip', cHint ) > 0 then
                       begin
                            if not ( rc_TypeIsValid( vtIP, cTmp ) ) then
                            begin
                                 if ( Pos( ' notblank', cHint ) = 0 ) or ( Pos( ' notblank', cHint ) > 0 ) and ( ReturnNumbers( cTmp ) <> '' ) then
                                 begin
                                    cMsg := 'IP: ' + mm.MSG_INVALID + ' ' + mm.MSG_VALIDATE_OR_BLANK_CONTENT;
                                    rc_AddCssClass( oObj , 'rc-invalid' );
                                    oObj.Hint := rc_SetHintProperty( 'true' , {v. 4.0.0.5}'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro
                                 end;
                            end
                            else
                            begin
                                rc_RemoveCssClass( oObj , 'rc-invalid' );
                                oObj.Hint := rc_SetHintProperty( 'false' , {v. 4.0.0.5}'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro
                            end;
                       end;

                       if Pos( 'valid:date', cHint ) > 0 then
                       begin
                            if ( not ( rc_TypeIsValid( vtDATE, cTmp ) ) ) or ( cTmp = '30/12/1899' ) then
                            begin
                                 if ( Pos( ' notblank', cHint ) = 0 ) or ( Pos( ' notblank', cHint ) > 0 ) and ( cTmp <> '' ) then
                                 begin
                                    cMsg := mm.MSG_DATETYPE + ': ' + mm.MSG_INVALID + ' ' + mm.MSG_VALIDATE_OR_BLANK_CONTENT;
                                    rc_AddCssClass( oObj , 'rc-invalid' );
                                    oObj.Hint := rc_SetHintProperty( 'true' , {v. 4.0.0.5}'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro
                                 end;
                            end
                            else
                            begin
                                rc_RemoveCssClass( oObj , 'rc-invalid' );
                                oObj.Hint := rc_SetHintProperty( 'false' , {v. 4.0.0.5}'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro
                            end;
                       end;

                       if Pos( 'valid:email', cHint ) > 0 then
                       begin
                            if not ( rc_TypeIsValid( vtEmail, cTmp ) ) then
                            begin
                                 if ( Pos( ' notblank', cHint ) = 0 ) or ( Pos( ' notblank', cHint ) > 0 ) and ( cTmp <> '' ) then
                                 begin
                                    cMsg := 'Email: ' + mm.MSG_INVALID + ' ' + mm.MSG_VALIDATE_OR_BLANK_CONTENT;
                                    rc_AddCssClass( oObj , 'rc-invalid' );
                                    oObj.Hint := rc_SetHintProperty( 'true' , {v. 4.0.0.5}'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro
                                 end;
                            end
                            else
                            begin
                                rc_RemoveCssClass( oObj , 'rc-invalid' );
                                oObj.Hint := rc_SetHintProperty( 'false' , {v. 4.0.0.5}'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro
                            end;
                       end;

                       // The RegEX context applyed here sometimes "broken"...I am still trying to undestand why.
                       if Pos( 'valid:pass', cHint ) > 0 then
                       begin
                            if not ( rc_TypeIsValid( vtPASS, cTmp ) ) then
                            begin
                               if ( Pos( ' notblank', cHint ) = 0 ) or ( Pos( ' notblank', cHint ) > 0 ) and ( cTmp <> '' ) then
                               begin
                                  cMsg := mm.MSG_VALIDATE_PASSWORD;
                                  rc_AddCssClass( oObj , 'rc-invalid' );
                                  oObj.Hint := rc_SetHintProperty( 'true' , {v. 4.0.0.5}'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro
                               end;
                            end
                            else
                            begin
                                rc_RemoveCssClass( oObj , 'rc-invalid' );
                                oObj.Hint := rc_SetHintProperty( 'false' , {v. 4.0.0.5}'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro
                            end;
                       end;

                       cTmp3 := rc_GetHintProperty( 'valid:', cHint );
                       if Pos( 'min-', cTmp3 ) > 0 then
                       begin
                            // v. 4.0.0.0
                            cTmp3 := StringReplace( cTmp3, 'min-', '', [rfReplaceAll] ) + ' ' ;
                            cTmp3 := Copy( cTmp3, 1, Pos( ' ', cTmp3 ) - 1 );
                            l1 := StrToIntDef( cTmp3, 0 );

                            if rc_GetHintProperty( 'mask:', oObj.Hint ) <> '' then
                               cTmp4 := StrTokenClear( TUniEdit( oObj ).Text )
                            else
                               cTmp4 := TUniEdit( oObj ).Text;

                            l2 := Length( cTmp4 );
                            if l2 < l1 then
                            begin
                               if ( Pos( ' notblank', cHint ) = 0 ) or ( Pos( ' notblank', cHint ) > 0 ) and ( cTmp <> '' ) then
                               begin
                                  cMsg := format( mm.MSG_VALIDATE_LENGTH_MIN, [ l1.ToString, l2.ToString ] );
                                  rc_AddCssClass( oObj , 'rc-invalid' );
                                  oObj.Hint := rc_SetHintProperty( 'true' , {v. 4.0.0.5}'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro
                               end;
                            end
                            else
                            begin
                                rc_RemoveCssClass( oObj , 'rc-invalid' );
                                oObj.Hint := rc_SetHintProperty( 'false' , {v. 4.0.0.5}'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro
                            end;
                       end;

                       cTmp3 := rc_GetHintProperty( 'valid:', cHint );
                       if Pos( 'max-', cTmp3 ) > 0 then
                       begin
                            // v. 4.0.0.0
                            cTmp3 := StringReplace( cTmp3, 'max-', '', [rfReplaceAll] ) + ' ' ;
                            cTmp3 := Copy( cTmp3, 1, Pos( ' ', cTmp3 ) - 1 );
                            l1 := StrToIntDef( cTmp3, 0 );

                            if rc_GetHintProperty( 'mask:', oObj.Hint ) <> '' then
                               cTmp4 := StrTokenClear( TUniEdit( oObj ).Text )
                            else
                               cTmp4 := TUniEdit( oObj ).Text;

                            l2 := Length( cTmp4 );
                            if l2 > l1 then
                            begin
                               if ( Pos( ' notblank', cHint ) = 0 ) or ( Pos( ' notblank', cHint ) > 0 ) and ( cTmp <> '' ) then
                               begin
                                  cMsg := format( mm.MSG_VALIDATE_LENGTH_MAX, [ l1.ToString, l2.ToString ] );
                                  rc_AddCssClass( oObj , 'rc-invalid' );
                                  oObj.Hint := rc_SetHintProperty( 'true' , {v. 4.0.0.5}'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro
                               end;
                            end
                            else
                            begin
                                rc_RemoveCssClass( oObj , 'rc-invalid' );
                                oObj.Hint := rc_SetHintProperty( 'false' , {v. 4.0.0.5}'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro
                            end;
                       end;

                       // CPF and CNPJ are brazilian document types
                       if ( Pos( 'valid:cpfcnpj', cHint ) > 0 ) or ( Pos( 'valid:cnpjcpf', cHint ) > 0 ) or
                          ( Pos( 'valid:cpf', cHint ) > 0 ) or ( Pos( 'valid:cnpj', cHint ) > 0 ) then
                       begin
                            // campo PESSOA
                            cTmp3 := '';
                            oObj2 := nil;
                            if Pos( ' &', cHint ) > 0 then
                            begin
                                 cTmp2 := StringReplace( Trim( Copy( cHint, Pos( ' &', cHint ) + 1, 100 ) ), '|', '', [rfReplaceAll] ) + ' ';

                                 cTmp3 := Copy( cTmp2, Pos( '"', cTmp2 ) + 1 , 100 );
                                 cTmp2 := trim( Copy( cTmp2, 2, Pos( '=' , cTmp2 ) - 2 ) );
                                 cTmp3 := Copy( cTmp3, 1, Pos( '"', cTmp3 ) - 1 );

                                 cPf   := Copy( cTmp3, 1, Pos( ' ', cTmp3 ) - 1 );
                                 cPj   := Copy( cTmp3, Pos( ' ', cTmp3 ) + 1, 100 );

                                 oObj2  := TUniControl ( TComponent( pFormFrame ).FindComponent( cTmp2 ) );

                                 if oObj2 <> nil then
                                 begin
                                      If GetPropInfo( oObj2.ClassInfo, 'DataSource') <> nil then
                                         cTmp4 := TUniDBEdit( oObj2 ).Text
                                      else
                                      If GetPropInfo( oObj2.ClassInfo, 'Text') <> nil then
                                         cTmp4 := TUniEdit( oObj2 ).Text;
                                      // v. 4.0.0.5
                                      cTmp5 := rc_GetHintProperty( 'cbbxdata:' , TUniDBComboBox( oObj2 ).Hint ) + ',' ;
                                      l2 := Pos( cTmp4, cTmp5 );
                                      if l2 > 0 then
                                      begin
                                          cTmp3 := Copy( cTmp5, l2 );
                                          cTmp3 := Copy( cTmp3 , 1, Pos( ',', cTmp3 ) - 1 );
                                          cTmp3 := Copy( cTmp3 , Pos( '=', cTmp3 ) + 1 );
                                          cTmp4 := cTmp3;
                                      end;
                                 end;
                            end;

                            if cTmp4 <> '' then
                            begin
                                if ( Pos( 'valid:cpfcnpj', cHint ) > 0 ) and ( cTmp4 = cPF ) and ( not rc_TypeIsValid( vtCPF, cTmp ) ) then
                                begin
                                   if ( Pos( ' notblank', cHint ) = 0 ) or ( ( Pos( ' notblank', cHint ) > 0 ) and ( ReturnNumbers( cTmp ) <> '' ) ) then
                                   begin
                                      cMsg := 'Cpf inválido ou em branco !';
                                      rc_AddCssClass( oObj , 'rc-invalid' );
                                      oObj.Hint := rc_SetHintProperty( 'true' , {v. 4.0.0.5}'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro
                                   end;
                                end
                                else
                                if ( Pos( 'valid:cpfcnpj', cHint ) > 0 ) and ( cTmp4 = cPJ ) and ( not rc_TypeIsValid( vtCNPJ, cTmp ) ) then
                                begin
                                   if ( Pos( ' notblank', cHint ) = 0 ) or ( Pos( ' notblank', cHint ) > 0 ) and ( ReturnNumbers( cTmp ) <> '' ) then
                                   begin
                                      cMsg := 'Cnpj inválido ou em branco!';
                                      rc_AddCssClass( oObj , 'rc-invalid' );
                                      oObj.Hint := rc_SetHintProperty( 'true' , {v. 4.0.0.5}'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro
                                   end;
                                end
                                else
                                begin
                                    rc_RemoveCssClass( oObj , 'rc-invalid' );
                                    oObj.Hint := rc_SetHintProperty( 'false' , {v. 4.0.0.5}'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro
                                end;
                            end
                            else
                            if ( ( Pos( 'valid:cpf', cHint ) > 0 ) and ( Length( ReturnNumbers( cTmp ) ) <= 11 ) ) and ( not rc_TypeIsValid( vtCPF, cTmp ) ) then
                            begin
                               if ( Pos( ' notblank', cHint ) = 0 ) or ( Pos( ' notblank', cHint ) > 0 ) and ( ReturnNumbers( cTmp ) <> '' ) then
                               begin
                                  cMsg := 'Cpf inválido !';
                                  rc_AddCssClass( oObj , 'rc-invalid' );
                                  oObj.Hint := rc_SetHintProperty( 'true' , {v. 4.0.0.5}'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro
                               end
                               else
                               begin
                                   rc_RemoveCssClass( oObj , 'rc-invalid' );
                                   oObj.Hint := rc_SetHintProperty( 'false' , {v. 4.0.0.5}'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro
                               end;
                            end
                            else
                            if ( ( Pos( 'valid:cnpj', cHint ) > 0 ) and ( Length( ReturnNumbers( cTmp ) ) <= 14 ) ) and ( not rc_TypeIsValid( vtCNPJ, cTmp ) ) then
                            begin
                               if ( Pos( ' notblank', cHint ) = 0 ) or ( Pos( ' notblank', cHint ) > 0 ) and ( ReturnNumbers( cTmp ) <> '' ) then
                               begin
                                  cMsg := 'Cnpj inválido !';
                                  rc_AddCssClass( oObj , 'rc-invalid' );
                                  oObj.Hint := rc_SetHintProperty( 'true' , {v. 4.0.0.5}'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro
                               end
                               else
                               begin
                                   rc_RemoveCssClass( oObj , 'rc-invalid' );
                                   oObj.Hint := rc_SetHintProperty( 'false' , {v. 4.0.0.5}'invalidate:', oObj.Hint ); //para limpar ao cancelar o cadastro
                               end;
                            end;
                       end;
                    end;

                    if cMsg <> EmptyStr then
                    begin
                        Result := False;
                        dm_rc.rc_ShowSweetAlert( mm.MSG_WARNING, cMsg, 'warning', pFormFrame, oObj.Name ); // v. 4.1.0.0
                    end;
                 end;
              end;
              cHint := StringReplace( cHint, 'valid:' + trim(cValidProccess), '', [rfReplaceAll] );
           end;
        end;
     end;
  end;
end;
end.
