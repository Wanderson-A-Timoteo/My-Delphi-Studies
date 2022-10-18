unit mkm_gridblock; // v. 4.1.0.0

interface

uses
    System.SysUtils, System.Classes , System.TypInfo, JSON, DBXJSON, DBXJSONReflect,
    {$ifdef MSWINDOWS}
    winapi.Windows,
    {$endif}
    System.DateUtils, math, System.Rtti, System.StrUtils, Vcl.Graphics, vcl.Controls,
    uniComboBox, uniDBComboBox,uniDBLookupComboBox, uniDateTimePicker, uniDBDateTimePicker,  uniListBox,
    uniBitBtn, uniButton, uniEdit, UniDBEdit, UniSpeedButton, uniGUIFrame, uniGUIForm,  uniGUIDialogs, Messages,
    uniGUIClasses, uniGUIAbstractClasses,  uniGUIApplication, uniPanel, IniFiles, UniImage, uniLabel,  Unipagecontrol,
    uniMemo, uniDBMemo, uniGUIRegClasses, uniDBNavigator, uniScrollBox,
    UniDBRadioGroup, uniDBCheckBox, uniDBImage, uniDBText, System.Types, System.Generics.Collections,
    Variants, pngimage, jpeg, vcl.stdctrls, uniCheckBox, uniTreeMenu,
    uconsts ;

procedure rc_ResizeBlocksExecute( pFrame : TObject = nil;
                                  iMenu : integer = 0;
                                  iOffSet : integer = 15;
                                  iOffSet_Border : integer = 15;
                                  iNumBlocks : integer = 12;
                                  iAreaAvailableH : integer = 0;
                                  iAreaAvailableV : integer = 0;
                                  iResponsivenessLimitH : integer = 0;
                                  iResponsivenessLimitV : integer = 0;
                                  bMobileScreen : boolean = false;
                                  bMobileScreenPortrait : boolean = false;
                                  bMobileScreenLandScape : boolean = false;
                                  bDesktop : boolean = false // v. 4.0.0.4
                                  );
function  rc_GetBlockPrior( pBlock, pFrameOrig : TObject ) : string;
function  rc_GetBlockNext( pBlock, pFrameOrig : TObject ) : string;
function  rc_GetBlockHeight( oObj, pFrame : TObject; pParamBlk, pAttrib : string ) : integer;

implementation

uses str_func, mkm_func_web, mkm_layout;//, StrUtilsEx; // v. 4.0.0.1

function rc_GetBlockPrior( pBlock, pFrameOrig : TObject ) : string;
var
   n, f, i : integer;
   cSeq : string;
   oObject : TUniContainerPanel;
begin
     oObject := nil;

     if pBlock <> nil then
     begin
        cSeq := ReturnNumbers( TComponent(pBlock).Name );

        if Pos( '_', cSeq ) > 0 then
        begin
           n := StrToIntDef( Copy( cSeq, 1, Pos( '_' , cSeq ) - 1 ) , 0 );
           f := StrToIntDef( Copy( cSeq, Pos( '_' , cSeq ) + 1 , 5 ) , 0 );
        end
        else
        begin
           f := StrToIntDef( cSeq, 0 );
        end;

        for I := ( f - 1 ) downto 1 do
        begin
            if Pos( '_', cSeq ) > 0 then
               cSeq := n.ToString + '_' + i.ToString
            else
               cSeq := i.ToString;

            oObject := TUniContainerPanel( rc_FindControl( 'rcBlock' + cSeq , pFrameOrig ) );

            if oObject <> nil then
               if oObject.Enabled then
                  Break else cSeq := '';
        end;
     end;

     Result := cSeq;
end;

function rc_GetBlockNext( pBlock, pFrameOrig : TObject ) : string;
var
   n, f, i : integer;
   cSeq : string;
   oObject : TUniContainerPanel;
begin
     oObject := nil;

     if pBlock <> nil then
     begin
        cSeq := ReturnNumbers( TComponent(pBlock).Name );

        if Pos( '_', cSeq ) > 0 then
        begin
           n := StrToIntDef( Copy( cSeq, 1, Pos( '_' , cSeq ) - 1 ) , 0 );
           f := StrToIntDef( Copy( cSeq, Pos( '_' , cSeq ) + 1 , 5 ) , 0 );
        end
        else
        begin
           f := StrToIntDef( cSeq, 0 );
        end;

        for I := ( f + 1 ) to ( f + 5000 ) do
        begin
            if Pos( '_', cSeq ) > 0 then
               cSeq := n.ToString + '_' + i.ToString
            else
               cSeq := i.ToString;

            oObject := TUniContainerPanel( rc_FindControl( 'rcBlock' + cSeq , pFrameOrig ) );

            if oObject <> nil then
               if oObject.Enabled then
                  Break else cSeq := '';
        end;
     end;

     Result := cSeq;
end;

function rc_GetBlockHeight( oObj, pFrame : TObject; pParamBlk, pAttrib : string ) : integer;
var
   cTemp2, cTemp3 : string;
   x, y : integer;
   oObjTemp2 : TUniControl;
begin
   Result := 0;
   cTemp2 := Trim( Copy( pParamBlk, Pos( pAttrib + '-' , pParamBlk ) + 3 , 200 ) );

   if Pos( ' ' , cTemp2 ) > 0 then
      cTemp2 := Trim( Copy( cTemp2, 1, Pos( ' ', cTemp2 ) ) );

   if ReturnLetters( cTemp2 ) <> '' then
   begin
        if Pos( '(' , cTemp2 ) > 0 then
        begin
             x := Pos( '+', cTemp2 );

             cTemp3 := Copy( cTemp2, 2, x - 2 );
             oObjTemp2 := TUniControl( rc_FindControl( cTemp3 , pFrame ) );

             if oObjTemp2 <> nil then
             begin
                cTemp3 := Copy( cTemp2, x + 1, 20 );
                y := Pos( ')', cTemp3 ) - 1;
                cTemp2 := Copy( cTemp3, 1, y );

                if x > 0 then
                begin
                   x := TUniControl(oObjTemp2).Height + StrToIntDef( cTemp2, 0  );
                end
                else
                begin
                    x := Pos( '-', cTemp2 );
                    cTemp3 := Copy( cTemp2, x + 1, 20 );
                    y := Pos( ')', cTemp3 ) - 1;
                    cTemp2 := Copy( cTemp3, 1, y );

                    if x > 0 then
                    begin
                       x := TUniControl(oObjTemp2).Height - StrToIntDef( cTemp2, 0  );
                    end
                    else
                    begin
                       x := Pos( '*', cTemp2 );
                       cTemp3 := Copy( cTemp2, x + 1, 20 );
                       y := Pos( ')', cTemp3 ) - 1;
                       cTemp2 := Copy( cTemp3, 1, y );

                       if x > 0 then
                       begin
                          x := TUniControl(oObjTemp2).Height * StrToIntDef( cTemp2, 0  );
                       end
                       else
                       begin
                          x := Pos( '/', cTemp2 );
                          cTemp3 := Copy( cTemp2, x + 1, 20 );
                          y := Pos( ')', cTemp3 ) - 1;
                          cTemp2 := Copy( cTemp3, 1, y );

                          if x > 0 then
                          begin
                             x := Trunc( TUniControl(oObjTemp2).Height / StrToIntDef( cTemp2, 1  ) );
                          end
                          else
                          begin
                             x := TUniControl( oObjTemp2 ).Height;
                          end;
                       end;
                    end;
                end;
             end
             else
                x := TUniControl( oObj ).Height;

             Result := x;
        end
        else
        begin
             oObjTemp2 := TUniControl( rc_FindControl( cTemp2 , pFrame ) );
             if oObjTemp2 <> nil then
                Result := TUniControl( oObjTemp2 ).Height;
        end;
   end
   else
   begin
      pParamBlk := Trim( Copy( pParamBlk, Pos( pAttrib , pParamBlk ) + 3 , 5 ) );

      if Pos( ' ' , pParamBlk ) > 0 then
         pParamBlk := Trim( Copy( pParamBlk, 1, Pos( ' ' , pParamBlk ) - 1 ) );

      Result := StrToIntDef( pParamBlk , TUniControl( oObj ).Height );
   end;
end;
// v. 4.0.0.4
procedure rc_ResizeBlocksExecute( pFrame : TObject ;
                                  iMenu : integer;
                                  iOffSet : integer ;
                                  iOffSet_Border : integer ;
                                  iNumBlocks : integer ;
                                  iAreaAvailableH : integer ;
                                  iAreaAvailableV : integer;
                                  iResponsivenessLimitH : integer;
                                  iResponsivenessLimitV : integer ;
                                  bMobileScreen : boolean;
                                  bMobileScreenPortrait : boolean;
                                  bMobileScreenLandScape : boolean;
                                  bDesktop : boolean // v. 4.0.0.4
                                  );
var
   fClassName, cCmd, cTemp, cTemp2, cTemp3, cTemp4,
   pgNAme : string;
   fClass : TClass;
   pLabel : TuniLabel;
   frm : TUniFrame;
   // armazenar os blocos que totalizar 12 colunas pra cada linha
   // pora ajustar suas larguras
   oBlocks      : Array[ 1..2000 ] of TUniContainerPanel;
   oBlocksProps : Array[ 1..2000, 1..6 ] of Integer;

   oObj, oObjPrior, oObjNext : TUniContainerPanel;

   oObj_HRCHILD, oObj_HRCHILD_Parent,
   oObj_Parent,
   oObj4 ,
   oObjTemp, oObjTemp2, oObjTemp3, oObjTemp4 : TUniControl;

   oComponent : TComponent;

   fHeight : double;

   iTabs, iTabLastPos, iFirstPos, iCountBlocks,

   iColsXS, iColsSM, iColsMD, iColsLG, iColsXL, iCols4k, iCols8k,
   iHeightXS, iHeightSM, iHeightMD, iHeightLG, iHeightXL, iHeight4k, iHeight8k,

   iTopMinus,
   i,f,n,x,y, o, ff,
   iLeft, iTop, iRight, iBottom, iWidth, iHeight, iHeightParent,
   iPos, iPos2,

   iResponsivenessLimit,

   iBlockWidth, iBlockHeight,
   iNumBlocksH, iNumBlocksV,

   iBlockExtraWidth,
   iBlockAdjustWidth,

   iMaxAreaAvaibleH,
   iNextObjWidth, iPriorObjWidth,

   // v. 3.3.0.0
   iMax,
   iMax_mob,
   iMax_mob_v,
   iMax_mob_h,
   iMin,
   iMin_mob,
   iMin_mob_v,
   iMin_mob_h,

   iParentWidth,
   i3, i4, i5 : integer;

   iBlockPercent : Double;

   // v. 3.3.0.0
   bNoBorderAll,
   bNoBorderAll2,
   bNoBorderAll3,
   bNoBorder,
   bBlockAreaMax,
   bNoBorderRight2, bNoBorderBottom2,
   bNoBorderLeft2, bNoBorderTop2,
   bNoBorderRight, bNoBorderBottom,
   bNoBorderLeft, bNoBorderTop,
   bNoBorderRight3, bNoBorderBottom3,
   bNoBorderLeft3, bNoBorderTop3 : boolean;
   IniFile : TMemIniFile;
   cHint, cHintNext, cHintPrior  : string;
   bLoaded : boolean;
