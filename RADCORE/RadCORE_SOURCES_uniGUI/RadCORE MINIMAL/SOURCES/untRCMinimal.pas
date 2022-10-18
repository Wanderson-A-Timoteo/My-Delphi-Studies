unit untRCMinimal; // v. 3.2.0.7

interface
// v. 3.2.0.3
uses
  SysUtils, Classes, uniGUIClasses, uniGUIApplication, UniScrollBox,
  uniGUITypes, uniGUIDialogs, uniGUIForm, uniPageControl, Vcl.Controls, uniLabel, uniPanel,
  uniGUIFrame, uniHTMLFrame, uniURLFrame, System.TypInfo, IniFiles,
  //FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  //FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  //Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  UniBitBtn, Math, StrUtils,
  System.Variants;

type
  TRCRGPParamType = (rptSEQ, rptVALUE, rptFIELD);

  function  ReverseStr(S: String): String;
  function  strTokenCount(S: string; Seperator: Char): integer;
  function  strToken(var S: string; Seperator: Char): string;
  function  Occurs(T, S: String): integer;
  function  ReturnLetters(pText: string): string;
  function  RemoveLineBreaks(InputText: string): string;
  function  varIIF(aTest: boolean; TrueValue, FalseValue: Variant): Variant;
  function  ReturnNumbers(pText: string): string;

  function  rc_GetDeviceType: string;
  function  rc_NormalizeHintProperty(pContent: string): string;
  function  rc_NormalizeAllTrim( pContent, pToken : string): string;
  function  rc_GetHintProperty( pProp, pProps : string; bParam : boolean = false; bFullLength:boolean = false ) : string;
  function  rc_SetHintProperty(pContent, pProp, pProps: string; pAdd: boolean = false): string;
  function  rc_PosHintProperty(pProp, pContent: string): integer;
  procedure rc_BootStrapRender(
            pForm: TObject;
            pUpdateDBFields: boolean = false;
            pOnlyThisObj: TObject = nil);
  procedure rc_BootStrapRenderExecute(
               pForm: TObject = nil;
               pUpdateDBFields: boolean = false;
               pTabIni: integer = 0;
               pTabEnd: integer = 0;
               pMobileScreen: boolean = false;
               pLandScape: boolean = false;
               pOnlyThisObj: TObject = nil);
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
  procedure rc_DynamicAlignment(pFrame: TObject);
  procedure rc_AlignLabel(pLabel: TUniLabel; pAlign: string = 'left-center');
  procedure rc_AddCssClass(pObj: TObject; pCls: string);
  procedure rc_RemoveCssClass(pObj: TObject; pCls: string); // v. 3.2.0.7
  function  rc_GetParamFromRGP(pName: string; pParam: TRCRGPParamType): string;
  function  rc_GetBlockHeight(oObj, pFrame: TObject; pParamBlk, pAttrib: string): integer;
  function  rc_GetBlockPrior(pBlock, pFrameOrig: TObject): string;
  procedure rc_CenterObj(pObj, pObjParent: TObject; pV, pH: boolean; pV_OffSet, pH_OffSet: integer);
  function  rc_ScreenUpdate(pMainMenuExists: boolean = true): TObject;
  function  rc_FindControl(pName: string; pForm: TObject = nil): TUniControl;
  procedure rc_AdjustFormsSize(pMainMenu: TObject = nil; pResizeBlocks: boolean = true);
  procedure rc_ResizeBlocks( pFrame : TObject; pRunBSRender : boolean = true; pRunAlignment : boolean = true; pScrollTop : boolean = true ); // v. 4.0.0.0
  // v. 4.0.0.0
  procedure rc_RenderLayout(pForm: TObject; pAdjustFormSize : boolean = false ; pResizeBlocks : boolean = false; pMainMenuExists : boolean = true; pUpdateDBGrids : boolean = true; pAdjustEdits : boolean = true  );
  procedure rc_ScrollTop( pFormFrame : TObject );

implementation

uses
  UniGUIVars, uniGUIMainModule, MainModule, Main;

// v. 4.0.0.0
procedure rc_ScrollTop( pFormFrame : TObject );
var
   i : integer;
begin
  // all itemn set tag = 0
  for I := 0 to TComponent(pFormFrame).ComponentCount - 1 do
  begin
      if TComponent(pFormFrame).Components[i] is TUniScrollBox then
      begin
           TUniScrollBox( TComponent(pFormFrame).Components[i] ).ScrollTo( 0,0 );
      end;
  end;
end;
// v. 4.0.0.6
function rc_ScreenUpdate( pMainMenuExists : boolean = true ) : TObject;
var
   oObj : TUniControl;
begin
     oObj := nil;

//     if pMainMenuExists then
//        if UniApplication.FindComponent( 'MainForm' ) <> nil then
//           oObj := TUniControl( MainForm.FindComponent( 'paLayoutMainMenu' ) );
//
//     dm_rc.rc_GetDeviceType;

     mm.varB_Screen_LandScape        := ( mm.varI_ScreenWidth > mm.varI_ScreenHeight );
     mm.varB_Mobile_Screen_Portrait  := ( mm.varB_Mobile_Screen ) and ( not mm.varB_Screen_LandScape );
     mm.varB_Mobile_Screen_Landscape := ( mm.varB_Mobile_Screen and mm.varB_Screen_LandScape );

//     if mm.CONFIG_LAYOUT_MENU_TYPE = '1' then
//     begin
         Result := nil;
//     end
//     else
//     if mm.CONFIG_LAYOUT_MENU_TYPE = '3' then
//     begin
//        if oObj <> nil then
//        begin
//
//            if ( mm.varI_ScreenWidth <= 1024 ) then
//               oObj.Width := 0
//            else
//               oObj.Width := 260;
//            // v. 3.2.0.0
//            MainForm.rc_UpdateMainControls;
//
//            if MainForm.FindComponent( 'sboxMain') <> nil then
//               TUniScrollBox( MainForm.FindComponent( 'sboxMain') ).DoAlignControls; // Feedback from Farshad
//        end;
//
//        Result := oObj;
//     end;
end;

function  rc_GetDeviceType: string;
begin
  mm.uPlat        := UniSession.UniPlatform;

  mm.varB_iOS     := (upiOS in mm.uPlat);
  mm.varB_Android := (upAndroid in mm.uPlat);
  mm.varB_Tablet  := (upTablet in mm.uPlat);
  mm.varB_Desktop := (upDesktop in mm.uPlat);

  mm.varB_Mobile_Screen :=
    (upMobile in mm.uPlat) or
    (upPhone in mm.uPlat) or (upAndroid in mm.uPlat) or
    (upTablet in mm.uPlat) or
    ( ( mm.varB_Desktop ) and ( ( mm.varI_ScreenWidth > 0 ) and ( mm.varI_ScreenWidth <= 740 ) ) ); // v. 3.4.0.0
  // v. 3.3.3.0
  mm.varB_Desktop := ( not mm.varB_Mobile_Screen );
end;

function rc_FindControl( pName: string; pForm : TObject ): TUniControl;
begin
     Result := nil;
     if UniApplication.FindComponent('MainForm' ) <> nil then
        if pForm = nil then pForm := MainForm;

     if pForm <> nil then
     begin
        Result := TUniControl( TComponent( pForm ).FindComponent( pName ) );

        if Result = nil then
           Result := TUniControl( UniApplication.FindComponent( pName ) );
        // v. 3.3.3.2
        if Result = nil then
           if TUniControl( pForm ).Name = 'MainForm' then
              Result := TUniControl( MainForm.FindComponent( pName ) )
           else
           if pForm is TUniForm then
              Result := TUniControl( TUniForm ( pForm ).FindComponent( pName ) )
           else
              Result := TUniControl( TUniFrame ( pForm ).FindComponent( pName ) );
     end;
end;
// v. 4.0.0.4
procedure rc_AdjustFormsSize( pMainMenu : TObject ; pResizeBlocks : boolean );
var
   oMainMenu ,
   oObj : TUniControl;
   oFrm : TUniForm;

   bHeightMax, bWidthMax,
   bAlignLeft, bAlignRight, bAlignTop, bAlignBottom : Boolean;

   cHint,
   cTmp, cTmp2, cTmpW, cTmpH : string;

   bModal,
   bFrmAlign,
   bWidthFix,
   bHeightFix :boolean;

   iMaxWidth, iMaxHeight,
   x, y,
   i : integer;
begin
     oMainMenu := TUniControl ( pMainMenu );
     //UniSession.SuspendLayouts();

     // se houver algum FORM filho aberto ajusta dimensões
     if ( mm.varC_Form_Detail <> nil ) then
     begin
          oFrm       := TUniFORM( mm.varC_Form_Detail );
          bWidthFix  := false;
          bHeightFix := false;
          iMaxWidth  := 0;
          iMaxHeight := 0;

          cTmp  := '';
          cTmp2 := '';

          if Pos( '[[', TUniForm(oFrm).Hint ) = 0 then
             cTmp2 := '[[';

          //[[height:max]]
          bHeightMax := Pos( 'height:max'  , TUniForm(oFrm).Hint ) > 0 ;
          bWidthMax  := Pos( 'width:max'   , TUniForm(oFrm).Hint ) > 0 ;
          bModal     := Pos( 'modal:'      , TUniForm(oFrm).Hint ) > 0 ;

          //[[frm-align:right]]
          bAlignLeft   := Pos( 'frm-align:left'   , TUniForm(oFrm).Hint ) > 0 ;
          bAlignRight  := Pos( 'frm-align:right'  , TUniForm(oFrm).Hint ) > 0 ;
          bAlignTop    := Pos( 'frm-align:top'    , TUniForm(oFrm).Hint ) > 0 ;
          bAlignBottom := Pos( 'frm-align:bottom' , TUniForm(oFrm).Hint ) > 0 ;

          bFrmAlign    := ( bAlignBottom ) or ( bAlignTop ) or ( bAlignLeft ) or ( bAlignRight ) ;
          // v. 3.3.1.0
          if ( Pos( 'width:' , oFrm.Hint ) = 0 )  then
          begin
             if not oFrm.Hint.IsEmpty then
                cTmp := cTmp + '|';
             if oFrm.Align = alClient then
                cTmp := 'width:' + oFrm.Parent.Width.ToString + '|rc_wupd' + cTmp
             else
                 cTmp := 'width:' + oFrm.Width.ToString + '|rc_wupd' + cTmp;

             oFrm.Hint := cTmp + StringReplace( oFrm.Hint, '[[', '', [rfReplaceAll] );
          end;
          // v. 3.3.1.0
          if ( Pos( 'height:' , oFrm.Hint ) = 0 )  then
          begin
             if not cTmp.IsEmpty then
                cTmp := cTmp + '|';
             if oFrm.Align = alClient then
                cTmp := 'height:' + oFrm.Parent.height.ToString + '|rc_hupd'
             else
                 cTmp := 'height:' + oFrm.height.ToString + '|rc_hupd';

             oFrm.Hint := StringReplace( oFrm.Hint, '[[', '', [rfReplaceAll] );
             if oFrm.Hint.IsEmpty then
                oFrm.Hint := cTmp + oFrm.Hint
             else
                oFrm.Hint := cTmp + '|' + oFrm.Hint;
          end;

          if Pos( ']]', oFrm.Hint ) = 0 then
             oFrm.Hint  := oFrm.Hint + ']]';

          if Pos( '[[', oFrm.Hint ) = 0 then
             oFrm.Hint := '[[' + oFrm.Hint ;

          cHint := rc_NormalizeHintProperty( oFrm.Hint  );

          cTmp := rc_GetHintProperty( 'width:', cHint );
          if cTmp <> '' then
          begin
             bWidthFix := ( Pos( 'fix' , cTmp ) > 0 );
             iMaxWidth := StrToIntDef( ReturnNumbers( cTmp ), oFrm.Width );
          end;

          cTmp := rc_GetHintProperty( 'height:', cHint );
          if cTmp <> '' then
          begin
             bHeightFix := ( Pos( 'fix' , cTmp ) > 0 );
             iMaxHeight := StrToIntDef( ReturnNumbers( cTmp ), oFrm.Height );
          end;

          x := oFrm.Left;
          y := oFrm.Top;

          if x > 0 then
             oFrm.Width  := mm.varI_ScreenWidth - ( oFrm.Left * 2 )
          else
             oFrm.Width  := mm.varI_ScreenWidth ;

          if y > 0 then
             oFrm.Height := mm.varI_ScreenHeight - ( oFrm.Top * 2 )
          else
             oFrm.Height := mm.varI_ScreenHeight;

          if bHeightMax then
             oFrm.Height := mm.varI_ScreenHeight;

          if bWidthMax then
             oFrm.Width := mm.varI_ScreenWidth;

          oFrm.Left := ( mm.varI_ScreenWidth div 2 ) - (  oFrm.Width div 2 );
          oFrm.Top  := ( mm.varI_ScreenHeight div 2 ) - (  oFrm.Height div 2 );

          if pResizeBlocks then
             rc_ResizeBlocks( TUniControl(oFrm) );
     end
     else   // Form Detail are MODAL by Default
     begin
        if ( oMainMenu = nil ) then
           if ( UniApplication.FindComponent('MainForm' ) <> nil )  then
              oMainMenu := rc_FindControl( 'paLayoutMainMenu' );
     end;

     for I := 0 to UniApplication.ComponentCount - 1 do
     begin
         if ( UniApplication.Components[i] is TUniForm ) then
         begin
             oObj  := TUniControl( UniApplication.Components[i] );
             oFrm  := TUniForm( UniApplication.Components[i] );

             if ( oFrm.Name <> 'MainForm' ) then
             begin
                 // [[width:360 fix | height:353 fix]]
                 // [[width:sm-360 md-420 lg-540 | height:sm-353 md-420 lg-540]]  - thinking....
                 bWidthFix  := false;
                 bHeightFix := false;
                 iMaxWidth  := 0;
                 iMaxHeight := 0;

                 cTmp  := '';
                 cTmp2 := '';

                 if Pos( '[[', oFrm.Hint ) = 0 then
                    cTmp2 := '[[';

                 //[[height:max]]
                 bHeightMax := Pos( 'height:max'  , TUniForm(oFrm).Hint ) > 0 ;
                 bWidthMax  := Pos( 'width:max'   , TUniForm(oFrm).Hint ) > 0 ;
                 bModal     := Pos( 'modal:'      , TUniForm(oFrm).Hint ) > 0 ;

                 //[[frm-align:right]]
                 bAlignLeft   := Pos( 'frm-align:left'   , TUniForm(oFrm).Hint ) > 0 ;
                 bAlignRight  := Pos( 'frm-align:right'  , TUniForm(oFrm).Hint ) > 0 ;
                 bAlignTop    := Pos( 'frm-align:top'    , TUniForm(oFrm).Hint ) > 0 ;
                 bAlignBottom := Pos( 'frm-align:bottom' , TUniForm(oFrm).Hint ) > 0 ;

                 bFrmAlign    := ( bAlignBottom ) or ( bAlignTop ) or ( bAlignLeft ) or ( bAlignRight ) ;
                 // v. 3.3.1.0
                 if ( Pos( 'width:' , oFrm.Hint ) = 0 )  then
                 begin
                    if not oFrm.Hint.IsEmpty then
                       cTmp := cTmp + '|';
                    if oFrm.Align = alClient then
                       cTmp := 'width:' + oFrm.Parent.Width.ToString + '|rc_wupd' + cTmp
                    else
                        cTmp := 'width:' + oFrm.Width.ToString + '|rc_wupd' + cTmp;

                    oFrm.Hint := cTmp + StringReplace( oFrm.Hint, '[[', '', [rfReplaceAll] );
                 end;
                 // v. 3.3.1.0
                 if ( Pos( 'height:' , oFrm.Hint ) = 0 )  then
                 begin
                    if not cTmp.IsEmpty then
                       cTmp := cTmp + '|';
                    if oFrm.Align = alClient then
                       cTmp := 'height:' + oFrm.Parent.height.ToString + '|rc_hupd'
                    else
                        cTmp := 'height:' + oFrm.height.ToString + '|rc_hupd';

                    oFrm.Hint := StringReplace( oFrm.Hint, '[[', '', [rfReplaceAll] );
                    if oFrm.Hint.IsEmpty then
                       oFrm.Hint := cTmp + oFrm.Hint
                    else
                       oFrm.Hint := cTmp + '|' + oFrm.Hint;
                 end;

                 if Pos( ']]', oFrm.Hint ) = 0 then
                    oFrm.Hint  := oFrm.Hint + ']]';

                 if Pos( '[[', oFrm.Hint ) = 0 then
                    oFrm.Hint := '[[' + oFrm.Hint ;

                 cHint := rc_NormalizeHintProperty( oFrm.Hint  );

                 cTmp := rc_GetHintProperty( 'width:', cHint );
                 if cTmp <> '' then
                 begin
                    bWidthFix := ( Pos( 'fix' , cTmp ) > 0 );
                    iMaxWidth := StrToIntDef( ReturnNumbers( cTmp ), oFrm.Width );
                 end;

                 cTmp := rc_GetHintProperty( 'height:', cHint );
                 if cTmp <> '' then
                 begin
                    bHeightFix := ( Pos( 'fix' , cTmp ) > 0 );
                    iMaxHeight := StrToIntDef( ReturnNumbers( cTmp ), oFrm.Height );
                 end;

                 if ( not bHeightMax ) or ( not bWidthMax ) then
                 begin
                    if ( oFrm.Name <> 'frmMessage' ) then
                    begin
                       if mm.varB_Mobile_Screen_Landscape then
                       begin
                          If ( bModal ) or ( bFrmAlign ) then
                          begin
                             if not bWidthFix then
                               oFrm.Width := varIIF( ( iMaxWidth < 500 ), iMaxWidth, 500 )
                             else
                                oFrm.Width := iMaxWidth ;

                             if not bHeightFix then
                                oFrm.Height := mm.varI_ScreenHeight
                             else
                                oFrm.Height := iMaxHeight ;
                          end
                          else
                          begin
                             oFrm.Width  := mm.varI_ScreenWidth;
                             oFrm.Height := iMaxHeight ;
                          end;
                       end
                       else
                       if ( mm.varB_Mobile_Screen ) then
                       begin
                          If ( bModal ) or ( bFrmAlign ) then
                          begin
                             if ( ( not bWidthFix ) and ( not bWidthMax ) ) or ( bWidthMax ) then
                             begin
                               // v. 4.0.0.0
                               oFrm.Width := mm.varI_ScreenWidth;
                               //if oMainMenu = nil then
                               //   oFrm.Width := mm.varI_ScreenWidth
                               //else
                               //   oFrm.Width := mm.varI_ScreenWidth - TUniControl( oMainMenu ).Width;
                             end
                             else
                                oFrm.Width := iMaxWidth ;

                             if ( ( not bHeightFix ) and ( not bHeightMax ) ) or ( bHeightMax ) then
                                oFrm.Height := mm.varI_ScreenHeight
                             else
                                oFrm.Height := iMaxHeight ;
                          end
                          else
                          begin
                             oFrm.Width  := mm.varI_ScreenWidth;
                             oFrm.Height := mm.varI_ScreenHeight;
                          end;
                       end
                       else
                       begin
                          If ( bModal ) or ( bFrmAlign ) then
                          begin
                              if iMaxWidth > 0 then
                                 oFrm.Width  := iMaxWidth ;

                              if iMaxHeight > 0 then
                                 oFrm.Height := iMaxHeight ;
                          end
                          else
                          begin
                             If ( bModal ) then
                             begin
                                // v. 4.0.0.0
//                                if UniApplication.FindComponent('MainForm' ) <> nil then
//                                begin
//                                     oMainMenu := rc_FindControl( 'paLayoutMainMenu' );
//                                     if oMainMenu <> nil then
//                                     begin
//                                        oFrm.Width  := mm.varI_ScreenWidth - TUniControl( oMainMenu ).Width;
//                                     end;
//                                end
//                                else
                                   oFrm.Width  := mm.varI_ScreenWidth;
                             end
                             else
                                oFrm.Width  := mm.varI_ScreenWidth;

                             oFrm.Height := iMaxHeight ;
                          end;
                       end;
                    end
                    else
                    begin
                       if mm.varB_Mobile_Screen_Landscape then
                       begin
                          oFrm.Height:= mm.varI_ScreenHeight - 10;
                       end
                    end;

                    If ( bModal ) or ( bFrmAlign ) then
                    begin
                       if bAlignLeft then
                       begin
                            oFrm.Left := 0;
                            oFrm.Top  := 0;
                       end
                       else
                       if bAlignRight then
                       begin
                            oFrm.Left := ( mm.varI_ScreenWidth ) - oFrm.Width;
                            oFrm.Top  := 0;
                       end
                       else
                       if bAlignTop then
                       begin
                            oFrm.Left := ( mm.varI_ScreenWidth div 2 ) - (  oFrm.Width div 2 );
                            oFrm.Top  := 0;
                       end
                       else
                       if bAlignBottom then
                       begin
                            oFrm.Left := ( mm.varI_ScreenWidth div 2 ) - (  oFrm.Width div 2 );
                            oFrm.Top  := ( mm.varI_ScreenHeight ) - oFrm.Height;
                       end
                       else
                       begin
                          oFrm.Left := ( mm.varI_ScreenWidth div 2 ) - (  oFrm.Width div 2 );
                          oFrm.Top  := ( mm.varI_ScreenHeight div 2 ) - (  oFrm.Height div 2 );
                       end;
                    end
                    else
                    begin
                       oFrm.Left := 0;
                       oFrm.Top  := 0;
                    end;
                 end;

                 if bHeightMax then
                    oFrm.Height := mm.varI_ScreenHeight;
                 // v. 4.0.0.1
                 if bWidthMax then
                    //if oMainMenu = nil then
                    oFrm.Width := mm.varI_ScreenWidth;
                    //else
                    //   oFrm.Width := mm.varI_ScreenWidth - TUniControl( oMainMenu ).Width;

                 if pResizeBlocks then
                   rc_ResizeBlocks( TUniControl(oObj), bModal );
             end;
         end;
     end;
     //UniSession.ResumeLayouts();
end;

// v. 4.0.0.0
procedure rc_ResizeBlocks( pFrame : TObject; pRunBSRender : boolean ; pRunAlignment : boolean; pScrollTop : boolean  ); // v. 4.0.0.0
// v. 3.2.0..7
var
   oObj : TUniContainerPanel;
   oObjTemp, oObjTemp2,
   oObjTemp3, oObjTemp4, oObjTemp5,
   oObjTemp6, oObjTemp7, oObjTemp8 : TUniControl;

   bModal : Boolean;

   iOffSet_Border,
   iOffSet,
   iAreaAvailableH,
   iAreaAvailableV,
   iLimiteResponsividadeH,
   iLimiteResponsividadeV,
   iNumBlocks,
   i4, i5 : integer;
begin
     oObj      := nil; // v. 3.2.0..7
     oObjTemp  := nil;
     oObjTemp2 := nil;
     oObjTemp3 := nil;
     oObjTemp4 := nil;
     oObjTemp5 := nil;
     oObjTemp6 := nil;
     oObjTemp7 := nil;
     oObjTemp8 := nil;

     try
        //UniSession.SuspendLayouts;
        mm.varB_Resizing := true;

        try
           if pFrame = nil then
              if UniApplication.FindComponent('MainForm' ) <> nil then
                 pFrame := MainForm;

           if ( lowercase( TUniControl(pFrame).Name ) <> 'mainform' ) and
              ( lowercase( TUniControl(pFrame).Name ) <> 'mf' ) then
              bModal := Pos( 'modal:', TUniControl(pFrame).Hint ) > 0
           else
              bModal := false;

           if UniApplication.FindComponent('MainForm' ) <> nil then
           begin
              if ( mm.varB_Mobile_Screen ) then
              begin
                  //MainForm.Align  := alNone;
                  //MainForm.Height := TUniControl( pFrame ).Height;//  740;
              end;

              oObjTemp8 := TUniHTMLFrame( Mainform.FindComponent( 'btnFloatingFAB' ) );

              if oObjTemp8 <> nil then
              begin
                 oObjTemp8.Left := mm.varI_ScreenWidth - oObjTemp8.Width - 20 ;
                 oObjTemp8.Top  := mm.varI_ScreenHeight - oObjTemp8.Height - 20;
              end;

              // rotacionou MOBILE( MainForm Controls )
              oObjTemp := TUniLabel( Mainform.FindComponent( 'labCompanyName' ) );
              if oObjTemp <> nil then
              begin
                 oObjTemp2 := TUniLabel( Mainform.FindComponent( 'btnNotifications' ) );
                 oObjTemp3 := TUniLabel( Mainform.FindComponent( 'btnCfg' ) );
                 oObjTemp4 := TUniLabel( Mainform.FindComponent( 'labbtnExit' ) );
                 oObjTemp5 := nil;//TUniContainerPanel( Mainform.FindComponent( 'paLayoutMainMenu' ) ); // v. 4.0.0.4
                 oObjTemp6 := TUniContainerPanel( Mainform.FindComponent( 'paSearchTop' ) );
                 oObjTemp7 := TUniPanel( Mainform.FindComponent( 'paLayoutBgUser' ) );

                 if mm.varI_ScreenHeight <= 500  then
                 begin
                    if oObjTemp5 <> nil then
                       if oObjTemp5.tag = 0 then // paLayoutMainMenu
                       begin
                          if oObjTemp7 <> nil then
                          begin
                             oObjTemp7.tag     := oObjTemp7.Height;
                             oObjTemp7.Visible := False;
                          end;
                       end;
                 end
                 else
                 begin
                    if oObjTemp5 <> nil then
                       if ( oObjTemp5.tag = 0 ) and ( oObjTemp6 <> nil ) and ( oObjTemp7 <> nil ) then // paLayoutMainMenu
                       begin
                          oObjTemp6.Visible             := false;
                          oObjTemp6.Align               := alNone;
                          oObjTemp7.Visible          := True;
                          oObjTemp6.Align               := alTop;
                          oObjTemp6.Visible             := true;
                       end;
                 end;
              end;
           end;
           // v. 4.0.0.1
           //desmarca: clicou no MENU
           //if oObjTemp5 <> nil then
           //   oObjTemp5.tag := 0; // paLayoutMainMenu

           // v. 3.0.0.48
           iOffSet        := StrToIntDef( mm.CONFIG_LAYOUT_GRIDBLOCK_OFFSET, 15 );
           iOffSet_Border := iOffSet;

          // blocos horizontais  por padrao
          iNumBlocks    := 12;  // 9 bordas entre eles e mais 2 bordas ( 8 antes e 1 depois pra dar espaco a barra de rolagem )

          // largura de cada bloco mínimo inicial( defina um padrao diferente caso deseje )
          iLimiteResponsividadeH := 150 + iOffSet_Border ;
          iLimiteResponsividadeV := 150 + iOffSet_Border ;

          // dashboard
          i4 := 0;
          i5 := 0;

          if ( oObjTemp5 <> nil ) then
          begin
             i4 := oObjTemp5.Width; // paLayoutMainMenu
             i5 := oObjTemp5.Height;
          end;

          // area disponivel em tela ( HORIZONTAL )
          if not bModal then
             iAreaAvailableH := ( mm.varI_ScreenWidth - i4 - 2 )
          else
             iAreaAvailableH := ( TUniControl(pFrame).Width ) - 2;

          iAreaAvailableV := ( mm.varI_ScreenHeight ) - iOffSet_Border ;

          if TComponent( pFrame ) <> nil then
          begin
             rc_BootStrapRender( pFrame );
             // v. 4.0.0.0
             if ( TComponent( pFrame ).Name <> 'MainForm' ) then
                rc_BootStrapRender( MainForm );
             // v. 3.3.3.1
             if ( pRunAlignment ) then
                rc_DynamicAlignment( MainForm );
          end;
          // v. 4.0.0.4
          rc_ResizeBlocksExecute( pFrame, i4, iOffSet, iOffSet_Border, iNumBlocks, iAreaAvailableH, iAreaAvailableV, iLimiteResponsividadeH, iLimiteResponsividadeV , mm.varB_Mobile_Screen, mm.varB_Mobile_Screen_Portrait, mm.varB_Mobile_Screen_Landscape, mm.varB_Desktop );
        except on e:exception do
               begin
                    ShowMessage( 'rc_ResizeBlocks: ' + mm.MSG_ERROR + '<br>' + TComponent( pFrame ).Name + varIIF( oObj <> nil, ' oObj: ' + oObj.Name, '' ) ); // v. 3.0.0.0
                    Abort;
               end;
        end;

        if TComponent( pFrame ) <> nil then
        begin
           if pRunBSRender then
           begin
              rc_BootStrapRender( pFrame, true ); // v. 3.2.0.1
              // v. 4.0.0.0
              if ( UniApplication.FindComponent('MainForm' ) <> nil ) then
                 rc_BootStrapRender( MainForm );
           end;

           if ( TComponent( pFrame ).Name <> 'MainForm' ) and ( pRunAlignment ) then
              rc_DynamicAlignment( MainForm );

           if pRunAlignment then
              rc_DynamicAlignment( pFrame );
           // v. 4.0.0.0
           if pScrollTop then
              rc_ScrollTop( pFrame );
        end;

     finally
            mm.varB_Resizing := false;
            //UniSession.ResumeLayouts;
     end;
end;

procedure rc_BootStrapRender(pForm: TObject; pUpdateDBFields: boolean; pOnlyThisObj: TObject);
begin
  rc_BootStrapRenderExecute( pForm, pUpdateDBFields, mm.varI_TabIni,
                             mm.varI_TabEnd, mm.varB_Mobile_Screen,
                             mm.varB_Screen_LandScape, pOnlyThisObj);
end;
// v. 3.2.0.3
procedure rc_BootStrapRenderExecute( pForm : TObject ; pUpdateDBFields : Boolean ; pTabIni, pTabEnd : integer; pMobileScreen, pLandScape : boolean ; pOnlyThisObj : TObject );
var
  oObj : TObject;
  oObjTemp : TUniControl;

  //pQryMaster : TFDQuery;
  //pDsMaster  : TDataSource;

  cHint, cHintDefault,
  cCaption,
  cField,
  cValue,
  cSeq,
  cTemp,
  cTemp2,
  cTemp3,
  cTemp4,
  cDataSource,
  cQuery,

  cActive,

  cBsTempVal,
  cBsComponent,
  cBsCaption,
  cBsTemp,
  cBsField,
  cBsClass,
  cBsColor,
  cBsType : string;

  bEnabled,
  bisDB : Boolean;

  iW, iH,
  iReduc,
  iBsTempVal,
  iPos, iPosIni, iPosEnd,
  I, F : Integer;

  pPageControl : TUnipagecontrol;

  varSL_TagParams,
  varSL_HtmlMenu,
  varSL_HtmlPage : TStringList;