begin
     // v. 4.1.0.0
     iMin_mob   := 0;
     iMin_mob_h := 0;
     iMin_mob_v := 0;
     iMin       := 0;
     iMax_mob   := 0;
     iMax_mob_h := 0;
     iMax_mob_v := 0;
     iMax       := 0;

     iTopMinus       := 0;
     // linux issue
     oObjTemp  := nil; // feedback by mesut (turkey)
     oObjTemp2 := nil;
     oObjTemp3 := nil;

     if TComponent( pFrame ).Name <> 'MainForm' then
        f := 0;

     i  := 0;
     i3 := 1; // intervalo entre sequenciais de blocos para permitir futuras inserções
     i4 := 0; // contador de colunas
     i5 := 0; // somar width dos blocos exibidos em cada linha

     // organizar blocos( widgets ) de acordo com o no. de colunas que ele ocupará
     // defina a prop. tag de cada bloco: 1 , 2 , 3 ou 4 colunas
     iCountBlocks := 0;
     i3 := 0;

     // default values
     iColsXS := 12;  // <=200
     iColsSM := 12;  // <=400
     iColsMD := 3;  // <=768
     iColsLG := 3;  // <=1366
     iColsXL := 3;  // <=1920
     iCols4K := 3;  // <=3000
     iCols8K := 3;  // <=7000

     iHeightXS := 52;
     iHeightSM := 52;
     iHeightMD := 52;
     iHeightLG := 52;
     iHeightXL := 52;
     iHeight4K := 52;
     iHeight8K := 52;

     oObj_Parent  := nil;
     oObj_HRCHILD := nil;
     oObj_HRCHILD_Parent := nil;

     Try
       for f := 1 to 5000 do
       begin
            oObj  := TUniContainerPanel( rc_FindControl( 'rcBlock' + f.tostring , pFrame ) );
            cHint := '';
            // v. 4.0.0.2
            if oObj <> nil then
            begin
               if oObj.Enabled then
               begin
                  oObj.Hint := '[[' + rc_NormalizeHintProperty( oObj.Hint ) + ']]';

                  cHint   := '';
                  {$IFDEF RELEASE}
                  if pFrame is TUniForm then
                     bLoaded := rc_PosHintProperty('rcfrmloaded:', TUniForm(pFrame).hint ) > 0
                  else
                     bLoaded := rc_PosHintProperty('rcfrmloaded:', TUniFrame(pFrame).hint ) > 0;
                  {$ENDIF}
                  {$IFDEF DEBUG}
                  bLoaded := false;
                  {$ENDIF}
                  if not bLoaded then
                  begin
                     if FileExists( '.\files\rc-forms\' + lowercase( TComponent(pFrame).Name ) + '.ini' ) then
                     begin
                         IniFile := TMemIniFile.Create( '.\files\rc-forms\' + lowercase( TComponent(pFrame).Name ) + '.ini' );
                         cHint := IniFile.ReadString( oObj.Name , 'cmd' , '' );
                         IniFile.Free;
                         if cHint <> '' then
                         begin
                            oObj.hint := '[[' + rc_NormalizeHintProperty( cHint ) + ']]';
                            if not bLoaded then
                               if pFrame is TUniForm then
                               begin
                                  if Pos( ']]', TUniForm(pFrame).hint ) = 0 then
                                     TUniForm(pFrame).hint := '[[rcfrmloaded:]]'
                                  else
                                     TUniForm(pFrame).hint := '[[rcfrmloaded:|' + Copy( TUniForm(pFrame).hint, 3, 1000 );
                               end
                               else
                               begin
                                  if Pos( ']]', TUniFrame(pFrame).hint ) = 0 then
                                     TUniFrame(pFrame).hint := '[[rcfrmloades:]]'
                                  else
                                     TUniFrame(pFrame).hint := '[[rcfrmloaded:|' + Copy( TUniFrame(pFrame).hint, 3, 1000 );
                               end;

                         end;
                     end;
                  end;

                  Inc( iCountBlocks );
                  oBlocks[ iCountBlocks ] := oObj;
                  i3 := 0;

                  // sistema de colunas semelhante ao bootstrap
                  // [[cols:sm-1 md-2   lg-3    xl-4]]
                  cTemp := rc_GetHintProperty( 'cols:', oObj.Hint );

                  if ( StrToIntDef( cTemp, 0 ) = 0 ) and
                     ( Pos( 'xs-', oObj.Hint ) = 0 ) and
                     ( Pos( 'sm-', oObj.Hint ) = 0 ) and
                     ( Pos( 'md-', oObj.Hint ) = 0 ) and
                     ( Pos( 'lg-', oObj.Hint ) = 0 ) and
                     ( Pos( 'xl-', oObj.Hint ) = 0 ) and
                     ( Pos( '4k-', oObj.Hint ) = 0 ) and
                     ( Pos( '8k-', oObj.Hint ) = 0 ) then
                  begin
                       // v. 4.0.0.0
                       if Pos( '[[' , oObj.Hint ) = 0 then
                          oObj.Hint := '[[cols:12]]'
                       else
                          oObj.Hint := Copy( Trim( oObj.Hint ) , 1, Length( oObj.Hint ) - 2 ) + ' | cols:12]]';
                  end
                  else
                  if ( StrToIntDef( cTemp, 0 ) > 0 ) then
                  begin
                       oObj.Hint := StringReplace( oObj.Hint, 'cols:' + cTemp , 'cols:xs-' + cTemp + ' sm-' + cTemp + ' md-' + cTemp + ' lg-' + cTemp + ' xl-' + cTemp + ' 4k-' + cTemp + ' 8k-' + cTemp , [rfReplaceAll] );
                  end;

                  cTemp := rc_GetHintProperty( 'cols:', oObj.Hint );
                  // md vai ser o padrão para os demais( caso não sejam definidos )
                  if ( Pos( 'md-', cTemp ) > 0 ) then
                     oObj.Tag := StrToIntDef( Trim( Copy( cTemp, Pos( 'md', cTemp ) + 3 , 2 ) ) , 1 );

                  if ( iAreaAvailableH <= 200 ) then
                  begin
                      if ( Pos( 'xs-', cTemp ) > 0 ) then
                         oObj.Tag := StrToIntDef( Trim( Copy( cTemp, Pos( 'xs', cTemp ) + 3 , 2 ) ) , 1 )
                      else
                         oObj.Tag := iColsXS;
                  end
                  else
                  if ( iAreaAvailableH <= 400 ) then
                  begin
                     if ( Pos( 'sm-', cTemp ) > 0 ) then
                        oObj.Tag := StrToIntDef( Trim( Copy( cTemp, Pos( 'sm', cTemp ) + 3 , 2 ) ) , 1 )
                     else
                        oObj.Tag := iColsSM;
                  end
                  else
                  if ( iAreaAvailableH <= 768 ) then // to better adjustment on MOBILE
                  begin
                     if ( bMobileScreen ) and ( Pos( 'sm-', cTemp ) > 0 ) then
                     begin
                         if ( Pos( 'sm-', cTemp ) > 0 )  then
                            oObj.Tag := StrToIntDef( Trim( Copy( cTemp, Pos( 'sm', cTemp ) + 3 , 2 ) ) , 1 )
                         else
                            oObj.Tag := iColsSM;
                     end
                     else
                     begin
                        if ( Pos( 'md-', cTemp ) > 0 )  then
                           oObj.Tag := StrToIntDef( Trim( Copy( cTemp, Pos( 'md', cTemp ) + 3 , 2 ) ) , 1 )
                        else
                           oObj.Tag := iColsMD;
                     end;
                  end
                  else
                  if ( iAreaAvailableH <= 1366 ) then // v. 4.0.0.0 // 1368 thanks Fabio Oliveira
                  begin
                     // v. 3.3.0.1
                     if ( bMobileScreen ) and ( Pos( 'sm-', cTemp ) > 0 ) then
                     begin
                         if ( Pos( 'sm-', cTemp ) > 0 )  then
                            oObj.Tag := StrToIntDef( Trim( Copy( cTemp, Pos( 'sm', cTemp ) + 3 , 2 ) ) , 1 )
                         else
                            oObj.Tag := iColsSM;
                     end
                     else
                     begin
                        if ( Pos( 'lg-', cTemp ) > 0 ) then
                           oObj.Tag := StrToIntDef( Trim( Copy( cTemp, Pos( 'lg', cTemp ) + 3 , 2 ) ) , 1 )
                        else
                        if ( Pos( 'md-', cTemp ) = 0 ) then
                           oObj.Tag := iColsLG;
                     end;
                  end
                  else
                  if ( iAreaAvailableH <= 1920 ) then
                  begin
                     // v. 3.3.0.1
                     if ( bMobileScreen ) and ( Pos( 'sm-', cTemp ) > 0 ) then
                     begin
                         if ( Pos( 'sm-', cTemp ) > 0 )  then
                            oObj.Tag := StrToIntDef( Trim( Copy( cTemp, Pos( 'sm', cTemp ) + 3 , 2 ) ) , 1 )
                         else
                            oObj.Tag := iColsSM;
                     end
                     else
                     begin
                        if ( Pos( 'xl-', cTemp ) > 0 ) then
                           oObj.Tag := StrToIntDef( Trim( Copy( cTemp, Pos( 'xl', cTemp ) + 3 , 2 ) ) , 1 )
                        else
                        if ( Pos( 'md-', cTemp ) = 0 ) then
                           oObj.Tag := iColsXL;
                     end;
                  end
                  else
                  if ( iAreaAvailableH <= 3000 ) then
                  begin
                     // v. 3.3.0.1
                     if ( bMobileScreen ) and ( Pos( 'sm-', cTemp ) > 0 ) then
                     begin
                         if ( Pos( 'sm-', cTemp ) > 0 )  then
                            oObj.Tag := StrToIntDef( Trim( Copy( cTemp, Pos( 'sm', cTemp ) + 3 , 2 ) ) , 1 )
                         else
                            oObj.Tag := iColsSM;
                     end
                     else
                     begin
                        if ( Pos( '4k-', cTemp ) > 0 ) then
                           oObj.Tag := StrToIntDef( Trim( Copy( cTemp, Pos( '4k', cTemp ) + 3 , 2 ) ) , 1 )
                        else
                        if ( Pos( 'md-', cTemp ) = 0 ) then
                           oObj.Tag := iCols4k;
                     end;
                  end
                  else
                  if ( iAreaAvailableH <= 7000 ) then
                  begin
                     // v. 3.3.0.1
                     if ( bMobileScreen ) and ( Pos( 'sm-', cTemp ) > 0 ) then
                     begin
                         if ( Pos( 'sm-', cTemp ) > 0 )  then
                            oObj.Tag := StrToIntDef( Trim( Copy( cTemp, Pos( 'sm', cTemp ) + 3 , 2 ) ) , 1 )
                         else
                            oObj.Tag := iColsSM;
                     end
                     else
                     begin
                        if ( Pos( '8k-', cTemp ) > 0 ) then
                           oObj.Tag := StrToIntDef( Trim( Copy( cTemp, Pos( '8k', cTemp ) + 3 , 2 ) ) , 1 )
                        else
                        if ( Pos( 'md-', cTemp ) = 0 ) then
                           oObj.Tag := iCols8k;
                     end;
                  end;

                  // HEIGHT responsivo
                  // [[hr:sm-1 md-2   lg-3    xl-4]]
                  cTemp := rc_GetHintProperty( 'hr:', oObj.Hint );
                  iPos  := Pos( 'hr:' , oObj.Hint );
                  if iPos > 0 then
                  begin
                     iPos2 := Pos( '|' , Copy( oObj.Hint, iPos + 3 , 100 ) );
                     if iPos2 = 0 then
                        iPos2 := Pos( ']]' , Copy( oObj.Hint, iPos + 3 , 100 ) );

                     cTemp := lowercase( Trim( Copy( oObj.Hint, iPos + 3, iPos2 ) ) );
                     cTemp := StringReplace( cTemp, '|' , '', [rfReplaceAll] );
                     cTemp := Trim( StringReplace( cTemp, ']' , '', [rfReplaceAll] ) );

                     // hr:objeto ? ... instable
                     oObj_HRCHILD_Parent := TUniContainerPanel( rc_FindControl( cTemp , pFrame ) );

                     // hr com mobile-v / h ?
                     if ( Pos( 'xs-', cTemp ) = 0 ) and
                        ( Pos( 'sm-', cTemp ) = 0 ) and
                        ( Pos( 'md-', cTemp ) = 0 ) and
                        ( Pos( 'lg-', cTemp ) = 0 ) and
                        ( Pos( 'xl-', cTemp ) = 0 ) and
                        ( Pos( '4k-', cTemp ) = 0 ) and
                        ( Pos( '8k-', cTemp ) = 0 ) then
                     begin
                        n := StrToIntDef( Copy( cTemp, 1, Pos( ' ' , cTemp + ' ' ) - 1), 0 );//
                        cTemp3 := Copy( cTemp, Pos( ' ', cTemp ) + 1, 1000 );

                        if n = 0 then
                           n := oObj_HRCHILD_Parent.Height;

                        iHeight := n;
                        if ( Pos( 'mobile-v-', cTemp3 ) > 0 ) and
                           ( bMobileScreenPortrait ) then
                           iHeight := StrToIntDef( rc_GetHintProperty( 'mobile-v-', cTemp3, true ) , iHeight )
                        else
                        if ( Pos( 'mobile-h-', cTemp3 ) > 0 ) and
                           ( bMobileScreenLandScape ) then
                           iHeight := StrToIntDef( rc_GetHintProperty( 'mobile-h-', cTemp3, true ) , iHeight )
                        else
                        if ( Pos( 'mobile-', cTemp3 ) > 0 ) and
                           ( bMobileScreenPortrait ) then
                           iHeight := StrToIntDef( rc_GetHintProperty( 'mobile-', cTemp3, true ) , iHeight );

                        oObj.Height := iHeight;
                     end
                     else
                     begin
                        if ( StrToIntDef( cTemp, 0 ) > 0 ) then
                        begin
                             oObj.Hint := StringReplace( oObj.Hint, 'hr:' + cTemp , 'hr:xs-' + cTemp + ' sm-' + cTemp + ' md-' + cTemp + ' lg-' + cTemp + ' xl-' + cTemp + ' 4k-' + cTemp + ' 8k-' + cTemp , [rfReplaceAll] );
                        end;

                        iPos  := Pos( 'hr:' , oObj.Hint );
                        iPos2 := Pos( '|' , Copy( oObj.Hint, iPos + 3 , 100 ) );
                        if iPos2 = 0 then
                           iPos2 := Pos( ']]' , Copy( oObj.Hint, iPos + 3 , 100 ) );

                        cTemp := lowercase( Trim( Copy( oObj.Hint, iPos + 3, iPos2 ) ) );

                        cTemp := StringReplace( cTemp, '|' , '', [rfReplaceAll] );
                        cTemp := StringReplace( cTemp, ']' , '', [rfReplaceAll] );

                        if Pos( '%' , cTemp ) > 0 then
                        begin
                             iHeightXS := StrToIntDef( ReturnNumbers( cTemp ), 100 );
                             TUniControl(oObj).Height := Round( ( iHeightXS / 100 ) * ( oObj.Parent.Height ) );
                        end
                        else
                        begin
                           // md vai ser o padrão para os demais( caso não sejam definidos )
                           if ( Pos( 'md-', cTemp ) > 0 ) then
                           begin
                              TUniControl(oObj).Height := rc_GetBlockHeight( oObj, pFrame, cTemp, 'md' );
                           end;

                           if ( iAreaAvailableH <= 200 ) then
                           begin
                               if ( Pos( 'xs-', cTemp ) > 0 ) then
                                  TUniControl(oObj).Height := rc_GetBlockHeight( oObj, pFrame, cTemp, 'xs' )
                               else
                                  TUniControl(oObj).Height := iHeightXS;
                           end
                           else
                           if ( iAreaAvailableH <= 400 ) then
                           begin
                              if ( Pos( 'sm-', cTemp ) > 0 ) then
                                 TUniControl(oObj).Height := rc_GetBlockHeight( oObj, pFrame, cTemp, 'sm' )
                              else
                                 TUniControl(oObj).Height := iHeightSM;
                           end
                           else
                           if ( iAreaAvailableH <= 768 ) then
                           begin
                              if ( bMobileScreen ) and ( Pos( 'sm-', cTemp ) > 0 ) then
                              begin
                                  if ( Pos( 'sm-', cTemp ) > 0 )  then
                                     TUniControl(oObj).Height := rc_GetBlockHeight( oObj, pFrame, cTemp, 'sm' )
                                  else
                                     oObj.Tag := iColsSM;
                              end
                              else
                              begin
                                    if ( Pos( 'md-', cTemp ) > 0 )  then
                                       TUniControl(oObj).Height := rc_GetBlockHeight( oObj, pFrame, cTemp, 'md' )
                                    else
                                       TUniControl(oObj).Height := iHeightMD;
                              end;
                           end
                           else
                           if ( iAreaAvailableH <= 1366 ) then // v. 4.0.0.0 // 1368 thanks Fabio Oliveira
                           begin
                              if ( Pos( 'lg-', cTemp ) > 0 ) then
                                 TUniControl(oObj).Height := rc_GetBlockHeight( oObj, pFrame, cTemp, 'lg' )
                              else
                              if ( Pos( 'md-', cTemp ) = 0 ) then
                                 TUniControl(oObj).Height := iHeightLG;
                           end
                           else
                           if ( iAreaAvailableH <= 1920 ) then
                           begin
                              if ( Pos( 'xl-', cTemp ) > 0 ) then
                                 TUniControl(oObj).Height := rc_GetBlockHeight( oObj, pFrame, cTemp, 'xl' )
                              else
                              if ( Pos( 'md-', cTemp ) = 0 ) then
                                 TUniControl(oObj).Height := iHeightXL;
                           end
                           else
                           if ( iAreaAvailableH <= 3000 ) then
                           begin
                              if ( Pos( '4k-', cTemp ) > 0 ) then
                                 TUniControl(oObj).Height := rc_GetBlockHeight( oObj, pFrame, cTemp, '4k' )
                              else
                              if ( Pos( 'md-', cTemp ) = 0 ) then
                                 TUniControl(oObj).Height := iHeight4k;
                           end
                           else
                           if ( iAreaAvailableH <= 7000 ) then
                           begin
                              if ( Pos( '8k-', cTemp ) > 0 ) then
                                 TUniControl(oObj).Height := rc_GetBlockHeight( oObj, pFrame, cTemp, '8k' )
                              else
                              if ( Pos( 'md-', cTemp ) = 0 ) then
                                 TUniControl(oObj).Height := iHeight8k;
                           end;
                        end;
                     end;
                  end;
                  // v. 4.1.0.0
                  iMin_mob   := 0;
                  iMin_mob_h := 0;
                  iMin_mob_v := 0;
                  iMin       := 0;
                  iMax_mob   := 0;
                  iMax_mob_h := 0;
                  iMax_mob_v := 0;
                  iMax       := 0;
                  cTemp3 := rc_GetHintProperty( 'min-height:', oObj.Hint ) ;
                  if cTemp3 <> '' then
                  begin
                     cTemp3 := cTemp3 + '.';//rc_GetHintProperty( 'max-width:', oObj.Hint ) ;
                     cTemp3 := Copy( cTemp3, 1, Pos( '.', cTemp3 ) - 1 );

                     if ( Pos( 'mobile-v', cTemp3 ) > 0 ) and
                        ( bMobileScreenPortrait ) then
                     begin
                          cTemp3          := rc_GetHintProperty( 'mobile-v-', cTemp3, true ) ;
                          iMax_mob_v := StrToIntDef( cTemp3, oObj.Height );
                          if oObj.Height < iMax_mob_v then
                             oObj.Height := iMax_mob_v;
                     end
                     else
                     if ( Pos( 'mobile-h', cTemp3 ) > 0 ) and
                        ( bMobileScreenLandscape ) then
                     begin
                          cTemp3          := rc_GetHintProperty( 'mobile-h-', cTemp3, true ) ;
                          iMax_mob_h := StrToIntDef( cTemp3, oObj.Height );
                          if oObj.Height < iMax_mob_h then
                             oObj.Height := iMax_mob_h;
                     end
                     else
                     if ( Pos( 'mobile-', cTemp3 ) > 0 ) and
                        ( bMobileScreen ) then
                     begin
                          cTemp3          := rc_GetHintProperty( 'mobile-', cTemp3, true ) ;
                          iMax_mob   := StrToIntDef( cTemp3, oObj.Height );
                          if oObj.Height < iMax_mob then
                             oObj.Height := iMax_mob;
                     end
                     else
                     //desktop
                     begin
                        cTemp3 := cTemp3 + ' ';
                        cTemp3 := Copy( cTemp3, 1, Pos( ' ', cTemp3 ) - 1 );
                        if ( StrToIntDef( cTemp3 , -99999) <> -99999 ) then
                        begin
                           iMax  := StrToIntDef( cTemp3, oObj.Height );
                           if oObj.Height < iMax then
                              oObj.Height := iMax;
                        end;
                     end;
                  end;
                  cTemp3 := rc_GetHintProperty( 'max-height:', oObj.Hint ) ;
                  if cTemp3 <> '' then
                  begin
                     cTemp3 := cTemp3 + '.';//rc_GetHintProperty( 'max-width:', oObj.Hint ) ;
                     cTemp3 := Copy( cTemp3, 1, Pos( '.', cTemp3 ) - 1 );

                     if ( Pos( 'mobile-v', cTemp3 ) > 0 ) and
                        ( bMobileScreenPortrait ) then
                     begin
                          cTemp3          := rc_GetHintProperty( 'mobile-v-', cTemp3, true ) ;
                          iMax_mob_v := StrToIntDef( cTemp3, oObj.Height );
                          if oObj.Height > iMax_mob_v then
                             oObj.Height := iMax_mob_v;
                     end
                     else
                     if ( Pos( 'mobile-h', cTemp3 ) > 0 ) and
                        ( bMobileScreenLandscape ) then
                     begin
                          cTemp3          := rc_GetHintProperty( 'mobile-h-', cTemp3, true ) ;
                          iMax_mob_h := StrToIntDef( cTemp3, oObj.Height );
                          if oObj.Height > iMax_mob_h then
                             oObj.Height := iMax_mob_h;
                     end
                     else
                     if ( Pos( 'mobile-', cTemp3 ) > 0 ) and
                        ( bMobileScreen ) then
                     begin
                          cTemp3          := rc_GetHintProperty( 'mobile-', cTemp3, true ) ;
                          iMax_mob   := StrToIntDef( cTemp3, oObj.Height );
                          if oObj.Height > iMax_mob then
                             oObj.Height := iMax_mob;
                     end
                     else
                     //desktop
                     begin
                        cTemp3 := cTemp3 + ' ';
                        cTemp3 := Copy( cTemp3, 1, Pos( ' ', cTemp3 ) - 1 );
                        if ( StrToIntDef( cTemp3 , -99999) <> -99999 ) then
                        begin
                           iMax  := StrToIntDef( cTemp3, oObj.Height );
                           if oObj.Height > iMax then
                              oObj.Height := iMax;
                        end;
                     end;
                  end;
                  cTemp3 := rc_GetHintProperty( 'height:', oObj.Hint ) ;
                  if cTemp3 <> '' then
                  begin
                     cTemp3 := cTemp3 + '.';//rc_GetHintProperty( 'max-width:', oObj.Hint ) ;
                     cTemp3 := Copy( cTemp3, 1, Pos( '.', cTemp3 ) - 1 );

                     if ( Pos( 'mobile-v', cTemp3 ) > 0 ) and
                        ( bMobileScreenPortrait ) then
                     begin
                          cTemp3          := rc_GetHintProperty( 'mobile-v-', cTemp3, true ) ;
                          iMax_mob_v := StrToIntDef( cTemp3, oObj.Height );
                          oObj.Height := iMax_mob_v;
                     end
                     else
                     if ( Pos( 'mobile-h', cTemp3 ) > 0 ) and
                        ( bMobileScreenLandscape ) then
                     begin
                          cTemp3          := rc_GetHintProperty( 'mobile-h-', cTemp3, true ) ;
                          iMax_mob_h := StrToIntDef( cTemp3, oObj.Height );
                          oObj.Height := iMax_mob_h;
                     end
                     else
                     if ( Pos( 'mobile-', cTemp3 ) > 0 ) and
                        ( bMobileScreen ) then
                     begin
                          cTemp3          := rc_GetHintProperty( 'mobile-', cTemp3, true ) ;
                          iMax_mob   := StrToIntDef( cTemp3, oObj.Height );
                          oObj.Height := iMax_mob;
                     end
                     else
                     //desktop
                     begin
                        cTemp3 := cTemp3 + ' ';
                        cTemp3 := Copy( cTemp3, 1, Pos( ' ', cTemp3 ) - 1 );
                        if ( StrToIntDef( cTemp3 , -99999) <> -99999 ) then
                        begin
                           iMax  := StrToIntDef( cTemp3, oObj.Height );
                           oObj.Height := iMax;
                        end;
                     end;
                  end;
               end
            end
            else
                Inc( i3 ); // dois intervalos entre sem encontrar um bloco indica que pode encerrar

            // por padrão usamos intervalos de 5 em 5 , 10 em 10, 100 em 100... o limite até 5000 blocos
            // isso permite inserir novos objetos dentro de uma sequencia
            // rcBlock5..rcBlock10..rcBlock15
            // rcBlock5..rcBlock7...rcBlock10...rcBlock512...rcBlock15
            //if i3 > 5 then
            if i3 > 5000 then
               Break;
       end;
     Except on e:exception do
            begin
                 //dm_rc.rc_ShowError( 'rcBlocks( 1 ): ' + e.Message )
                 ShowMessageN( 'rcBlocks( p1[' + iCountBlocks.ToString + '] ): ' + e.Message );
            end;
     End;

     try
       // ajustar HEIGHT-CHILDs
       for f := 1 to iCountBlocks do
       begin
            oObj := oBlocks[ f ];

            cTemp3 := rc_GetHintProperty( 'hide:', oObj.Hint ) ;
            if cTemp3 <> '' then
            begin
               if rc_GetHintProperty( 'hideh:', oObj.Hint ) = '' then
                  oObj.Hint := rc_SetHintProperty( oObj.Height.ToString , 'hideh:', oObj.Hint );

               if ( cTemp3 = 'mobile-v' ) and
                  ( bMobileScreenPortrait ) then
               begin
                    oObj.Height := 0;
               end
               else
               if ( cTemp3 = 'mobile-h' ) and
                  ( bMobileScreenLandscape ) then
               begin
                    oObj.Height := 0;
               end
               else
                if ( cTemp3 = 'mobile' ) and
                  ( bMobileScreen ) then
               begin
                    oObj.Height := 0;
               end
               else
               begin
                    oObj.Height := StrToIntdef( rc_GetHintProperty( 'hideh:', oObj.Hint ) , 0 );
               end;
            end;

            if ( oObj.Enabled ) then
            begin
                 // HEIGHT responsivo: sum childs height
                 // Set DEAULT HEIGHT
                 // [[hr:sm-1 md-2   lg-3    xl-4]]
                 iPos  := Pos( 'hr-childs:' , oObj.Hint );

                 if ( iPos > 0 ) and ( oObj.Height > 0 ) then
                 begin
                    x := 0;
                    y := 0; // v. 3.2.0.8
                    fHeight := 0;
                    for o := 0 to TUniControl( oObj ).ControlCount - 1 do
                    begin
                         oObj_HRCHILD := TUniContainerPanel( TUniControl( oObj ).Controls[ o ] );

                         // v. 3.2.0.8
                         if Pos( 'rcblock', lowercase( oObj_HRCHILD.Name ) ) > 0 then
                         begin
                            y := oObj_HRCHILD.Height;

                            if ( bMobileScreenPortrait ) and ( Pos( 'hide:mobile-v' , oObj.Hint ) > 0 ) then
                               y := 0
                            else
                            if ( bMobileScreenLandScape ) and ( Pos( 'hide:mobile-h' , oObj.Hint ) > 0 ) then
                               y := 0
                            else
                            if ( bMobileScreen ) and ( Pos( 'hide:mobile' , oObj.Hint ) > 0 ) then
                               y := 0;

                            x := x + y;
                         end;
                         // se não houver nenhum componente dentro do bloco, x recebe o proprio height
                         // if there is no component inside the block, x receives its own height
                         if x = 0 then
                            x := oObj.Height;
                         // nao somar os OFFSETS se nao tiver "borda"
                         if ( Pos( 'noborder-top', lowercase( oObj_HRCHILD.Hint ) ) = 0 ) and
                            ( Pos( 'noborder-bottom', lowercase( oObj_HRCHILD.Hint ) ) = 0 ) then
                            fHeight := fHeight + 1
                         else
                         if ( Pos( 'noborder-top', lowercase( oObj_HRCHILD.Hint ) ) > 0 ) or
                            ( Pos( 'noborder-bottom', lowercase( oObj_HRCHILD.Hint ) ) > 0 ) then
                            fHeight := fHeight - 0.5;
                    end;

                    if x > 0 then
                    begin
                         // v. 3.3.2.0
//                         if fHeight > 0 then
//                            x := x + ( Round( iOffSet_Border * ( fHeight ) ) + ( iOffSet_Border  ) ) + 15
//                         else
//                            x := x + ( Round( iOffSet_Border * ( fHeight ) ) + ( iOffSet_Border  ) ) + 5;
                         x := x + ( Round( iOffSet_Border * ( fHeight ) ) + ( iOffSet_Border  ) ) ;

                         n := 0;
                         cTemp := rc_GetHintProperty( 'hr-sumchild:', oObj.Hint ) ;
                         n := StrToIntDeF( Trim( Copy( cTemp, 1, Pos( '=', cTemp ) - 1 ) ), 0 );

                         if n > 0 then
                            y := n    //140
                         else
                            y := oObj.Height; //317

                         oObj.Hint := rc_SetHintProperty( y.ToString + '=' + x.ToString , 'hr-sumchild:', oObj.Hint ) ;

                         // HEIGHT responsivo
                         // [[hr:sm-1 md-2   lg-3    xl-4]]
                         iPos  := Pos( 'hr-childs:' , oObj.Hint );
                         iPos2 := Pos( 'hr-sumchild:' , oObj.Hint );
                         if iPos > 0 then
                         begin
                            iPos2 := Pos( '|' , Copy( oObj.Hint, iPos + 3 , 100 ) );
                            if iPos2 = 0 then
                               iPos2 := Pos( ']]' , Copy( oObj.Hint, iPos + 3 , 100 ) );

                            cTemp := lowercase( Trim( Copy( oObj.Hint, iPos + 3, iPos2 ) ) );
                            cTemp := StringReplace( cTemp, '|' , '', [rfReplaceAll] );
                            cTemp := Trim( StringReplace( cTemp, ']' , '', [rfReplaceAll] ) );

                            if ( StrToIntDef( cTemp, 0 ) = 0 ) and
                               ( Pos( 'xs-', oObj.Hint ) = 0 ) and
                               ( Pos( 'sm-', oObj.Hint ) = 0 ) and
                               ( Pos( 'md-', oObj.Hint ) = 0 ) and
                               ( Pos( 'lg-', oObj.Hint ) = 0 ) and
                               ( Pos( 'xl-', oObj.Hint ) = 0 ) and
                               ( Pos( '4k-', oObj.Hint ) = 0 ) and
                               ( Pos( '8k-', oObj.Hint ) = 0 ) then
                            begin
                                 //if Pos( '[[' , oObj.Hint ) = 0 then
                                 //   oObj.Hint := '[[cols:xs-12 sm-6 md-3 lg-3 xl-3 4k-3 8k-3]]'
                                 //else
                                 //   oObj.Hint := Copy( Trim( oObj.Hint ) , 1, Length( oObj.Hint ) - 2 ) + ' | cols:xs-12 sm-6 md-3 lg-3 xl-3 4k-3 8k-3]]';
                            end
                            else
                            if ( StrToIntDef( cTemp, 0 ) > 0 ) then
                            begin
                                 oObj.Hint := StringReplace( oObj.Hint, 'hr-childs:' + cTemp , 'hr-childs:xs-' + cTemp + ' sm-' + cTemp + ' md-' + cTemp + ' lg-' + cTemp + ' xl-' + cTemp + ' 4k-' + cTemp + ' 8k-' + cTemp , [rfReplaceAll] );
                            end;

                            iPos  := Pos( 'hr-childs:' , oObj.Hint );
                            iPos2 := Pos( '|' , Copy( oObj.Hint, iPos + 3 , 100 ) );
                            if iPos2 = 0 then
                               iPos2 := Pos( ']]' , Copy( oObj.Hint, iPos + 3 , 100 ) );

                            cTemp := lowercase( Trim( Copy( oObj.Hint, iPos + 3, iPos2 ) ) );
                            cTemp := StringReplace( cTemp, '|' , '', [rfReplaceAll] );
                            cTemp := StringReplace( cTemp, ']' , '', [rfReplaceAll] );

                            If Pos( 'expanded-' , oObj.Hint ) > 0 then
                            begin
                                //if Pos( 'off-', cTemp ) > 0 then
                                begin
                                   cTemp := rc_GetHintProperty( 'expanded-', oObj.Hint, true );
                                   x := StrToIntDef ( cTemp, 0 );
                                   TUniControl(oObj).Height := x;
                                   rc_AddCssClass( TUniControl(oObj), 'rc-scrollbar-hidden' );
                                end;
                            end
                            else
                            begin
                               rc_RemoveCssClass( TUniControl(oObj), 'rc-scrollbar-hidden' );
                               // md vai ser o padrão para os demais( caso não sejam definidos )
                               if ( Pos( 'md-exp', cTemp ) > 0 ) then
                               begin
                                  TUniControl(oObj).Height := x;
                               end
                               else
                                  TUniControl(oObj).Height := y;

                               if ( iAreaAvailableH <= 200 ) then
                               begin
                                   if ( Pos( 'xs-exp', cTemp ) > 0 ) then
                                      TUniControl(oObj).Height := x
                                   else
                                      TUniControl(oObj).Height := y;
                               end
                               else
                               if ( iAreaAvailableH <= 400 ) then
                               begin
                                  if ( Pos( 'sm-exp', cTemp ) > 0 ) then
                                     TUniControl(oObj).Height := x
                                  else
                                     TUniControl(oObj).Height := y;
                               end
                               else
                               if ( iAreaAvailableH <= 768 ) then
                               begin
                                  // mesmo que esteja md-fix mas se estiver acessando fisicamente de um MOBILE
                                  // vai expandir...
                                  if bMobileScreen then
                                     TUniControl(oObj).Height := x
                                  else
                                  if ( Pos( 'md-exp', cTemp ) > 0 )  then
                                     TUniControl(oObj).Height := x
                                  else
                                     TUniControl(oObj).Height := y;
                               end
                               else
                               if ( iAreaAvailableH <= 1366 ) then // v. 4.0.0.0 // 1368 thanks Fabio Oliveira
                               begin
                                  // v. 3.3.0.1
                                  // mesmo que esteja md-fix mas se estiver acessando fisicamente de um MOBILE
                                  // vai expandir...
                                  if bMobileScreen then
                                     TUniControl(oObj).Height := x
                                  else
                                  if ( Pos( 'lg-exp', cTemp ) > 0 ) then
                                     TUniControl(oObj).Height := x
                                  else
                                  if ( Pos( 'md-exp', cTemp ) > 0 ) then
                                     TUniControl(oObj).Height := x
                                  else
                                     TUniControl(oObj).Height := y;
                               end
                               else
                               if ( iAreaAvailableH <= 1920 ) then
                               begin
                                  // v. 3.3.0.1
                                  // mesmo que esteja md-fix mas se estiver acessando fisicamente de um MOBILE
                                  // vai expandir...
                                  if bMobileScreen then
                                     TUniControl(oObj).Height := x
                                  else
                                  if ( Pos( 'xl-exp', cTemp ) > 0 ) then
                                     TUniControl(oObj).Height := rc_GetBlockHeight( oObj, pFrame, cTemp, 'xl' )
                                  else
                                  if ( Pos( 'md-exp', cTemp ) > 0 ) then
                                     TUniControl(oObj).Height := x
                                  else
                                     TUniControl(oObj).Height := y;
                               end
                               else
                               if ( iAreaAvailableH <= 3000 ) then
                               begin
                                  // v. 3.3.0.1
                                  // mesmo que esteja md-fix mas se estiver acessando fisicamente de um MOBILE
                                  // vai expandir...
                                  if bMobileScreen then
                                     TUniControl(oObj).Height := x
                                  else
                                  if ( Pos( '4k-exp', cTemp ) > 0 ) then
                                     TUniControl(oObj).Height := rc_GetBlockHeight( oObj, pFrame, cTemp, '4k' )
                                  else
                                  if ( Pos( 'md-exp', cTemp ) > 0 ) then
                                     TUniControl(oObj).Height := x
                                  else
                                     TUniControl(oObj).Height := y;
                               end
                               else
                               if ( iAreaAvailableH <= 7000 ) then
                               begin
                                  if ( Pos( '8k-exp', cTemp ) > 0 ) then
                                     TUniControl(oObj).Height := rc_GetBlockHeight( oObj, pFrame, cTemp, '8k' )
                                  else
                                  if ( Pos( 'md-exp', cTemp ) > 0 ) then
                                     TUniControl(oObj).Height := x
                                  else
                                     TUniControl(oObj).Height := y;
                               end;
                            end;
                         end;
                    end;
                 end;
            end;
       end;

       iTabLastPos := 1;

       i3 := 1;   // intervalo entre sequenciais de blocos para permitir futuras inserções
       i4 := 0;   // contador de colunas
       i5 := 0;   // somar width dos blocos exibidos
       iPos := 0;
       iFirstPos := 0;

       iHeight   :=0 ;

       for f := 1 to iCountBlocks do
       begin
            oObj  := oBlocks[ f ];

            if f > 1 then
            begin
               oObjPrior := oBlocks[ f - 1 ];
            end
            else
               oObjPrior := nil;

            if f < iCountBlocks then
            begin
               oObjNext := oBlocks[ f + 1 ];
            end
            else
               oObjNext := nil;

           if oObj <> nil then
           begin
               // v. 3.3.2.0
               bNoBorderAll2    := false;
               bNoBorderAll3    := false;
               bNoBorderLeft2   := false;
               bNoBorderTop2    := false;
               bNoBorderBottom2 := false;
               bNoBorderRight2  := false;
               bNoBorderLeft3   := false;
               bNoBorderTop3    := false;
               bNoBorderBottom3 := false;
               bNoBorderRight3  := false;
               cHintNext        := '';
               iNextObjWidth    := 0;
               cHintPrior       := '';
               iPriorObjWidth   := 0;
               if oObj.Enabled then
               begin
                    // parent do objeto atual
                    oObjTemp2 := TUniControl( oObj.GetParentComponent );

                    // another parent object ?
                    if oObjTemp <> nil then
                    begin
                       if ( oObjTemp.Name <> oObjTemp2.Name ) then
                       begin
                          // se o obj anterior existir... verificar se está dentro de outro parent
                          (*
                          block7  	    parent = scroll		left 0

                             block8  	parent = block7		left 0
                             block9  	parent = block7		left 0 se for comeco de linha
                             block10  	parent = block7

                          block13  	  parent = scroll		left ult. block mesmo parent
                                                         left 0 se for comeco de linha
                          *)
                          oObjTemp3 := nil;
                          if oObjPrior <> nil then
                             for o := f-1 downto 1 do
                             begin
                                  oObjTemp3 := TUniControl( oBlocks[ o ].GetParentComponent );

                                  if ( oObjTemp3 = oObjTemp2 ) then
                                  begin
                                     oObjTemp2 := oObjTemp3;
                                     oObjTemp  := oObjTemp2;
                                     oObjTemp3 := oBlocks[ o ] ; // block13 é o atual...e achou o block7 de mesmo parent
                                     oObjPrior := oBlocks[ o ];
                                     iPos := oBlocksProps[ o, 1 ];
                                     i    := oBlocksProps[ o, 2 ];
                                     i3   := oBlocksProps[ o, 3 ];
                                     i4   := oBlocksProps[ o, 4 ];
                                     i5   := oBlocksProps[ o, 5 ];

                                     Break;
                                  end
                                  else
                                      oObjTemp3 := nil;
                             end;

                          if oObjTemp3 = nil then
                          begin
                             i3 := 1;
                             i4 := 0;
                             i5 := 0;
                             iPos := 0;
                             iFirstPos := 0;
                             oObjTemp := oObjTemp2;
                          end;
                       end;
                    end
                    else
                       oObjTemp := oObjTemp2; // percorrer todos blocos do mesmo "parent" atual

                    // v. 3.3.2.0
                    cHint           := oObj.Hint;
                    bNoBorderAll    := ( ( Pos( 'noborder-all'           , cHint ) > 0 ) and ( Pos( 'noborder-all:'   , cHint ) = 0 ) ) or
                                       ( ( Pos( 'noborder-all:mobile'    , cHint ) > 0 ) and ( bMobileScreen ) ) or
                                       ( ( Pos( 'noborder-all:desktop'   , cHint ) > 0 ) and ( not bMobileScreen ) );
                    bNoBorderLeft   := ( bNoBorderAll ) or
                                       ( ( ( Pos( 'noborder-left'          , cHint ) > 0 ) and ( Pos( 'noborder-left:'  , cHint ) = 0 ) ) or
                                         ( ( Pos( 'noborder-left:mobile'   , cHint ) > 0 ) and ( bMobileScreen ) ) or
                                         ( ( Pos( 'noborder-left:desktop'   , cHint ) > 0 ) and ( not bMobileScreen ) ) );
                    bNoBorderRight  := ( bNoBorderAll ) or
                                       ( ( ( Pos( 'noborder-right'         , cHint ) > 0 ) and ( Pos( 'noborder-right:' , cHint ) = 0 ) ) or
                                         ( ( Pos( 'noborder-right:mobile'  , cHint ) > 0 ) and ( bMobileScreen ) ) or
                                         ( ( Pos( 'noborder-right:desktop'   , cHint ) > 0 ) and ( not bMobileScreen ) ) );
                    bNoBorderTop    := ( bNoBorderAll ) or
                                       ( ( ( Pos( 'noborder-top'           , cHint ) > 0 ) and ( Pos( 'noborder-top:'   , cHint ) = 0 ) ) or
                                         ( ( Pos( 'noborder-top:mobile'    , cHint ) > 0 ) and ( bMobileScreen ) ) or
                                         ( ( Pos( 'noborder-top:desktop'   , cHint ) > 0 ) and ( not bMobileScreen ) ) );
                    bNoBorderBottom := ( bNoBorderAll ) or
                                       ( ( ( Pos( 'noborder-bottom'        , cHint ) > 0 ) and ( Pos( 'noborder-bottom:', cHint ) = 0 ) ) or
                                         ( ( Pos( 'noborder-bottom:mobile' , cHint ) > 0 ) and ( bMobileScreen ) ) or
                                         ( ( Pos( 'noborder-bottom:desktop'   , cHint ) > 0 ) and ( not bMobileScreen ) ) );
//                    bNoBorderAll    := ( ( Pos( 'noborder-all'           , cHint ) > 0 ) and ( Pos( 'noborder-all:'   , cHint ) = 0 ) ) or
//                                       ( ( Pos( 'noborder-all:mobile'    , cHint ) > 0 ) and ( bMobileScreen ) );
//                    bNoBorderLeft   := ( bNoBorderAll ) or
//                                       ( ( ( Pos( 'noborder-left'          , cHint ) > 0 ) and ( Pos( 'noborder-left:'  , cHint ) = 0 ) ) or
//                                         ( ( Pos( 'noborder-left:mobile'   , cHint ) > 0 ) and ( bMobileScreen ) ) );
//                    bNoBorderRight  := ( bNoBorderAll ) or
//                                       ( ( ( Pos( 'noborder-right'         , cHint ) > 0 ) and ( Pos( 'noborder-right:' , cHint ) = 0 ) ) or
//                                         ( ( Pos( 'noborder-right:mobile'  , cHint ) > 0 ) and ( bMobileScreen ) ) );
//                    bNoBorderTop    := ( bNoBorderAll ) or
//                                       ( ( ( Pos( 'noborder-top'           , cHint ) > 0 ) and ( Pos( 'noborder-top:'   , cHint ) = 0 ) ) or
//                                         ( ( Pos( 'noborder-top:mobile'    , cHint ) > 0 ) and ( bMobileScreen ) ) );
//                    bNoBorderBottom := ( bNoBorderAll ) or
//                                       ( ( ( Pos( 'noborder-bottom'        , cHint ) > 0 ) and ( Pos( 'noborder-bottom:', cHint ) = 0 ) ) or
//                                         ( ( Pos( 'noborder-bottom:mobile' , cHint ) > 0 ) and ( bMobileScreen ) ) );

                    if ( iFirstPos = 0 ) or ( oObjTemp3 <> nil ) then
                    begin
                         iAreaAvailableH := oObjTemp2.Width ;//- 2 ;  // v. 3.3.0.0

                         //block-area-max
//                         bBlockAreaMax    := False;
//                         iMaxAreaAvaibleH := 0;
//                         cTemp2 := rc_GetHintProperty( 'block-area-max:' , oObjTemp2.Hint );
//                         If cTemp2 <> '' then
//                         begin
//                              bBlockAreaMax    := True;
//                              iMaxAreaAvaibleH := StrToIntDef( cTemp2, iAreaAvailableH );
//                         end;

                         iNumBlocksH := iAreaAvailableH div iNumBlocks;

                         iBlockWidth  := iResponsivenessLimitH;
                         iBlockHeight := iResponsivenessLimitV;

                         //qts blocos efetivamente cabem na area disponivel ?
                         if iResponsivenessLimitH > 0 then
                            iNumBlocksH := ( ( iAreaAvailableH ) div ( iResponsivenessLimitH ) ) ;

                         if iNumBlocksH > iNumBlocks then
                            iNumBlocksH := iNumBlocks
                         else
                         if iNumBlocksH = 0 then
                            iNumBlocksH := 1;

                         //analisaar isso abaixo e acima
                         iBlockPercent    := ( 1 / iNumBlocks ) ;

                         if bMobileScreen then
                            iBlockWidth := Trunc( ( iAreaAvailableH - ( iOffSet_Border div 2 ) ) * iBlockPercent )
                         else
                            iBlockWidth := Trunc( ( iAreaAvailableH - iOffSet_Border ) * iBlockPercent ) ;
                    end;

                    oObj.Width := ( iBlockWidth * oObj.tag ) - iOffSet_Border;

                    if oObj.Width < 0 then
                       oObj.Width := 0;

                    if bNoBorderLeft then
                       oObj.Width := oObj.Width + iOffSet_Border ;

                    // v. 4.1.0.0
                    iMin_mob   := 0;
                    iMin_mob_h := 0;
                    iMin_mob_v := 0;
                    iMin       := 0;
                    iMax_mob   := 0;
                    iMax_mob_h := 0;
                    iMax_mob_v := 0;
                    iMax       := 0;
                    cTemp3 := rc_GetHintProperty( 'max-width:', oObj.Hint ) ;
                    if cTemp3 <> '' then
                    begin
                       cTemp3 := cTemp3 + '.';//rc_GetHintProperty( 'max-width:', oObj.Hint ) ;
                       cTemp3 := Copy( cTemp3, 1, Pos( '.', cTemp3 ) - 1 );

                       if ( Pos( 'mobile-v', cTemp3 ) > 0 ) and
                          ( bMobileScreenPortrait ) then
                       begin
                            cTemp3          := rc_GetHintProperty( 'mobile-v-', cTemp3, true ) ;
                            iMax_mob_v := StrToIntDef( cTemp3, oObj.Width );
                            if oObj.Width > iMax_mob_v then
                               oObj.Width := iMax_mob_v;
                       end
                       else
                       if ( Pos( 'mobile-h', cTemp3 ) > 0 ) and
                          ( bMobileScreenLandscape ) then
                       begin
                            cTemp3          := rc_GetHintProperty( 'mobile-h-', cTemp3, true ) ;
                            iMax_mob_h := StrToIntDef( cTemp3, oObj.Width );
                            if oObj.Width > iMax_mob_h then
                               oObj.Width := iMax_mob_h;
                       end
                       else
                       if ( Pos( 'mobile-', cTemp3 ) > 0 ) and
                          ( bMobileScreen ) then
                       begin
                            cTemp3          := rc_GetHintProperty( 'mobile-', cTemp3, true ) ;
                            iMax_mob   := StrToIntDef( cTemp3, oObj.Width );
                            if oObj.Width > iMax_mob then
                               oObj.Width := iMax_mob;
                       end
                       else
                       //desktop
                       if ( not bMobileScreen ) then // v. 3.3.2.0
                       begin
                          cTemp3 := cTemp3 + ' ';
                          cTemp3 := Copy( cTemp3, 1, Pos( ' ', cTemp3 ) - 1 );
                          if ( StrToIntDef( cTemp3 , -99999) <> -99999 ) then
                          begin
                             iMax  := StrToIntDef( cTemp3, oObj.Width );
                             if oObj.Width > iMax then
                                oObj.Width := iMax;
                          end;
                       end;
                    end;
                    cTemp3 := rc_GetHintProperty( 'min-width:', oObj.Hint ) ;
                    if cTemp3 <> '' then
                    begin
                       cTemp3 := cTemp3 + '.';//rc_GetHintProperty( 'max-width:', oObj.Hint ) ;
                       cTemp3 := Copy( cTemp3, 1, Pos( '.', cTemp3 ) - 1 );

                       if ( Pos( 'mobile-v', cTemp3 ) > 0 ) and
                          ( bMobileScreenPortrait ) then
                       begin
                            cTemp3          := rc_GetHintProperty( 'mobile-v-', cTemp3, true ) ;
                            iMax_mob_v := StrToIntDef( cTemp3, oObj.Width );
                            if oObj.Width < iMax_mob_v then
                               oObj.Width := iMax_mob_v;
                       end
                       else
                       if ( Pos( 'mobile-h', cTemp3 ) > 0 ) and
                          ( bMobileScreenLandscape ) then
                       begin
                            cTemp3          := rc_GetHintProperty( 'mobile-h-', cTemp3, true ) ;
                            iMax_mob_h := StrToIntDef( cTemp3, oObj.Width );
                            if oObj.Width < iMax_mob_h then
                               oObj.Width := iMax_mob_h;
                       end
                       else
                       if ( Pos( 'mobile-', cTemp3 ) > 0 ) and
                          ( bMobileScreen ) then
                       begin
                            cTemp3          := rc_GetHintProperty( 'mobile-', cTemp3, true ) ;
                            iMax_mob   := StrToIntDef( cTemp3, oObj.Width );
                            if oObj.Width < iMax_mob then
                               oObj.Width := iMax_mob;
                       end
                       else
                       //desktop
                       if ( not bMobileScreen ) then // v. 3.3.2.0
                       begin
                          cTemp3 := cTemp3 + ' ';
                          cTemp3 := Copy( cTemp3, 1, Pos( ' ', cTemp3 ) - 1 );
                          if ( StrToIntDef( cTemp3 , -99999) <> -99999 ) then
                          begin
                             iMax  := StrToIntDef( cTemp3, oObj.Width );
                             if oObj.Width < iMax then
                                oObj.Width := iMax;
                          end;
                       end;
                    end;
                    cTemp3 := rc_GetHintProperty( 'width:', oObj.Hint ) ;
                    if cTemp3 <> '' then
                    begin
                       cTemp3 := cTemp3 + '.';//rc_GetHintProperty( 'max-width:', oObj.Hint ) ;
                       cTemp3 := Copy( cTemp3, 1, Pos( '.', cTemp3 ) - 1 );

                       if ( Pos( 'mobile-v', cTemp3 ) > 0 ) and
                          ( bMobileScreenPortrait ) then
                       begin
                            cTemp3          := rc_GetHintProperty( 'mobile-v-', cTemp3, true ) ;
                            iMax_mob_v := StrToIntDef( cTemp3, oObj.Width );
                            oObj.Width := iMax_mob_v;
                       end
                       else
                       if ( Pos( 'mobile-h', cTemp3 ) > 0 ) and
                          ( bMobileScreenLandscape ) then
                       begin
                            cTemp3          := rc_GetHintProperty( 'mobile-h-', cTemp3, true ) ;
                            iMax_mob_h := StrToIntDef( cTemp3, oObj.Width );
                            oObj.Width := iMax_mob_h;
                       end
                       else
                       if ( Pos( 'mobile-', cTemp3 ) > 0 ) and
                          ( bMobileScreen ) then
                       begin
                            cTemp3          := rc_GetHintProperty( 'mobile-', cTemp3, true ) ;
                            iMax_mob   := StrToIntDef( cTemp3, oObj.Width );
                            oObj.Width := iMax_mob;
                       end
                       else
                       //desktop
                       if ( not bMobileScreen ) then // v. 3.3.2.0
                       begin
                          cTemp3 := cTemp3 + ' ';
                          cTemp3 := Copy( cTemp3, 1, Pos( ' ', cTemp3 ) - 1 );
                          if ( StrToIntDef( cTemp3 , -99999) <> -99999 ) then
                          begin
                             iMax  := StrToIntDef( cTemp3, oObj.Width );
                             oObj.Width := iMax;
                          end;
                       end;
                    end;

                    cTemp3 := rc_GetHintProperty( 'hide:', oObj.Hint ) ;
                    if cTemp3 <> '' then
                    begin
                       if ( cTemp3 = 'mobile-v' ) and
                          ( bMobileScreenPortrait ) then
                       begin
                            oObj.Width := 0;
                       end
                       else
                       if ( cTemp3 = 'mobile-h' ) and
                          ( bMobileScreenLandscape ) then
                       begin
                            oObj.Width := 0;
                       end
                       else
                       if ( cTemp3 = 'mobile' ) and
                          ( bMobileScreen ) then
                       begin
                            oObj.Width := 0;
                       end;
                    end;

                    //oBlocksProps[ f , 1 ] := oObj.Width;
                    iNextObjWidth := 0;
                    oObjTemp4 := nil;
                    oObjNext  := nil;
                    for o := f+1 to iCountBlocks do
                    begin
                         oObjTemp4 := TUniControl( oBlocks[ o ].GetParentComponent );

                         if ( oObjTemp4 = oObjTemp2 ) then
                         begin
                            oObjNext := oBlocks[ o ];
                            Break;
                         end
                         else
                            oObjTemp4 := nil;
                    end;
                    if oObjNext <> nil then
                    begin
                       // v. 3.3.2.0
                       cHintNext        := oObjNext.Hint;
                       bNoBorderAll3    := ( ( Pos( 'noborder-all'           , cHintNext ) > 0 ) and ( Pos( 'noborder-all:'   , cHint ) = 0 ) ) or
                                           ( ( Pos( 'noborder-all:mobile'    , cHintNext ) > 0 ) and ( bMobileScreen ) ) or
                                           ( ( Pos( 'noborder-all:desktop'   , cHintNext ) > 0 ) and ( not bMobileScreen ) );
                       bNoBorderLeft3   := ( bNoBorderAll ) or
                                           ( ( ( Pos( 'noborder-left'          , cHintNext ) > 0 ) and ( Pos( 'noborder-left:'  , cHint ) = 0 ) ) or
                                             ( ( Pos( 'noborder-left:mobile'   , cHintNext ) > 0 ) and ( bMobileScreen ) ) or
                                             ( ( Pos( 'noborder-left:desktop'  , cHintNext ) > 0 ) and ( not bMobileScreen ) ) );
                       bNoBorderRight3  := ( bNoBorderAll ) or
                                           ( ( ( Pos( 'noborder-right'         , cHintNext ) > 0 ) and ( Pos( 'noborder-right:' , cHint ) = 0 ) ) or
                                             ( ( Pos( 'noborder-right:mobile'  , cHintNext ) > 0 ) and ( bMobileScreen ) ) or
                                             ( ( Pos( 'noborder-right:desktop' , cHintNext ) > 0 ) and ( not bMobileScreen ) ) );
                       bNoBorderTop3    := ( bNoBorderAll ) or
                                           ( ( ( Pos( 'noborder-top'           , cHintNext ) > 0 ) and ( Pos( 'noborder-top:'   , cHint ) = 0 ) ) or
                                             ( ( Pos( 'noborder-top:mobile'    , cHintNext ) > 0 ) and ( bMobileScreen ) ) or
                                             ( ( Pos( 'noborder-top:desktop'   , cHintNext ) > 0 ) and ( not bMobileScreen ) ) );
                       bNoBorderBottom3 := ( bNoBorderAll ) or
                                           ( ( ( Pos( 'noborder-bottom'        , cHintNext ) > 0 ) and ( Pos( 'noborder-bottom:', cHint ) = 0 ) ) or
                                             ( ( Pos( 'noborder-bottom:mobile' , cHintNext ) > 0 ) and ( bMobileScreen ) ) or
                                             ( ( Pos( 'noborder-bottom:desktop', cHintNext ) > 0 ) and ( not bMobileScreen ) ) );
//                       bNoBorderAll3    := ( ( Pos( 'noborder-all'           , cHintNext ) > 0 ) and ( Pos( 'noborder-all:'   , cHintNext ) = 0 ) ) or
//                                           ( ( Pos( 'noborder-all:mobile'    , cHintNext ) > 0 ) and ( bMobileScreen ) );
//                       bNoBorderLeft3   := ( bNoBorderAll3 ) or
//                                           ( ( ( Pos( 'noborder-left'          , cHintNext ) > 0 ) and ( Pos( 'noborder-left:'  , cHintNext ) = 0 ) ) or
//                                             ( ( Pos( 'noborder-left:mobile'   , cHintNext ) > 0 ) and ( bMobileScreen ) ) );
//                       bNoBorderRight3  := ( bNoBorderAll3 ) or
//                                           ( ( ( Pos( 'noborder-right'         , cHintNext ) > 0 ) and ( Pos( 'noborder-right:' , cHintNext ) = 0 ) ) or
//                                             ( ( Pos( 'noborder-right:mobile'  , cHintNext ) > 0 ) and ( bMobileScreen ) ) );
//                       bNoBorderTop3    := ( bNoBorderAll3 ) or
//                                           ( ( ( Pos( 'noborder-top'           , cHintNext ) > 0 ) and ( Pos( 'noborder-top:'   , cHintNext ) = 0 ) ) or
//                                             ( ( Pos( 'noborder-top:mobile'    , cHintNext ) > 0 ) and ( bMobileScreen ) ) );
//                       bNoBorderBottom3 := ( bNoBorderAll3 ) or
//                                           ( ( ( Pos( 'noborder-bottom'        , cHintNext ) > 0 ) and ( Pos( 'noborder-bottom:', cHintNext ) = 0 ) ) or
//                                             ( ( Pos( 'noborder-bottom:mobile' , cHintNext ) > 0 ) and ( bMobileScreen ) ) );

                       oObjNext.Width := ( iBlockWidth * oObjNext.tag ) - IfThen( bNoBorderRight, 0, iOffSet_Border );

                       iNextObjWidth  := oObjNext.Width;
                    end;

                    // em landscape...abro o MENU..e GIRO...
                    if ( iFirstPos > 0 ) then
                    begin
                      // se houve mudanca de parent...manter o PRIOR
                      if ( oObjTemp3 = nil ) then
                      begin
                         cTemp := rc_GetBlockPrior( oObj , pFrame );
                         oObjPrior := TUniContainerPanel( rc_FindControl( 'rcBlock' + cTemp , pFrame ) );
                      end;
                      // v. 3.3.2.0
                      cHintPrior       := oObjPrior.Hint;
                      bNoBorderAll2    := ( ( Pos( 'noborder-all'           , cHintPrior ) > 0 ) and ( Pos( 'noborder-all:'   , cHint ) = 0 ) ) or
                                          ( ( Pos( 'noborder-all:mobile'    , cHintPrior ) > 0 ) and ( bMobileScreen ) ) or
                                          ( ( Pos( 'noborder-all:desktop'   , cHintPrior ) > 0 ) and ( not bMobileScreen ) );
                      bNoBorderLeft2   := ( bNoBorderAll ) or
                                          ( ( ( Pos( 'noborder-left'          , cHintPrior ) > 0 ) and ( Pos( 'noborder-left:'  , cHint ) = 0 ) ) or
                                            ( ( Pos( 'noborder-left:mobile'   , cHintPrior ) > 0 ) and ( bMobileScreen ) ) or
                                            ( ( Pos( 'noborder-left:desktop'  , cHintPrior ) > 0 ) and ( not bMobileScreen ) ) );
                      bNoBorderRight2  := ( bNoBorderAll ) or
                                          ( ( ( Pos( 'noborder-right'         , cHintPrior ) > 0 ) and ( Pos( 'noborder-right:' , cHint ) = 0 ) ) or
                                            ( ( Pos( 'noborder-right:mobile'  , cHintPrior ) > 0 ) and ( bMobileScreen ) ) or
                                            ( ( Pos( 'noborder-right:desktop' , cHintPrior ) > 0 ) and ( not bMobileScreen ) ) );
                      bNoBorderTop2    := ( bNoBorderAll ) or
                                          ( ( ( Pos( 'noborder-top'           , cHintPrior ) > 0 ) and ( Pos( 'noborder-top:'   , cHint ) = 0 ) ) or
                                            ( ( Pos( 'noborder-top:mobile'    , cHintPrior ) > 0 ) and ( bMobileScreen ) ) or
                                            ( ( Pos( 'noborder-top:desktop'   , cHintPrior ) > 0 ) and ( not bMobileScreen ) ) );
                      bNoBorderBottom2 := ( bNoBorderAll ) or
                                          ( ( ( Pos( 'noborder-bottom'        , cHintPrior ) > 0 ) and ( Pos( 'noborder-bottom:', cHint ) = 0 ) ) or
                                            ( ( Pos( 'noborder-bottom:mobile' , cHintPrior ) > 0 ) and ( bMobileScreen ) ) or
                                            ( ( Pos( 'noborder-bottom:desktop', cHintPrior ) > 0 ) and ( not bMobileScreen ) ) );
//                      bNoBorderAll2    := ( bNoBorderAll2 ) or
//                                          ( ( ( Pos( 'noborder-all'           , cHintPrior ) > 0 ) and ( Pos( 'noborder-all:'   , cHintPrior ) = 0 ) ) or
//                                            ( ( Pos( 'noborder-all:mobile'    , cHintPrior ) > 0 ) and ( bMobileScreen ) ) );
//                      bNoBorderLeft2   := ( bNoBorderAll2 ) or
//                                          ( ( ( Pos( 'noborder-left'          , cHintPrior ) > 0 ) and ( Pos( 'noborder-left:'  , cHintPrior ) = 0 ) ) or
//                                            ( ( Pos( 'noborder-left:mobile'   , cHintPrior ) > 0 ) and ( bMobileScreen ) ) );
//                      bNoBorderRight2  := ( bNoBorderAll2 ) or
//                                          ( ( ( Pos( 'noborder-right'         , cHintPrior ) > 0 ) and ( Pos( 'noborder-right:' , cHintPrior ) = 0 ) ) or
//                                            ( ( Pos( 'noborder-right:mobile'  , cHintPrior ) > 0 ) and ( bMobileScreen ) ) );
//                      bNoBorderTop2    := ( bNoBorderAll2 ) or
//                                          ( ( ( Pos( 'noborder-top'           , cHintPrior ) > 0 ) and ( Pos( 'noborder-top:'   , cHintPrior ) = 0 ) ) or
//                                            ( ( Pos( 'noborder-top:mobile'    , cHintPrior ) > 0 ) and ( bMobileScreen ) ) );
//                      bNoBorderBottom2 := ( bNoBorderAll2 ) or
//                                          ( ( ( Pos( 'noborder-bottom'        , cHintPrior ) > 0 ) and ( Pos( 'noborder-bottom:', cHintPrior ) = 0 ) ) or
//                                            ( ( Pos( 'noborder-bottom:mobile' , cHintPrior ) > 0 ) and ( bMobileScreen ) ) );
                    end;

                    if iFirstPos = 0 then
                       iFirstPos := f;

                    i3 := 0;

                    // continuar daqui amanha...
                    // tentar ver em modo landscape por que nao tá expandido sem a imagem
                    if oObj.Width > 0 then
                    begin
                         // v. 3.3.3.0
                         // somar os offsets
                         if not bNoBorderRight then
                            i5 := i5 + iOffSet_Border;
                         // v. 3.3.2.0
                         // pular linha
                         if ( i5 + oObj.width >= iAreaAvailableH ) or
                            ( i4 + oObj.tag = iNumBlocks ) or
                            ( i5 + oObj.width + iNextObjWidth  >= iAreaAvailableH ) then
                            if ( iMax = 0 ) and ( bNoBorderRight ) and ( oObj.Width + iOffSet_Border <= iAreaAvailableH ) then
                               oObj.Width := oObj.Width + iOffSet_Border ;

                         i5 := i5 + oObj.width;
                         i4 := i4 + oObj.tag;
                    end;

                    // primeiro bloco encontrado...
                    if ( ( f <= iFirstPos ) and ( iPos = 0 ) ) then
                    begin
                       iPos := 1;

                       oObj.Left := IfThen( bNoBorderLeft, 0, iOffSet_Border );
                       oObj.Top  := IfThen( bNoBorderTop , 0, iOffSet_Border );
                    end
                    else
                    begin
                       if i = 0 then
                       begin
                          if oObjPrior <> nil then
                          begin
                                if oObjPrior.Width > 0 then
                                   oObj.Left := oObjPrior.Left + oObjPrior.Width + iOffSet
                                else
                                   oObj.Left := oObjPrior.Left + oObjPrior.Width ;

                                oObj.Top  := oObjPrior.Top;
                                oObj.Left := IfThen( bNoBorderLeft, oObj.Left - iOffSet_Border, oObj.Left );
                                // v. 3.3.2.0
                                if ( Pos( 'cols:', oObjTemp2.Hint ) > 0 ) and
                                   ( ( bNoBorderLeft and bNoBorderRight and bNoBorderLeft2 and bNoBorderLeft3 and bNoBorderRight2 and bNoBorderRight3 ) ) then
                                begin
                                   if ( oObjPrior <> nil ) and ( oObjNext <> nil ) then
                                   begin
                                        if not ( bNoBorderLeft2 and bNoBorderLeft3 and bNoBorderRight2 and bNoBorderRight3 ) then
                                           oObj.Left := IfThen( bNoBorderLeft and bNoBorderRight, oObj.Left - iOffSet_Border, oObj.Left );
                                   end
                                   else
                                   if (oObjPrior <> nil ) then
                                   begin
                                        if not ( bNoBorderLeft2 and bNoBorderRight2 ) then
                                           oObj.Left := IfThen( bNoBorderLeft and bNoBorderRight, oObj.Left - iOffSet_Border, oObj.Left );
                                   end;
                                end
                                else
                                if ( ( bNoBorderLeft and bNoBorderRight and bNoBorderLeft2 and bNoBorderLeft3 and bNoBorderRight2 and bNoBorderRight3 ) ) then
                                begin
                                   if ( oObjPrior <> nil ) and ( oObjNext <> nil ) then
                                   begin
                                        if not ( bNoBorderLeft2 and bNoBorderLeft3 and bNoBorderRight2 and bNoBorderRight3 ) then
                                           oObj.Left := IfThen( bNoBorderLeft and bNoBorderRight, oObj.Left - iOffSet_Border, oObj.Left );
                                   end
                                   else
                                   if (oObjPrior <> nil ) then
                                   begin
                                        if not ( bNoBorderLeft2 and bNoBorderRight2 ) then
                                           oObj.Left := IfThen( bNoBorderLeft and bNoBorderRight, oObj.Left - iOffSet_Border, oObj.Left );
                                   end;
                                end
                                else
                                if ( ( bNoBorderLeft2 and bNoBorderLeft3 and bNoBorderRight2 and bNoBorderRight3 ) ) then
                                begin
                                     oObj.Left := IfThen( bNoBorderLeft and bNoBorderRight, oObj.Left - iOffSet_Border, oObj.Left );
                                end;

                                if ( bNoBorderTop2 ) and ( bNoBorderTop ) then
                                   oObj.Top  := oObjPrior.Top
                                else
                                if ( bNoBorderTop2 ) then
                                   oObj.Top  := IfThen( bNoBorderTop  , oObjPrior.Top, oObj.Top );

                                if oObj.Top < 0 then
                                   oObj.Top := 0;
                          end;
                       end
                       else
                       begin
                          oObj.Left := IfThen( bNoBorderLeft, 0, iOffSet_Border );
                          oObj.Top  := IfThen( bNoBorderTop , i - iOffSet_Border, i );

                          if oObj.Top < 0 then
                             oObj.Top := 0;
                       end;
                    end;

                    iNextObjWidth := 0;
                    If oObjNext <> nil then
                       iNextObjWidth := oObjNext.Width;

                    // pular linha
                    if ( i5 >= iAreaAvailableH ) or
                       ( i4 = iNumBlocks ) or
                       ( i5 + iNextObjWidth  >= iAreaAvailableH  ) then
                    begin
                        i  := iOffSet_Border + oObj.top + oObj.height ;

                        oBlocksProps[ f, 6 ] := oBlocksProps[ f, 6 ] + i;

                        if oObj.Width > 0 then
                           if bNoBorderRight then
                           begin

                              x := oObj.Width;
                              y := 0;
                              // v. 3.3.3.0
                              o := oObj.Width;
                              if ( iAreaAvailableH - i5 ) > 0 then
                              begin
                                 oObj.Width := oObj.Width + ( iAreaAvailableH - i5 );
                                 i5 := i5 - o;
                                 i5 := i5 + oObj.Width;
                              end;

                              // v. 3.3.0.0
                              if ( iMax_mob_v > 0 ) and
                                 ( bMobileScreenPortrait ) then
                              begin
                                   y := iMax_mob_v;
                              end
                              else
                              if ( iMax_mob_h > 0 ) and
                                 ( bMobileScreenLandscape ) then
                              begin
                                   y := iMax_mob_h;
                              end
                              else
                              if ( iMax_mob > 0 ) and
                                 ( bMobileScreen ) then
                              begin
                                   y := iMax_mob;
                              end
                              else
                              //desktop
                              if ( not bMobileScreen ) and ( iMax > 0  ) then
                              begin
                                 y := iMax;
                              end;

                              if ( y > 0 )then
                              begin
                                   // v. 3.3.2.0
                                   //oObj.Left  := oObj.Left + ( oObj.Width - y ) + iOffSet_Border;
                                   oObj.Left  := oObj.Left + ( oObj.Width - y );
                                   // v. 4.1.0.0
//                                   if oObjPrior <> nil then
//                                      oObjPrior.Width := oObjPrior.Width + ( oObj.Width - y );
                                   if oObjPrior <> nil then
                                   begin
                                      if ( iAreaAvailableH - oObjPrior.Width ) > 0 then
                                      begin
                                         oObjPrior.Width := oObjPrior.Width + ( iAreaAvailableH - ( oObj.Width - y ) );
                                         if oObjPrior.Width > iAreaAvailableH then
                                            oObjPrior.Width := iAreaAvailableH;
                                      end;
                                   end;

                                   oObj.Width := y;
                              end ;
                           end;

                        i4 := 0;
                        i5 := 0;
                    end
                    else
                       i := 0;
                    //v. 4.1.0.0
                    if ( bMobileScreen ) then
                    begin
//                       if oObj.Name = 'rcBlock132' then
//                       rc_CenterObj( oObj, oObj.Parent , false, true , 0, 0 );
                         cTemp3 := rc_GetHintProperty( 'center:', oObj.Hint );
                         if cTemp3 <> '' then
                            if not DynamicAlignment_CENTER( pFrame, oObj, cTemp3, cTemp ) then
                               Break;
                    end;

                    oBlocksProps[ f, 1 ] := iPos;
                    oBlocksProps[ f, 2 ] := i;
                    oBlocksProps[ f, 3 ] := i3;
                    oBlocksProps[ f, 4 ] := i4;
                    oBlocksProps[ f, 5 ] := i5;
               end;
           end
           else
           begin
               if i3 > 5000 then
                  Break
               else
                  Inc( i3 );
           end;
       end;
     Except on e:exception do
            begin
                 //dm_rc.rc_ShowError( 'rcBlocks( 2 ): ' + e.Message )
                 ShowMessageN( 'rcBlocks( 2 ): ' + e.Message );
            end;
     End;
end;
end.