begin
     //UniSession.SuspendLayouts();

     varSL_HtmlPage := TStringList.Create;

     if TComponent( pForm ) <> nil then
     begin
         for I := 0 to TComponent( pForm ).ComponentCount - 1 do
         begin
             Try
                 if pOnlyThisObj = nil then
                    oObj := TComponent( pForm ).Components[I]
                 else
                    oObj := pOnlyThisObj;

                 cHint    := '';
                 // v. 3.3.3.0
                 If ( Pos( 'TAction' , TComponent( pForm ).Components[I].ClassName ) = 0 ) and
                    ( Pos( 'THelp' , TComponent( pForm ).Components[I].ClassName ) = 0 ) then
                 begin
                    // Ext.ToolTip
                    If GetPropInfo( oObj.ClassInfo, 'Hint') <> nil then
                    begin
                       // refazer Hint do bsAlert ( feedback by daniel rodrigues )
                       if ( oObj is TUniLabel ) then
                       begin
                          cCaption := TUniControl( oObj ).Caption;
                          if Copy( cCaption, 1, 26 ) = '<div  class ="alert alert-'  then
                          begin
                               cTemp := Trim( Copy( cCaption, 27, Pos( ' alert-dismissible', cCaption ) - 1 ) );
                               cTemp := Copy( cTemp, 1, Pos( ' ' , cTemp ) - 1 );
                               TUniControl( oObj ).Hint :=
                                  '[[ bsAlert:' + cTemp + ' ]]';

                               cCaption := Copy( cCaption , Pos( '</h5>', cCaption ) + 5, 500 );
                               cCaption := Copy( cCaption , 1, Pos( '</div>', cCaption ) - 1 );
                               TUniControl( oObj ).Caption := cCaption;
                          end;

                          cCaption := '';
                       end;

                       cHint    := TUniControl( oObj ).Hint;

                       if Pos( '[[', cHint ) = 0 then
                          cHint := ''
                       else
                       begin
                          cHint := StringReplace( cHint , '[[' , '', [rfReplaceAll] );
                          cHint := StringReplace( cHint , ']]' , '', [rfReplaceAll] ) + ' ';
                       end;

                       if ( Pos( '[[', cHint ) > 0 ) and ( Pos( #$D , cHint ) > 0 )then
                       begin
                          TUniControl( oObj ).hint := StringReplace( TUniControl( oObj ).hint, #$D, '', [rfreplaceall] );
                          cHint    := TUniControl( oObj ).Hint;
                       end;
                    end;

                    cHintDefault := cHint;
                    cHintDefault := trim( rc_NormalizeHintProperty( cHintDefault )) + ' ';
                    cHint        := trim( rc_NormalizeHintProperty( cHint )) + ' ';

                    // if not HINT 'attribute' defined( [[ )....
                    if ( cHint <> '' ) or ( Pos( 'bsrgp' , lowercase( TUniControl( oObj ).Name ) ) > 0 ) then
                    begin
                        // bsToolTip
                        if Pos( ' hint:' , cHint ) > 0 then
                        begin
                           //( feedback by JOAS )
                           cTemp    := Trim(Copy( cHintDefault, Pos( 'hint:' , cHintDefault ) + 5 , 200 ))  ;
                           if Pos( '|', cTemp ) > 0 then
                              cTemp    := Trim(Copy( cTemp, 1, Pos( '|' , cTemp ) -1 ))
                           else
                           if Pos( ']]', cTemp ) > 0 then
                              cTemp    := Trim(Copy( cTemp, 1, Pos( ']]' , cTemp ) -1 )) ;

                           TUniControl( oObj ).ClientEvents.ExtEvents.Values['afterrender'] :=
                              'function afterrender(sender, eOpts){'+
                                 'Ext.create(''Ext.tip.ToolTip'','+
                                 '{  target: sender.getEl(), ' +
                                 '   html: "' + cTemp + '"})}' ;
                        end;

                        if ( oObj is TUniLabel ) then
                        begin
                           cCaption := TUniControl( oObj ).Caption;

                           cTemp    := trim( Copy( cHint, Pos( 'bsh' , lowercase(cHint) ) , 100 ) );
                           cTemp    := Copy( cTemp, 1, Pos( ':' , cTemp ) - 1 );

                           cTemp2   := lowercase( TUniControl( oObj ).Name );
                           cTemp2   := Copy( cTemp2, 1, 5 );

                           if ( Pos( cTemp, BS_COMPONENTS ) > 0 ) or ( Pos( cTemp2, BS_COMPONENTS ) > 0 ) then
                           begin
                              // remover o SUBLINHADO
                              if ( oObj is TUniLabel ) then
                              begin
                                TUniLabel( oObj ).Font.Style := [];
                              end;

                              cTemp := '';
                              for f := 1 to 6 do
                                  if ( Copy( cHint, 1, 5 ) = 'bsh' + f.ToString + ':' ) then
                                  begin
                                      cHint := StringReplace( cHint, 'bsh' + f.ToString + ':', '', [rfReplaceAll] );

                                      if pos( 'cls:' , cHint ) > 0 then
                                      begin
                                         cHint := Copy( cHint, Pos( 'cls:', cHint ) + 4, 100 );
                                         cHint := Copy( cHint, 1, Pos( ' ', cHint ) - 1 );
                                      end;

                                      TUniLabel( oObj ).TextConversion := txtHTML;

                                      cTemp := TUniControl( oObj ).Caption ;
                                      TUniControl( oObj ).Caption := '';
                                      TUniControl( oObj ).Caption := '<h' + f.ToString + '>' + cTemp + '</h' + f.ToString + '>';

                                      // align label
                                      if cHint <> '' then
                                      begin
                                         // v. 3.2.0.0
                                         //rc_AlignLabel( TUniLabel( oObj ), cHint );
                                         if mm.RTL then
                                             rc_AddCssClass( TUniLabel( oObj ), 'align-label-right-center' )
                                         else
                                             rc_AddCssClass( TUniLabel( oObj ), 'align-label-left-center' );
                                      end;
                                      Break;
                                  end;

//                              cTemp4 := rc_GetHintProperty( 'rcalert:', cHint, false ) ;
                              //if cTemp4 <> '' then
                              if Pos( 'rcalert:' , cHint ) > 0 then
                              begin
                                  cTemp4 := rc_GetHintProperty( 'rcalert:', cHint, false ) ;
                                  TUniLabel( oObj ).TextConversion := txtHTML;

                                  cTemp4 := cTemp4 + ' ';
                                  cCaption := rc_GetHintProperty( 'title:', cTemp4, true, true );
                                  cTemp4   := Copy( cTemp4, 1, Pos( ' ', cTemp4 ) - 1 );
                                  //cTemp4   := stringReplace( cTemp4, cCaption, '', [rfReplaceAll] );

                                  cTemp := cTemp4;//Trim( StringReplace( cTemp4 , 'rcalert:' , '', [rfReplaceAll] ) );
                                  cTemp4 := cCaption;
                                  cCaption := cTemp;
                                  cTemp3   := mm.MSG_INFO;

                                  if cTemp = 'danger' then
                                  begin
                                     cCaption := 'ban';
                                     cTemp3   := mm.MSG_DANGER;
                                  end
                                  else
                                  if cTemp = 'warning' then
                                  begin
                                     cCaption := 'exclamation-triangle';
                                     cTemp3   := mm.MSG_WARNING;
                                  end
                                  else
                                  if cTemp = 'success' then
                                  begin
                                     cCaption := 'check';
                                     cTemp3   := mm.MSG_SUCCESS;
                                  end;

                                  if Pos( '-',cCaption )=0 then
                                     cCaption := 'fa-' + cCaption
                                  else
                                     cTemp := 'themed';

                                  cTemp2 :=
                                     ' <div class="rc-' + cTemp + '-alert rc-label-wrap">' +
                                     '   <i class="fas ' + cCaption + '"></i>' +
                                     '   <div class="rc-' + cTemp + '-alert-content">' +
                                     '     <div class="rc-' + cTemp + '-alert-title">' + cTemp4 + '</div>' +
                                     '     <div>' + TUniLabel( oObj ).Caption + '</div>' +
                                     '   </div>' +
                                     ' </div>';

                                  TUniControl( oObj ).Caption := cTemp2 ;
                                  TUniControl( oObj ).Hint    := '';
                              end
                              else
                              if Pos( 'rcfeature:' , cHint ) > 0 then
                              begin
                                  cTemp4 := rc_GetHintProperty( 'rcfeature:', cHint, false ) ;
                                  TUniLabel( oObj ).TextConversion := txtHTML;

                                  cTemp4 := cTemp4 + ' ';
                                  cCaption := rc_GetHintProperty( 'title:', cTemp4, true, true );
                                  cTemp4   := Copy( cTemp4, 1, Pos( ' ', cTemp4 ) - 1 );
                                  //cTemp4   := stringReplace( cTemp4, cCaption, '', [rfReplaceAll] );

                                  cTemp := cTemp4;//Trim( StringReplace( cTemp4 , 'rcalert:' , '', [rfReplaceAll] ) );
                                  cTemp4 := cCaption;
                                  cCaption := cTemp;
                                  cTemp3   := mm.MSG_INFO;

//                                  if cTemp = 'danger' then
//                                  begin
//                                     cCaption := 'ban';
//                                     cTemp3   := mm.MSG_DANGER;
//                                  end
//                                  else
//                                  if cTemp = 'warning' then
//                                  begin
//                                     cCaption := 'exclamation-triangle';
//                                     cTemp3   := mm.MSG_WARNING;
//                                  end
//                                  else
//                                  if cTemp = 'success' then
//                                  begin
//                                     cCaption := 'check';
//                                     cTemp3   := mm.MSG_SUCCESS;
//                                  end;

                                  cTemp2 :=
                                     '<div class="feature-tiles">' +
                                     '  <div class="feature">' +
                                     '    <div class="icon">' +
                                     '      <i class="fas ' + cCaption + '"></i>' +
                                     '    </div>' +
                                     '    <div class="description">' +
                                     '      <h3>' + cTemp4 + '</h3>' +
                                     '      <p>' + TUniLabel( oObj ).Caption + '</p>' +
                                     '    </div>' +
                                     '  </div>' +
                                     '</div>' ;
//                                     ' <div class="rc-' + cTemp + '-alert rc-label-wrap">' +
//                                     '   <i class="fa fa-' + cCaption + '"></i>' +
//                                     '   <div class="rc-' + cTemp + '-alert-content">' +
//                                     '     <div class="rc-' + cTemp + '-alert-title">' + cTemp4 + '</div>' +
//                                     '     <div>' + TUniLabel( oObj ).Caption + '</div>' +
//                                     '   </div>' +
//                                     ' </div>' ;

                                  TUniControl( oObj ).Caption := cTemp2 ;
                                  TUniControl( oObj ).Hint    := '';
                              end
                              else
                              if Pos( 'bsalert:' , cHint ) > 0 then
                              begin
                                  TUniLabel( oObj ).TextConversion := txtHTML;
                                  cTemp := Trim( StringReplace( cHint , 'bsalert:' , '', [rfReplaceAll] ) );

                                  cCaption := cTemp;
                                  cTemp3   := mm.MSG_INFO;

                                  if cTemp = 'danger' then
                                  begin
                                     cCaption := 'ban';
                                     cTemp3   := mm.MSG_DANGER;
                                  end
                                  else
                                  if cTemp = 'warning' then
                                  begin
                                     cCaption := 'exclamation-triangle';
                                     cTemp3   := mm.MSG_WARNING;
                                  end
                                  else
                                  if cTemp = 'success' then
                                  begin
                                     cCaption := 'check';
                                     cTemp3   := mm.MSG_SUCCESS;
                                  end;

                                  cTemp2 := '<div class="alert alert-' + cTemp + ' alert-dismissible rc-label-wrap">' +
                                            '<h5><i class="icon fas fa-' + cCaption + '"></i> '+ cTemp3 + '</h5>' +
                                            TUniLabel( oObj ).Caption +
                                            '</div>';

                                  TUniControl( oObj ).Caption := cTemp2 ;
                                  TUniControl( oObj ).Hint    := '';
                              end
                              else
                              if ( Pos( 'bslabel:' , cHint ) > 0 ) and ( Pos( '<i class' , cCaption ) = 0 ) then
                              begin
                                  TUniLabel( oObj ).TextConversion := txtHTML;
                                  cTemp := StringReplace( cHint , 'bslabel:' , '', [rfReplaceAll] );

                                  iPos := Pos( 'fa-' , cTemp );
                                  if iPos > 0 then
                                     cTemp := '<i class="fas fa-camera "></i> ' + cCaption;

                                  TUniControl( oObj ).Caption := cTemp ;
                              end
                              else
                              if Pos( 'bsbtn:' , cHint ) > 0 then
                              begin
                                   TUniLabel( oObj ).TextConversion := txtHTML;
                                   cBsTemp := Copy( cHint, Pos( ':' , cHint ) + 1 , 100 );

                                   cBsCaption := '';
                                   if Pos( 'caption:' , cBsTemp ) > 0 then
                                   begin
                                      cBsTemp := Copy( cBsTemp, 1, Pos( 'caption:' , cBsTemp ) - 1 );
                                      cBsCaption := Trim( Copy( cHintDefault, Pos( 'caption:' , cHintDefault ) + 8 , 100 ) );
                                   end;

                                   TUniControl( oObj ).Caption := '<button type="submit" class="btn btn-' + cBsTemp + '">' + cBsCaption + '</button>';
                              end
                              else
                              if Pos( 'bsedit:' , cHint ) > 0 then
                              begin
                                  cTemp := Copy( cHint, Pos( 'bsedit:' , cHint ) + 9, 100 ) ;
                                  cTemp := Trim( Copy( cTemp, 1, Pos( ' ' , cTemp ) -1 ) );

                                  cBsTemp := '';
                                  if Pos( 'texthint:' , cHint ) > 0 then
                                  begin
                                     cBsCaption := Copy( cHintDefault, Pos( 'texthint:' , cHintDefault ) + 9, 100 );
                                  end;

                                  TUniLabel( oObj ).TextConversion := txtHTML;
                                  TUniControl( oObj ).Caption := '<input type="text" class="form-control" placeholder="' + cBsCaption + '">';
                              end
                              else
                              if Pos( 'bsemail: ' , cHint ) > 0 then
                              begin
                                  //[[bsEmail: icon:envelope texthint:Usuário]]
                                  TUniLabel( oObj ).TextConversion := txtHTML;

                                  cTemp := Copy( cHint, Pos( 'bsemail:' , cHint ) + 9, 100 ) ;
                                  cTemp := Trim( Copy( cTemp, 1, Pos( ' ' , cTemp ) -1 ) );

                                  cBsTemp := '';
                                  if Pos( 'texthint:' , cHint ) > 0 then
                                  begin
                                     cBsCaption := Copy( cHintDefault, Pos( 'texthint:' , cHintDefault ) + 9, 100 );
                                  end;

                                  if Pos( 'icon:' , cHint ) > 0 then
                                  begin
                                     cBsTemp := Copy( cHint, Pos( 'icon:' , cHint ) + 5 , 100 );
                                     cBsTemp := Copy( cBsTemp, 1, Pos( ' ' , cBsTemp ) - 1 );

                                     TUniControl( oObj ).Caption := '<div class="input-group mb-3"><div class="input-group-prepend"><span class="input-group-text"><i class="fas fa-' + cBsTemp + '"></i></span></div><input type="email" class="form-control" placeholder="' + cBsCaption + '"></div>';
                                  end
                                  else
                                     TUniControl( oObj ).Caption := '<input type="email" class="form-control" placeholder="' + cBsCaption + '">';
                              end
                              else
                              if Pos( 'bspassword:' , cHint ) > 0 then
                              begin
                                  cTemp := Copy( cHint, Pos( 'bspassword:' , cHint ) + 9, 100 ) ;
                                  cTemp := Trim( Copy( cTemp, 1, Pos( ' ' , cTemp ) -1 ) );

                                  cBsTemp := '';
                                  if Pos( 'texthint:' , cHint ) > 0 then
                                  begin
                                     cBsCaption := Copy( cHintDefault, Pos( 'texthint:' , cHintDefault ) + 9, 100 );
                                  end;

                                  if Pos( 'icon:' , cHint ) > 0 then
                                  begin
                                     cBsTemp := Copy( cHint, Pos( 'icon:' , cHint ) + 5 , 100 );
                                     cBsTemp := Copy( cBsTemp, 1, Pos( ' ' , cBsTemp ) - 1 );

                                     TUniControl( oObj ).Caption := '<div class="input-group mb-3"><div class="input-group-prepend"><span class="input-group-text"><i class="fas fa-' + cBsTemp + '"></i></span></div><input type="password" class="form-control" placeholder="' + cBsCaption + '"></div>';
                                  end
                                  else
                                     TUniControl( oObj ).Caption := '<input type="password" class="form-control" placeholder="' + cBsCaption + '">';
                              end
                              else
                              if Pos( 'bsmemo:' , cHint ) > 0 then
                              begin
                                  iBsTempVal := 3;
                                  TUniLabel( oObj ).TextConversion := txtHTML;

                                  if Pos( 'rows:' , cHint ) = 0 then
                                  begin
                                     cBsTemp := Copy( cHint, Pos( 'rows:' , cHint ) + 5 , 100 );
                                     cBsTemp := Copy( cBsTemp, 1, Pos( ' ' , cBsTemp ) - 1 );
                                     iBsTempVal := StrToIntDef( cBsTemp , 3 );
                                  end;

                                  TUniControl( oObj ).Caption := '<textarea class="form-control" rows="' + iBsTempVal.ToString + '"></textarea>';
                              end
                              else
                              if Pos( 'bsdate:' , cHint ) > 0 then
                              begin
                                  TUniLabel( oObj ).TextConversion := txtHTML;
                                  cBsTemp := Copy( cHint, Pos( '_' , cHint ) + 1 , 100 );
                                  cBsTemp := Copy( cBsTemp, 1, Pos( '__' , cBsTemp ) - 1 );
                                  iBsTempVal := StrToIntDef( cBsTemp , 0 );
                                  cBsCaption := Trim(Copy( cHint, Pos( '__' , cHint ) + 2 , 100 ) );

                                  TUniControl( oObj ).Caption :=
                                  '<div class="input-group"><div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-calendar"></i></span></div><input type="text" class="form-control" data-inputmask="''alias'': ''dd/mm/yyyy''" data-mask="" im-insert="true"></div>';
                              end
                              else
                              if ( Pos( 'bschk:' , cHint ) > 0 ) or ( Pos( 'bsswt:' , cHint ) > 0 ) then
                              begin
                                  TUniLabel( oObj ).TextConversion := txtHTML;
                                  if Pos( 'bschk:' , cHint ) > 0 then
                                     cBsComponent := 'bschk'
                                  else
                                     cBsComponent := 'bsswt';

                                  cTemp2 := cHint;

                                  if Pos( 'reportmenuclientes' , lowercase( TUniControl( oObj ).Name ) ) > 0 then
                                     cTemp2 := cTemp2;

                                  // red or green( only switch )
                                  if ( Pos( '*' , cTemp2 ) > 0 ) and ( cBsComponent = 'bsswt' ) then
                                  begin
                                     cTemp := 'custom-switch-off-danger custom-switch-on-success';
                                     cHint := StringReplace( cTemp2, '*', '',[rfReplaceAll] );
                                  end
                                  else
                                     cTemp := '';

                                  cTemp2 := cHint;

                                  // field ?
                                  if Pos( 'field:' , cTemp2 ) > 0 then
                                  begin
                                     cBsField := Copy( cTemp2, Pos( 'field:' , cTemp2 ) , 100 );
                                     cHint := StringReplace( cTemp2, cBsField, '',[rfReplaceAll] );
                                     cBsField := Trim( Copy( cBsField, 7 , 100 ) ) + ' ';
                                     cBsField := Copy( cBsField, 1, Pos( ' ' , cBsField ) -1 );
                                  end
                                  else
                                     cBsField := '';

                                  bisDB    := ( cBsField <> '' );

                                  cTemp2 := cHint;

                                  cBsTemp := Copy( cTemp2, Pos( '_' , lowercase( cTemp2 ) ) + 1 , 100 );
                                  cBsCaption := '';
                                  iBsTempVal := TUniControl( oObj ).Tag;
                                  bEnabled   := TUniControl( oObj ).Enabled;

                                  cDataSource := '';
                                  //pDsMaster   := nil;
                                  cQuery      := '';

                                  begin
                                     if cBsComponent = 'bschk' then
                                        TUniControl( oObj ).Caption :=
                                          '<div class="custom-control custom-checkbox"><input type="checkbox" ' +
                                             varIIF( iBsTempVal = 1, 'checked=""', '' ) +
                                             varIIF( bEnabled, '', 'disabled=""' ) +
                                             ' class="custom-control-input" ' +
                                             'onclick="ajaxRequest( MainForm.htmlFrame, ' + QuotedStr( cBsComponent ) + ' , [' +
                                                QuotedStr( cBsComponent + '=' + iBsTempVal.ToString ) + ', ' +
                                                QuotedStr( 'chk=' + TUniControl( oObj ).Name ) + ' , ' +
                                                QuotedStr( 'field=' + cBsField ) + ' , ' +
                                                QuotedStr( 'query=' + cQuery ) + ' , ' +
                                                QuotedStr( 'form=' + TComponent( pForm ).Name ) + '] );" id="bschk_' +
                                                   TUniControl( oObj ).Name + '"><label class="custom-control-label" for="bschk_' +
                                                   TUniControl( oObj ).Name +'">' + cBsCaption + '</label></div>'
                                     else
                                        TUniControl( oObj ).Caption :=

                                          '<div class="custom-control custom-switch ' + cTemp + '"><input type="checkbox" ' +
                                             varIIF( iBsTempVal = 1, 'checked=""', '' ) +
                                             varIIF( bEnabled, '', 'disabled=""' ) +
                                             ' class="custom-control-input" ' +
                                             'onclick="ajaxRequest( MainForm.htmlFrame, ' + QuotedStr( cBsComponent ) + ' , [' +
                                                QuotedStr( cBsComponent + '=' + iBsTempVal.ToString ) + ', ' +
                                                QuotedStr( 'swt=' + TUniControl( oObj ).Name ) + ' , ' +
                                                QuotedStr( 'field=' + cBsField ) + ' , ' +
                                                QuotedStr( 'query=' + cQuery ) + ' , ' +
                                                QuotedStr( 'form=' + TComponent( pForm ).Name ) + '] );" id="bsswt_' +
                                                   TUniControl( oObj ).Name + '"><label class="custom-control-label" for="bsswt_' +
                                                   TUniControl( oObj ).Name +'">' + cBsCaption + '</label></div>';
                                  end;
                              end
                              else
                              if ( Pos( 'bsrgp' , lowercase( TUniControl( oObj ).Name ) ) > 0 ) then
                              begin
                                     TUniLabel( oObj ).TextConversion := txtHTML;
                                     cBsComponent := 'bsrgp';

                                     //bsrgpTipo01_M     bsrgpTipo_do_feriado01_M_db
                                     cHint    := TUniControl( oObj ).Name;

                                     if Pos( 'bsrgpTipo', TUniLabel( oObj ).Name ) > 0 then
                                        cTemp2 := cTemp2;

                                     cTemp2   := cHint;
                                     cTemp3   := ReverseStr( cTemp2 );

                                     // field ?   //M_10opiTpgRsb   bd_M_10odairef_od_opiTpgRsb
                                     bisDB    := ( Pos( 'bd_', cTemp3 ) > 0 );

                                     cSeq     := rc_GetParamFromRGP( cHint, rptSEQ );
                                     cField   := rc_GetParamFromRGP( cHint, rptFIELD );
                                     cValue   := rc_GetParamFromRGP( cHint, rptVALUE );
                                     cBsField := cField;
                                     cBsTemp  := cValue;
                                     cBsCaption := '';
                                     cBsTempVal := cBsTemp;

                                     iPos       := StrToIntDef( cSeq, 0 );

                                     iBsTempVal := TUniControl( oObj ).Tag;

                                     cTemp  := TUniControl( oObj ).Caption ;

                                     cDataSource := '';
                                     //pQryMaster := nil;
                                     cQuery     := '';

                                     begin
                                           // rc_RgpCheck / rc_RgpInitialize
                                           if ( iBsTempVal = 999 ) or ( iBsTempVal = -999 ) then
                                           begin
                                              if iBsTempVal = 999 then
                                              begin
                                                 iBsTempVal := 1;
                                              end
                                              else
                                              if iBsTempVal = -999 then
                                              begin
                                                 iBsTempVal := 0;
                                              end;
                                           end
                                           else
                                           if iBsTempVal = -1 then
                                              iBsTempVal := 0;

                                           TUniControl( oObj ).Caption :=
                                             '<div class="custom-control custom-radio"><input class="custom-control-input" type="radio" ' + varIIF( iBsTempVal = 1, ' checked="" ', '' ) +
                                                'onclick="ajaxRequest( MainForm.htmlFrame, ' + QuotedStr( cBsComponent ) + ' , [' +
                                                   QuotedStr( cBsComponent + '=' + TUniControl( oObj ).Name ) + ', ' +
                                                   QuotedStr( 'field=' + cBsField ) + ' , ' +
                                                   QuotedStr( 'value=' + cBsTempVal ) + ' , ' +
                                                   QuotedStr( 'radio=' + iPos.ToString ) + ' , ' +
                                                   QuotedStr( 'query=' + cQuery ) + ' , ' +
                                                   QuotedStr( 'form=' + TComponent( pForm ).Name ) + '] );" name="customRadio' + TUniControl( oObj ).Name + '" id="customRadio' + TUniControl( oObj ).Name +
                                                      '"><label class="custom-control-label" for="customRadio' + TUniControl( oObj ).Name +
                                                      '">' + cBsCaption + '</label></div>';
                                     end;
                              end
                              else
                              if Pos( 'bsbtngroup' , cHint ) > 0 then
                              begin
                                     TUniLabel( oObj ).TextConversion := txtHTML;
                                     cBsTemp := Copy( cHint, Pos( '_' , cHint ) + 1 , 100 );
                                     cBsTemp := Copy( cBsTemp, 1, Pos( '__' , cBsTemp ) - 1 );
                                     iBsTempVal := StrToIntDef( cBsTemp , 0 );
                                     cBsCaption := Trim(Copy( cHint, Pos( '__' , cHint ) + 2 , 100 ) );

                                     //pPageControl := TUniPageControl( TComponent( pForm ).FindComponent( cBsCaption ) );

                                     //if pPageControl <> nil then
                                     begin
                                        varSL_HtmlPage.Add( '<div class="row">' );
                                        varSL_HtmlPage.Add( '  <div class="col-md-12 text-center">' );

                                        //for F := 0 to pPageControl.PageCount - 1 do
                                        begin
                                           varSL_HtmlPage.Add( '     <div class="btn-group btn-group-justified">' );
                                           //if pPageControl.Pages[ f ].TabVisible then
                                           begin

                                              //varSL_HtmlPage.Add( '        <button type="button" class="btn btn-primary">' + pPageControl.Pages[ i ].Caption + '</button>' );
                                              varSL_HtmlPage.Add( '        <button type="button" class="btn ' + 'ButtonThemeTab' + '">' + 'btn 1' + '</button>' );

                                           end;

                                           varSL_HtmlPage.Add( '     </div">' );

                                           varSL_HtmlPage.Add( '     <div class="btn-group">' );
                                           //if pPageControl.Pages[ f ].TabVisible then
                                           begin

                                              varSL_HtmlPage.Add( '        <button type="button" class="btn btn-primary">' + 'btn 2' + '</button>' );

                                           end;

                                           varSL_HtmlPage.Add( '     </div">' );

                                           varSL_HtmlPage.Add( '     <div class="btn-group">' );
                                           //if pPageControl.Pages[ f ].TabVisible then
                                           begin

                                              varSL_HtmlPage.Add( '        <button type="button" class="btn btn-primary">' + 'btn 3' + '</button>' );

                                           end;

                                           varSL_HtmlPage.Add( '     </div">' );

                                        end;

                                        varSL_HtmlPage.Add( '  </div">' );
                                        varSL_HtmlPage.Add( '</div">' );

                                        TUniControl( oObj ).Caption := varSL_HtmlPage.Text;

                                     end;
                              end
                              else
                              // don´t work
                              if Pos( 'bscardtabs_' , cHint ) > 0 then
                              begin
                                     varSL_HtmlPage.Clear;

                                     TUniLabel( oObj ).TextConversion := txtHTML;
                                     cBsComponent := trim( Copy( cHint, 1, Pos( '_' , cHint ) - 1 ) );

                                     cBsTemp := Copy( cHint, Pos( '_' , cHint ) + 1 , 100 );

                                     // todas as classes usadas ficam antes do nome do PAgeControl associado
                                     cBsClass := Copy( cBsTemp, 1, Pos( '__' , cBsTemp ) - 1 );

                                     if strTokenCount( cBsClass, '_' ) >= 1 then
                                     begin
                                        cBsColor := Copy( cBsClass, 1, Pos( '_' , cBsTemp ) - 1 );
                                        cBsClass := Copy( cBsClass, Pos( '_' , cBsTemp ) + 1, 20 );
                                     end
                                     else
                                     begin
                                        cBsColor := cBsClass;
                                        cBsClass := '';
                                     end;

                                     cBsTemp := Copy( cBsTemp, 1, Pos( '__' , cBsTemp ) - 1 );
                                     iBsTempVal := StrToIntDef( cBsTemp , 0 );
                                     cBsCaption := Trim(Copy( cHint, Pos( '__' , cHint ) + 2 , 100 ) );

                                     pPageControl := TUniPageControl( TComponent( pForm ).FindComponent( cBsCaption ) );

                                     if pPageControl <> nil then
                                     begin
                                         TUniPageControl(pPageControl).TabBarVisible := False;

                                         iReduc := varIIF( pMobileScreen, 1, 6 );

                                         // controlar o fluxo de abas pra nao estourar os linmites da tela
                                         pTabEnd := pTabIni + iReduc;

                                         if pTabEnd >= pPageControl.PageCount - 1 then
                                         begin
                                            pTabEnd := pPageControl.PageCount - 1;
                                            pTabIni := pTabEnd - iReduc;

                                            if pTabIni < 0 then
                                               pTabIni := 0;
                                         end;

                                         varSL_HtmlPage.Add( '     <div class="card card-primary card-outline card-outline-tabs>' );
                                         varSL_HtmlPage.Add( '        <div class="card-header p-0 border-bottom-0">' );
                                         varSL_HtmlPage.Add( '           <ul class="nav nav-tabs" id="custom-tabs-four-tab" role="tablist">' );

                                         for F := pTabIni to pTabEnd do
                                         begin
                                            if pPageControl.Pages[ f ].TabVisible then
                                            begin
                                               cTemp  := trim( TUniTabSheet( pPageControl.Pages[ f ] ).Name );
                                               cTemp2 := trim( TUniTabSheet( pPageControl.Pages[ f ] ).Caption );

                                               cBsTemp := IfThen( cTemp = pPageControl.ActivePage.Name , 'active' , '' );

                                               varSL_HtmlPage.Add( '         <li class="nav-item">' )  ;
                                               varSL_HtmlPage.Add( '            <a class="nav-link ' + cBsTemp + '" id="custom-tabs-four-' + pPageControl.Name + '-tab" data-toggle="pill" href="#custom-tabs-four-' + pPageControl.Name + '" onclick="ajaxRequest( MainForm.htmlFrame, ' + QuotedStr( cBsComponent ) + ' , [' +
                                                                                QuotedStr( cBsComponent + '=' + cTemp ) + ', ' +
                                                                                QuotedStr( 'tab=Tab' + f.ToString ) + ', ' +
                                                                                QuotedStr( 'form=' + TComponent( pForm ).Name ) + ', ' +
                                                                                QuotedStr( 'pgcontrol=' + pPageControl.Name ) + '] );" role="tab" aria-controls="custom-tabs-four-' + pPageControl.Name + '" aria-selected="' + varIIF( cBsTemp = 'active', 'true', 'false' )  + '">' +
                                                                                cTemp2 );
                                               varSL_HtmlPage.Add( '            </a>' );
                                               varSL_HtmlPage.Add( '         </li>' );                                                                                                                                                       //       ^
                                            end;
                                         end;

                                         varSL_HtmlPage.Add( '           </ul>' );
                                         varSL_HtmlPage.Add( '        </div>' );

                                         // complemento..

                                         varSL_HtmlPage.Add( '<div class="card-body">' );
                                         varSL_HtmlPage.Add( '  <div class="tab-content" id="custom-tabs-four-tabContent">' );

                                         for F := pTabIni to pTabEnd do
                                         begin
                                            if pPageControl.Pages[ f ].TabVisible then
                                            begin
                                               cTemp  := trim( TUniTabSheet( pPageControl.Pages[ f ] ).Name );
                                               cTemp2 := trim( TUniTabSheet( pPageControl.Pages[ f ] ).Caption );

                                               cBsTemp := IfThen( cTemp = pPageControl.ActivePage.Name , ' active show' , '' );

                                               varSL_HtmlPage.Add( '<div class="tab-pane fade' + cBsTemp + '" id="custom-tabs-four-' + pPageControl.Name + '" role="tabpanel" aria-labelledby="custom-tabs-four-' + pPageControl.Name + '-tab">' );
                                               varSL_HtmlPage.Add( '</div>' );
                                            end;
                                         end;

                                         varSL_HtmlPage.Add( '  </div>' );
                                         varSL_HtmlPage.Add( '</div>' );
                                         varSL_HtmlPage.Add( '      </div>' ); //final

                                         // bscardtabs
                                         TUniControl( TComponent( pForm ).Components[ I ] ).Caption := ( varSL_HtmlPage.Text );  //UTF8Encode
                                     end;
                              end
                              else
                              if Pos( 'bstabs:' , cHint ) > 0 then
                              begin
                                     //bsTabs_light_btn-sm__pgPadrao [[bsTabs:light cls:btn-sm pgc:pgPadrao]]

                                     varSL_HtmlPage.Clear;

                                     TUniLabel( oObj ).TextConversion := txtHTML;
                                     cBsComponent := trim( Copy( cHint, 1, Pos( ':' , cHint ) - 1 ) );

                                     cBsTemp := Copy( cHint, Pos( ':' , cHint ) + 1 , 100 );

                                     cBsColor := Copy( cBsTemp, 1, Pos ( ' ' , cBsTemp ) - 1 );

                                     cBsClass := Copy( cBsTemp, Pos( 'cls:' , cBsTemp ) + 4, 100 );
                                     cBsClass := Copy( cBsClass, 1, Pos ( ' ' , cBsClass ) - 1 );

                                     // todas as classes usadas ficam antes do nome do PAgeControl associado

                                     cBsTemp := Copy( cBsTemp, 1, Pos( '__' , cBsTemp ) - 1 );
                                     iBsTempVal := StrToIntDef( cBsTemp , 0 );
                                     cBsCaption := Trim(Copy( cHint, Pos( 'pgc:' , cHint ) + 4 , 100 ) );
                                     cBsCaption := Copy( cBsCaption, Pos( ' ' , cBsCaption ) - 1 );

                                     pPageControl := TUniPageControl( TComponent( pForm ).FindComponent( cBsCaption ) );

                                     if pPageControl <> nil then
                                     begin
                                         TUniPageControl(pPageControl).TabBarVisible := False;

                                         iReduc := varIIF( pMobileScreen, 1, 6 );

                                         // controlar o fluxo de abas pra nao estourar os linmites da tela
                                         pTabEnd := pTabIni + iReduc;

                                         if pTabEnd >= pPageControl.PageCount - 1 then
                                         begin

                                            pTabEnd := pPageControl.PageCount - 1;
                                            pTabIni := pTabEnd - iReduc;

                                            if pTabIni < 0 then
                                               pTabIni := 0;
                                         end;

                                         varSL_HtmlPage.Add( '<div class="row">' );
                                         varSL_HtmlPage.Add( '  <div class="col-md-12">' );
                                         varSL_HtmlPage.Add( '     <ul class="nav nav-tabs" id="custom-content-below-tab' + pPageControl.Name + '" role="tablist">' );

                                         for F := pTabIni to pTabEnd do
                                         begin
                                            if pPageControl.Pages[ f ].TabVisible then
                                            begin
                                               cTemp  := trim( TUniTabSheet( pPageControl.Pages[ f ] ).Name );
                                               cTemp2 := trim( TUniTabSheet( pPageControl.Pages[ f ] ).Caption );

                                               cBsTemp := IfThen( cTemp = pPageControl.ActivePage.Name , 'active color-gray' , 'color-silver' );

                                               varSL_HtmlPage.Add( '<li class="nav-item">' +
                                                                                 '  <a class="nav-link ' + cBsTemp + '" id="custom-content-below-home-tab' + pPageControl.Name + f.ToString + '" data-toggle="pill" href="#custom-content-below-home-tab' + pPageControl.Name + '" onclick="ajaxRequest( MainForm.htmlFrame, ' + QuotedStr( cBsComponent ) + ' , [' +
                                                                         QuotedStr( cBsComponent + '=' + cTemp ) + ', ' +
                                                                         QuotedStr( 'tab=Tab' + f.ToString ) + ', ' +
                                                                         QuotedStr( 'form=' + TComponent( pForm ).Name ) + ', ' +
                                                                         QuotedStr( 'pgcontrol=' + pPageControl.Name ) + '] );" role="tab" aria-controls="custom-content-below-home" aria-selected="' + varIIF( Pos( 'active' , cBsTemp ) > 0, 'true', 'false' )  + '">' +
                                                                         cTemp2 +
                                                                         '</a></li>' );                                                               //       ^
                                                                         // btn-xs -> Mini                                                                     |
                                                                         // btn-sm -> Small  ------------------------------------------------------------------
                                                                         // btn-lg -> Large
                                                                         // no class> Default
                                            end;
                                         end;

                                         varSL_HtmlPage.Add( '     </ul>' );
                                         varSL_HtmlPage.Add( '  </div>' );
                                         varSL_HtmlPage.Add( '</div>' );

                                         // bstabs
                                         TUniControl( TComponent( pForm ).Components[ I ] ).Caption := RemoveLineBreaks( varSL_HtmlPage.Text );  //UTF8Encode
                                     end;
                              end
                              else
                              if Pos( 'bspills:' , cHint ) > 0 then
                              begin
                                     varSL_HtmlPage.Clear;

                                     TUniLabel( oObj ).TextConversion := txtHTML;
                                     cBsComponent := trim( Copy( cHint, 1, Pos( ':' , cHint ) - 1 ) );

                                     cBsTemp := Copy( cHint, Pos( ':' , cHint ) + 1 , 100 );

                                     cBsColor := Copy( cBsTemp, 1, Pos ( ' ' , cBsTemp ) - 1 );

                                     cBsClass := Copy( cBsTemp, Pos( 'cls:' , cBsTemp ) + 4, 100 );
                                     cBsClass := Copy( cBsClass, 1, Pos ( ' ' , cBsClass ) - 1 );

                                     // todas as classes usadas ficam antes do nome do PAgeControl associado
                                     cBsTemp := Copy( cBsTemp, 1, Pos( '__' , cBsTemp ) - 1 );
                                     iBsTempVal := StrToIntDef( cBsTemp , 0 );
                                     cBsCaption := Trim(Copy( cHint, Pos( 'pgc:' , cHint ) + 4 , 100 ) );
                                     cBsCaption := Copy( cBsCaption, Pos( ' ' , cBsCaption ) - 1 );

                                     pPageControl := TUniPageControl( TComponent( pForm ).FindComponent( cBsCaption ) );

                                     if pPageControl <> nil then
                                     begin
                                         TUniPageControl(pPageControl).TabBarVisible := False;

                                         TUniLabel( oObj ).Align := alNone;
                                         oObjTemp := TUniControl( TUniLabel( oObj ).GetParentComponent );
                                         iReduc := 6;

                                         if mm.varB_Mobile_Screen then
                                         begin
                                              iReduc := varIIF( mm.varB_Mobile_Screen_Portrait, 1, 6 );
                                         end;

                                         if GetPropInfo( oObjTemp.ClassInfo, 'AutoScroll' ) <> nil then
                                            TUniContainerPanel( oObjTemp ).AutoScroll := False ;

                                         TUniLabel( oObj ).Left  := 8;
                                         TUniLabel( oObj ).width := oObjTemp.Width - 8;

                                         // controlar o fluxo de abas pra nao estourar os linmites da tela
                                         pTabEnd := pTabIni + iReduc;

                                         if pTabEnd >= pPageControl.PageCount - 1 then
                                         begin
                                            pTabEnd := pPageControl.PageCount - 1;
                                            pTabIni := pTabEnd - iReduc;

                                            if pTabIni < 0 then
                                               pTabIni := 0;
                                         end;

                                         varSL_HtmlPage.Add( '<div class="row" >' );
                                         varSL_HtmlPage.Add( '  <div class="col-md-12">' );
                                         // v. 3.2.0.0
                                         if mm.RTL then
                                            varSL_HtmlPage.Add( '     <div class="rc-btn-group-rtl btn-group-justified">' )
                                         else
                                            varSL_HtmlPage.Add( '     <div class="btn-group btn-group-justified">' );

                                         for F := pTabIni to pTabEnd do
                                         begin
                                            if pPageControl.Pages[ f ].TabVisible then
                                            begin
                                               cTemp  := trim( TUniTabSheet( pPageControl.Pages[ f ] ).Name );
                                               cTemp2 := trim( TUniTabSheet( pPageControl.Pages[ f ] ).Caption );

                                               if Pos( '<span>', cTemp2 ) = 0 then
                                                  cTemp2 := '<i class=""></i><span> ' + cTemp2 + '</span>';


                                               cTemp3 := '';
                                               if TUniTabSheet( pPageControl.Pages[ f ] ).Name = pPageControl.ActivePage.Name then
                                               begin
                                                  cTemp3 := '<i class="fas fa-times"></i>';
                                               end;

                                               if ( ( f > 0 ) and ( f = pTabIni ) ) and ( pPageControl.PageCount - 1 > ( iReduc ) ) then // and ( f = 0 ) then
                                               begin
                                                  cBsTemp := 'ButtonThemeTab';

                                                  varSL_HtmlPage.Add( '        <button onclick="ajaxRequest( MainForm.htmlFrame, ' + QuotedStr( cBsComponent ) + ' , [' +
                                                                            QuotedStr( cBsComponent + '=' + cTemp ) + ', ' +
                                                                            QuotedStr( 'tab=TabLeft' ) + ', ' +
                                                                            QuotedStr( 'form=' + TComponent( pForm ).Name ) + ', ' +
                                                                            QuotedStr( 'pgcontrol=' + pPageControl.Name ) + '] );" id="' + pPageControl.Name + '_Tab' + f.ToString + '" type="button" class="btn ' + cBsClass + ' ' + cBsTemp + '">' + '<i class="fa fa-arrow-left fa-1x"></i>' +
                                                                            '</button>' );                                                               //       ^
                                               end;

                                               cBsTemp := IfThen( cTemp = pPageControl.ActivePage.Name , 'ButtonThemeTab' , 'ButtonThemeInactive' );

                                               varSL_HtmlPage.Add( '    <button onclick="ajaxRequest( MainForm.htmlFrame, ' + QuotedStr( cBsComponent ) + ' , [' +
                                                                            QuotedStr( cBsComponent + '=' + cTemp ) + ', ' +
                                                                            QuotedStr( 'tab=Tab' + f.ToString ) + ', ' +
                                                                            QuotedStr( 'form=' + TComponent( pForm ).Name ) + ', ' +
                                                                            QuotedStr( 'pgcontrol=' + pPageControl.Name ) + '] );" id="' + pPageControl.Name + f.ToString + '_TabLeft" type="button" class="btn ' + cBsClass + ' ' + cBsTemp + '">' + cTemp2 +

                                                                            IfThen( ( cTemp3 <> '' ) and ( pPageControl.ActivePageIndex > 0 ) , '<a onclick="ajaxRequest( MainForm.htmlFrame , ' + QuotedStr( cBsComponent ) + ' , [' +
                                                                                                   QuotedStr( cBsComponent + '=' + cTemp ) + ', ' +
                                                                                                   QuotedStr( 'tab=_closeTab' ) + ', ' +
                                                                                                   QuotedStr( 'form=' + TComponent( pForm ).Name ) + ', ' +
                                                                                                   QuotedStr( 'pgcontrol=' + pPageControl.Name ) +

                                                                                                   ']);"><span> ' + cTemp3 + '</span></a>', '' ) +
                                                                         '</button>' );                                                               //       ^

                                                // close all
                                                if ( f = pTabEnd ) and ( pTabEnd > 1 ) then
                                                begin
                                                    cBsTemp := 'ButtonThemeTab';

                                                    varSL_HtmlPage.Add( '        <button onclick="ajaxRequest( MainForm.htmlFrame, ' + QuotedStr( cBsComponent ) + ' , [' +
                                                                              QuotedStr( cBsComponent + '=' + cTemp ) + ', ' +
                                                                              QuotedStr( 'tab=_closeAllTabs' ) + ', ' +
                                                                              QuotedStr( 'form=' + TComponent( pForm ).Name ) + ', ' +
                                                                              QuotedStr( 'pgcontrol=' + pPageControl.Name ) + '] );" id="' + pPageControl.Name + f.ToString + '_closeAllTabs" type="button" class="btn ' + cBsClass + ' ' + cBsTemp + '">' + '<i class="fas fa-window-close"></i>' +
                                                                              '</button>' );                                                               //       ^

                                                end;

                                                if ( pPageControl.PageCount - 1 > ( iReduc ) ) and ( ( f = pTabEnd ) and ( f <> pPageControl.PageCount - 1 ) ) then
                                                begin
                                                   cBsTemp := 'ButtonThemeTab';
                                                   varSL_HtmlPage.Add( '        <button onclick="ajaxRequest( MainForm.htmlFrame, ' + QuotedStr( cBsComponent ) + ' , [' +
                                                                             QuotedStr( cBsComponent + '=' + cTemp ) + ', ' +
                                                                             QuotedStr( 'tab=TabRight' ) + ', ' +
                                                                             QuotedStr( 'form=' + TComponent( pForm ).Name ) + ', ' +
                                                                             QuotedStr( 'pgcontrol=' + pPageControl.Name ) + '] );" id="' + pPageControl.Name + f.ToString + '_TabRight" type="button" class="btn ' + cBsClass + ' ' + cBsTemp + '">' + '<i class="fa fa-arrow-right fa-1x"></i>' +
                                                                             '</button>' );                                                               //       ^

                                                end;
                                            end;
                                         end;

                                         varSL_HtmlPage.Add( '     </div>' );
                                         varSL_HtmlPage.Add( '  </div>' );
                                         varSL_HtmlPage.Add( '</div>' );
                                         //pills
                                         TUniControl( TComponent( pForm ).Components[ I ] ).Caption := RemoveLineBreaks( varSL_HtmlPage.Text );  //UTF8Encode
                                     end;
                              end;
                           end;
                        end
                        else
                        if ( oObj is TUniHTMLFrame ) then
                        begin
                             if TUniControl( oObj ).Name = 'hfImg1' then
                                iw := iw;

                            cTemp := rc_NormalizeHintProperty( cHint );
                            cTemp := RemoveLineBreaks( cTemp );
                            cTemp := Copy( cTemp, 1, Pos( ':' , cTemp ) - 1 );

                            if ( Pos( cTemp, BS_COMPONENTS ) > 0 ) and ( cHint <> '' ) then
                            begin
                               varSL_HtmlPage.Clear;
                               // bscarousel
                               if Pos( 'bscarousel:' , cHint ) > 0 then
                               begin
                                  varSL_HtmlPage.Add( '<div class="container">' );
                                  varSL_HtmlPage.Add( '<div id="carouselIndicators" class="carousel slide" data-ride="carousel">' );

                                  varSL_HtmlPage.Add( '   <ol class="carousel-indicators">' );

                                  cTemp := rc_NormalizeHintProperty( cHint );
                                  cTemp := RemoveLineBreaks( cTemp );
                                  iPos := Occurs( 'bscarousel:', cTemp );
                                  for f := 0 to iPos - 1 do
                                      varSL_HtmlPage.Add( '      <li data-target="#carouselIndicators" data-slide-to="' + f.ToString + '" class="' + varIIF( f = 0 , 'active', '' ) + '"></li>' );

                                  varSL_HtmlPage.Add( '   </ol>' );

                                  varSL_HtmlPage.Add( '   <div class="carousel-inner">' );

                                  //bsCarousel_https://placehold.it/900x500/39CCCC/ffffff?text=RadCORE+WEB[Slide 1#Demonstrando BS_Carousel]@https://www.radcore.pro.br@Powered by RadCORE

                                  cHint := RemoveLineBreaks( cHintDefault );
                                  cTemp2 := cHint;
                                  iPos := 0;
                                  While ( Pos( 'bscarousel:' , cTemp2.ToLower ) > 0 ) do
                                  begin
                                       cTemp3 := rc_GetHintProperty( 'bscarousel:', cTemp2 );

                                       // no cache
                                       //cTemp3 := cTemp3 + '?' + FormatDateTime('ddmmyyyyhhmmss', Now);

                                       varSL_HtmlPage.Add( '    <div class="carousel-item' + varIIF( iPos = 0 , ' active', '' ) + '">' );
                                       varSL_HtmlPage.Add( '      <img style="width:100%;" src="' + cTemp3 + '" alt="slide' + iPos.ToString + '">' );
                                       varSL_HtmlPage.Add( '    </div>' );

                                       Inc( iPos );

                                       cTemp2 := Trim( StringReplace( cTemp2 , 'bscarousel:' + cTemp3 + '|' , '', [rfReplaceAll] ));
                                  end;

                                  varSL_HtmlPage.Add( '  </div>' );
                                  varSL_HtmlPage.Add( '  <a class="carousel-control-prev" id="btncarouselprev" href="#carouselIndicators" role="button" data-slide="prev">' );
                                  varSL_HtmlPage.Add( '    <span class="carousel-control-prev-icon" aria-hidden="true"></span>' );
                                  varSL_HtmlPage.Add( '    <span class="sr-only">Previous</span>' );
                                  varSL_HtmlPage.Add( '  </a>' );
                                  varSL_HtmlPage.Add( '  <a class="carousel-control-next" id="btncarouselnext" href="#carouselIndicators" role="button" data-slide="next">' );
                                  varSL_HtmlPage.Add( '    <span class="carousel-control-next-icon" aria-hidden="true"></span>' );
                                  varSL_HtmlPage.Add( '    <span class="sr-only">Next</span>' );
                                  varSL_HtmlPage.Add( '  </a>' );
                                  varSL_HtmlPage.Add( ' </div>' );
                                  varSL_HtmlPage.Add( '</div>' );

                                  varSL_HtmlPage.Text := RemoveLineBreaks( varSL_HtmlPage.Text );
                                  varSL_HtmlPage.Text := StringReplace( varSL_HtmlPage.Text, '?', '&amp;', [rfReplaceAll] );
                               end
                               else
                               // qrcode with bugfix to solve
//                               if Pos( 'bsqrcode:' , cHint ) > 0 then
//                               begin
//                                    cTemp3 := rc_GetHintProperty( 'bsqrcode:', cHint );
//                                    UniSession.AddJS( 'updateQRCode("' + 'rcQrCodeViewer_' + TUniControl( oObj ).Parent.Name + '", "' + cTemp3  + '", 3 );' );
//                               end
//                               else
                               if Pos( 'bsimg:' , cHint ) > 0 then
                               begin
                                      cTemp :='<img id="bsimg' + TUniControl( oObj ).name + '" ' +
                                              'class="img-responsive" ' +  //img-fluid mx-auto d-block
                                              'src="bsimgfile" ' +
                                              'alt="bsimg-' + TUniControl( oObj ).name + '">' ;

                                      cHint := RemoveLineBreaks( cHint );
                                      cHint := trim( rc_NormalizeHintProperty( cHint )) + ' ';

                                      iH := TUniControl( TUniControl( oObj ).GetParentComponent ).Height;

                                      // todo conteudo de bsimg
                                      cTemp3 := rc_GetHintProperty( 'bsimg:', cHint );

                                      //apenas o img
                                      cTemp2 := rc_GetHintProperty( 'bsimg:', cHint, true );
                                      cTemp  := StringReplace( cTemp, 'bsimgfile', cTemp2 , [rfReplaceAll] );

                                      cTemp2 := Copy( cTemp3, Pos( 'width-', cTemp3 ), 1000 ) + ' |';
                                      cTemp4 := Copy( cTemp2, 1, Pos( 'height-', cTemp2 )  );

                                      if StrToIntDef( cTemp4, 0 ) = 0 then
                                      begin
                                           cTemp2 := IntToStr( TUniControl( TUniControl( oObj ).GetParentComponent ).Width );
                                      end
                                      else
                                      if ( mm.varB_Mobile_Screen_Portrait )  then
                                      begin
                                         cTemp2 := rc_GetHintProperty( 'mobile-v-', cTemp4, True );
                                      end
                                      else
                                      if ( mm.varB_Mobile_Screen_Landscape )  then
                                         cTemp2 := rc_GetHintProperty( 'mobile-h-', cTemp4, True )
                                      else
                                         cTemp2 := rc_GetHintProperty( 'width-', cTemp4, True );

                                      iw := Trunc( StrToIntDef( cTemp2, 560 ) ) ;
                                      //ih := Trunc( StrToIntDef( cTemp2, iw ) * ( 60.71 / 100 ) ) ;

                                      cTemp2 := Copy( cTemp3, Pos( 'height-', cTemp3 ), 1000 ) + ' |';
                                      cTemp4 := cTemp2;

                                      if StrToIntDef( cTemp4, 0 ) = 0 then
                                      begin
                                           cTemp2 := IntToStr( TUniControl( TUniControl( oObj ).GetParentComponent ).Height );
                                           ih     := StrToIntDef( cTemp2, ih );
                                      end
                                      else
                                      if ( mm.varB_Mobile_Screen_Portrait )  then
                                      begin
                                         cTemp2 := rc_GetHintProperty( 'mobile-v-', cTemp4, True );
                                      end
                                      else
                                      if ( mm.varB_Mobile_Screen_Landscape )  then
                                         cTemp2 := rc_GetHintProperty( 'mobile-h-', cTemp4, True )
                                      else
                                         cTemp2 := rc_GetHintProperty( 'height-', cTemp4, True );

                                      TUniControl( oObj ).Width  := iW;
                                      TUniControl( oObj ).Height := TUniControl( oObj ).Parent.Height;

                                      varSL_HtmlPage.Text := StringReplace( cTemp, '?', '&amp;', [rfReplaceAll] );
                               end
                               else
                               // bsvideo
                               if Pos( 'bsvideo:' , cHint ) > 0 then
                               begin
                                  if Pos( 'youtube.com', cHint ) = 0 then
                                  begin
                                     cTemp := '<div class="video-file-responsive"><video width="100%" heigth="100%"' ;

                                     if Pos ( ' controls', cHint ) > 0 then
                                        cTemp := cTemp + ' controls';
                                     if Pos ( ' muted', cHint ) > 0 then
                                        cTemp := cTemp + ' muted';
                                     if Pos ( ' poster', cHint ) > 0 then
                                        cTemp := cTemp + ' poster';
                                     if Pos ( ' autoplay', cHint ) > 0 then
                                        cTemp := cTemp + ' autoplay';
                                     if Pos ( ' loop', cHint ) > 0 then
                                        cTemp := cTemp + ' loop';

                                     cTemp2 := StringReplace( cHintDefault  , ' controls'  , '' , [rfReplaceAll] );
                                     cTemp2 := StringReplace( cTemp2        , ' muted'     , '' , [rfReplaceAll] );
                                     cTemp2 := StringReplace( cTemp2        , ' poster'    , '' , [rfReplaceAll] );
                                     cTemp2 := StringReplace( cTemp2        , ' autoplay'  , '' , [rfReplaceAll] );
                                     cTemp2 := StringReplace( cTemp2        , ' loop'      , '' , [rfReplaceAll] );
                                     cTemp2 := StringReplace( cTemp2        , '|'          , '' , [rfReplaceAll] );

                                     varSL_HtmlPage.Add( cTemp + '>' );

                                     iPos := 0;
                                     While ( Pos( 'bsvideo:' , cTemp2.ToLower ) > 0 ) do
                                     begin
                                          cTemp2 := rc_GetHintProperty( 'bsvideo:', cHint, true );
                                          if Pos( 'bsvideo:' , cTemp2.ToLower ) > 0 then
                                             cTemp := Copy( cTemp2 , 1, Pos( 'bsvideo:' , cTemp2.ToLower ) - 1 )
                                          else
                                          if cTemp2 <> '' then
                                             cTemp := cTemp2
                                          else
                                             cTemp := cTemp2;

                                          cTemp := Trim( RemoveLineBreaks( cTemp ) );

                                          varSL_HtmlPage.Add( '   <source src="' + cTemp + '" type="video/' + Copy( ExtractFileExt( cTemp ), 2, 10 ) + '">' );

                                          Inc( iPos );

                                          cTemp2 := Trim( StringReplace( cTemp2 , cTemp, '', [rfReplaceAll] ));
                                     end;

                                     varSL_HtmlPage.Add( '  </video>' );

                                     varSL_HtmlPage.Text := RemoveLineBreaks( varSL_HtmlPage.Text );
                                     varSL_HtmlPage.Text := StringReplace( varSL_HtmlPage.Text, '?', '&amp;', [rfReplaceAll] ) + '</div';
                                  end
                                  else
                                  begin
                                      cTemp := '<div class="video-tube-responsive">' +
                                                 '<iframe width="ytw" height="yth" ' +
                                                 'src="ytsrc" ' +
                                                 'title="YouTube video player" frameborder="0" ' +
                                                 'allow="accelerometer; autoplay; clipboard-write; ' +
                                                 'encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>' +
                                               '</div>' ;;

                                      cHint := RemoveLineBreaks( cHint );
                                      cHint := trim( rc_NormalizeHintProperty( cHint )) + ' ';

                                      iH := TUniControl( TUniControl( oObj ).GetParentComponent ).Height;

                                      // todo conteudo de bsvideo
                                      cTemp3 := rc_GetHintProperty( 'bsvideo:', cHint );

                                      //apenas o video
                                      cTemp2 := rc_GetHintProperty( 'bsvideo:', cHint, true );
                                      cTemp := StringReplace( cTemp, 'ytsrc', cTemp2 , [rfReplaceAll] );

                                      cTemp2 := Copy( cTemp3, Pos( 'width-', cTemp3 ), 1000 ) + ' |';
                                      cTemp4 := Copy( cTemp2, 1, Pos( 'height-', cTemp2 )  );

                                      if ( mm.varB_Mobile_Screen_Portrait )  then
                                      begin
                                         cTemp2 := rc_GetHintProperty( 'mobile-v-', cTemp4, True );
                                      end
                                      else
                                      if ( mm.varB_Mobile_Screen_Landscape )  then
                                         cTemp2 := rc_GetHintProperty( 'mobile-h-', cTemp4, True )
                                      else
                                         cTemp2 := rc_GetHintProperty( 'width-', cTemp4, True );

                                      cTemp := StringReplace( cTemp, '"ytw"', '"' + cTemp2 + '"' , [rfReplaceAll] );

                                      TUniControl( oObj ).Height := iH;

                                      iw := Trunc( StrToIntDef( cTemp2, 560 ) ) ;
                                      ih := Trunc( StrToIntDef( cTemp2, iw ) * ( 60.71 / 100 ) ) ;

                                      cTemp2 := Copy( cTemp3, Pos( 'height-', cTemp3 ), 1000 ) + ' |';
                                      cTemp4 := cTemp2;

                                      if ( mm.varB_Mobile_Screen_Portrait )  then
                                      begin
                                         cTemp2 := rc_GetHintProperty( 'mobile-v-', cTemp4, True );
                                      end
                                      else
                                      if ( mm.varB_Mobile_Screen_Landscape )  then
                                         cTemp2 := rc_GetHintProperty( 'mobile-h-', cTemp4, True )
                                      else
                                         cTemp2 := rc_GetHintProperty( 'height-', cTemp4, True );

                                      cTemp2 := IntToStr( ih );

                                      cTemp := StringReplace( cTemp, '"yth"', '"' + cTemp2 + '"' , [rfReplaceAll] );

                                      TUniControl( oObj ).Parent.Height := iH;

                                      TUniControl( oObj ).Width  := iW;
                                      TUniControl( oObj ).Height := iH;

                                      varSL_HtmlPage.Text := StringReplace( cTemp, '?', '&amp;', [rfReplaceAll] );
                                  end;
                               end;

                               TUniHTMLFrame( oObj ).HTML.Text :=  varSL_HtmlPage.Text;
                            end;
                        end
                        else
                        if ( oObj is TUniPanel ) or
                           ( oObj is TUniContainerPanel ) then
                        begin
                           cTemp := Copy( cHint, 1, Pos( '_' , cHint ) - 1 );

                           if Pos( cTemp, BS_COMPONENTS ) > 0 then
                           begin
                              if ( Pos( 'bscard_' , cHint ) > 0 ) or
                                 ( Pos( 'bscardheader' , cHint ) > 0 ) or
                                 ( Pos( 'bscardfooter' , cHint ) > 0 ) then
                              begin
                                     TUniControl( oObj ).BorderStyle := ubsNone;

                                     cBsCaption := '';
                                     if Pos( 'bscard__' , cHint ) > 0 then
                                     begin
                                        cBsType := '';
                                        TUniControl( oObj ).JSInterface.JSCall( 'addCls' , ['clsRoundPanelForm']);
                                     end
                                     else
                                     begin
                                         if ( Pos( 'bscardheader_' , cHint ) > 0 ) or
                                            ( Pos( 'bscardfooter_' , cHint ) > 0 ) then
                                         begin
                                            cBsType := Copy( cHintDefault, Pos( '_' , cHint ) + 1 , 100 );
                                            cBsType := Copy( cBsType, 1, Pos( '__' , cBsType ) - 1 );
                                            cBsCaption := Trim( Copy( cHintDefault, Pos( '__' , cHintDefault ) + 2 , 100 ));
                                         end;

                                         if Pos( 'bscardheader_' , cHint ) > 0 then
                                         begin
                                            TUniControl( oObj ).JSInterface.JSCall( 'update', [
                                                                                                   '<div class="card card-' + cBsType + '">'+ //card-themecrud">' + // card-outline
                                                                                                   '     <div class="card-header">'+
                                                                                                   '        <h3 class="card-title">' + cBsCaption + '</h3>'+
                                                                                                   '     </div>'+
                                                                                                   '</div>'
                                             ]);
                                         end
                                         else
                                         if Pos( 'bscardfooter_' , cHint ) > 0 then
                                         begin
                                            TUniControl( oObj ).JSInterface.JSCall( 'update', [
                                                                                                  '     <div class="card-footer">'+
                                                                                                  '     </div>'
                                            ]);
                                         end;

                                         //remove o caption do panel
                                         TUniControl( oObj ).Caption := cBsCaption;

                                     end;
                                     //remove o caption do panel
                                     TUniControl( oObj ).Caption := '';
                              end;
                           end;
                        end;
                    end;

                    if pOnlyThisObj <> nil then
                       Break;
                 end;
             except on e:exception do
                    begin
                         ShowMessage( 'rc_BootStrapRenderExecute ( ' + i.ToString + ' | obj: ' + TUniControl( oObj ).name + ') : ' + e.Message  );
                    end;
             End;
         end;
     end;
     //UniSession.ResumeLayouts();
     varSL_HtmlPage.Free;
end;

procedure rc_DynamicAlignment(pFrame: TObject);
var
  oComponent: TComponent;
  oObj, oObj2, oObj3: TUniContainerPanel;
  oObj4, oObjTemp, oObjTemp2: TUniControl;

  cCaption, fClassName, cCmd, cTemp, cTemp2, cTemp3, cTemp4, cHint,
    pgNAme: string;

  iOffSet_Border, iOffSet,

    i, f, n, x, y, w, h, iLeft, iTop, iRight, iBottom, iWidth, iHeight, iPos,
    iPos2, iTemp: integer;

  bDots: boolean;

  pControl, pBlock: TUniControl;
  oUrlFrm: TUniUrlFrame;
  oHtmlFrm: TUniHTMLFrame;
begin
  // align components
  //
  // [[cls:btngreen | align:btncancel r:-10]]
  // [[cls:btnred | align:memo l:0 b:4]]
  // [[center:parent xy]]

  try
    for i := 1 to TComponent(pFrame).ComponentCount - 1 do
    begin
      oObjTemp := TUniControl(TComponent(pFrame).Components[i]);
      // v. 3.3.3.0
      If ( Pos( 'TAction' , TComponent( pFrame ).Components[I].ClassName ) = 0 ) and
         ( Pos( 'THelp' , TComponent( pFrame ).Components[I].ClassName ) = 0 ) and
         ( Pos( 'TUniDBGrid' , TComponent( pFrame ).Components[I].ClassName ) = 0 ) then
      begin
        if GetPropInfo(oObjTemp.ClassInfo, 'Hint') <> nil then
        begin
          cHint := oObjTemp.Hint;

          if Pos('[[', oObjTemp.Hint) > 0 then
          begin
            cTemp3 := oObjTemp.Hint;

            if (oObjTemp is TUniLabel) then
            begin
              // FONT responsive
              // font-size:50 mobile-v-24 mobile-h-32 |
              cTemp := rc_GetHintProperty('fontsize-r:', cTemp3);

              if cTemp <> '' then
              begin
                iPos := StrToIntDef(Copy(cTemp, 1, Pos(' ', cTemp) - 1),
                  TUniLabel(oObjTemp).Font.Size);

                if mm.varB_Mobile_Screen_Portrait then
                begin
                  iPos := Pos('mobile-v-', cTemp) + 9;
                  cTemp := Copy(cTemp, iPos, 100);
                  cTemp := Copy(cTemp, 1, Pos(' ', cTemp) - 1);
                  iPos := StrToIntDef(cTemp, TUniLabel(oObjTemp).Font.Size);
                end
                else if mm.varB_Mobile_Screen_Landscape then
                begin
                  iPos := Pos('mobile-h-', cTemp) + 9;
                  cTemp := Copy(cTemp, iPos, 100) + ' ';
                  cTemp := Copy(cTemp, 1, Pos(' ', cTemp) - 1);
                  iPos := StrToIntDef(cTemp, TUniLabel(oObjTemp).Font.Size);
                end;

                TUniLabel(oObjTemp).Font.Size := iPos;
              end;

              // caption-dots
              //
              // mobile-v  : in MOBILE PORTRAIT MODE
              // mobile-h  : in MOBILE LANDSCAPE MODE
              // mobile    : in MOBILE MODE
              cTemp3 := rc_GetHintProperty('caption-dots:', cHint);

              if cTemp3 <> '' then
              begin
                cTemp3 := rc_GetHintProperty('caption-dots:', cHint);
                cTemp4 := rc_GetHintProperty('caption-dots-default:', cHint);

                if Pos('...', oObjTemp.Caption) = 0 then
                  oObjTemp.Hint := rc_SetHintProperty(oObjTemp.Caption,
                    'caption-dots-default:', oObjTemp.Hint);

                iTemp := StrToIntDef(ReturnNumbers(cTemp3), 0);

                bDots := ((Pos('mobile-v-', cTemp3) > 0) and
                  (mm.varB_Mobile_Screen_Portrait)) or
                  ((Pos('mobile-h-', cTemp3) > 0) and
                  (mm.varB_Mobile_Screen_Landscape)) or
                  ((Pos('mobile-', cTemp3) > 0) and
                  (mm.varB_Mobile_Screen_Portrait));

                if (bDots) and (Length(oObjTemp.Caption) >= iTemp) then
                  oObjTemp.Caption := Copy(oObjTemp.Caption, 1, iTemp) + '...'
                else if (cTemp4 <> '') then
                  oObjTemp.Caption := cTemp4;
              end;

            end
            else if (oObjTemp is TUniBitBtn) then
            begin
              // caption-hide
              //
              // mobile-v  : in MOBILE PORTRAIT MODE
              // mobile-h  : in MOBILE LANDSCAPE MODE
              // mobile    : in MOBILE MODE
              if Pos('caption-hide:', cHint) > 0 then
              begin
                cTemp3 := (rc_GetHintProperty('caption-hide:', cHint));

                cCaption := Copy(oObjTemp.Caption, 1,
                  Pos('</span>', oObjTemp.Caption) - 1);
                cCaption := ReverseStr(cCaption);
                cCaption :=
                  ReverseStr(Copy(cCaption, 1, Pos('>', cCaption) - 1));

                cTemp4 := rc_GetHintProperty('caption:', cHint);

                TUniControl(oObjTemp).Caption := StringReplace(oObjTemp.Caption,
                  cCaption, '[-]', [rfReplaceAll]);

                if (cTemp3 = 'mobile-v') and
                  (mm.varB_Mobile_Screen_Portrait) then
                  cTemp4 := ''
                else if (cTemp3 = 'mobile-h') and
                  (mm.varB_Mobile_Screen_Landscape) then
                  cTemp4 := ''
                else if (cTemp3 = 'mobile') and
                  (mm.varB_Mobile_Screen_Portrait) then
                  cTemp4 := '';

                if cCaption <> '' then
                  TUniControl(oObjTemp).Caption :=
                    StringReplace(oObjTemp.Caption, '[-]', cTemp4,
                    [rfReplaceAll])
                else
                begin
                  cCaption := Copy(oObjTemp.Caption, 1,
                    Pos('></span>', oObjTemp.Caption));
                  cCaption := cCaption + cTemp4 + '</span>';
                  TUniControl(oObjTemp).Caption := cCaption;
                end;
              end;
            end;

            cTemp2 := rc_NormalizeHintProperty(oObjTemp.Hint);
            oObjTemp.Hint := '[[' + cTemp2 + ']]';

            cTemp2 := cTemp2 + '|';

            cCmd := cTemp2;

            iPos2 := Pos('|', cTemp2);

            While (iPos2 > 0) do
            begin
              cTemp := Trim(Copy(cCmd, 1, iPos2));
              cTemp2 := Trim(StringReplace(cCmd, cTemp, '', [rfReplaceAll]));

              cCmd := cTemp2;

              cTemp := StringReplace(cTemp, '|', '', [rfReplaceAll]) + ' ';

              // hidden
              //
              // mobile-v  : in MOBILE PORTRAIT MODE
              // mobile-h  : in MOBILE LANDSCAPE MODE
              // mobile    : in MOBILE MODE
              cTemp3 := (rc_GetHintProperty('hide:', cTemp));
              if cTemp3 <> '' then
              begin
                if (cTemp3 = 'mobile-v') and
                  (mm.varB_Mobile_Screen_Portrait) then
                  oObjTemp.Visible := false
                else if (cTemp3 = 'mobile-h') and
                  (mm.varB_Mobile_Screen_Landscape) then
                  oObjTemp.Visible := false
                else if (cTemp3 = 'mobile') and
                  (mm.varB_Mobile_Screen) then
                  oObjTemp.Visible := false
                else
                  oObjTemp.Visible := true;
              end;

              cTemp3 := rc_GetHintProperty('disable:', cTemp);

              if cTemp3 <> '' then
              begin
//                 if (cTemp3 = 'mobile-v') and
//                  (mm.varB_Mobile_Screen_Portrait) then
//                begin
//                  oObjTemp.Enabled := false;
//                end
//                else if (cTemp3 = 'mobile-h') and
//                  (mm.varB_Mobile_Screen_Landscape) then
//                begin
//                  oObjTemp.Enabled := false;
//                end
//                else if (cTemp3 = 'mobile') and
//                  (mm.varB_Mobile_Screen) then
//                begin
//                  oObjTemp.Enabled := false;
//                end
//                else
//                begin
//                  oObjTemp.Enabled := true;
//                end;
              end;

              if (oObjTemp.Visible) and (oObjTemp.Enabled) then
              begin
                // pos-l:5%
                if Pos('pos-l:', cTemp) > 0 then
                begin
                  // on l inux have probles without .HasParent
                  if oObjTemp.HasParent then
                    oObjTemp2 := TUniControl(oObjTemp.GetParentComponent)
                  else
                    oObjTemp2 := nil;

                  n := StrToIntDef(ReturnNumbers(cTemp), 0);

                  if Pos('%', cTemp) > 0 then
                    x := Trunc((n / 100) * (oObjTemp2.Width))
                  else
                    x := n;

                  oObjTemp.Left := x;
                end;

                // pos-r:5%
                if Pos('pos-r:', cTemp) > 0 then
                begin
                  // on l inux have probles without .HasParent
                  if oObjTemp.HasParent then
                    oObjTemp2 := TUniControl(oObjTemp.GetParentComponent)
                  else
                    oObjTemp2 := nil;

                  n := StrToIntDef(ReturnNumbers(cTemp), 0);

                  if Pos('%', cTemp) > 0 then
                    x := Trunc((n / 100) * (oObjTemp2.Width))
                  else
                    x := n;

                  oObjTemp.Left := oObjTemp2.Width - x;
                end;

                // pos-t:5%
                if Pos('pos-t:', cTemp) > 0 then
                begin
                  // on l inux have probles without .HasParent
                  if oObjTemp.HasParent then
                    oObjTemp2 := TUniControl(oObjTemp.GetParentComponent)
                  else
                    oObjTemp2 := nil;

                  n := StrToIntDef(ReturnNumbers(cTemp), 0);

                  if Pos('%', cTemp) > 0 then
                    x := Trunc((n / 100) * (oObjTemp2.height))
                  else
                    x := n;

                  oObjTemp.Top := x;
                end;

                // pos-bottom:5%
                if Pos('pos-b:', cTemp) > 0 then
                begin
                  // on l inux have probles without .HasParent
                  if oObjTemp.HasParent then
                    oObjTemp2 := TUniControl(oObjTemp.GetParentComponent)
                  else
                    oObjTemp2 := nil;

                  n := StrToIntDef(ReturnNumbers(cTemp), 0);

                  if Pos('%', cTemp) > 0 then
                    x := Trunc((n / 100) * (oObjTemp2.height))
                  else
                    x := n;

                  oObjTemp.Top := oObjTemp2.height - x;
                end;

                // scale  scale:rcBlock34 x:45% pad:0 5 0 5
                cTemp3 := rc_GetHintProperty('scale:', cTemp);
                if cTemp3 <> '' then
                begin
                  cTemp3 := Copy(cTemp3, 1, Pos(' ', cTemp3) - 1);

                  oObjTemp2 := nil;

                  if cTemp3 = 'parent' then
                  begin
                    if oObjTemp.HasParent then
                      oObjTemp2 := TUniControl(oObjTemp.GetParentComponent)
                    else
                      oObjTemp2 := nil;
                  end
                  else
                    oObjTemp2 := rc_FindControl(cTemp3, pFrame);

                  x := 0;
                  y := 0;

                  if oObjTemp2 <> nil then
                  begin
                    if (Pos('w:', cTemp) = 0) and (Pos('h:', cTemp) = 0) then
                    begin
                      cTemp3 := StringReplace(cTemp, 'scale:', '',
                        [rfReplaceAll]);
                      cTemp3 := Trim(StringReplace(cTemp3, oObjTemp2.Name, '',
                        [rfReplaceAll]));
                    end
                    else
                    begin
                      cTemp3 := '';

                      if (Pos('w:', cTemp) > 0) then
                      begin
                        cTemp2 := Copy(cTemp, Pos('w:', cTemp) + 2, 300) + ' ';
                        cTemp2 := Trim(Copy(cTemp2, 1, Pos(' ', cTemp2)));

                        n := StrToIntDef(ReturnNumbers(cTemp2), 0);

                        iOffSet := 0;
                        if Pos(' off:', cTemp) > 0 then
                          iOffSet :=
                            StrToIntDef
                            (ReturnNumbers(Copy(cTemp, Pos(' off:', cTemp),
                            Pos(' ', cTemp))), 0);

                        iWidth := oObjTemp2.Width;

                        if Pos('%', cTemp2) > 0 then
                          x := Trunc((n / 100) * (iWidth))
                        else
                          x := StrToIntDef(cTemp2, 0);

                        x := x - iOffSet;
                      end;

                      if (Pos('h:', cTemp) > 0) then
                      begin
                        cTemp4 := Copy(cTemp, Pos('h:', cTemp) + 2, 300) + ' ';
                        cTemp4 := Trim(Copy(cTemp4, 1, Pos(' ', cTemp4)));

                        cTemp3 := Trim(Copy(cTemp4, Pos('-top', cTemp4),
                          300) + ' ');

                        cTemp4 := StringReplace(cTemp4, cTemp3, '',
                          [rfReplaceAll]);

                        n := StrToIntDef(ReturnNumbers(cTemp4), 0);

                        iOffSet := 0;
                        if Pos(' off:', cTemp) > 0 then
                          iOffSet :=
                            StrToIntDef
                            (ReturnNumbers(Copy(cTemp, Pos(' off:', cTemp),
                            Pos(' ', cTemp))), 0);

                        iHeight := oObjTemp2.height;

                        if Pos('%', cTemp4) > 0 then
                          y := Trunc((n / 100) * (iHeight))
                        else
                          y := StrToIntDef(cTemp4, 0);

                        y := y - iOffSet;

                        if cTemp3 <> '' then
                          y := y - oObjTemp.Top;
                      end;
                    end;
                  end
                  else
                  begin
                    ShowMessage('SCALE Obj:' + cTemp3 + ' not found.');
                    Break;
                  end;

                  if x > 0 then
                    oObjTemp.Width := x;

                  if y > 0 then
                    oObjTemp.height := y;
                end;

                cTemp3 := rc_GetHintProperty('align:', cTemp);
                if cTemp3 <> '' then
                begin
                  cTemp3 := Copy(cTemp3, 1, Pos(' ', cTemp3) - 1);

                  if cTemp3 = 'parent' then
                  begin
                    // on l inux have probles without .HasParent
                    if oObjTemp.HasParent then
                      oComponent := oObjTemp.GetParentComponent
                    else
                      oComponent := nil;

                    oObjTemp2 := TUniControl(oComponent);
                  end
                  else
                    oObjTemp2 := rc_FindControl(cTemp3, pFrame);

                  if oObjTemp2 <> nil then
                  begin
                    if Pos('r:', cTemp) > 0 then
                    begin
                      cTemp3 := Copy(cTemp, Pos('r:', cTemp) + 2, 300) + ' ';

                      if Pos('w', cTemp3) > 0 then
                      begin
                        cTemp4 := Copy(cTemp3, Pos('w', cTemp3) + 1, 10);
                        cTemp4 := Trim(Copy(cTemp4, 1, Pos(' ', cTemp4) - 1));
                        n := StrToIntDef(cTemp4, 0);

                        cTemp3 := StringReplace(cTemp3, cTemp4, '',
                          [rfReplaceAll]);
                        iRight := oObjTemp.Width * varIIF(Pos('-w', cTemp3) > 0,
                          (-1), 1) + n;
                      end
                      else
                        iRight := StrToIntDef
                          (Copy(cTemp3, 1, Pos(' ', cTemp3) - 1), 0);

                      oObjTemp.Left := oObjTemp2.Left + oObjTemp2.Width
                        + iRight;
                    end;

                    if Pos('l:', cTemp) > 0 then
                    begin
                      cTemp3 := Copy(cTemp, Pos('l:', cTemp) + 2, 300) + ' ';

                      if Pos('w', cTemp3) > 0 then
                      begin
                        cTemp4 := Copy(cTemp3, Pos('w', cTemp3) + 1, 10);
                        cTemp4 := Trim(Copy(cTemp4, 1, Pos(' ', cTemp4) - 1));
                        n := StrToIntDef(cTemp4, 0);

                        cTemp3 := StringReplace(cTemp3, cTemp4, '',
                          [rfReplaceAll]);
                        iLeft := oObjTemp.Width * varIIF(Pos('-w', cTemp3) > 0,
                          (-1), 1) + n;
                      end
                      else
                        iLeft := StrToIntDef
                          (Copy(cTemp3, 1, Pos(' ', cTemp3) - 1), 0);

                      oObjTemp.Left := oObjTemp2.Left + iLeft;
                    end;

                    if Pos('t:', cTemp) > 0 then
                    begin
                      cTemp3 := Copy(cTemp, Pos('t:', cTemp) + 2, 300) + ' ';

                      if Pos('h', cTemp3) > 0 then
                      begin
                        cTemp4 := Copy(cTemp3, Pos('h', cTemp3) + 1, 10);
                        cTemp4 := Trim(Copy(cTemp4, 1, Pos(' ', cTemp4) - 1));
                        n := StrToIntDef(cTemp4, 0);

                        cTemp3 := StringReplace(cTemp3, cTemp4, '',
                          [rfReplaceAll]);
                        iTop := oObjTemp.height * varIIF(Pos('-h', cTemp3) > 0,
                          (-1), 1) + n;
                      end
                      else
                        iTop := StrToIntDef
                          (Copy(cTemp3, 1, Pos(' ', cTemp3) - 1), 0);

                      oObjTemp.Top := oObjTemp2.Top + iTop;
                    end;

                    if Pos('b:', cTemp) > 0 then
                    begin
                      cTemp3 := Copy(cTemp, Pos('b:', cTemp) + 2, 300) + ' ';

                      if Pos('h', cTemp3) > 0 then
                      begin
                        cTemp4 := Copy(cTemp3, Pos('h', cTemp3) + 1, 10);
                        cTemp4 := Trim(Copy(cTemp4, 1, Pos(' ', cTemp4) - 1));
                        n := StrToIntDef(cTemp4, 0);

                        cTemp3 := StringReplace(cTemp3, cTemp4, '',
                          [rfReplaceAll]);
                        iBottom := oObjTemp.height *
                          varIIF(Pos('-h', cTemp3) > 0, (-1), 1) + n;
                      end
                      else
                        iBottom :=
                          StrToIntDef(Copy(cTemp3, 1, Pos(' ', cTemp3) - 1), 0);

                      oObjTemp.Top := oObjTemp2.Top + oObjTemp2.height
                        + iBottom;
                    end;
                  end
                  else
                  begin
                    ShowMessage('ALIGN Obj:' + cTemp3 + ' not found.');
                    Break;
                  end;
                end;

                cTemp3 := rc_GetHintProperty('center:', cTemp);
                if cTemp3 <> '' then
                begin
                  if Pos('rcCarous', oObjTemp.Name) > 0 then
                    x := x;

                  x := 0;
                  y := 0;

                  cTemp3 := Copy(cTemp3, 1, Pos(' ', cTemp3) - 1);

                  oObjTemp2 := nil;

                  if cTemp3 = 'parent' then
                  begin
                    // on l inux have probles without .HasParent
                    if oObjTemp.HasParent then
                      oComponent := oObjTemp.GetParentComponent
                    else
                      oComponent := nil;

                    oObjTemp2 := TUniControl(oComponent);
                  end
                  else
                    oObjTemp2 := rc_FindControl(cTemp3, pFrame);

                  cTemp3 := Trim(StringReplace(cTemp, 'center:' + cTemp3, '',
                    [rfReplaceAll]));

                  if (cTemp3 = 'x') or (cTemp3 = 'y') or (cTemp3 = 'xy') then
                    rc_CenterObj(oObjTemp, oObjTemp2, (cTemp3 = 'y') or
                      (cTemp3 = 'xy'), (cTemp3 = 'x') or (cTemp3 = 'xy'), y, x)
                  else if oObjTemp2 <> nil then
                  begin
                    if (Pos('x:', cTemp) = 0) and (Pos('y:', cTemp) = 0) then
                    begin
                      cTemp3 := StringReplace(cTemp, 'center:', '',
                        [rfReplaceAll]);
                      cTemp3 := Trim(StringReplace(cTemp3, oObjTemp2.Name, '',
                        [rfReplaceAll]));

                      x := 0;
                      y := 0;
                    end
                    else
                    begin
                      cTemp3 := '';

                      if (Pos('x:', cTemp) > 0) then
                      begin
                        cTemp2 := Copy(cTemp, Pos('x:', cTemp) + 2, 300) + ' ';
                        cTemp2 := Trim(Copy(cTemp2, 1, Pos(' ', cTemp2)));

                        n := StrToIntDef(ReturnNumbers(cTemp2), 0);
                        w := oObjTemp2.Width;

                        if Pos('%', cTemp2) > 0 then
                          x := Trunc((n / 100) * (w))
                        else
                          x := StrToIntDef(cTemp2, 0);

                        cTemp3 := 'x';
                      end;

                      if (Pos('y:', cTemp) > 0) then
                      begin
                        cTemp4 := Copy(cTemp, Pos('y:', cTemp) + 2, 300) + ' ';
                        cTemp4 := Trim(Copy(cTemp4, 1, Pos(' ', cTemp4)));

                        n := StrToIntDef(ReturnNumbers(cTemp4), 0);
                        h := oObjTemp2.height;

                        if Pos('%', cTemp4) > 0 then
                          y := Trunc((n / 100) * (h))
                        else
                          y := StrToIntDef(cTemp4, 0);

                        cTemp3 := cTemp3 + 'y';
                      end;
                    end;
                    rc_CenterObj(oObjTemp, oObjTemp2, (cTemp3 = 'y') or
                      (cTemp3 = 'xy'), (cTemp3 = 'x') or (cTemp3 = 'xy'), y, x);
                  end
                  else
                  begin
                    ShowMessage('CENTER Obj:' + cTemp3 + ' not found.');
                    Break;
                  end;
                end;
              end;
              iPos2 := Pos('|', cCmd);
            end;
          end;
        end;
      end;
    end;
  except
    on e: exception do
    begin
      ShowMessage('Error rc_DynamicAlignment error(' +
        VarToStr(varIIF(oObjTemp <> nil, oObjTemp.Name, '')) + '): ' + e.Message
        + 'error');
      // Abort;
    end;
  end;
end;

function rc_GetHintProperty(pProp, pProps: string; bParam : boolean; bFullLength:boolean ): string;
var
   cTmp : string;
   iPos : integer;
begin
    cTmp := rc_NormalizeHintProperty( pProps );
    iPos := rc_PosHintProperty( pProp, cTmp );

    if iPos > 0 then
    begin
       cTmp := Trim( Copy( cTmp, iPos , 200 ) ) + '.$%¨&*.';
       if Pos( '|', cTmp ) > 0 then
          cTmp := Trim( Copy( cTmp, 1, Pos( '|', cTmp ) - 1 ) )
       else
          cTmp := Trim( Copy( cTmp, 1, Pos( '.$%¨&*.', cTmp ) - 1 ) );

       cTmp := Trim( StringReplace( cTmp , pProp, '', [rfReplaceAll] ) );

       if bParam then
          if not bFullLength then
             cTmp := Trim( Copy( cTmp, 1, Pos( ' ' , cTmp + ' ' ) ) )
          else
          begin
               cTmp := Trim( Copy( cTmp, 1, 1000 ) );
               if Pos( '|', cTmp ) > 0 then
                  cTmp := Trim( Copy( cTmp, 1, Pos( '|', cTmp )-1 ) );
          end;
    end
    else
       cTmp := '';

    // algumas propriedades não precisam de valores, entao, assumem um DEFAULT de acordo com seu contexto
    //
    // Ex: edLKPTABLE_SetDS_FieldName( veja um exemplo no "frmCadCLIENTES" - campo: edLkpCIDADES_SetDS_CodiIbge )
    //
    //       [[saveto:field]] -> salvar conteudo de "FieldName" no campo "field"
    //       [[saveto:]]      -> salvar conteudo de "FieldName" no campo de próprio nome do lookup, ou seja, "FieldName"
    //
    //   quando ocorrer isso, será retornado pela função o conteúdo "_default" para ser tratado no seu código.
    //
    // some properties don't need values, so they take a DEFAULT according to their context
    //
    // Ex: edLKPTABLE_SetDS_FieldName (see an example in "frmCadCLIENTES" - field: edLkpCIDADES_SetDS_CodiIbge)
    //
    // [[saveto: field]] -> save content from "FieldName" in field "field"
    // [[saveto:]] -> save "FieldName" content in the lookup's own name field, that is, "FieldName"
    //
    // when this occurs, the function will return the content "_default" to be treated in your code.
    //
    if ( iPos > 0 ) then
    begin
       if ( cTmp = '' ) and ( pProp = 'saveto:' ) then
          Result := '_default'
       else
          Result := cTmp;
    end
    else
       Result := '';
end;

function rc_SetHintProperty( pContent, pProp, pProps: string; pAdd : boolean) : string;
var
   cTmp, cTmp2 : string;
   iPos : integer;
begin
    cTmp2 := rc_NormalizeHintProperty( pProps );
    //cTmp2 := pProps;
    //cTmp2 := Trim( StringReplace( cTmp2 , ']]', '', [rfReplaceAll] ) );
    //cTmp2 := Trim( StringReplace( cTmp2 , '[[', '', [rfReplaceAll] ) );

    iPos := rc_PosHintProperty( pProp, cTmp2 );

    if iPos > 0 then
    begin
       cTmp := Trim( Copy( cTmp2, iPos , 200 ) ) + '.$%¨&*.';
       if Pos( '|', cTmp ) > 0 then
          cTmp := Trim( Copy( cTmp, 1, Pos( '|', cTmp ) - 1 ) )
       else
          cTmp := Trim( Copy( cTmp, 1, Pos( '.$%¨&*.', cTmp ) - 1 ) );

       if pAdd then
          cTmp2 := Trim( StringReplace( cTmp2 , cTmp, cTmp + pContent, [rfReplaceAll] ) )
       else
          cTmp2 := Trim( StringReplace( cTmp2 , cTmp, pProp + pContent, [rfReplaceAll] ) );
    end
    else
    if ( cTmp2 <> '' ) then
        cTmp2 := cTmp2 + '|' + pProp + pContent
    else
       cTmp2 := pProp + pContent ;

    Result := '[[' + cTmp2 + ']]';
end;

function  rc_GetBlockPrior(pBlock, pFrameOrig: TObject): string;
var
  n, f, i: integer;
  cSeq: string;
  oObject: TUniContainerPanel;
begin
  oObject := nil;

  if pBlock <> nil then
  begin
    cSeq := ReturnNumbers(TComponent(pBlock).Name);

    if Pos('_', cSeq) > 0 then
    begin
      n := StrToIntDef(Copy(cSeq, 1, Pos('_', cSeq) - 1), 0);
      f := StrToIntDef(Copy(cSeq, Pos('_', cSeq) + 1, 5), 0);
    end
    else
    begin
      f := StrToIntDef(cSeq, 0);
    end;

    for i := (f - 1) downto 1 do
    begin
      if Pos('_', cSeq) > 0 then
        cSeq := n.ToString + '_' + i.ToString
      else
        cSeq := i.ToString;

      oObject := TUniContainerPanel(rc_FindControl('rcBlock' + cSeq,
        pFrameOrig));

      if oObject <> nil then
        if oObject.Enabled then
          Break
        else
          cSeq := '';
    end;
  end;
  Result := cSeq;
end;

function  rc_GetBlockHeight(oObj, pFrame: TObject; pParamBlk, pAttrib: string): integer;
var
  cTemp, cTemp2, cTemp3: string;
  x, y: integer;
  oObjTemp2: TUniControl;
begin
  cTemp2 := Trim(Copy(pParamBlk, Pos(pAttrib + '-', pParamBlk) + 3, 200));

  if Pos(' ', cTemp2) > 0 then
    cTemp2 := Trim(Copy(cTemp2, 1, Pos(' ', cTemp2)));

  if ReturnLetters(cTemp2) <> '' then
  begin
    if Pos('(', cTemp2) > 0 then
    begin
      x := Pos('+', cTemp2);

      cTemp3 := Copy(cTemp2, 2, x - 2);
      oObjTemp2 := TUniControl(rc_FindControl(cTemp3, pFrame));

      if oObjTemp2 <> nil then
      begin
        cTemp3 := Copy(cTemp2, x + 1, 20);
        y := Pos(')', cTemp3) - 1;
        cTemp2 := Copy(cTemp3, 1, y);

        if x > 0 then
        begin
          x := TUniControl(oObjTemp2).height + StrToIntDef(cTemp2, 0);
        end
        else
        begin
          x := Pos('-', cTemp2);
          cTemp3 := Copy(cTemp2, x + 1, 20);
          y := Pos(')', cTemp3) - 1;
          cTemp2 := Copy(cTemp3, 1, y);

          if x > 0 then
          begin
            x := TUniControl(oObjTemp2).height - StrToIntDef(cTemp2, 0);
          end
          else
          begin
            x := Pos('*', cTemp2);
            cTemp3 := Copy(cTemp2, x + 1, 20);
            y := Pos(')', cTemp3) - 1;
            cTemp2 := Copy(cTemp3, 1, y);

            if x > 0 then
            begin
              x := TUniControl(oObjTemp2).height * StrToIntDef(cTemp2, 0);
            end
            else
            begin
              x := Pos('/', cTemp2);
              cTemp3 := Copy(cTemp2, x + 1, 20);
              y := Pos(')', cTemp3) - 1;
              cTemp2 := Copy(cTemp3, 1, y);

              if x > 0 then
              begin
                x := Trunc(TUniControl(oObjTemp2).height /
                  StrToIntDef(cTemp2, 1));
              end
              else
              begin
                x := TUniControl(oObjTemp2).height;
              end;
            end;
          end;
        end;
      end
      else
        x := TUniControl(oObj).height;

      Result := x;
    end
    else
    begin
      oObjTemp2 := TUniControl(rc_FindControl(cTemp2, pFrame));
      if oObjTemp2 <> nil then
        Result := TUniControl(oObjTemp2).height;
    end;
  end
  else
  begin
    pParamBlk := Trim(Copy(pParamBlk, Pos(pAttrib, pParamBlk) + 3, 5));

    if Pos(' ', pParamBlk) > 0 then
      pParamBlk := Trim(Copy(pParamBlk, 1, Pos(' ', pParamBlk) - 1));

    Result := StrToIntDef(pParamBlk, TUniControl(oObj).height);
  end;
end;

procedure rc_CenterObj(pObj: TObject; pObjParent: TObject; pV: boolean; pH: boolean; pV_OffSet: integer; pH_OffSet: integer);
var
  pWidthParent, pHeightParent: integer;
begin
  if pObjParent = nil then
  begin
    pWidthParent := mm.varI_ScreenWidth;
    pHeightParent := mm.varI_ScreenHeight;
  end
  else
  begin
    pWidthParent := TUniControl(pObjParent).Width;
    pHeightParent := TUniControl(pObjParent).height;
  end;

  pWidthParent := pWidthParent + pH_OffSet;
  pHeightParent := pHeightParent + pV_OffSet;

  if pH then
  begin
    TUniControl(pObj).Left := (pWidthParent div 2) -
      (TUniControl(pObj).Width div 2);
    if TUniControl(pObj).Left < 0 then
      TUniControl(pObj).Left := 0;
  end;

  if pV then
  begin
    TUniControl(pObj).Top := (pHeightParent div 2) -
      (TUniControl(pObj).height div 2);
    if TUniControl(pObj).Top < 0 then
      TUniControl(pObj).Top := 0;
  end;
end;

function  ReturnNumbers(pText: string): string;
var
  ind: integer;
begin
  Result := '';
  if pText <> '' then
  begin
    for ind := low(pText) to Length(pText) do // v. 3.3.1.0
    begin
      if pText[ind] in ['0' .. '9'] then
        Result := Result + pText[ind];
    end;
  end;
end;

function rc_NormalizeHintProperty(pContent: string): string;
var
ctemp, cTemp2 : string;
begin
    if Pos( '[[', pContent ) > 0 then
    begin
       pContent := RemoveLineBreaks( Trim( pContent ) );
       pContent := Trim( StringReplace( pContent , '[[     ', '[[', [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , '[[    ', '[[', [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , '[[  ', '[[', [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , '[[ ', '[[', [rfReplaceAll] ) );

       pContent := Trim( StringReplace( pContent , '     ]]', ']]', [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , '    ]]', ']]', [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , '   ]]', ']]', [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , '  ]]', ']]', [rfReplaceAll] ) );

       //if Copy( pContent, 1, 2 ) = '[[' then
          pContent := Copy( pContent, 3, 2000 );

       //if Copy( ReverseStr(pContent), 1, 2 ) = ']]' then
          pContent := Copy( pContent, 1, length( pContent ) - 2 );
       //else
       //   pContent := Copy( pContent, 1, length( pContent ) - 1 );

       pContent := Trim( StringReplace( pContent , '|   ', '|', [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , '   |', '|', [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , '|  ', '|', [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , '  |', '|', [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , ' | ', '|', [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , '| ', '|', [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , ' |', '|', [rfReplaceAll] ) );

    end;

    Result := pContent;
end;
// v. 4.0.0.5
function rc_PosHintProperty( pProp, pContent: string): integer;
var
   r,l : integer;
   cTmp, cTmp2 : string;
begin
    r := 0;
    if pContent <> '' then
    begin
       cTmp := pContent;
       cTmp2 := cTmp;

       if copy( pContent, 1, Length( pProp ) ) = pProp then
          r := 1
       else
       begin
          r := Pos( '[[' + pProp, pContent );

          if ( r = 0 ) then
          begin
             r := Pos( '|' + pProp, pContent );

             if r = 0 then
             begin
                r := Pos( ';' + pProp, pContent );

                if r = 0 then
                begin
                   r := Pos( ' ' + pProp, pContent );

                   if r = 0 then
                   begin
                      l := Pos( pProp, pContent );

                      if l > 1 then
                      begin
                         cTmp2 := Copy( pContent, l-1, 100 );

                         if Copy( cTmp2, 1, 1 ) <> Copy( pProp, 1, 1 ) then
                            r := 0
                         else
                            r := Pos( pProp, cTmp2 );
                      end
                      else
                         r := l;
                   end
                   else
                       r := r + 1;
                end
                else
                    r := r + 1;
             end
             else
                 r := r + 1;
          end
          else
              r := r + 2;
       end;
    end;

    result := r;
end;

function  RemoveLineBreaks(InputText: string): string;
begin
  InputText := StringReplace(InputText, #$D, ' ', [rfReplaceAll]);
  InputText := StringReplace(InputText, #$A, ' ', [rfReplaceAll]);
  InputText := StringReplace(InputText, #$D#$A, ' ', [rfReplaceAll]);
  InputText := StringReplace(InputText, #13, ' ', [rfReplaceAll]);
  InputText := StringReplace(InputText, #13#10, ' ', [rfReplaceAll]);
  Result := InputText;
end;

function  varIIF(aTest: boolean; TrueValue, FalseValue: Variant): Variant;
begin
  if aTest then
    Result := TrueValue
  else
    Result := FalseValue;
end;

procedure rc_AlignLabel(pLabel: TUniLabel; pAlign: string);
begin
  rc_AddCssClass(pLabel, 'align-label-' + pAlign);
end;

function  ReverseStr(S: String): String;
var
  i: integer;
begin
  Result := '';
  for i := Length(S) DownTo low(s) Do // v. 3.3.1.0
    Result := Result + S[i];
end;

procedure rc_AddCssClass(pObj: TObject; pCls: string);
begin
     if pObj is TUniForm then
        TUniForm( pObj ).WebForm.JSInterface.JSCall( 'addCls' , [ pCls ])
     else
        TUniControl( pObj ).JSInterface.JSCall( 'addCls' , [ pCls ]);
end;
// v. 3.2.0.7
procedure rc_RemoveCssClass(pObj: TObject; pCls: string);
begin
    if pObj is TUniForm then
       TUniForm( pObj ).WebForm.JSInterface.JSCall( 'removeCls' , [ pCls ])
    else
       TUniControl( pObj ).JSInterface.JSCall( 'removeCls' , [ pCls ]);
end;

function  rc_GetParamFromRGP(pName: string; pParam: TRCRGPParamType): string;
var
  cTemp2, cTemp3, cValue, cSeq, cField: string;
  iPos: integer;
begin
  cTemp2 := pName;
  cTemp3 := ReverseStr(cTemp2);

  if Pos('bd_', cTemp3) > 0 then // M_10odairef_od_opiTpgRsb
    cTemp3 := Copy(cTemp3, 4, 200);

  iPos := Pos('_', cTemp3);
  cValue := ReverseStr(Copy(cTemp3, 1, iPos - 1)); // M

  cTemp3 := Copy(cTemp3, iPos + 1, 200); // 10odairef_od_opiTpgRsb
  cSeq := ReverseStr(Copy(cTemp3, 1, 2)); // 10

  cTemp3 := Copy(cTemp3, 3, 200); // odairef_od_opiTpgRsb
  cField := Copy(ReverseStr(cTemp3), 6, 200); // Tipo_do_feriado

  case pParam of
    rptSEQ:
      Result := cSeq;
    rptVALUE:
      Result := cValue;
    rptFIELD:
      Result := cField;
  end;
end;

function  strTokenCount(S: string; Seperator: Char): integer;
begin
  Result := 0;
  while S <> '' do
  begin { 29.10.96 sb }
    strToken(S, Seperator);
    Inc(Result);
  end;
end;

function  strToken(var S: string; Seperator: Char): string;
var
  i: Word;
begin
  i := Pos(Seperator, S);
  if i <> 0 then
  begin
    Result := System.Copy(S, 1, i - 1);
    System.Delete(S, 1, i);
  end
  else
  begin
    Result := S;
    S := '';
  end;
end;

function  Occurs(T, S: String): integer;
Var
  P: integer;
begin
  Result := 0;
  P := Pos(T, S);
  while P > 0 do
  begin
    Inc(Result);
    S := Copy(S, P + Length(T), 65535);
    P := Pos(T, S);
  end;
end;

function  ReturnLetters(pText: string): string;
var
  ind: integer;
begin
  Result := '';
  for ind := low(pText) to Length(pText) do // v. 3.3.1.0
  begin
    if (pText[ind] in ['a' .. 'z']) or (pText[ind] in ['A' .. 'Z']) then
      Result := Result + pText[ind];

  end;
end;

function rc_NormalizeAllTrim( pContent, pToken : string): string;
begin
       pContent := Trim( StringReplace( pContent , '  ' + pToken + '      ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , '  ' + pToken + '      ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , '  ' + pToken + '     ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , '  ' + pToken + '     ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , '  ' + pToken + '    ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , '  ' + pToken + '    ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , '  ' + pToken + '   ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , '  ' + pToken + '   ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , '  ' + pToken + '  ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , '  ' + pToken + '  ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , '  ' + pToken + ' ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , '  ' + pToken + ' ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , '  ' + pToken + '', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , '  ' + pToken + '', pToken, [rfReplaceAll] ) );

       pContent := Trim( StringReplace( pContent , ' ' + pToken + '      ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , ' ' + pToken + '      ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , ' ' + pToken + '     ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , ' ' + pToken + '     ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , ' ' + pToken + '    ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , ' ' + pToken + '    ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , ' ' + pToken + '   ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , ' ' + pToken + '   ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , ' ' + pToken + '  ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , ' ' + pToken + '  ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , ' ' + pToken + ' ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , ' ' + pToken + ' ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , ' ' + pToken + '', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , ' ' + pToken + '', pToken, [rfReplaceAll] ) );

       pContent := Trim( StringReplace( pContent , pToken + '      ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , pToken + '      ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , pToken + '     ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , pToken + '     ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , pToken + '    ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , pToken + '    ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , pToken + '   ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , pToken + '   ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , pToken + '  ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , pToken + '  ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , pToken + ' ', pToken, [rfReplaceAll] ) );
       pContent := Trim( StringReplace( pContent , pToken + ' ', pToken, [rfReplaceAll] ) );

       Result := pContent;
end;
// v. 4.0.0.0
procedure rc_RenderLayout( pForm: TObject; pAdjustFormSize : boolean ; pResizeBlocks : boolean ; pMainMenuExists : boolean ; pUpdateDBGrids : boolean; pAdjustEdits : boolean );
var
   oMainMenu : TObject;
   bModal    : boolean;
   cHint     : string;
begin
    bModal := false;
    if pForm is TUniForm then
       TUniForm( pForm ).RTL := mm.RTL
    else
       TUniFrame( pForm ).RTL := mm.RTL;

    {$IFDEF RELEASE}
    dm_rc.rc_ProtectForm( pForm );
    {$ENDIF}

    UniSession.SuspendLayouts; // v. 4.0.0.0
    try
        // para quando um FORM MODAL estiver ativo, não executar o "dbGridUpdate" no que estiver "abaixo" do MODAL
        mm.varC_Form_Modal := nil;
        if pForm is TUniForm then
        begin
           // v. 4.0.0.0
//           if mm.CONFIG_LAYOUT_ROUND_FORM = 'ON' then
//              rc_AddCssClass( pForm, 'form-rounded' )
//           else
//              rc_AddCssClass( pForm, 'form-noborder' );

           if Pos( 'modal:' , TUniForm( pForm ).Hint ) > 0 then
              mm.varC_Form_Modal := TUniForm( pForm );
        end;

        oMainMenu := nil;

        cHint     := rc_NormalizeHintProperty( TUniControl( pForm ).Hint );
        // v. 3.3.1.0
        if ( pForm is TUniForm ) then
           bModal := Pos( 'modal:' , cHint ) > 0 ;

        if ( lowercase( TUniControl( pForm ).name ) = 'mainform' ) or
           ( lowercase( TUniControl( pForm ).name ) = 'mf' ) or ( bModal ) then // v. 3.3.1.0
           pMainMenuExists := false;

        oMainMenu := rc_ScreenUpdate( pMainMenuExists );

        // se for MODAL não precisa dar o 'offset' do mainmenu
        if bModal then
           oMainMenu := nil;

        if ( not bModal ) and ( pForm is TUniForm ) then
        begin
           if Pos( 'width:max', cHint ) > 0 then
           begin
             // v. 4.0.0.0
             TUniControl( pForm ).Width := mm.varI_ScreenWidth;
             //if oMainMenu = nil then
             //   TUniControl( pForm ).Width := mm.varI_ScreenWidth
             //else
             //   TUniControl( pForm ).Width := mm.varI_ScreenWidth - TUniControl( oMainMenu ).Width;
           end;

           if Pos( 'height:max', cHint ) > 0 then
              TUniControl( pForm ).Height  := mm.varI_ScreenHeight;
        end;

        if pAdjustFormSize then
           if bModal then
              rc_AdjustFormsSize( nil, pResizeBlocks )
           else
              rc_AdjustFormsSize( oMainMenu , pResizeBlocks );
        // v. 4.0.0.0
        //if pAdjustEdits then
        //   rc_AdjustEditColors ( pForm );

        //rc_RenderControls( pForm );

        if not pResizeBlocks then
        begin
           rc_BootStrapRender( pForm );
        end;
        // v. 4.0.0.0
        //if pUpdateDBGrids then
        //   dm_rc.rc_DBGridUpdateAll( pForm, true, true, true );
    finally
           UniSession.ResumeLayouts; // v. 4.0.0.0
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
     iMin_mob   := 0;
     iMin_mob_h := 0;
     iMin_mob_h := 0;
     iMin       := 0;
     iMax_mob   := 0;
     iMax_mob_h := 0;
     iMax_mob_h := 0;
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
                  // v. 3.3.0.2
                  iMin_mob   := 0;
                  iMin_mob_h := 0;
                  iMin_mob_h := 0;
                  iMin       := 0;
                  iMax_mob   := 0;
                  iMax_mob_h := 0;
                  iMax_mob_h := 0;
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

                    // v. 3.3.0.2
                    iMin_mob   := 0;
                    iMin_mob_h := 0;
                    iMin_mob_h := 0;
                    iMin       := 0;
                    iMax_mob   := 0;
                    iMax_mob_h := 0;
                    iMax_mob_h := 0;
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

                                   if oObjPrior <> nil then
                                      oObjPrior.Width := oObjPrior.Width + ( oObj.Width - y );

                                   oObj.Width := y;
                              end ;
                           end;

                        i4 := 0;
                        i5 := 0;
                    end
                    else
                       i := 0;

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
