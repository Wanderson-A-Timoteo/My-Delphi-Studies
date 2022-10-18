unit mkm_layout; // v. 4.0.0.0

interface

uses
    System.SysUtils, System.Classes ,       System.TypInfo, JSON, DBXJSON, DBXJSONReflect,
    System.DateUtils, math, System.Rtti, System.StrUtils, Vcl.Graphics,
    Controls,
    // feedback: Mesut from Turkey
    {$ifdef LINUX}
    System.UIConsts,
    {$endif}
    uconsts,
    uniGUIBaseClasses, uniGUIClasses, uniGUITypes, uniGUIJSUtils, Vcl.forms,
    uniComboBox, uniDBComboBox,uniDBLookupComboBox, uniDateTimePicker, uniDBDateTimePicker,  uniListBox, uniDBGrid, // v. 4.0.0.0
    uniBitBtn, uniButton, uniEdit, UniDBEdit, UniSpeedButton, uniGUIFrame, uniGUIForm,  uniGUIDialogs, Messages, uniMenuButton, // v. 3.4.0.0
    uniGUIAbstractClasses,  uniGUIApplication, uniPanel, IniFiles, UniImage, uniLabel,  Unipagecontrol,
    uniMemo, uniDBMemo, uniGUIRegClasses, uniDBNavigator, uniScrollBox,
    UniDBRadioGroup, uniDBCheckBox, uniDBImage, uniDBText, uniHTMLFrame, uniURLFrame,
    FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
    FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
    FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
    FireDAC.Comp.Client;

    // transferido de dm_rc
    // adiciona uma classe CSS
    procedure rc_AddCssClass(pObj: TObject; pCls: string);
    procedure rc_RemoveCssClass(pObj: TObject; pCls: string);
    // alinhamento do label vertical centralizado + horizontal
    // left-center   center  right-center
    procedure rc_AlignLabel( pLabel : TUniLabel ; pAlign : string = 'left-center' );
    function  rc_FindControl( pName: string; pForm : TObject = nil ): TUniControl;
    function  rc_FindAllComponents( pForm : TObject; pCriteria : string ) : TStringList;
    function  rc_GetHintProperty( pProp, pProps : string; bParam : boolean = false; bFullLength:boolean = false ) : string;
    function  rc_SetHintProperty( pContent, pProp, pProps : string; pAdd : boolean = false ) : string;
    function  rc_AddHintProperty( pContent, pProps : string; pUpdate : boolean = false ) : string;
    function  rc_NormalizeHintProperty( pContent: string): string;
    function  rc_NormalizeAllTrim( pContent, pToken : string ) : string;
    function  rc_PosHintProperty( pProp, pContent: string): integer;

    procedure rc_CenterObj( pObj : TObject ; pObjParent : TObject = nil ;pV : boolean = true; pH : boolean = true; pV_OffSet : integer = 0; pH_OffSet : integer = 0 );
    procedure rc_AdjustFormsSize( pMainMenu : TObject = nil; pResizeBlocks : boolean = true );
    procedure rc_BootStrapRenderExecute( pForm : TObject = nil; pUpdateDBFields : Boolean  = false; pTabIni : integer = 0; pTabEnd : integer = 0; pMobileScreen : boolean = false; pLandScape : boolean = false; pOnlyThisObj : TObject = nil );
    procedure rc_AdjustEditColorsExecute( pForm : TObject; pAPP_FONT, pEDLKP_COLOR, pEDLKP_FONT_COLOR, pEDIT_COLOR, pEDIT_FONT_COLOR, pEDIT_COLOR_READONLY, pEDIT_FONT_COLOR_READONLY, pEDIT_FOCUS_COLOR : String ); // v. 4.0.0.0
    procedure rc_RenderControlsExecute(pForm: TObject; pMENU_COLOR : string = ''; pOnlyThisObj : TUniControl = nil ); // v. 4.0.0.0
    procedure rc_DynamicAlignment( pFrame: TObject );
    // v. 4.0.0.0
    function DynamicAlignment_CENTER( pFrame : TObject; pObj : TUniControl; pParam1, pParam2 : string ):boolean;
    //procedure rc_GetLeftPosition( pForm, pObj: TObject ) : string;
    //procedure rc_GetTopPosition( pForm, pObj: TObject ) : string;
    procedure rc_SetPosition( pForm, pObj: TObject; pX, pY : string );
    procedure rc_ScreenAdjustMobileKeyboard( pForm : TObject; pOffSetV : Integer = 0; pOffSetH : Integer = 0 );
    // v. 4.0.0.0
    procedure rc_RenderLayout(pForm: TObject; pAdjustFormSize : boolean = false ; pResizeBlocks : boolean = false; pMainMenuExists : boolean = true; pUpdateDBGrids : boolean = true; pAdjustEdits : boolean = true  );
    // v. 3.2.0.4 // Thanks to JOAS // Renamed from GetRCBlocks(pFrame: TObject);
    procedure rc_GenerateRuntimeDebugBlocksFile(pFrame: TObject);

    procedure rc_Collapse( Sender, pForm : TObject; pObj : TUniControl );
    // v. 3.3.3.1
    procedure rc_BringToFront( pObject : TObject );
    // v. 4.0.0.0
    function rc_GetScrollBoxForMobileKeyboard( pObj : TObject ):TObject;
    // v. 3.4.0.0
    procedure rc_CallOut( pText : string ;
                          pTargetObj : TUniControl;
                          pTheme : TRCCalloutTheme = ctDefault;
                          pArrowLocation : TRCCalloutArrow = carTop;
                          pRelativeOffsets : string = '0,10';
                          pRelativePos : TRCCalloutRelPos = crpT_B;
                          pFadeInDuration : integer = 200;
                          pFadeOutDuration : integer = 200;
                          pDismissDelay : integer = 5000;
                          pWidth : integer = 200 );
    // v. 4.0.0.0
    procedure rc_ScrollTop( pFormFrame : TObject );
    procedure rc_UpdateFormsInsideContainers;
    procedure rc_AddFocusBlur( pFormFrame : TObject; pObj : TUniControl; pEDIT_COLOR, pEDIT_FOCUS_COLOR, pEDIT_FONT_COLOR : string );

implementation

uses untdm_rc, str_func, mkm_func_web, MainModule, Main, mkm_gridblock, mkm_qrcode, mkm_paginator;

// v. 4.0.0.0
procedure rc_AddFocusBlur( pFormFrame : TObject; pObj : TUniControl; pEDIT_COLOR, pEDIT_FOCUS_COLOR, pEDIT_FONT_COLOR : string );
begin
    if Pos( 'focus-color:off' , TUniEdit( pObj ).Hint ) = 0 then
    begin
       pObj.ClientEvents.ExtEvents.Values['onfocus'] :=
          'function focus(sender, eOpts)'+
          '{  document.getElementById(sender.getInputId( )).style.backgroundColor = "' + ColorToHtml( StringToColor( pEDIT_FOCUS_COLOR ) ) + '";' + //    "#ffffff";'+
          '   document.getElementById(sender.getInputId( )).style.color = "' + ColorToHtml( StringToColor( pEDIT_FONT_COLOR ) ) + '";' +

          //'UniSession.AddJS('$("input").attr("autocomplete", "off");');' +

          '   ajaxRequest( ' + mm.varC_JSNAME_HTMLFRAME + '  , "_onFocus", ' +
          '                [ ' +
          '                "pform=" + ' + QuotedStr( TComponent( pFormFrame ).Name ) + ', ' +
          '                "pobj=" + ' + QuotedStr( pObj.Name ) +
          '                ]);' +
          '}';

       pObj.ClientEvents.ExtEvents.Values['onblur'] :=
          'function focusout(sender, eOpts)'+
          '{  document.getElementById(sender.getInputId( )).style.backgroundColor = "' + ColorToHtml( StringToColor( pEDIT_COLOR ) ) + '";'+
          '   document.getElementById(sender.getInputId( )).style.color = "' + ColorToHtml( StringToColor( pEDIT_FONT_COLOR ) ) + '";' +

          '   ajaxRequest( ' + mm.varC_JSNAME_HTMLFRAME + '  , "_onBlur", ' +
          '                [ ' +
          '                "pform=" + ' + QuotedStr( TComponent( pFormFrame ).Name ) + ', ' +
          '                "pobj=" + ' + QuotedStr( pObj.Name ) +
          '                ]);' +
          '}';
    end
    else
    begin
       pObj.ClientEvents.ExtEvents.Values['onfocus'] :=
          'function focus(sender, eOpts)'+
          '{  ajaxRequest( ' + mm.varC_JSNAME_HTMLFRAME + '  , "_onFocus", ' +
          '                [ ' +
          '                "pform=" + ' + QuotedStr( TComponent( pFormFrame ).Name ) + ', ' +
          '                "pobj=" + ' + QuotedStr( pObj.Name ) +
          '                ]);' +
          '}';

       pObj.ClientEvents.ExtEvents.Values['onblur'] :=
          'function focusout(sender, eOpts)'+
          '{  ajaxRequest( ' + mm.varC_JSNAME_HTMLFRAME + '  , "_onBlur", ' +
          '                [ ' +
          '                "pform=" + ' + QuotedStr( TComponent( pFormFrame ).Name ) + ', ' +
          '                "pobj=" + ' + QuotedStr( pObj.Name ) +
          '                ]);' +
          '}';
    end;
end;
// v. 4.0.0.0
// [PT] existe form/frame adicionado em um objeto ?
// [EN] is there a form/frame added to an object?
procedure rc_UpdateFormsInsideContainers;
var
   cFrameFormInParent : string;
   oObj : TUniControl;
begin
  cFrameFormInParent := mm.varC_FormsInParent;
  while Length( trim(cFrameFormInParent) ) > 0 do
  begin
     cFrameFormInParent := Copy( cFrameFormInParent, Pos( ';' , cFrameFormInParent ) + 1 ) + ' ';
     //cFrameFormInParent := Copy( cFrameFormInParent, 2 ) + ' ';
     //cFrameFormInParent := Copy( cFrameFormInParent, 1, Pos( ' ', cFrameFormInParent )-1 );
     //cFrameFormInParent := Copy( cFrameFormInParent, 1 );
     //oObj := rc_FindControl( cFrameFormInParent );
     oObj := rc_FindControl( Copy( cFrameFormInParent, 1, Pos( ' ', cFrameFormInParent )-1 ) );
     if oObj <> nil then
     begin
        dm_rc.rc_ResizeBlocks( oObj );
        if ( mm.varC_Form_Detail = nil ) and ( mm.varC_Form_Modal = nil ) then
           dm_rc.rc_DBGridUpdateAll( oObj) //, true, true, true )
        else
        if ( mm.varC_Form_Modal = nil ) then
           dm_rc.rc_DBGridUpdateAll( mm.varC_Form_Detail) //, true, true, true )
        else
        if rc_FindControl( mm.varC_Form_Modal.Name ) <> nil then
           dm_rc.rc_DBGridUpdateAll( mm.varC_Form_Modal ) ;//, true, true, true );

        //cFrameFormInParent := StringReplace( cFrameFormInParent, ';' + oObj.Name, '', [rfReplaceAll] ) ;
        cFrameFormInParent := StringReplace( cFrameFormInParent, oObj.Name, '', [rfReplaceAll] ) ;
     end;
//     cFrameFormInParent := StringReplace( cFrameFormInParent, ';' + oObj.Name, '', [rfReplaceAll] ) ;
  end;
  cFrameFormInParent := mm.varC_FormsInParent;
end;
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
// v. 3.4.0.0
procedure rc_CallOut( pText : string ;
                      pTargetObj : TUniControl;
                      pTheme : TRCCalloutTheme;
                      pArrowLocation : TRCCalloutArrow;
                      pRelativeOffsets : string;
                      pRelativePos : TRCCalloutRelPos;
                      pFadeInDuration : integer;
                      pFadeOutDuration : integer;
                      pDismissDelay : integer;
                      pWidth : integer );
var
   cTheme, cArrowLoc, cRelPos : string;
begin
       cTheme    := lowercase( Copy( GetEnumName( typeInfo( TRCCalloutTheme ), Ord(pTheme)), 3 ) );
       cArrowLoc := StringReplace( lowercase( Copy( GetEnumName( typeInfo( TRCCalloutArrow ), Ord(pArrowLocation)), 4 ) ), '_', '-', [rfReplaceAll] );
       cRelPos   := StringReplace( lowercase( Copy( GetEnumName( typeInfo( TRCCalloutRelPos ), Ord(pRelativePos)), 4 ) ), '_', '-', [rfReplaceAll] );
       UniSession.AddJS(
       'Ext.widget(''callout'', {' +
       '  cls: "' + cTheme + '",'+
       '  width: ' + IntToStr(pWidth) + ','+
       '  html: "' + pText + '",'+
       '  calloutArrowLocation: "' + cArrowLoc + '",' +
       '  target: "#' + pTargetObj.JSName + '_id",'+
       '	relativePosition: ' + QuotedStr( cRelPos ) + ',' + //   ''t-b'',' +
       '	relativeOffsets: [' + pRelativeOffsets + '],' +//   [0,10],' +
       '	fadeInDuration: ' + IntToStr(pFadeInDuration) + ','+
       '	fadeOutDuration: ' + IntToStr(pFadeOutDuration) + ','+
       '	dismissDelay: ' + IntToStr(pDismissDelay) + ','+
       '}).show();'
       );
end;
// v. 4.0.0.0
function rc_GetScrollBoxForMobileKeyboard( pObj : TObject ):TObject;
var
   i : integer;
   oSBox : TUniScrollBox;
   oScrollBlock : TObject;
begin
   Result       := nil;
   oScrollBlock := nil;
   i            := 0;
   if pObj <> nil then
   begin
      if TUniControl( pObj ).HasParent then
         Result := TUniControl( pObj ).Parent;
      while ( Result.ClassName <> 'TUniScrollBox' ) and ( i < 3 ) do
      begin
         if TUniControl( Result ).HasParent then
         begin
            Result := TUniControl( Result  ).Parent;
         end;
         if ( Result.ClassName <> 'TUniScrollBox' ) then
            Inc( i );
      end;
      if ( Result.ClassName <> 'TUniScrollBox' ) then
         Result := nil;
   end;
end;
// HOUVE ERRO NA COMPILAÇÃO ?   /   DO YOU HAVE A COMPILE ERROR ?
//
// in unigui old versions, maybe need to comment this lines below
// em versões antigas do unigui, comente as linhas abaixo
// v. 3.3.3.1
procedure rc_BringToFront( pObject : TObject );
begin
     if pObject is TUniForm then
        TUniForm( pObject ).JSInterface.JSCall( 'addCls' , ['bringtofront'])
     else
        TUniControl( pObject ).JSInterface.JSCall( 'addCls' , ['bringtofront']);
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
           if mm.CONFIG_LAYOUT_ROUND_FORM = 'ON' then
              rc_AddCssClass( pForm, 'form-rounded' )
           else
              rc_AddCssClass( pForm, 'form-noborder' );

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

        oMainMenu := dm_rc.rc_ScreenUpdate( pMainMenuExists );

        // se for MODAL não precisa dar o 'offset' do mainmenu
        if bModal then
           oMainMenu := nil;

        if ( not bModal ) and ( pForm is TUniForm ) then
        begin
           if Pos( 'width:max', cHint ) > 0 then
           begin
             // v. 4.0.0.6
             if mm.CONFIG_LAYOUT_MENU_TYPE = '1' then
                TUniControl( pForm ).Width := mm.varI_ScreenWidth
             else
             begin
                if oMainMenu = nil then
                   TUniControl( pForm ).Width := mm.varI_ScreenWidth
                else
                   TUniControl( pForm ).Width := mm.varI_ScreenWidth - TUniControl( oMainMenu ).Width;
             end;
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
        if pAdjustEdits then
           dm_rc.rc_AdjustEditColors ( pForm );

        dm_rc.rc_RenderControls( pForm );

        if not pResizeBlocks then
        begin
           dm_rc.rc_BootStrapRender( pForm );
        end;
        // v. 4.0.0.0
        if pUpdateDBGrids then
           dm_rc.rc_DBGridUpdateAll( pForm, true, true, true );
    finally
           UniSession.ResumeLayouts; // v. 4.0.0.0
    end;
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

function rc_FindAllComponents(pForm: TObject; pCriteria: string): TStringList;
var
  i : Integer;
  sl : TStringList;
begin
  sl := TStringList.Create;

  Try
     if pForm is TUniForm then
     begin
        for i := 0 to TUniForm( pForm ).ComponentCount - 1 do
        begin
           if Pos( lowercase( pCriteria ), lowercase( TUniForm( pForm ).Components[ i ].Name ) ) > 0 then
           begin
                sl.Add( TUniForm( pForm ).Components[ i ].Name );
           end;
        end;
     end
     else
     if pForm is TUniFrame then
     begin
        for i := 0 to TUniFrame( pForm ).ComponentCount - 1 do
        begin
           if Pos( lowercase( pCriteria ), lowercase( TUniFrame( pForm ).Components[ i ].Name ) ) > 0 then
           begin
                sl.Add( TUniFrame( pForm ).Components[ i ].Name );
           end;
        end;
     end;
  Finally
        Result := sl;
  End;
end;
// v. 4.0.0.0
function rc_GetHintProperty(pProp, pProps: string; bParam : boolean; bFullLength:boolean ): string;
var
   cTmp : string;
   iPos : integer;
begin
    // v. 4.0.0.0
//    cTmp := pProps;
//    if Pos( '[[', pProps ) > 0 then
//    begin
//         //cTmp := StringReplace( pProps, Copy( pProps, Pos( '[[', pProps ), Pos( ']]', pProps ) + 2 ), cIcon, [rfReplaceAll]);
//         cTmp := Copy( pProps, Pos( '[[', pProps ) );
//         if Pos( ']]', cTmp ) > 0 then
//            cTmp := Copy( cTmp, 1, Pos( ']]', cTmp ) + 2 );
//    end;
//    cTmp := rc_NormalizeHintProperty( cTmp );
    if pos( pProp, pProps ) = 0 then
       Result := ''
    else
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
             begin

                if Pos( ':', cTmp ) > 0 then
                begin
                   cTmp := ReverseStr( Copy( cTmp, 1, Pos( ':', cTmp ) ) );
                   cTmp := Trim( ReverseStr( Copy( cTmp, Pos( ' ', cTmp ) ) ) );
                end
                else
                if ( Pos( '-', cTmp ) > 0 ) and ( pProp <> 'c:' ) and ( Pos( 'cls', pProp ) = 0  ) then // v. 4.0.0.0
                begin
                   cTmp := ReverseStr( Copy( cTmp, 1, Pos( '-', cTmp ) ) );
                   cTmp := Trim( ReverseStr( Copy( cTmp, Pos( ' ', cTmp ) ) ) );
                end
                else
                   cTmp := Trim( Copy( cTmp, 1, Pos( ' ' , cTmp + ' ' ) ) );
             end
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
// v. 3.3.3.0
function rc_AddHintProperty( pContent, pProps : string; pUpdate : boolean ) : string;
var
   cTmp, cFirstChar, cProp, cValue : string;
begin
    cTmp := pProps;
    if Copy( cTmp, 1, 2 ) = '[[' then
       cTmp := Copy( cTmp, 3, 2000 );
    if Copy( ReverseString( cTmp ), 1, 2 ) = ']]' then
       cTmp := Copy( cTmp, 1, Length( cTmp ) - 2 );

    Result := '[[' + cTmp;
    cValue := '';
    cProp  := '';
    if pUpdate then
    begin
       cProp := Trim( Copy( pContent, 1, Pos( ':', pContent ) ) );
       if ReturnLetters( copy( cProp, 1, 1 ) ) = ''  then
       begin
          cFirstChar := copy( cProp, 1, 1 );
          cProp := copy( cProp, 2 );
       end;
       if cProp <> '' then
          cValue := rc_GetHintProperty( cProp, pprops );

       if cValue <> '' then
          Result := StringReplace( Result, cFirstChar + cProp + cValue, pContent, [rfReplaceAll] )
       else
         Result := Result + pContent ;
    end
    else
    begin
       Result := StringReplace( Result, pContent, '', [rfReplaceAll] );
       Result := Result + pContent ;
    end;

    Result := Result + ']]';
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

function rc_NormalizeHintProperty(pContent: string): string;
begin
    //if Pos( '[[', pContent ) > 0 then
    if Copy( pContent, 1, 2 ) = '[[' then
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

procedure rc_AddCssClass(pObj: TObject; pCls: string);
begin
     if pCls <> '' then
     begin
        if pObj is TUniForm then
           TUniForm( pObj ).WebForm.JSInterface.JSCall( 'addCls' , [ pCls ])
        else
           TUniControl( pObj ).JSInterface.JSCall( 'addCls' , [ pCls ]);
     end;
end;
// v. 3.3.0.0
procedure rc_RemoveCssClass(pObj: TObject; pCls: string);
begin
    if pCls <> '' then
    begin
       if pObj is TUniForm then
          TUniForm( pObj ).WebForm.JSInterface.JSCall( 'removeCls' , [ pCls ])
       else
          TUniControl( pObj ).JSInterface.JSCall( 'removeCls' , [ pCls ]);
    end;
end;

procedure rc_AlignLabel(pLabel: TUniLabel; pAlign: string);
begin
     rc_AddCssClass( pLabel, 'align-label-' + pAlign );
end;

procedure rc_ScreenAdjustMobileKeyboard( pForm : TObject; pOffSetV, pOffSetH : Integer );
begin
     if ( mm.varB_Mobile_Screen_Portrait ) then
        TUniControl( pForm ).Top := TUniControl( pForm ).Top - pOffSetV
     else
     if ( mm.varB_Mobile_Screen_Landscape ) then
        TUniControl( pForm ).Top := TUniControl( pForm ).Top - pOffSetH;
end;

procedure rc_SetPosition( pForm, pObj: TObject; pX, pY : string );
var
   cLeft,
   cTop,
   cJs,
   cId : string;
begin
     if pObj is TUniForm then
        cId := TUniForm( pObj ).WebForm.JSId
     else
        cId := TUniControl(pObj).JSId;

     cLeft := '';
     cTop  := '';
     cJs   := '';

     if pX <> '' then
        cLeft := 'left: "' + pX + 'px"';

     if pY <> '' then
        cTop := 'top: "' + pY + 'px"';

     if cLeft + cTop <> '' then
        cJs := '$("#' + cId + '").css( { ';

     if cLeft <> '' then
        cJs := cJs + cLeft;

     if cTop <> '' then
        cJs := cJs + IfThen( cLeft <> '', ',', '' ) + cTop;

     if cJs <> '' then
        UniSession.AddJS( cJs + '} );' ) ;
     //UniSession.AddJS( '$("#' + cId + '").css( { left: "200px", top: "200px" } );' ) ;

     UniSession.AddJS(
       'ajaxRequest( ' + MainForm.htmlFrame.JSName + ' , "_SetPosLeft", ' +
       '["form=" + ' + QuotedStr( TComponent(pForm).Name ) + ', ' +
       '"pleft=" + ' + QuotedStr( pX ) + ', ' +
       '"ptop=" + ' + QuotedStr( pX ) + '] );' );


     //rc_GetLeftPosition( oObj );

     Exit;

     uniSession.AddJS(
                    //$('#block').offset().left
        ' var p = document.getElementById("' + cId + '").position();' +
        ' var x =  ' + //  p.left; '+
        ' var y = p.top; ' +
//        ' var x = document.getElementById("' + cId + '").offsetLeft;' +
//        ' var y = document.getElementById("' + cId + '").offsetTop;' +

        IfThen( pX <> '', ' x = x + ' + pX + '; document.getElementById("' + cId + '").style.left = x + "px";' , '' ) +
        IfThen( pY <> '', ' y = y + ' + pY + '; document.getElementById("' + cId + '").style.top = y + "px";' , '' )

     );

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
             dm_rc.rc_ResizeBlocks( TUniControl(oFrm) );
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
                               // v. 4.0.0.6
                               if mm.CONFIG_LAYOUT_MENU_TYPE = '1' then
                                  oFrm.Width := mm.varI_ScreenWidth
                               else
                               begin
                                  if oMainMenu = nil then
                                     oFrm.Width := mm.varI_ScreenWidth
                                  else
                                     oFrm.Width := mm.varI_ScreenWidth - TUniControl( oMainMenu ).Width;
                               end;
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
                                // v. 4.0.0.6
                                if mm.CONFIG_LAYOUT_MENU_TYPE = '1' then
                                begin
                                    oFrm.Width  := mm.varI_ScreenWidth;
                                end
                                else
                                if UniApplication.FindComponent('MainForm' ) <> nil then
                                begin
                                     oMainMenu := rc_FindControl( 'paLayoutMainMenu' );
                                     if oMainMenu <> nil then
                                     begin
                                        oFrm.Width  := mm.varI_ScreenWidth - TUniControl( oMainMenu ).Width;
                                     end;
                                end
                                else
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
                 // v. 4.0.0.6
                 if bWidthMax then
                    if mm.CONFIG_LAYOUT_MENU_TYPE = '1' then
                       oFrm.Width := mm.varI_ScreenWidth
                    else
                    begin
                       if oMainMenu = nil then
                          oFrm.Width := mm.varI_ScreenWidth
                       else
                          oFrm.Width := mm.varI_ScreenWidth - TUniControl( oMainMenu ).Width;
                    end;

                 if pResizeBlocks then
                   dm_rc.rc_ResizeBlocks( TUniControl(oObj), bModal );
             end;
         end;
     end;
     //UniSession.ResumeLayouts();
end;

procedure rc_AdjustEditColorsExecute( pForm : TObject; pAPP_FONT, pEDLKP_COLOR, pEDLKP_FONT_COLOR, pEDIT_COLOR, pEDIT_FONT_COLOR, pEDIT_COLOR_READONLY, pEDIT_FONT_COLOR_READONLY, pEDIT_FOCUS_COLOR : String ); // v. 4.0.0.0
var
   I, iT, iL : integer; // v. 3.4.0.0
   tComp : TComponent;
   oLabel : TUniLabel ;// v. 3.4.0.0
   oHF    : TUniHTMLFrame; // v. 3.4.0.0
   cTemp : char;
   cTmp : string;
begin
     //UniSession.SuspendLayouts();
    tComp := nil;
    try
       for I := 0 to TComponent( pForm ).ComponentCount - 1 do
       begin
          tComp := TComponent( pForm ).Components[I];
          // v. 3.3.0.2
          If ( Pos( 'TAction' , TComponent( pForm ).Components[I].ClassName ) = 0 ) and
             ( Pos( 'THelp' , TComponent( pForm ).Components[I].ClassName ) = 0 ) then
          begin
             If GetPropInfo( tComp.ClassInfo, 'Hint') <> nil then
             begin
                if ( Pos( '[[', TUniControl( tComp ).hint ) > 0 ) then
                begin
                   TUniControl( tComp ).hint := '[[' + rc_NormalizeHintProperty( TUniControl( tComp ).hint ) + ']]';
                end;
             end;
             // v. 3.4.0.0
             if ( tComp is TUniBitBtn ) or ( tComp is TUniButton ) or ( tComp is TUniSpeedButton ) or ( tComp is TUniMenuButton ) Then
             begin
                   if mm.CONFIG_LAYOUT_APPLY_FONT_ALL = 'ON' then
                      TUniButton( TComponent( pForm ).Components[I] ).Font.Name  := pAPP_FONT;
             end
             else
             if ( tComp is TUniLabel ) Then
             begin
                   if mm.CONFIG_LAYOUT_APPLY_FONT_ALL = 'ON' then
                      TUniLabel( TComponent( pForm ).Components[I] ).Font.Name  := pAPP_FONT;
             end
             else
             // v. 4.0.0.0
             if ( tComp is TUniDBCheckBox ) Then
             begin
                   if mm.CONFIG_LAYOUT_APPLY_FONT_ALL = 'ON' then
                      TUniDBCheckBox( TComponent( pForm ).Components[I] ).Font.Name  := pAPP_FONT;
             end
             else
             if ( tComp is TUniListBox ) Then
             begin
                   if mm.CONFIG_LAYOUT_APPLY_FONT_ALL = 'ON' then
                      TUniListBox( TComponent( pForm ).Components[I] ).Font.Name  := pAPP_FONT;

                   TUniListBox( TComponent( pForm ).Components[I] ).Font.Size  := 10;
             end
             else
             if ( tComp is TUniEdit ) OR
                ( tComp is TUniDBEdit ) OR
                ( tComp is TUniMemo ) OR
                ( tComp is TUniDBMemo ) OR
                ( tComp is TUniComboBox ) OR
                ( tComp is TUniDBComboBox ) OR
                ( tComp is TUniDBLookupComboBox ) OR
                ( tComp is TUniDateTimePicker ) OR
                ( tComp is TUniDBDateTimePicker ) OR
                ( tComp is TUniCustomNumberEdit ) OR // v. 3.4.0.0
                ( tComp is TUniCustomDBEdit ) Then
             begin
                // v. 4.0.0.4 // future implementation
                if ( tComp is TUniComboBox ) OR
                   ( tComp is TUniDBComboBox ) OR
                   ( tComp is TUniDBLookupComboBox ) OR
                   ( tComp is TUniDateTimePicker ) OR
                   ( tComp is TUniDBDateTimePicker ) Then
                begin
                   //iT := Trunc( FixDecimals( ( TUniControl( tComp ).Height * 0.235 ), 2 ) );
                   //UniSession.AddJS('$(''.rc-trigger-icon-top .x-form-trigger-default {'').css({ ''padding-top'': ''' + It.ToString + ''' })' );
                   //rc_AddCssClass( tComp, 'rc-trigger-icon-top-8' );
                end;
                //lookups( nao alterar a cor do FOCO - vc pode mudar isso... )
                if ( lowercase( Copy( TUniDBEdit( TComponent( pForm ).Components[I] ).Name , 1, 5 ) ) = 'edlkp' ) and
                   ( ( tComp is TUniDBEdit ) and
                     ( Pos( '_pesqextra' , lowercase( TUniDBEdit( TComponent( pForm ).Components[I] ).Name ) ) = 0 ) and
                     ( Pos( '_codid' , lowercase( TUniDBEdit( TComponent( pForm ).Components[I] ).Name ) ) = 0 ) ) then
                begin
                   TUniDBEdit( TComponent( pForm ).Components[I] ).ReadOnly   := True;
                   TUniDBEdit( TComponent( pForm ).Components[I] ).Color      := StringToColor( pEDLKP_COLOR );
                   TUniDBEdit( TComponent( pForm ).Components[I] ).Font.Color := StringToColor( pEDLKP_FONT_COLOR );

                   if mm.CONFIG_LAYOUT_APPLY_FONT_ALL = 'ON' then
                      TUniDBEdit( TComponent( pForm ).Components[I] ).Font.Name  := pAPP_FONT;
                end
                else
                begin
                   cTemp := #32;
                   if GetPropInfo( TUniEdit( TComponent( pForm ).Components[I] ).ClassInfo, 'PasswordChar' ) <> nil then
                      cTemp := TUniEdit( TComponent( pForm ).Components[I] ).PasswordChar ;

                   // v. 4.0.0.0
                   if Pos( '[[EDIT_', TUniControl( tComp ).Hint ) > 0 then
                   begin
                      TUniControl( tComp ).Hint := StringReplace( TUniControl( tComp ).Hint, '[[EDIT_COLOR]]'              , mm.CONFIG_LAYOUT_EDIT_COLOR , [rfReplaceAll] );
                      TUniControl( tComp ).Hint := StringReplace( TUniControl( tComp ).Hint, '[[EDIT_FONT_COLOR]]'         , mm.CONFIG_LAYOUT_EDIT_FONT_COLOR, [rfReplaceAll] );
                      TUniControl( tComp ).Hint := StringReplace( TUniControl( tComp ).Hint, '[[EDIT_COLOR_READONLY]]'     , mm.CONFIG_LAYOUT_EDIT_COLOR_READONLY, [rfReplaceAll] );
                      TUniControl( tComp ).Hint := StringReplace( TUniControl( tComp ).Hint, '[[EDIT_FONT_COLOR_READONLY]]', mm.CONFIG_LAYOUT_EDIT_FONT_COLOR_READONLY, [rfReplaceAll] );
                   end;
                   // v. 4.0.0.0
                   if TUniEdit( TComponent( pForm ).Components[I] ).ReadOnly then
                      TUniEdit( TComponent( pForm ).Components[I] ).Color := StringToColor( pEDIT_COLOR_READONLY ) //$00d0d0d0  // adicionar ao controle de temas no futuro
                   else
                       TUniEdit( TComponent( pForm ).Components[I] ).Color  := StringToColor( pEDIT_COLOR );
                   // v. 4.0.0.0
                   if TUniEdit( TComponent( pForm ).Components[I] ).ReadOnly then
                      TUniEdit( TComponent( pForm ).Components[I] ).Font.Color := StringToColor( pEDIT_FONT_COLOR_READONLY )
                   else
                      TUniEdit( TComponent( pForm ).Components[I] ).Font.Color := StringToColor( pEDIT_FONT_COLOR );

                   if mm.CONFIG_LAYOUT_APPLY_FONT_ALL = 'ON' then
                      TUniEdit( TComponent( pForm ).Components[I] ).Font.Name  := pAPP_FONT;

                   if cTemp = '*' then
                   begin
                      TUniEdit( TComponent( pForm ).Components[I] ).PasswordChar := cTemp;
                   end;
                   // v. 4.0.0.0
                   if not TUniEdit( TComponent( pForm ).Components[I] ).ReadOnly then
                   begin
                        rc_AddFocusBlur( pForm, TUniControl( TComponent( pForm ).Components[I] ), pEDIT_COLOR, pEDIT_FOCUS_COLOR, pEDIT_FONT_COLOR );
                   end;
                   // v. 4.0.0.1( thanks to ExtJS: ISRAEL PORTILLO from Mexico )
                   cTmp := rc_GetHintProperty( 'keyboard:', TUniEdit( TComponent( pForm ).Components[I] ).Hint ) ;
                   if cTmp <> '' then
                   begin
                      if ( cTmp = 'off' ) then
                      begin
                          TUniControl( TComponent( pForm ).Components[I] ).ClientEvents.ExtEvents.Values['afterrender'] :=
                             'function afterrender(sender, eOpts)'+
                             '{  var me=sender.inputEl; me.set({ inputmode: "none" }); }';
                      end;
                   end;
                end;

                // v. 3.4.0.0
                if ( pos( 'valid-required:', TUniControl( tComp ).hint ) > 0 ) then
                begin
                   if TComponent(pForm).FindComponent('rc__Required' + TUniControl( tComp ).Name) = nil then
                   begin
                       iT         := 0;
                       iL         := 0;
                       cTmp       := rc_GetHintProperty( 'valid-required:', TUniControl( tComp ).hint );
                       oHF        := TUniHTMLFrame.Create( TComponent(pForm) );
                       oHF.Parent := TUniControl( tComp ).Parent;
                       oHF.Name   := 'rc__Required' + TUniControl( tComp ).Name;
                       //oHF.HTML.add( '<span class="rc-badge bg-danger bringtofront">!</span>' ); // with badge
                       oHF.HTML.add( '<span style="width:10;background-color:' + GetWebColor( ColorToString( TUniEdit( tComp ).Color ) ) + ';color:red;font-weight: 900" class="bringtofront">*</span>' );
                       //oHF.HTML.add( '<span class="rc-valid-required">*</span>' );
                       //oHF.Width  := 16; // with badge
                       //oHF.Top    := 14;
                       oHF.Width  := 6;
                       oHF.Height := 9; // v. 4.0.0.0
                       //oHF.Hint   := '[[cls:bringtofront | align:' + TUniControl( tComp ).Name + ' r:-w b:0 | ]]';
                   end;
                   if cTmp = '' then
                   begin
                      oHF.Left   := TUniControl( tComp ).Left + TUniControl( tComp ).Width - 6;
                      oHF.Top    := TUniControl( tComp ).Top -4 ;
                   end
                   else
                   begin
                      // v. 4.0.0.0
                      if Pos( 'top-in', cTmp ) > 0 then
                      begin
                         iT := 7;
                         iL := 8;
                         rc_AddCssClass( oHF, 'rc-mirror-h' );
                      end
                      else
                      if Pos( 'top', cTmp ) > 0 then
                      begin
                         iL := 4;
                         iT := -1;
                      end
                      else
                      if Pos( 'bottom-in', cTmp ) > 0 then
                      begin
                         iT := 2;
                         iL := 8;
                      end
                      else
                      if Pos( 'bottom', cTmp ) > 0 then
                      begin
                         iL := 4;
                         iT := -7;
                         rc_AddCssClass( oHF, 'rc-mirror-h' );
                      end;
                      if Pos( 'top', cTmp ) > 0 then
                      begin
                         //oHF.Left   := TUniControl( tComp ).Left + TUniControl( tComp ).Width - 6 - iL; // with badge
                         oHF.Left   := TUniControl( tComp ).Left + TUniControl( tComp ).Width - iL;
                         oHF.Top    := TUniControl( tComp ).Top - 4 + iT;
                      end
                      else
                      if Pos( 'bottom', cTmp ) > 0 then
                      begin
                         //oHF.Left   := TUniControl( tComp ).Left + TUniControl( tComp ).Width - 6 - iL; // with badge
                         oHF.Left   := TUniControl( tComp ).Left + TUniControl( tComp ).Width - iL;
                         oHF.Top    := TUniControl( tComp ).Top + TUniControl( tComp ).Height - 8 - iT;
                      end;

                   end;
                   oHF.Anchors := [akRight];
                end;
                // v. 3.4.0.0
                if ( pos( 'form-label:', TUniControl( tComp ).hint ) > 0 ) then
                begin
                   if TComponent(pForm).FindComponent('rc__FormLabel' + TUniControl( tComp ).Name) = nil then
                   begin
                       iT            := 0;
                       iL            := 0;
                       cTmp          := rc_GetHintProperty( 'form-label:', TUniControl( tComp ).hint );
                       cTmp          := Trim( Copy( cTmp , Pos( ' ', cTmp ) ) );
                       oLabel        := TUniLabel.Create( TComponent(pForm) );
                       oLabel.Caption:= cTmp ;
                       oLabel.Transparent := false;
                       oLabel.Color  := rc_HtmlToColor( rc_GetHintProperty( 'form-label-bg:', TUniControl( tComp ).hint ) );// clWhite;
                       oLabel.Font.Color  := rc_HtmlToColor( rc_GetHintProperty( 'form-label-color:', TUniControl( tComp ).hint ) );// clWhite;
                       oLabel.Parent := TUniControl( tComp ).Parent;
                       oLabel.Name   := 'rc__FormLabel' + TUniControl( tComp ).Name;
                       oLabel.Left   := TUniControl( tComp ).Left + 3;// + TUniControl( tComp ).Width - 6;
                       if ( TUniControl( tComp ) is TUniMemo ) or ( TUniControl( tComp ) is TUniDBMemo ) then // v. 4.0.0.0
                          oLabel.Top    := TUniControl( tComp ).Top + 8
                       else
                          //oLabel.Top    := TUniControl( tComp ).Top + Round( TUniControl( tComp ).Height * 0.32 ) ;
                          oLabel.Top    := TUniControl( tComp ).Top + ( ( TUniControl( tComp ).Height div 3 ) - 2 ) ; // v. 4.0.0.0
                   end;
                   if cTmp = '' then
                   begin
                      //oLabel.Left   := TUniControl( tComp ).Left;// + TUniControl( tComp ).Width - 6;
                      //oLabel.Top    := TUniControl( tComp ).Top - 12 ;
                   end
                   else
                   begin
                      if Pos( '-in', cTmp ) > 0 then
                      begin
                         iT := 7;
                         iL := 13;
                      end;
//                      if Pos( 'top', cTmp ) > 0 then
//                      begin
//                         oLabel.Left   := TUniControl( tComp ).Left + TUniControl( tComp ).Width - iL;
//                         oLabel.Top    := TUniControl( tComp ).Top - 4 + iT;
//                      end
//                      else
//                      if Pos( 'bottom', cTmp ) > 0 then
//                      begin
//                         oLabel.Left   := TUniControl( tComp ).Left + TUniControl( tComp ).Width - iL;
//                         oLabel.Top    := TUniControl( tComp ).Top + TUniControl( tComp ).Height - 12 - iT;
//                      end;

                   end;
                   oLabel.Anchors := [akLeft];
                end;

                if ( tComp is TUniMemo ) Then
                begin

                   if Pos( 'focus-color:off' , TUniControl( TComponent( pForm ).Components[I] ).Hint ) = 0 then
                      TUniControl( TComponent( pForm ).Components[I] ).ClientEvents.ExtEvents.Values['afterrender'] :=
                         'function afterrender(sender, eOpts)'+
                         '{  sender.bodyEl.dom.addEventListener( ''keydown'', function(e) {if (e.key==''Enter'') {e.stopPropagation()}} ); }';
                end
                else
                if ( tComp is TUniDBMemo ) Then
                begin
                   if Pos( 'focus-color:off' , TUniControl( TComponent( pForm ).Components[I] ).Hint ) = 0 then
                      TUniControl( TComponent( pForm ).Components[I] ).ClientEvents.ExtEvents.Values['afterrender'] :=
                         'function afterrender(sender, eOpts)'+
                         '{  sender.bodyEl.dom.addEventListener( ''keydown'', function(e) {if (e.key==''Enter'') {e.stopPropagation()}} ); }';
                end;
                // v. 3.1.0.60
                if ( tComp is TUniComboBox ) OR
                   ( tComp is TUniDBComboBox ) OR
                   ( tComp is TUniDBLookupComboBox ) OR
                   ( tComp is TUniDateTimePicker ) OR
                   ( tComp is TUniDBDateTimePicker ) then
                begin
                     if ( tComp is TUniDateTimePicker ) then
                        //rc_AddCssClass( TUniDateTimePicker( tComp ), 'rc-form-text-trigger')
                     else
                     if ( tComp is TUniDBDateTimePicker ) then
                        //rc_AddCssClass( TUniDBDateTimePicker( tComp ), 'rc-form-text-trigger')
                     else
                        rc_AddCssClass( TUniComboBox( tComp ), 'rc-form-text');
                end;
             end;
          end;
       end;
     except on e:exception do
            begin
                 cTmp := '';
                 if tComp <> nil then
                    cTmp := tcomp.Name;

                 ShowMessage( 'rc_AdjustEditColorsExecute' + sLineBreak + sLineBreak +
                              'I=' + i.ToString + sLineBreak + sLineBreak +
                              'Obj:' + cTmp + sLineBreak + sLineBreak +
                              e.Message );
            end;
    end;
     //UniSession.ResumeLayouts();
end;
// v. 3.3.1.0
procedure rc_RenderControlsExecute(pForm: TObject; pMENU_COLOR : string; pOnlyThisObj : TUniControl ); // v. 4.0.0.0
var
   FieldValue, FieldValue1, FieldValue2 : Variant;

   cField, cParam1, cParam2, cTmp : string;

   iZoom, iPos, iPos2, iFont, iTemp, iMaxWidth, iWidth, iDelay,
   R, I, F : integer;

   vSR: TSearchRec;

   bDots,
   bAppend : boolean;
   bIconOff : boolean;
   cIconOpen, cIconClose, // v. 4.0.0.0
   cCmd, cLink,
   cHint, cHintDefault, cCaption, cIco, cAlign, cImgCls, // v. 3.3.1.0
   cTemp, cTemp2, cTemp3, cTemp4,

   cBorder,
   cBorderColor,
   cBorderRadius,
   cBorderRadius_TL,
   cBorderRadius_TR,
   cBorderRadius_BL,
   cBorderRadius_BR,
   cBorderShadow,
   cIcoPosition,  // v. 3.3.3.2
   cClass, cClassCaption, cClassIco,
   pTypeButton : string;

   pControl, pBlock : TUniControl;

   oBtn  : TUniSpeedButton;
   oEdit : TObject;

   oUrlFrm : TUniUrlFrame;
   oHtmlFrm : TUniHTMLFrame;
   oQrCodeImg : TUniImage; // v. 3.2.0.0
begin
     pControl := nil;
     //UniSession.SuspendLayouts();
     try
        if lowercase( TComponent( pForm ).Name ) = 'mainform' then
        begin
           if TUniControl( TComponent( pForm ).FindComponent('UniTreeMainMenu')) <> nil then
              TUniControl( TComponent( pForm ).FindComponent('UniTreeMainMenu')).Color := StringToColor( pMENU_COLOR );

           if TUniControl( TComponent( pForm ).FindComponent('paSearchTop')) <> nil then
              TUniControl( TComponent( pForm ).FindComponent('paSearchTop')).Color := StringToColor( pMENU_COLOR );


           if TUniControl( TComponent( pForm ).FindComponent('sboxGridBlock')) <> nil then
              TUniControl( TComponent( pForm ).FindComponent('sboxGridBlock')).Color := StringToColor( mm.CONFIG_LAYOUT_BG_COLOR );
           if TUniControl( TComponent( pForm ).FindComponent('paBS_Tabs')) <> nil then
              TUniControl( TComponent( pForm ).FindComponent('paBS_Tabs')).Color     := StringToColor( mm.CONFIG_LAYOUT_BG_COLOR );
        end;

        // criar componentes...
        for I := 0 to TComponent( pForm ).ComponentCount - 1 do
        begin
           cTemp  := '';
           cTemp2 := '';
           cTemp3 := '';
           cIco   := '';

           cClass        := '';
           cClassCaption := '';
           cClassIco     := '';
           cLink         := '';
           bAppend       := False;
           cCaption      := '';
           // v. 4.0.0.0
           if pOnlyThisObj = nil then
              pControl := TUniControl( TComponent( pForm ).Components[I] )
           else
              pControl := pOnlyThisObj;
           // v. 3.3.0.2
           If ( Pos( 'TAction' , pControl.ClassName ) = 0 ) and
              ( Pos( 'THelp' , pControl.ClassName ) = 0 ) then
           begin
             // v. 4.0.0.0
             If ( GetPropInfo( pControl.ClassInfo, 'Hint') <> nil ) then
             begin
                cHint    := rc_NormalizeHintProperty( TUniControl( pControl ).hint );
             //end;
                // v. 4.0.0.0
                rc_RenderPaginator( pForm, pControl, cHint, mm.CONFIG_LAYOUT_GRID_RC_PAGINATOR );

                cHintDefault := cHint;

                // bsToolTip
                if ( Pos( 'hint:' , cHint ) > 0 ) and
                   ( ( pControl is TUniControl ) ) then
                begin
                   cTemp    := Trim( rc_GetHintProperty( 'hint:', cHintDefault, true, true )); // Trim(Copy( cHintDefault, Pos( 'hint:' , cHintDefault ) + 5 , 200 ))  ;
                   // v. 3.3.2.0 - hint
                   //hint:Show / Hide Search Dialog title:Search Button
                   cCaption := '';
                   if Pos( 't:', cHintDefault ) > 0  then
                   begin
                        // v. 4.0.0.0
                        cCaption := ( rc_GetHintProperty( 't:', cHintDefault, true, false ) );
                        cTemp := StringReplace( cTemp, 't:' + cCaption, '', [rfReplaceAll] );
                   end
                   else
                       cCaption := 'default';
                   // v. 3.4.0.0

                   iWidth := 0;
                   if Pos( 'w:', cHintDefault ) > 0  then
                   begin
                        cClass := rc_GetHintProperty( 'w:', cHintDefault, true );
                        iWidth := StrToIntDef( cClass, 0 );
                        // v. 4.0.0.0
                        cTemp := StringReplace( cTemp, 'w:' + cClass, '', [rfReplaceAll] );
                   end;
                   iDelay := 0;
                   if Pos( 'd:', cHintDefault ) > 0  then
                   begin
                        cClass := rc_GetHintProperty( 'd:', cHintDefault, true );
                        iDelay := StrToIntDef( cClass, 0 );
                        // v. 4.0.0.0
                        cTemp := StringReplace( cTemp, 'd:' + cClass, '', [rfReplaceAll] );
                   end;

                   cAlign        := '';
                   if Pos( 'a:', cHintDefault ) > 0  then
                   begin
                        cAlign := rc_GetHintProperty( 'a:', cHintDefault, true );
                        // v. 4.0.0.0
                        cTemp := StringReplace( cTemp, 'a:' + cAlign, '', [rfReplaceAll] );
                   end;
                   if Pos( 'c:', cHintDefault ) > 0  then
                   begin
                        cClass := rc_GetHintProperty( 'c:', cHintDefault, true, false ); // v. 3.4.0.0
                        // v. 4.0.0.0
                        cTemp := StringReplace( cTemp, 'c:' + cClass, '', [rfReplaceAll] );
                   end
                   else
                     cClass := '';

                   // v. 3.4.0.0
                   //if cClass = '' then
                   begin
                      if ( Pos( 'default', cClass ) = 0 ) and ( Pos( StringReplace( cClass, '-light', '', [rfReplaceAll] ) , 'gray success info warning danger' ) > 0 ) then
                      begin
                         if Pos( '-light', cClass ) > 0 then
                            cClass := 'rc-tip-' + cClass + ' rc-tip-title-' + cClass + ' rc-tip-text-' + cClass
                         else
                         if Pos( 'gray', cClass ) > 0 then
                            cClass := 'rc-tip-' + cClass
                         else
                            cClass := 'rc-tip-' + cClass + ' rc-tip-text-black';
                      end;
                   end;
                   // v. 4.0.0.0
   //                cTemp := StringReplace( cTemp, 't:' + cCaption, '', [rfReplaceAll] );
   //                cTemp := StringReplace( cTemp, 'c:' + cClass, '', [rfReplaceAll] );
   //                cTemp := StringReplace( cTemp, 'w:' + iwidth.ToString, '', [rfReplaceAll] );
   //                cTemp := StringReplace( cTemp, 'd:' + iDelay.ToString, '', [rfReplaceAll] );
                   // v. 4.0.0.0
                   If ( GetPropInfo( pControl.ClassInfo, 'RTL') <> nil ) then
                      pControl.RTL := mm.RTL;

                   //hint:Show / Hide Search Dialog title:Search Button
                   TUniControl( pControl ).ClientEvents.ExtEvents.Values['afterrender'] :=
                      'function afterrender(sender, eOpts){'+
                         'Ext.create(''Ext.tip.ToolTip'','+
                         '{  target: sender.getEl(), ' +
                         '   trackMouse: true,'+ // v. 3.3.1.0
                         //'   id : ' + QuotedStr('tooltip-' + TUniControl( pControl ).Name ) + ',' +
                         //'   anchor : ''top'',' + // não consegui ajustar a cor corretamente...fica para uma prox. versão
   //                      'closable: true, ' +
   //                      'align: ''tl'',' +
   //                      'focusOnToFront: true, ' +
   //                      'autoHide: true, ' +
   //                      'autoShow: true, ' +
   //                      'autoScroll: true, ' +
                         //varIIF( cAlign   <> '', ' align: ''' + cAlign + ''',' , '' ) +
                         varIIF( iWidth    > 0 , ' width: ' + iWidth.ToString + ', ' , '' ) + //  + ( Length( cTemp ) * 10 ).ToString + ',' +
                         varIIF( cCaption <> '', ' title: ''' + cCaption + ''',' , '' ) +
                         varIIF( cClass   <> '', ' cls: ''' + cClass + ''',' , '' ) +
                         varIIF( iDelay    > 0 , ' dismissDelay: ' + iDelay.ToString + ', ' , '' ) +
                         '   html: " ' + cTemp + '"})}' ;

                   cTemp := '';
                end;

                pTypeButton   := '';
                bAppend       := false;
                cClass        := '';
                cClassCaption := '';
                cClassIco     := '';
                cLink         := '';
                cCaption      := '';
                // v. 4.0.0.0
                if ( pControl is TUniContainerPanel ) or
                   ( pControl is TUniPanel ) or
                   ( pControl is TUniSimplePanel ) then
                begin
                   // adiciona animacao aos blocos
                   cTemp2 := rc_GetHintProperty( 'cols:' , cHint );

                   If ( cTemp2 <> '' ) and
                      ( Pos( 'animate:off', cHint ) = 0 ) and
                      ( Pos( ' rc-anim-block-resize', cHint ) = 0 ) and
                      ( mm.CONFIG_LAYOUT_GRIDBLOCK_ANIM = 'ON' ) then
                   begin
                       pBlock         := TUniControl( pControl );
                       if ( Pos( 'fade:off', cHint ) > 0 ) then
                          pBlock.Hint    := rc_SetHintProperty( ' rc-anim-block-resize', 'cls:', cHint, True )
                       else
                          pBlock.Hint    := rc_SetHintProperty( ' rc-anim-block-resize rc-fade-in', 'cls:', cHint, True );
                   end;
                   // PDF
                   cTemp2 := rc_GetHintProperty( 'pdf:' , cHint );
                   If cTemp2 <> '' then
                   begin
                       pBlock         := TUniControl( pControl );
                       oUrlFrm        := TUniURLFrame( TComponent(pForm).FindComponent( 'rcPdfViewer_' + pBlock.Name ) );
                       // v. 3.3.0.0
                       //if oUrlFrm <> nil then
                       //   TUniURLFrame( TComponent(pForm).FindComponent( 'rcPdfViewer_' + pBlock.Name ) ).Free;

                       if oUrlFrm = nil then
                       begin
                          oUrlFrm        := TUniURLFrame.Create( TComponent(pForm) );
                          oUrlFrm.Parent := pBlock;
                          oUrlFrm.Name   := 'rcPdfViewer_' + pBlock.Name;
                       end;

                       if oUrlFrm <> nil then
                       begin
                          oUrlFrm.Left   := 0;
                          oUrlFrm.Top    := 0;
                          oUrlFrm.Height := pBlock.Height;
                          oUrlFrm.Width  := pBlock.Width;

                          // se estiver dentro de um bloco 'responsivo'...
                          oUrlFrm.Anchors:= [ akTop, akLeft, akRight, akBottom];
                          oUrlFrm.URL    := cTemp2;
                       end;
                   end;
                   // VIDEO
                   cTemp2 := rc_GetHintProperty( 'video:' , cHint );
                   If cTemp2 <> '' then
                   begin
                       pBlock         := TUniControl( pControl );
                       oHtmlFrm       := TUniHTMLFrame( TComponent(pForm).FindComponent( 'rcVideoViewer_' + pBlock.Name ) );
                       // v. 3.3.0.0
                       //if oHtmlFrm <> nil then
                       //   TUniHTMLFrame( TComponent(pForm).FindComponent( 'rcVideoViewer_' + pBlock.Name ) ).Free;
                       // v. 3.3.0.0
                       if oHtmlFrm = nil then
                       begin
                          oHtmlFrm        := TUniHTMLFrame.Create( TComponent(pForm) );
                          oHtmlFrm.Parent := pBlock;
                          oHtmlFrm.Name   := 'rcVideoViewer_' + pBlock.Name;
                       end;
                       // v. 3.3.0.0
                       if oHtmlFrm <> nil then
                       begin
                          oHtmlFrm.Hint   := '[[bsvideo:' + cTemp2 + '|center:parent x]]';
                          // se estiver dentro de um bloco 'responsivo'...
                          oHtmlFrm.Anchors:= [ akTop, akLeft];
                          oHtmlFrm.Left   := 0;
                          oHtmlFrm.Top    := 0;
                       end;
                   end;
                   // v. 3.2.0.2
                   // QR CODE
                   cTemp2 := rc_GetHintProperty( 'qrcode:' , cHint );
                   If cTemp2 <> '' then
                   begin
                       pBlock         := TUniControl( pControl );
                       oQrCodeImg     := TUniImage( TComponent(pForm).FindComponent( 'rcQrCode_' + pBlock.Name ) );
                       // v. 3.3.0.0
                       //if oQrCodeImg <> nil then
                       //begin
                           //FreeAndNil ( TUniImage( TComponent(pForm).FindComponent( 'rcQrCode_' + pBlock.Name ) ) );
                       //end;

                       if oQrCodeImg = nil then
                       begin
                          oQrCodeImg        := TUniImage.Create( TComponent(pForm) );
                          oQrCodeImg.Parent := pBlock;
                          oQrCodeImg.Name   := 'rcQrCode_' + pBlock.Name;
                          oQrCodeImg.Hint   := '[[center:parent xy]]';
                          oQrCodeImg.Stretch:= true;
                          oQrCodeImg.Proportional := true;
                       end;

                       if oQrCodeImg <> nil then
                       begin
                          oQrCodeImg.Left   := 0;
                          oQrCodeImg.Top    := 0;
                          oQrCodeImg.Height := pBlock.Height;
                          oQrCodeImg.Width  := pBlock.Width;

                          // se estiver dentro de um bloco 'responsivo'...
                          //oQrCodeImg.Anchors:= [ akTop, akLeft, akRight, akBottom];
                          rc_QRCode( oQrCodeImg, cTemp2 );
                       end;
                   end;
                   // IMG
                   cTemp2 := rc_GetHintProperty( 'img:' , cHint );
                   If cTemp2 <> '' then
                   begin
                       pBlock         := TUniControl( pControl );

                       oHtmlFrm       := TUniHTMLFrame( TComponent(pForm).FindComponent( 'rcImgViewer_' + pBlock.Name ) );
                       // v. 3.3.0.0
                       //if oHtmlFrm <> nil then
                       //   TUniHTMLFrame( TComponent(pForm).FindComponent( 'rcImgViewer_' + pBlock.Name ) ).Free;
                       // v. 3.3.0.0
                       if oHtmlFrm = nil then
                       begin
                          oHtmlFrm        := TUniHTMLFrame.Create( TComponent(pForm) );
                          oHtmlFrm.Parent := pBlock;
                          oHtmlFrm.Name   := 'rcImgViewer_' + pBlock.Name;
                          //oHtmlFrm.Hint   := '[[bsimg:' + cTemp2 + '|center:parent xy]]';
                       end;
                       // v. 3.3.1.0
                       if oHtmlFrm <> nil then
                       begin
                          cImgCls := rc_GetHintProperty( 'img-cls:', cHint );
                          if not cImgCls.IsEmpty then
                             cImgCls := '|img-cls:' + cImgCls;
                          oHtmlFrm.Hint   := '[[bsimg:' + cTemp2 + '|center:parent xy' + cImgCls + ']]';
                          oHtmlFrm.Left   := 0;
                          oHtmlFrm.Top    := 0;
                          oHtmlFrm.Height := pBlock.Height;
                          oHtmlFrm.Width  := pBlock.Width;

                          // se estiver dentro de um bloco 'responsivo'...
                          oHtmlFrm.Anchors:= [ akTop, akLeft, akRight, akBottom];
                       end;
                   end;
                   // CAROUSEL
                   // v. 3.3.0.0
                   cTemp2 := rc_GetHintProperty( 'carousel:' , cHint );
                   If cTemp2 <> '' then
                   begin
                       pBlock         := TUniControl( pControl );
                       oHtmlFrm       := TUniHTMLFrame( TComponent(pForm).FindComponent( 'rcCarouselViewer_' + pBlock.Name ) );
                       // v. 3.3.0.0
                       // feedback FABIO OLIVEIRA
                       //if oHtmlFrm <> nil then
                       //   TUniHTMLFrame( TComponent(pForm).FindComponent( 'rcCarouselViewer_' + pBlock.Name ) ).Free;
                       // v. 3.3.0.0
                       if oHtmlFrm = nil then
                       begin
                          oHtmlFrm        := TUniHTMLFrame.Create( TComponent(pForm) );
                          oHtmlFrm.Parent := pBlock;
                          oHtmlFrm.Name   := 'rcCarouselViewer_' + pBlock.Name;
                       end;
                       // v. 3.3.0.0
                       if oHtmlFrm <> nil then
                       begin
                          // imagens
                          cTemp  := cHint;
                          cTemp3 := '';
                          repeat
                                cTemp3 := cTemp3 + 'bscarousel:' + cTemp2 + '|';

                                cTemp := StringReplace( cTemp, 'carousel:' + cTemp2, '', [rfReplaceAll] ) + ' ';

                                cTemp2 := rc_GetHintProperty( 'carousel:' , cTemp );
                          until cTemp2 = '' ;

                          cTemp4 := StringReplace( cTemp3, 'bscarousel:', '', [rfReplaceAll] );
                          cTemp4 := StringReplace( cTemp4, '|', '', [rfReplaceAll] );
                          // Informou uma pasta ou arquivos( .png, .jpg ... ) ?
                          if Pos( '.', cTemp4 ) = 0 then
                          begin
                             cTemp3 := '';
                             R := FindFirst( cTemp4 + BACKSLASH + '*.*' , faAnyFile, vSR );
                             while R = 0 do
                             begin
                               if ( Pos( '.jpg', vSR.Name ) > 0 ) or
                                  ( Pos( '.png', vSR.Name ) > 0 ) or
                                  ( Pos( '.bmp', vSR.Name ) > 0 ) then
                                  cTemp3 := cTemp3 + 'bscarousel:' + cTemp4 + '/' + vSR.Name + '|';

                               R := FindNext( vSR );
                             end;
                             FindClose(vSR);
                          end;

                          oHtmlFrm.Hint   := '[[' + cTemp3 + 'center:parent xy]]';
                          oHtmlFrm.Left   := 0;
                          oHtmlFrm.Top    := 0;
                          oHtmlFrm.Height := pBlock.Height;
                          oHtmlFrm.Width  := pBlock.Width;

                          // se estiver dentro de um bloco 'responsivo'...
                          oHtmlFrm.Anchors:= [ akTop, akLeft, akRight, akBottom];
                       end;
                   end;

                   cTemp2 := '';
                   cTemp3 := '';
                end
                else
                if ( pControl is TUniEdit ) or
                   ( pControl is TUniDBEdit ) then
                begin
                   // feedback Mohamed Ammar( testing... )
                   //TUniControl( pControl ).RTL := mm.RTL;
                   //if ( pControl is TUniDBEdit ) then
                   //begin
                   //   TUniDBEdit( pControl ).UseFieldAlignment := not mm.RTL;
                   //end;

                   if rc_PosHintProperty( 'link:' , cHint ) > 0 then
                   begin
                      cLink := rc_GetHintProperty( 'link:' , cHint );
                      oEdit := pControl;
                      oBtn  := TUniSpeedButton( TComponent(pForm).FindComponent( 'rcBtnLink_' + TUniControl( oEdit ).Name ) );
                      // v. 3.3.0.0
                      if oBtn = nil then
                      begin
                         oBtn              := TUniSpeedButton.Create( TComponent(pForm) );
                         oBtn.Parent       := TUniControl( oEdit ).Parent;
                         oBtn.Name         := 'rcBtnLink_' + TUniControl( oEdit ).Name;

                         // se estiver dentro de um bloco 'responsivo'...
                         if Pos( 'rcblock', lowercase( oBtn.Parent.Name ) ) > 0 then
                            oBtn.Anchors   := [akTop,akRight];

                         TUniControl( oEdit ).Width := TUniControl( oEdit ).Width - 27;
                         // v. 3.4.0.0
                         oHtmlFrm := TUniHTMLFrame( TComponent(pForm).FindComponent('rc__Required' + TUniControl( oEdit ).Name) );
                         if oHtmlFrm <> nil then
                         begin
                            oHtmlFrm.Left := oHtmlFrm.Left - 27;
                         end;
                         oHtmlFrm := nil;
                      end;
                      // v. 3.3.0.0
                      if oBtn <> nil then
                      begin
                         oBtn.Hint         := '[[cls:ButtonThemeCrud | ico:fas-link | link:' + cLink + ']]';
                         TUniControl( oBtn ).TabStop:= false; // v. 3.2.0.7
                         TUniControl( oBtn ).Left   := TUniControl( oEdit ).Left + TUniControl( oEdit ).Width + 2;
                         TUniControl( oBtn ).Top    := TUniControl( oEdit ).Top ;
                         TUniControl( oBtn ).Height := TUniControl( oEdit ).Height;
                         TUniControl( oBtn ).Width  := 25;
                      end;
                   end;

                   if ( rc_PosHintProperty( 'dial:' , cHint ) > 0 ) then
                   begin
                      cLink := rc_GetHintProperty( 'dial:' , cHint );
                      oEdit := pControl;
                      oBtn  := TUniSpeedButton( TComponent(pForm).FindComponent( 'rcBtnPhone_' + TUniControl( oEdit ).Name ) );
                      // v. 3.3.0.0
                      if oBtn = nil then
                      begin
                         oBtn              := TUniSpeedButton.Create( TComponent(pForm) );
                         oBtn.Parent       := TUniControl( oEdit ).Parent;
                         oBtn.Name         := 'rcBtnPhone_' + TUniControl( oEdit ).Name;
                         // se estiver dentro de um bloco 'responsivo'...
                         if Pos( 'rcblock', lowercase( oBtn.Parent.Name ) ) > 0 then
                            oBtn.Anchors   := [akTop,akRight];

                         TUniControl( oEdit ).Width := TUniControl( oEdit ).Width - 27;
                         // v. 3.4.0.0
                         oHtmlFrm := TUniHTMLFrame( TComponent(pForm).FindComponent('rc__Required' + TUniControl( oEdit ).Name) );
                         if oHtmlFrm <> nil then
                         begin
                            oHtmlFrm.Left := oHtmlFrm.Left - 27;
                         end;
                         oHtmlFrm := nil;
                      end;
                      // v. 3.3.0.0
                      if oBtn <> nil then
                      begin
                         oBtn.Hint         := '[[cls:ButtonThemeCrud | ico:fas-phone | dial:' + cLink + ']]';
                         TUniControl( oBtn ).TabStop:= false; // v. 3.2.0.7
                         TUniControl( oBtn ).Left   := TUniControl( oEdit ).Left + TUniControl( oEdit ).Width + 2;
                         TUniControl( oBtn ).Top    := TUniControl( oEdit ).Top ;
                         TUniControl( oBtn ).Height := TUniControl( oEdit ).Height;
                         TUniControl( oBtn ).Width  := 25;
                      end;
                   end;

                   // in development
                   if ( rc_PosHintProperty( 'mail:' , cHint ) > 0 ) then
                   begin
                      cLink := rc_GetHintProperty( 'mail:' , cHint );
                      oEdit := pControl;
                      oBtn  := TUniSpeedButton( TComponent(pForm).FindComponent( 'rcBtnEmail_' + TUniControl( oEdit ).Name ) );
                      // v. 3.3.0.0
                      if oBtn = nil then
                      begin
                         oBtn              := TUniSpeedButton.Create( TComponent(pForm) );
                         oBtn.Parent       := TUniControl( oEdit ).Parent;
                         oBtn.Name         := 'rcBtnEmail_' + TUniControl( oEdit ).Name;
                         // se estiver dentro de um bloco 'responsivo'...
                         if Pos( 'rcblock', lowercase( oBtn.Parent.Name ) ) > 0 then
                            oBtn.Anchors   := [akTop,akRight];

                         TUniControl( oEdit ).Width := TUniControl( oEdit ).Width - 27;
                         // v. 3.4.0.0
                         oHtmlFrm := TUniHTMLFrame( TComponent(pForm).FindComponent('rc__Required' + TUniControl( oEdit ).Name) );
                         if oHtmlFrm <> nil then
                         begin
                            oHtmlFrm.Left := oHtmlFrm.Left - 27;
                         end;
                         oHtmlFrm := nil;
                         //TUniButton( oBtn ).OnClick := dm_rc.DynamicOnClickMail;
                      end;
                      // v. 3.3.0.0
                      if oBtn <> nil then
                      begin
                         oBtn.Hint         := '[[cls:ButtonThemeCrud | ico:fas-envelope | mail:' + cLink + ']]';
                         TUniControl( oBtn ).TabStop:= false; // v. 3.2.0.7
                         TUniControl( oBtn ).Left   := TUniControl( oEdit ).Left + TUniControl( oEdit ).Width + 2;
                         TUniControl( oBtn ).Top    := TUniControl( oEdit ).Top ;
                         TUniControl( oBtn ).Height := TUniControl( oEdit ).Height;
                         TUniControl( oBtn ).Width  := 25;
                      end;
                   end;

                   // v. 3.1.0.63
   //                cTemp := rc_GetHintProperty( 'mask:', TUniControl( TComponent(pForm).Components[I] ).hint ) ;
   //                if cTemp <> '' then
   //                begin
   //                   TUniEdit( TComponent(pForm).Components[I] ).InputType := 'text';
   //                   if ( cTemp = 'date' ) or ( cTemp = 'cep' ) or ( cTemp = 'cpf' ) or ( cTemp = 'cnpj' ) then
   //                      TUniEdit( TComponent(pForm).Components[I] ).InputType := 'number'
   //                   else
   //                   if ( cTemp = 'phoneddd' ) or ( cTemp = 'phone' ) then
   //                      TUniEdit( TComponent(pForm).Components[I] ).InputType := 'tel'
   //                   else
   //                      TUniEdit( TComponent(pForm).Components[I] ).InputType := 'text';
   //                end;
                end
                else
                if ( pControl is TUniHTMLFrame ) then
                begin
                   // QRCODE - bug fix to solve...
   //                cTemp2 := rc_GetHintProperty( 'qrcode:' , cHint );
   //                If cTemp2 <> '' then
   //                begin
   //                     oHtmlFrm := TUniHTMLFrame( pControl );
   //                     oHtmlFrm.HTML.Text := '<div class="rc-qrcode">' +
   //                                           '  <div class="rc-qrcode" id="' + oHtmlFrm.JSId + '"></div>' +
   //                                           '</div>';
   //                end;
                end;
             end;
           end;
           // v. 4.0.0.0
           if pOnlyThisObj <> nil then
              Break;
        end;

        for I := 0 to TComponent( pForm ).ComponentCount - 1 do
        begin
           cTemp  := '';
           cTemp2 := '';
           cTemp3 := '';
           cIco   := '';

           cClass        := '';
           cClassCaption := '';
           cClassIco     := '';
           cLink         := '';
           bAppend       := False;
           cCaption      := '';
           // v. 4.0.0.0
           if pOnlyThisObj = nil then
              pControl := TUniControl( TComponent( pForm ).Components[I] )
           else
              pControl := pOnlyThisObj;
           // v. 3.3.0.2
           If ( Pos( 'TAction' , pControl.ClassName ) = 0 ) and
              ( Pos( 'THelp' , pControl.ClassName ) = 0 ) then
           begin
             If ( GetPropInfo( pControl.ClassInfo, 'Hint') <> nil ) then
             begin
                // v. 3.3.3.0
                cTemp := rc_GetHintProperty( 'collapse:', pControl.Hint );
                // v. 4.0.0.0
                cIconOpen  := 'fas-angle-down';
                cIconClose := 'fas-angle-up';
                if cTemp <> '' then
                begin
                    bIconOff      := Pos( 'icons:off', pControl.Hint ) > 0;                    
                    if bIconOff then
                    begin
                       if Pos( 'cls:rc-cursor-pointer ', pControl.Hint ) = 0 then
                       begin
                          pControl.Hint := StringReplace( pControl.Hint, 'cls:', 'cls:rc-cursor-pointer ' , [rfReplaceAll] );
                       end
                       else
                       if Pos( 'cls:', pControl.Hint ) = 0 then
                          pControl.Hint := rc_AddHintProperty( '|cls:rc-cursor-pointer|', pControl.Hint, false );
                    end;
                    if Pos( 'icons:', pControl.Hint ) > 0 then
                    begin
                       cIconOpen     := rc_GetHintProperty( 'icons:', pControl.Hint ) ;
                       cIconClose    := trim( Copy( cIconOpen, pos( ' ', cIconOpen ) ) );
                       cIconOpen     := Copy( cIconOpen, 1, pos( ' ', cIconOpen ) - 1 );
                    end;
                end;

                if ( ( cTemp <> '' ) and ( pos( 'ico:', pControl.Hint ) = 0 ) and ( pos( 'cls:', pControl.Hint ) = 0 ) ) then
                begin
                     pBlock := TUniControl( TComponent( pForm ).FindComponent( Copy( cTemp, 1, Pos( ' ', cTemp ) - 1 ) ) );
                     //cTemp2 := 'ico:fas-angle-down';

//                     pControl.Hint := rc_AddHintProperty( '|cls:color-black rc-font-size-16 ' +
//                                                          'rc-cursor-pointer|' +
//                                                          cTemp2, pControl.Hint, false ); // v. 3.3.3.0
                     cTemp3 := rc_GetHintProperty( 'collapsed', cTemp, true, true );
                     // v. 3.3.3.0
                     if ( Pos( ' collapsed' , cTemp ) > 0 ) and
                        ( ( ( cTemp3 <> '' ) and ( mm.varB_Mobile_Screen ) ) or
                          ( ( cTemp3 = '' ) and ( not mm.varB_Mobile_Screen ) ) ) then
                     begin
                        if ( pBlock <> nil ) then
                        begin
                           cTemp3 := rc_GetHintProperty( 'hr-childs:', pBlock.Hint, false, true );
                           if Pos( 'off-', cTemp ) > 0 then
                              r := StrToIntDef ( ReturnNumbers( rc_GetHintProperty( 'off-', cTemp, true ) ) , 0 );

                           cTemp2 := rc_GetHintProperty( 'expanded-', cTemp3, true );
                           if Pos( 'expanded-', cTemp3 ) = 0 then
                           begin
                              pBlock.Hint := rc_SetHintProperty( ' expanded-' + r.ToString, 'hr-childs:' , pBlock.Hint, true );
                              //rc_AddCssClass( pControl, 'rc-rotate-180' );
                              // v. 4.0.0.0
                              //pControl.caption := StringReplace( pControl.caption, '-angle-up', '-angle-down' , [rfReplaceAll] );
                              pControl.Hint := rc_AddHintProperty( '|cls:color-black rc-font-size-16 ' +
                                                                   'rc-cursor-pointer|' +
                                                                   'ico:' + cIconOpen, pControl.Hint, false );
                           end
                           else
                           begin
                              pBlock.Hint := StringReplace( pBlock.Hint, ' expanded-' + cTemp2, '', [rfReplaceAll] );
                              //rc_RemoveCssClass( pControl, 'rc-transform-rotate-180' );//'rc-rotate-90' );
                              //rc_RemoveCssClass( pControl, 'rc-rotate-180' );
                              // v. 4.0.0.0
                              //pControl.caption := StringReplace( pControl.caption, '-angle-down', '-angle-up' , [rfReplaceAll] );
                              pControl.Hint := rc_AddHintProperty( '|cls:color-black rc-font-size-16 ' +
                                                                   'rc-cursor-pointer|' +
                                                                   'ico:' + cIconClose, pControl.Hint, false );

                           end;
                        end;
                     end
                     else
                        pControl.Hint := rc_AddHintProperty( '|cls:color-black rc-font-size-16 ' +
                                                             'rc-cursor-pointer|' +
                                                             'ico:' + cIconClose, pControl.Hint, false );
                end;
                if ( cTemp <> '' ) then
                   TUniLabel(pControl).OnClick := dm_rc.DynamicCollapse;

                cTemp  := '';
                cTemp2 := '';
                cTemp3 := '';
                r      := 0;
                cHint  := rc_NormalizeHintProperty( TUniControl( pControl ).hint );
             end;

             If ( pControl is TUniScrollBox ) then
             begin
                  // v. 3.2.0.7
                  If TComponent( pForm ) is TUniForm then
                     If GetPropInfo( TUniScrollBox( pControl ).ClassInfo, 'RetainInitialOffsets') <> nil then
                        TUniScrollBox( pControl ).RetainInitialOffsets := True;

                  TUniScrollBox( pControl ).ScrollTo(0,0);
                  TUniScrollBox( pControl ).DoAlignControls;
             end;

             If ( pControl is TUniEdit ) then
             begin
                 if ( rc_PosHintProperty( 'cls:', cHint ) > 0 ) then
                 begin
                      cClass := rc_GetHintProperty( 'cls:' , cHint );
                 end;

                 if cClass <> '' then
                    TUniControl( pControl ).JSInterface.JSCall( 'addCls' , [ cClass ]);

                 cClass := '';
             end
             else
             If ( pControl is TUniLabel ) then
             begin
                   //[[ico:fas-envelope | cls-ico:align-label-left-center | cls-caption:badge bg-warning | append]]
                   // [[cls:ButtonThemeCrud | ico:fas-angle-left 2x]]
                   //                         ico:fas-angle-left append]]
                   //                         ico:fas-angle-left cls-ico:font-black]]

                  TUniLabel( pControl ).TextConversion := txtHTML; // v. 4.0.0.0
                  cTemp2 := '';
                  cTemp3 := '';
                  if Trim( cHint ) <> '' then
                  cTemp2 := cHint + '|';

                  cCmd := cTemp2;

                  bAppend := false;

                  iPos2 := Pos( '|' , cTemp2 );
                  if cTemp2 <> '' then
                  begin
                     cTemp  := Trim( Copy( cCmd, 1 , iPos2 ) );
                     cTemp2 := Trim( StringReplace( cCmd, cTemp, '', [rfReplaceAll] ) );

                     cCmd := cTemp2;

                     cTemp  := StringReplace( cTemp, '|', '', [rfReplaceAll] ) + ' ';

                     cTemp := cHint;

                     // append caption if exists
                     if not bAppend then
                        bAppend := rc_PosHintProperty( 'append', cCmd ) > 0;

                     if rc_PosHintProperty( 'label-wrap:', cTemp ) > 0 then
                     begin
                          rc_AddCssClass( pControl, 'rc-label-wrap' );
                     end;

                     if ( rc_PosHintProperty( 'ico:', cTemp ) > 0 ) and ( rc_PosHintProperty( 'cls-ico:', cTemp ) > 0 ) then
                     begin
                          cClass := '';
                          cClassCaption := '';
                          cClassIco := '';
                          cIco := rc_GetHintProperty( 'ico:' , cTemp );
                     end;

                     if ( rc_PosHintProperty( 'cls:', cTemp ) > 0 ) then
                     begin
                          cClass := rc_GetHintProperty( 'cls:' , cTemp );
                          cClassCaption := cClass;
                     end;

                     if ( rc_PosHintProperty( 'cls-ico:', cTemp ) > 0 ) then
                     begin
                          cClass := rc_GetHintProperty( 'cls-ico:' , cTemp );
                     end;

                     if ( rc_PosHintProperty( 'ico:', cTemp ) > 0 ) then
                     begin
                          cIco := rc_GetHintProperty( 'ico:' , cTemp );
                     end;
                     // v. 3.3.0.2
                     if ( Pos( 'ico:' , cTemp ) > 0 ) then
                     begin
                          cIco := rc_GetHintProperty( 'ico:' , cTemp );
                          if ( Pos( 'rtl:', cIco ) > 0 ) then
                          begin
                               cParam1 := rc_GetHintProperty( 'rtl:' , cIco );
                               if ( mm.rtl ) then
                               begin
                                  if cParam1 <> '' then
                                  begin
                                     rc_AddCssClass( TUniLabel( pControl ), cParam1 );
                                  end;
                               end;
                               cIco := trim( StringReplace( cIco, 'rtl:' + cParam1, '', [rfReplaceAll] ) );
                          end;
                     end;
                     // v. 3.3.0.0
                     if ( rc_PosHintProperty( 'field-ico:', cTemp ) > 0 ) then
                     begin
                          cTmp := rc_GetHintProperty( 'field-ico:' , cTemp );
                          // v. 3.3.1.0
                          if Pos( ' ds:', cTmp ) > 0 then
                             cTmp := Copy( cTmp, 1, Pos( ' ds:', cTmp ) - 1 );

                          cField     := Copy( cTmp, 1, Pos( ' ', cTmp ) -1 );
                          //FieldValue := pDS.DataSet.FieldByName( cField ).Value;
                          cTmp       := Copy( cTmp, Pos( ' ', cTmp ) + 1, 2000 );

                          FieldValue1 := Copy( cTmp, 1, Pos( ' ', cTmp ) -1 );
                          cTmp        := Copy( cTmp, Pos( ' ', cTmp ) + 1, 2000 );
                          FieldValue1 := Copy( FieldValue1, 7, 2000 );
                          cParam1     := Trim( Copy( FieldValue1, Pos( ':', FieldValue1 ) +1, 2000 ) );
                          FieldValue1 := Copy( FieldValue1, 1, Pos( ':', FieldValue1 ) -1 );
                          cIco        := cParam1;
                     end;

                     if ( rc_PosHintProperty( 'cls-caption:', cTemp ) > 0 ) then
                     begin
                          cClassCaption := cClass + ' ' + rc_GetHintProperty( 'cls-caption:' , cTemp );

                     end;

                     if ( rc_PosHintProperty( 'label-link:', cTemp ) > 0 ) or ( rc_PosHintProperty( 'link:', cTemp ) > 0 ) then
                     begin
                          cLink := rc_GetHintProperty( 'label-link:' , cTemp );
                          if cLink = '' then
                             cLink := rc_GetHintProperty( 'link:' , cTemp );

                          TUniLabel( pControl ).Font.Color := StringToColor( mm.CONFIG_LAYOUT_LINK_COLOR );
                          TUniLabel( pControl ).TextConversion := txtHTML;
                          TUniLabel( pControl ).Caption :=
                            '<a href="' + cLink + '" target="_blank" ' +
                            'onmouseover="this.style.color=''' + ColorToHtml( StringToColor( mm.CONFIG_LAYOUT_LINKHOVER_COLOR ))  + ''';this.style.textDecoration=''none'';" onmouseout="this.style.color=''' + ColorToHtml( TUniLabel( pControl ).Font.Color ) + ''';">' + TUniLabel( pControl ).Caption + '</a>';
                     end;

                     iPos2 := Pos( '|' , cCmd );
                  end;

                  cTemp3 := rc_GetHintProperty( 'ico-stack:' , cHint, false ); // v. 3.4.0.0
                  if cTemp3 <> '' then
                  begin
                     // v. 4.0.0.0
                     cTemp := 'circle';
                     if Pos( 'type:', cTemp3 ) > 0 then
                     begin
                        cTemp := Copy( cTemp3, Pos( 'type:', cTemp3 ) + 5 ) + ' ';
                        cTemp := Copy( cTemp , 1, pos( ' ', cTemp )-1 );
                     end;
                     if Copy( cTemp3, 1, 3 ) = 'fas' then
                        cTemp3 := stringReplace( cTemp3, 'fas-', 'fa-', [rfReplaceAll] )
                     else
                     if Copy( cTemp3, 1, 3 ) = 'fas' then
                        cTemp3 := stringReplace( cTemp3, 'far-', 'fa-', [rfReplaceAll] )
                     else
                     if Copy( cTemp3, 1, 3 ) = 'fas' then
                        cTemp3 := stringReplace( cTemp3, 'fad-', 'fa-', [rfReplaceAll] )
                     else
                     if Copy( cTemp3, 1, 3 ) = 'fal' then
                        cTemp3 := stringReplace( cTemp3, 'fal-', 'fa-', [rfReplaceAll] );                     
                     // v. 3.4.0.1
                     cTemp2 := rc_GetHintProperty( 'cls:' , cHint, false );
                     if cTemp2 = '' then
                        cTemp2 := 'text-primary';
                     cTemp4 := rc_GetHintProperty( 'size:' , cHint, false );
                     if cTemp4 <> '' then
                        cTemp4 := 'fa-' + cTemp4;
                     // v. 3.4.0.1
                     TUniControl( pControl ).Caption :=
                         //'<span class="fa-stack fa-3x">' +
                         '<span class="fa-stack ' + cTemp4 + '">' +
                         '  <i class="fas fa-' + cTemp + ' fa-stack-2x ' + cTemp2 + '"></i>' +
                         '  <i class="fas ' + cTemp3 + ' fa-stack-1x fa-inverse"></i>' +
                         '</span>' ;
                  end
                  else
                  if Trim( cIco ) <> '' then
                  begin
                     (*
                     <i class="fa-light fa-copy"></i>
                     <i class="fa-regular fa-copy"></i>
                     <i class="fa-solid fa-copy"></i>
                     <i class="fa-thin fa-copy"></i>
                     <i class="fa-duotone fa-copy"></i>
                     *)
                     // icon type
                     cTemp3  := Copy( cIco , 1, Pos( '-' , cIco ) - 1 ) ;

                     if Copy( cTemp3, 1, 2 ) = 'fa' then
                        cTemp3 := cTemp3 + ' fa-'
                     else
                        cTemp3 := cTemp3 + ' picto-';

                     // icon name
                     cTemp2 := Copy( cIco , Pos( '-' , cIco ) + 1, 100 ) ;

                     // has a zoom ?( font awesome 2x...)
                     iZoom := 1;
                     for f := 1 to 4 do
                     begin
                     if ( Pos( ' ' + f.ToString + 'x' , cHint ) > 0 ) then
                        iZoom := StrToIntDef( ReturnNumbers( Copy( cHint, Pos( ' ' + f.ToString + 'x' , cHint ) , 3 ) ), 0 );
                     end;

                     if iZoom > 0 then
                        cTemp2 := StringReplace( cTemp2, iZoom.ToString + 'x' , '', [rfReplaceAll] );

                     iPos := rc_PosHintProperty( 'caption:' , cHint );

                     if ( bAppend ) and ( iPos = 0 ) then
                     begin
                        cCaption := TUniControl( pControl ).Caption;
                        TUniControl( pControl ).Hint := rc_SetHintProperty( cCaption, 'caption:' ,  cHint  ) ;
                        cHint := rc_NormalizeHintProperty( TUniControl( pControl ).Hint );
                     end
                     else
                     if iPos > 0 then
                     begin
                        cCaption := rc_GetHintProperty( 'caption:' ,  cHint  );
                     end;

                     TUniControl( pControl ).Caption := '<i class="' + cClass + ' ' + cTemp3 + cTemp2 +
                                  varIIF( iZoom > 0 , ' fa-' + iZoom.ToString + 'x' , '' ) + '"></i>';

                     // append caption if exists
                     if bAppend then
                     begin
                        iPos := Pos( '|append' , cHint );
                        if iPos = 0 then
                           iPos := Pos( '| append' , cHint );

                        // hidden-caption
                        //
                        // mobile-v  : in MOBILE PORTRAIT MODE
                        // mobile-h  : in MOBILE LANDSCAPE MODE
                        // mobile    : in MOBILE MODE
                        //
                        if Pos( 'caption-hide:', cHint ) > 0 then
                        begin
                           cTemp3 := ( rc_GetHintProperty( 'caption-hide:', cHint ) );

                           if ( cTemp3 = 'mobile-v' ) and
                              ( mm.varB_Mobile_Screen_Portrait ) then
                              cCaption := ''
                           else
                           if ( cTemp3 = 'mobile-h' ) and
                              ( mm.varB_Mobile_Screen_Landscape ) then
                              cCaption := ''
                           else
                           if ( cTemp3 = 'mobile' ) and
                              ( mm.varB_Mobile_Screen ) then // v. 3.3.0.2
                              cCaption := '';
                        end;
                        // v. 4.0.0.0
                        if cCaption = '' then
                           rc_RemoveCssClass( TUniControl( pControl ), 'align-btn-caption' );

                        TUniControl( pControl ).Caption :=
                            TUniControl( pControl ).Caption +
                            '<span' + varIIF( cClassCaption <> '', ' class="' + Trim( cClassCaption ) + '"', '' ) + '>' + cCaption + '</span>' ;
                     end;
                  end
                  else
                  if cClass <> '' then
                  begin
                       rc_AddCssClass( pControl, cClass );
                  end;

                  // bsswt / bschk - Initial ON
                  cTemp := ReturnNumbers( Copy( cHint, Pos( 'bsswt' , cHint.ToLower ) , 7 ) );
                  iPos  := Pos( 'bsswt' , cHint.ToLower );

                  if ( iPos = 0 ) then
                  begin
                     cTemp := ReturnNumbers( Copy( cHint, Pos( 'bschk' , cHint.ToLower ) , 7 ) );
                     iPos  := Pos( 'bschk' , cHint.ToLower );
                  end;

                  if ( iPos > 0 ) and ( cTemp = '1' ) then
                  begin
                         TUniControl( pControl ).Tag := 1;
                  end;
             end;

             cHintDefault := cHint;

             pTypeButton   := '';
             bAppend       := false;
             cClass        := '';
             cClassCaption := '';
             cClassIco     := '';
             cLink         := '';
             cCaption      := '';

             if ( pControl is TUniBitBtn ) or
                ( pControl is TUniSpeedButton ) or
                ( pControl is TUniMenuButton ) or // v. 3.4.0.1
                ( pControl is TUniButton ) then
             begin
                  cTemp2 := '';
                  cTemp3 := '';
                  if Trim( cHint ) <> '' then
                  cTemp2 := cHint + '|';

                  cCmd := cTemp2;

                  iPos2 := Pos( '|' , cTemp2 );

                  if ( iPos2 > 0 ) then
                  begin
                     cTemp  := Trim( Copy( cCmd, 1 , iPos2 ) );
                     cTemp2 := Trim( StringReplace( cCmd, cTemp, '', [rfReplaceAll] ) );

                     cCmd := cTemp2;

                     cTemp  := StringReplace( cTemp, '|', '', [rfReplaceAll] ) + ' ';

                     cTemp := cHint;

                     // append caption if exists
                     if not bAppend then
                        bAppend := rc_PosHintProperty( 'append', cCmd ) > 0;

                     if Pos( ' up' , cTemp ) >0 then
                        cTemp := cTemp;
                     if ( rc_PosHintProperty( 'ico:', cTemp ) > 0 ) and ( rc_PosHintProperty( 'cls-ico:', cTemp ) > 0 ) then
                     begin
                          cClass := '';
                          cClassCaption := '';
                          cIco := rc_GetHintProperty( 'ico:' , cTemp );
                     end;

                     if ( Pos( 'cls:' , cTemp ) > 0 ) then
                     begin
                          cClass := rc_GetHintProperty( 'cls:' , cTemp );

                          cClassCaption := cClass;
                     end;

                     if ( Pos( 'cls-ico:' , cTemp ) > 0 ) then
                     begin
                          cClassIco := rc_GetHintProperty( 'cls-ico:' , cTemp );
                     end;
                     // v. 3.3.3.2
                     cIcoPosition := '';
                     if ( Pos( 'ico:' , cTemp ) > 0 ) then
                     begin
                          // v. 3.3.3.2
                          if ( Pos( 'ico-pos:' , cTemp ) > 0 ) then
                          begin
                               cIcoPosition := rc_GetHintProperty( 'ico-pos:' , cTemp );
                               // v. 3.4.0.0 rc-ico-pos
                               rc_AddCssClass( TUniButton( pControl ), 'rc-ico-pos' );
                          end;
                          cIco := rc_GetHintProperty( 'ico:' , cTemp ) + ' ';
                          cIco := Trim( cIco );
                          if ( Pos( 'rtl:', cIco ) > 0 ) then
                          begin
                               cParam1 := rc_GetHintProperty( 'rtl:' , cIco );
                               if ( mm.rtl ) then
                               begin
                                  if cParam1 <> '' then
                                  begin
                                     rc_AddCssClass( TUniButton( pControl ), cParam1 );
                                  end;
                               end;
                               cIco := trim( StringReplace( cIco, 'rtl:' + cParam1, '', [rfReplaceAll] ) );
                          end;
                     end;
                     // v. 3.3.0.0
                     cParam1 := '';
                     if ( rc_PosHintProperty( 'field-ico:', cTemp ) > 0 ) then
                     begin
                          cTmp := rc_GetHintProperty( 'field-ico:' , cTemp );
                          // v. 3.3.1.0
                          if Pos( ' ds:', cTmp ) > 0 then
                             cTmp := Copy( cTmp, 1, Pos( ' ds:', cTmp ) - 1 );

                          cField     := Copy( cTmp, 1, Pos( ' ', cTmp ) -1 );
                          //FieldValue := pDS.DataSet.FieldByName( cField ).Value;
                          cTmp       := Copy( cTmp, Pos( ' ', cTmp ) + 1, 2000 );

                          FieldValue1 := Copy( cTmp, 1, Pos( ' ', cTmp ) -1 );
                          cTmp        := Copy( cTmp, Pos( ' ', cTmp ) + 1, 2000 );
                          FieldValue1 := Copy( FieldValue1, 7, 2000 );
                          cParam1     := Trim( Copy( FieldValue1, Pos( ':', FieldValue1 ) +1, 2000 ) );
                          FieldValue1 := Copy( FieldValue1, 1, Pos( ':', FieldValue1 ) -1 );
                          cIco        := cParam1;
                     end;

                     if ( Pos( 'cls-caption:' , cTemp ) > 0 ) then
                     begin
                          cClassCaption := cClass + ' ' + rc_GetHintProperty( 'cls-caption:' , cTemp );
                     end
                     else
                         cClassCaption := '';

                     //link:
                     if ( rc_PosHintProperty( 'link:', cTemp ) > 0 ) then
                     begin
                          TUniButton( pControl ).OnClick := dm_rc.DynamicOnClickLink;
                     end
                     else
                     if ( rc_PosHintProperty( 'dial:', cTemp ) > 0 ) then
                     begin
                          TUniButton( pControl ).OnClick := dm_rc.DynamicOnClickDial;
                     end
                     else
                     if ( rc_PosHintProperty( 'mail:', cTemp ) > 0 ) then
                     begin
                          TUniButton( pControl ).OnClick := dm_rc.DynamicOnClickMail;
                     end;

                     iPos2 := Pos( '|' , cCmd );
                  end;

                  if trim(cIco) <> '' then
                  begin
                       // v. 3.3.0.2
                       //cTemp := Copy( cHint, Pos( 'ico:' , cHint ) + 4, 100 ) + '|';
                       //cTemp := Copy( cTemp, 1, Pos( '|' , cTemp ) - 1 ) ;
                       //cTemp := rc_GetHintProperty( 'ico:', cHint ) + '|';
                       //cTemp2 := Copy( cTemp, Pos( ' ' , cTemp ) + 1 , 100 ) ;
                       cTemp2 := Copy( cIco, Pos( ' ' , cIco ) + 1 , 100 ) ;

                       // has a zoom ?
                       iZoom := StrToIntDef( ReturnNumbers( cTemp2 ), 0 );
                       // icon type
                       //cTemp3  := Copy( cTemp , 1, Pos( '-' , cTemp ) - 1 ) ;
                       cTemp3  := Copy( cIco , 1, Pos( '-' , cIco ) - 1 ) ;
                       // v. 3.3.0.0
                       if ( cTemp3 = '' ) and ( cIco <> '' ) and ( cParam1 <> '' ) then
                       begin
                            cTemp3 := Copy( cIco, 1, Pos( '-', cIco ) -1 );
                       end;

                       if Copy( cTemp3, 1, 2 ) = 'fa' then
                          cTemp3 := cTemp3 + ' fa-'
                       else
                          cTemp3 := cTemp3 + ' picto-';

                       cTemp2   := TUniControl( pControl ).Caption;

                       TUniControl( pControl ).Caption := '<i class="' ;

                       // v. 3.3.0.2
                       if ( cParam1 = '' ) then
                       begin
//                          pTypeButton := Copy( cHint, Pos( 'ico:' , cHint ) + 4, 100 ) + '|';
//                          pTypeButton := Copy( pTypeButton, 1, Pos( '|' , pTypeButton ) - 1 );
//                          pTypeButton := 'fa-' + Copy( pTypeButton, Pos( ':' , pTypeButton ) + 1 , 100 ) ;
//                          pTypeButton := Copy( cTemp, Pos( '-', cTemp ) + 1, 100 ) + '|';
//                          pTypeButton := Copy( pTypeButton, 1, Pos( '|', pTypeButton ) - 1 ) ;
                            pTypeButton := Copy( cIco, Pos( '-', cIco ) + 1, 100 ) + ' ';
                            pTypeButton := Copy( pTypeButton, 1, Pos( ' ', pTypeButton ) - 1 );
                       end
                       else
                          pTypeButton := Copy( cParam1, Pos( '-', cParam1 ) + 1, 100 );

                       iPos := rc_PosHintProperty( 'caption:' , cHint );

                       if ( bAppend ) and ( iPos = 0 ) then
                       begin
                          cCaption := cTemp2;
                          TUniControl( pControl ).Hint := rc_SetHintProperty( cCaption, 'caption:' ,  cHint  ) ;
                          cHint := rc_NormalizeHintProperty( TUniControl( pControl ).Hint );
                       end
                       else
                       if iPos > 0 then
                       begin
                          cCaption := rc_GetHintProperty( 'caption:' ,  cHint  );
                       end;

                       // append caption if exists
                       if bAppend then
                       begin
                          TUniControl( pControl ).Caption := TUniControl( pControl ).Caption +
                                cTemp3 + pTypeButton + ' ' + varIIF( iZoom > 0 , 'fa-' + iZoom.ToString + 'x ' , 'fa-1x ' ) + cClassIco + '"></i>';


                          // caption-hide
                          //
                          // mobile-v  : in MOBILE PORTRAIT MODE
                          // mobile-h  : in MOBILE LANDSCAPE MODE
                          // mobile    : in MOBILE MODE
                          //
                          cTemp3 := ( rc_GetHintProperty( 'caption-hide:', cHint ) );

                          if cTemp3 <> '' then
                          begin
                             cTemp3 := ( rc_GetHintProperty( 'caption-hide:', cHint ) );

                             if ( cTemp3 = 'mobile-v' ) and
                                ( mm.varB_Mobile_Screen_Portrait ) then
                                cCaption := ''
                             else
                             if ( cTemp3 = 'mobile-h' ) and
                                ( mm.varB_Mobile_Screen_Landscape ) then
                                cCaption := ''
                             else
                             if ( cTemp3 = 'mobile' ) and
                                ( mm.varB_Mobile_Screen ) then // v. 3.3.0.2
                                cCaption := '';
                          end;
                          // v. 4.0.0.0
                          if cCaption <> '' then
                             cTemp4 := 'align-btn-caption'
                          else
                             cTemp4 := 'align-btn-caption-remove';
                          if cClassCaption = '' then
                          begin
                             if cIcoPosition = 'up' then
                                TUniControl( pControl ).Caption :=
                                    TUniControl( pControl ).Caption +
                                    '<br>' + '<span class="' + cTemp4 + '">'+ cCaption + '</span>'
                             else
                             if cIcoPosition = 'down' then
                                TUniControl( pControl ).Caption :=
                                    '<span class="' + cTemp4 + '">'+ cCaption + '</span>' + '<br>' +
                                    TUniControl( pControl ).Caption
                             else
                             if cIcoPosition = 'right' then
                                TUniControl( pControl ).Caption :=
                                    '<span class="' + cTemp4 + '">'+ cCaption + '</span>' + '  ' +
                                    TUniControl( pControl ).Caption
                             else
                                TUniControl( pControl ).Caption :=
                                    TUniControl( pControl ).Caption +
                                    '<span class="' + cTemp4 + '">'+ cCaption + '</span>';
                          end
                          else
                          begin
                             if cIcoPosition = 'up' then
                                TUniControl( pControl ).Caption :=
                                    TUniControl( pControl ).Caption +
                                    '<br>' + '<span' + varIIF( cClassCaption <> '', ' class="' + Trim( cClassCaption ) + '"', '' ) + '>'+ cCaption + '</span>'
                             else
                             if cIcoPosition = 'down' then
                                TUniControl( pControl ).Caption :=
                                    '<span' + varIIF( cClassCaption <> '', ' class="' + Trim( cClassCaption ) + '"', '' ) + '>'+ cCaption + '</span>' + '<br>' +
                                    TUniControl( pControl ).Caption
                             else
                             if cIcoPosition = 'right' then
                                TUniControl( pControl ).Caption :=
                                    '<span' + varIIF( cClassCaption <> '', ' class="' + Trim( cClassCaption ) + '"', '' ) + '>'+ cCaption + '</span>' + '  ' +
                                    TUniControl( pControl ).Caption
                             else
                                TUniControl( pControl ).Caption :=
                                    TUniControl( pControl ).Caption +
                                    '<span' + varIIF( cClassCaption <> '', ' class="' + Trim( cClassCaption ) + '"', '' ) + '>'+ cCaption + '</span>'
                          end;
                       end
                       else
                       begin
                          TUniControl( pControl ).Caption := TUniControl( pControl ).Caption +
                                cTemp3 + pTypeButton + ' ' + varIIF( iZoom > 0 , 'fa-' + iZoom.ToString + 'x ' , 'fa-1x ' ) + cClassIco + '"></i>';
                       end;
                  end;

                  pTypeButton := '';

                  if Pos( 'rcbtn_' , cHint ) > 0 then
                     pTypeButton := cHint
                  else
                  if ( Pos( '__' , TUniControl( pControl ).Caption ) > 0 ) then
                    pTypeButton := TUniControl( pControl ).Caption
                  else
                  if ( Pos( 'cls:' , cHint ) > 0 ) then
                  begin
                    pTypeButton := cHintDefault + '|';
                  end;

                  if pTypeButton <> '' then
                  begin
                       if Pos( 'rcbtn_' , cHint ) > 0 then
                          pTypeButton := Copy( cHintDefault, 7, 100 );

                       if ( Pos( '__' , pTypeButton ) > 0 ) then
                       begin
                          TUniControl( pControl ).Caption := Copy( pTypeButton , 1, Pos( '__' , pTypeButton ) - 1 );
                          pTypeButton := Copy( pTypeButton , Pos( '__' , pTypeButton ) + 2, 50 );
                       end
                       else
                       if ( Pos( 'cls:' , pTypeButton ) > 0 ) then
                       begin
                          cTemp := Copy( pTypeButton , Pos( 'cls:' , pTypeButton ) + 4, 100 );
                          pTypeButton := Trim( Copy( cTemp , 1, Pos( '|' , cTemp ) -1 ) );
                       end;

                       TUniControl( pControl ).JSInterface.JSCall( 'removeCls' , [ 'disabled' ]);
                       TUniControl( pControl ).JSInterface.JSCall( 'addCls' , [ pTypeButton ]);

                       if not TUniControl( pControl ).Enabled then
                       begin
                            TUniControl( pControl ).JSInterface.JSCall( 'addCls' , [ 'disabled' ]);
                       end;
                  end;
             end
             else
             // v. 4.0.0.0
             if ( pControl is TUniContainerPanel ) or
                ( pControl is TUniPanel ) or
                ( pControl is TUniSimplePanel ) then
             begin
                if Pos( 'layout' , lowercase( TUniControl( pControl ).Name ) ) > 0 then
                begin
                      TUniControl( pControl ).Color := StringToColor( pMENU_COLOR );
                end;

                // ajustar ARREDONDAMENTO de panels...
                if   ( Pos( 'searchedit' , lowercase( pControl.Name ) ) > 0 ) then
                begin
                      TUniControl( pControl ).JSInterface.JSCall( 'addCls' , ['clsRoundPanel']);
                end;

                cClass := rc_GetHintProperty( 'cls:' , cHint );
                cTemp2 := rc_GetHintProperty( 'round:' , cHint );

                If cTemp2 <> '' then
                begin
                      cTemp := cTemp2;

                      if cTemp2 = 'all' then
                         cTemp2 := ''
                      else
                      if cTemp2 = 't l' then
                         cTemp2 := 'topleft'
                      else
                      if cTemp2 = 't r' then
                         cTemp2 := 'topright'
                      else
                      if cTemp2 = 'l' then
                         cTemp2 := 'topbottomleft'
                      else
                      if cTemp2 = 't' then
                         cTemp2 := 'topleftright'
                      else
                      if cTemp2 = 'r' then
                         cTemp2 := 'topbottomright'
                      else
                      if cTemp2 = 'b l' then
                         cTemp2 := 'bottomleft'
                      else
                      if cTemp2 = 'b r' then
                         cTemp2 := 'bottomright'
                      else
                      if cTemp2 = 'b' then
                         cTemp2 := 'bottomleftright';

                      if cTemp = 'no' then
                         cTemp2 := ''
                      else
                         cTemp2 := 'clsRoundPanel' + cTemp2 ;

                      if cClass <> '' then
                         cClass := ' ' + cClass;
                end;
                if cClass + cTemp2 <> '' then
                   rc_AddCssClass( pControl , cTemp2 + cClass );

                // v. 4.0.0.0
                // border
                cTemp2 := rc_GetHintProperty( 'border:' , cHint );
                cTemp3 := '';
                cTemp4 := '';
                cTemp  := '';
                If cTemp2 <> '' then
                begin
                      if Pos( ' border-round', cTemp2 ) > 0 then
                      begin
                         cTemp3 := ' clsRoundPanel';
                         cTemp2 := StringReplace( cTemp2, ' border-round', '', [rfReplaceAll] ) + ' ';
                      end;

                      // has css ?
                      if trim( Copy( cTemp2, Pos( ' ', cTemp2 ) + 1 ) ) <> ''then
                      begin
                         cTemp4 := Copy( cTemp2, Pos( ' ', cTemp2 ) + 1 );
                         cTemp2 := trim( StringReplace( cTemp2, cTemp4, '', [rfReplaceAll] ) );
                         cClass := cTemp4;
                      end;

                      cTemp := cTemp2;

                      if cTemp2 = 'all' then
                         cTemp2 := ''
                      else
                      if cTemp2 = 'tl' then
                         cTemp2 := 'topleft'
                      else
                      if cTemp2 = 'tr' then
                         cTemp2 := 'topright'
                      else
                      if cTemp2 = 'l' then
                         cTemp2 := 'left'
                      else
                      if cTemp2 = 't' then
                         cTemp2 := 'top'
                      else
                      if cTemp2 = 'r' then
                         cTemp2 := 'right'
                      else
                      if cTemp2 = 'bl' then
                         cTemp2 := 'bottomleft'
                      else
                      if cTemp2 = 'br' then
                         cTemp2 := 'bottomright'
                      else
                      if cTemp2 = 'b' then
                         cTemp2 := 'bottom';

                      if cTemp = 'no' then
                         cTemp2 := ''
                      else
                         cTemp2 := 'rc-border-' + cTemp2 ;

                      if cTemp3 <> '' then
                         cClass := cClass + ' ' + cTemp3;

                      if cClass <> '' then
                         cClass := ' ' + cClass;
                end;
                if cClass + cTemp2 <> '' then
                   rc_AddCssClass( pControl , cTemp2 + cClass  );
                // unicontainerpanel border
                // don´t work well... in development
//                cTemp2           := '';
//                cTemp3           := '';
//                cBorder          := rc_GetHintProperty( 'border:' , cHint );
//                cBorderColor     := rc_GetHintProperty( 'border-color:' , cHint );
//                cBorderRadius    := rc_GetHintProperty( 'border-radius:' , cHint );
//
//                if cBorderRadius = '' then
//                begin
//                   cBorderRadius_TL := rc_GetHintProperty( 'border-radius-tl:' , cHint ) + 'px';
//                   cBorderRadius_TR := rc_GetHintProperty( 'border-radius-tr:' , cHint ) + 'px';
//                   cBorderRadius_BL := rc_GetHintProperty( 'border-radius-bl:' , cHint ) + 'px';
//                   cBorderRadius_BR := rc_GetHintProperty( 'border-radius-br:' , cHint ) + 'px';
//                end
//                else
//                begin
//                   cBorderRadius_TL := cBorderRadius + 'px';
//                   cBorderRadius_TR := cBorderRadius + 'px';
//                   cBorderRadius_BL := cBorderRadius + 'px';
//                   cBorderRadius_BR := cBorderRadius + 'px';
//                end;
//
//                cBorderShadow    := rc_GetHintProperty( 'border-shadow:' , cHint );
//
//                If cBorder <> '' then
//                begin
//                     if cBorderColor <> '' then
//                        cTemp3 := '  this.setStyle("border-color", "' + cBorderColor + '"); '
//                     else
//                        cTemp3 := '  this.setStyle("border-color", "black"); ' ;
//
//                     if cBorderRadius_TL <> '' then
//                        cTemp3 := cTemp3 + '  this.setStyle("border-top-left-radius", "' + cBorderRadius_TL + '"); ' ;
//                     if cBorderRadius_TR <> '' then
//                        cTemp3 := cTemp3 + '  this.setStyle("border-top-right-radius", "' + cBorderRadius_TR + '"); ' ;
//                     if cBorderRadius_BL <> '' then
//                        cTemp3 := cTemp3 + '  this.setStyle("border-bottom-left-radius", "' + cBorderRadius_BL + '"); ' ;
//                     if cBorderRadius_BR <> '' then
//                        cTemp3 := cTemp3 + '  this.setStyle("border-bottom-right-radius", "' + cBorderRadius_BR + '"); ' ;
//
//                     if cBorderShadow <> '' then
//                        cTemp3 := cTemp3 + '  this.setStyle("border-shadow", "' + cBorderShadow + '"); ' ;
//
//                     with TUniControl( pControl ).JSInterface do
//                     begin
//                       JSConfig('border', [ '' + cBorder + '' ]);
//                       JSAddListener( 'afterrender',
//                                      'function(){ ' +
//                                      cTemp3 +
//                                      '  this.setStyle("border-style", "solid");' +
//                                      '}');
//                     end;
//                end;
                cTemp2 := '';
                cTemp3 := '';
             end
             else
             if ( pControl is TUniControl ) then
             begin
                cIco := rc_GetHintProperty( 'inputico:' , cHint );

                if cIco <> '' then
                begin
                   // icon type
                   cTemp3  := Copy( cIco , 1, Pos( '-' , cIco ) - 1 ) ;

                   if Copy( cTemp3, 1, 2 ) = 'fa' then
                      cTemp3 := cTemp3 + ' fa-'
                   else
                      cTemp3 := cTemp3 + ' picto-';

                   cIco := cTemp3 + Copy( cIco, Pos( '-', cIco ) +1, 100 );

                   //TUniControl( pControl ).JSInterface.JSCall( 'addCls' , ['inputWithIcon' + varIIF( mm.RTL, '-rtl', '' ) + ' inputIconBg' + varIIF( mm.RTL, '-rtl', '' )]);
                   TUniControl( pControl ).JSInterface.JSCall( 'addCls' , ['inputWithIcon inputIconBg']);

                   if ( pControl is TUniEdit ) then
                   begin
                      TUniEdit( pControl ).RTL                 := mm.RTL;
                      TUniEdit( pControl ).FieldLabel          := varIIF( mm.RTL, '', '<i class="' + cIco + ' fa-lg fa-fw" aria-hidden="true"></i>' );
                      TUniEdit( pControl ).FieldLabelWidth     := 20;
                      TUniEdit( pControl ).FieldLabelSeparator := ' ';
                      TUniEdit( pControl ).FieldLabelAlign     := varIIF( mm.RTL, laRight, laLeft );
                   end
                   else
                   if ( pControl is TUniDBEdit ) then
                   begin
                      TUniDBEdit( pControl ).RTL                 := mm.RTL;
                      TUniDBEdit( pControl ).FieldLabel          := varIIF( mm.RTL, '', '<i class="' + cIco + ' fa-lg fa-fw" aria-hidden="true"></i>' );
                      TUniDBEdit( pControl ).FieldLabelWidth     := 20;
                      TUniDBEdit( pControl ).FieldLabelSeparator := ' ';
                      TUniDBEdit( pControl ).FieldLabelAlign     := varIIF( mm.RTL, laRight, laLeft );
                   end
                   else
                   if ( pControl is TUniNumberEdit ) then
                   begin
                      TUniNumberEdit( pControl ).RTL                 := mm.RTL;
                      TUniNumberEdit( pControl ).FieldLabel          := varIIF( mm.RTL, '', '<i class="' + cIco + ' fa-lg fa-fw" aria-hidden="true"></i>' );
                      TUniNumberEdit( pControl ).FieldLabelWidth     := 20;
                      TUniNumberEdit( pControl ).FieldLabelSeparator := ' ';
                      TUniNumberEdit( pControl ).FieldLabelAlign     := varIIF( mm.RTL, laRight, laLeft );
                   end
                   else
                   if ( pControl is TUniDBNumberEdit ) then
                   begin
                      TUniDBNumberEdit( pControl ).RTL                 := mm.RTL;
                      TUniDBNumberEdit( pControl ).FieldLabel          := varIIF( mm.RTL, '', '<i class="' + cIco + ' fa-lg fa-fw" aria-hidden="true"></i>' );
                      TUniDBNumberEdit( pControl ).FieldLabelWidth     := 20;
                      TUniDBNumberEdit( pControl ).FieldLabelSeparator := ' ';
                      TUniDBNumberEdit( pControl ).FieldLabelAlign     := varIIF( mm.RTL, laRight, laLeft );
                   end ;
                end;
             end;
           end;
           // v. 4.0.0.0
           if pOnlyThisObj <> nil then
              Break;
        end;
     except on e:exception do
            begin
                 //UniSession.ResumeLayouts();
                 cTemp := '';
                 if pControl <> nil then
                    cTemp := pControl.Name;

                 ShowMessage( 'rc_RenderControlsExecute' + sLineBreak + sLineBreak +
                              'I=' + i.ToString + sLineBreak + sLineBreak +
                              'Obj:' + cTemp + sLineBreak + sLineBreak +
                              e.Message );
            end;
     end;
     //UniSession.ResumeLayouts();
end;
// v. 3.2.0.6
procedure rc_BootStrapRenderExecute( pForm : TObject ; pUpdateDBFields : Boolean ; pTabIni, pTabEnd : integer; pMobileScreen, pLandScape : boolean ; pOnlyThisObj : TObject );
var
  oObj : TObject;
  oObjTemp : TUniControl;

  pQryMaster : TFDQuery;
  pDsMaster  : TDataSource;
  // v. 4.0.0.0
  pDM : TDataModule;

  cImgCls, // v. 3.3.1.0
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

  cCloseBtn,
  cBsTempVal,
  cBsComponent,
  cBsCaption,
  cBsTemp,
  cBsField,
  cBsClass,
  cBsColor,
  cBsDisabled, cBsID, // v.3.3.3.0
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
     oObj       := nil;
     oObjTemp   := nil;
     //pQryMaster := nil;
     iW         := 0;
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
                 // v. 3.3.0.2
                 If ( Pos( 'TAction' , oObj.ClassName ) = 0 ) and // v. 4.0.0.0
                    ( Pos( 'THelp' , oObj.ClassName ) = 0 ) then  // v. 4.0.0.0
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
                                 '   trackMouse: true,'+ // v. 3.3.1.0
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

                              // v. 3.3.3.0
                              // para evitar que o "ID" do componente em HTML se repita se os nomes forem iguais
                              cBsID := ( Random( 900 ) + 1 ).ToString;

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
                                  //cTemp4   := StringReplace( cTemp4, cCaption, '', [rfReplaceAll] );

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
                                  //cTemp4   := StringReplace( cTemp4, cCaption, '', [rfReplaceAll] );

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
                                  pDsMaster   := nil;
                                  cQuery      := '';

                                  if bisDB then
                                  begin
                                     // v. 3.3.1.0
                                     if Pos( ' ds:', TUniControl( oObj ).hint ) > 0 then
                                     begin
                                        cDataSource := Trim( Copy( TUniControl( oObj ).hint, Pos( ' ds:', TUniControl( oObj ).hint ) + 4, 100 ) );
                                        cDataSource := Trim( StringReplace( cDataSource , ']]', '', [rfReplaceAll] ) ) + ' ';
                                        cDataSource := Copy( cDataSource, 1, Pos( ' ' , cDataSource ) -1 );
                                        // v. 4.0.0.0
                                        If Pos( '.', cDataSource ) > 0 then
                                        begin
                                            pDM := nil;
                                            pDM := dm_rc.rc_FindDataModule( Copy( cDataSource, 1, pos( '.', cDataSource ) - 1 ) );
                                            cTemp := Copy( cDataSource, pos( '.', cDataSource ) + 1 );
                                        end;
                                        if pDM <> nil then
                                           pDsMaster  := TDataSource( pDM.FindComponent( cDataSource ) )
                                        else
                                           pDsMaster  := TDataSource( TComponent( TComponent( pForm ) ).FindComponent( cDataSource ) );
                                        //pDsMaster   := TDataSource( TComponent( TComponent( pForm ) ).FindComponent( cDataSource ) );
                                     end
                                     else
                                        pDsMaster   := TDataSource( TComponent( TComponent( pForm ) ).FindComponent( 'dsmaster' ) );
                                  end;

                                  if pDsMaster <> nil then
                                  begin
                                     pQryMaster := TFdQuery( pDsMaster.DataSet );
                                     cQuery     := pQryMaster.Name;
                                  end;

                                  // read and update?
                                  if ( pUpdateDBFields ) and ( bisDB ) then
                                  begin
                                     if pQryMaster <> nil then
                                        if ( pQryMaster.State <> dsInactive ) then
                                        begin
                                             cTemp  := TUniControl( oObj ).Caption ;

                                             iPosIni := Pos( 'field=' , cTemp ) + 6;
                                             iPosEnd := Pos( 'form='  , cTemp ) - 1;

                                             cBsField   := Copy( cTemp, iPosIni, iPosEnd ) ;
                                             cBsField   := Trim( Copy( cBsField, 1, Pos ( ',', cBsField ) - 3 ) ) ;

                                             if cBsField <> '' then
                                             begin
                                                try
                                                   if DataTypeIsNumber( pQryMaster.FieldByName( cBsField ).DataType ) then
                                                      iBsTempVal := varIIF( pQryMaster.FieldByName( cBsField ).IsNull, 0, pQryMaster.FieldByName( cBsField ).Value )
                                                   else
                                                      iBsTempVal := varIIF( ( pQryMaster.FieldByName( cBsField ).Value = mm.VALUE_YES ) , 1, 0 );
                                                except on e:exception do
                                                       begin
                                                            dm_rc.rc_ShowError( cBsField + ' ' + e.Message )
                                                       end;
                                                end;

                                                iPosIni := Pos( 'type="checkbox"' , cTemp );
                                                iPosEnd := Pos( 'class="custom-control-input"' , cTemp );

                                                cTemp2 := Copy( cTemp, iPosIni, iPosEnd ) ;

                                                TUniControl( oObj ).Tag := iBsTempVal;

                                                cTemp := StringReplace( cTemp, 'checked=""', '',[rfReplaceAll] );
                                                cTemp := StringReplace( cTemp, 'disabled=""', '',[rfReplaceAll] );

                                                TUniControl( oObj ).Caption :=
                                                   Copy( cTemp, 1, iPosIni + 16 ) + varIIF( iBsTempVal = 1, 'checked=""', '' ) +
                                                   varIIF( ( pQryMaster.State in [dsInsert, dsEdit ] ) and ( bEnabled ) , '', 'disabled=""' ) +
                                                   Trim( Copy( cTemp, iPosIni + 16, 500 ) );
                                             end;

                                        end;
                                  end
                                  else
                                  begin
                                     // v. 3.3.3.0
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
                                                   TUniControl( oObj ).Name + '__' + cBsID + '"><label class="custom-control-label" for="bschk_' +
                                                   TUniControl( oObj ).Name + '__' + cBsID + '">' + cBsCaption + '</label></div>'
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
                                                   TUniControl( oObj ).Name + '__' + cBsID + '"><label class="custom-control-label" for="bsswt_' +
                                                   TUniControl( oObj ).Name + '__' + cBsID + '">' + cBsCaption + '</label></div>';
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

                                     cSeq     := dm_rc.rc_GetParamFromRGP( cHint, rptSEQ );
                                     cField   := dm_rc.rc_GetParamFromRGP( cHint, rptFIELD );
                                     cValue   := dm_rc.rc_GetParamFromRGP( cHint, rptVALUE );
                                     cBsField := cField;
                                     cBsTemp  := cValue;
                                     cBsCaption := '';
                                     cBsTempVal := cBsTemp;

                                     iPos       := StrToIntDef( cSeq, 0 );

                                     iBsTempVal := TUniControl( oObj ).Tag;

                                     cTemp  := TUniControl( oObj ).Caption ;

                                     cDataSource := '';
                                     pQryMaster := nil;
                                     cQuery     := '';

                                     If ( bisDB ) then
                                     begin
                                        // v. 3.3.3.0
                                        if ( Pos( ' ds:', TUniControl( oObj ).hint ) > 0 ) or ( Pos( '[ds:', TUniControl( oObj ).hint ) > 0 ) then
                                        begin
                                           cDataSource := Trim( Copy( TUniControl( oObj ).hint, Pos( 'ds:', TUniControl( oObj ).hint ) + 3, 100 ) );

                                           cDataSource := Trim( StringReplace( cDataSource , ']]', '', [rfReplaceAll] ) ) + ' ';
                                           cDataSource := Copy( cDataSource, 1, Pos( ' ' , cDataSource ) -1 );
                                           // v. 4.0.0.0
                                           If Pos( '.', cDataSource ) > 0 then
                                           begin
                                               pDM := nil;
                                               pDM := dm_rc.rc_FindDataModule( Copy( cDataSource, 1, pos( '.', cDataSource ) - 1 ) );
                                               cTemp := Copy( cDataSource, pos( '.', cDataSource ) + 1 );
                                           end;
                                           if pDM <> nil then
                                              pDsMaster  := TDataSource( pDM.FindComponent( cDataSource ) )
                                           else
                                              pDsMaster  := TDataSource( TComponent( TComponent( pForm ) ).FindComponent( cDataSource ) );
                                           //pDsMaster   := TDataSource( TComponent( TComponent( pForm ) ).FindComponent( cDataSource ) );
                                        end
                                        else
                                           pDsMaster   := TDataSource( TComponent( TComponent( pForm ) ).FindComponent( 'dsmaster' ) );

                                        pQryMaster := nil;
                                        cQuery     := '';
                                        if pDsMaster <> nil then
                                        begin
                                           pQryMaster := TFdQuery( pDsMaster.DataSet );
                                           cQuery     := pQryMaster.Name;
                                        end;
                                     end;

                                     // read and update?
                                     if ( pUpdateDBFields ) and ( bisDB ) then
                                     begin
                                        cTemp  := TUniControl( oObj ).Caption ;

                                        if pQryMaster <> nil then
                                        begin
                                           if ( pQryMaster.State <> dsInactive ) then
                                           begin
                                                cTemp  := TUniControl( oObj ).Caption ;

                                                iPosIni := Pos( 'field=' , cTemp ) + 6;
                                                iPosEnd := Pos( 'form='  , cTemp ) - 1;

                                                cBsField   := Copy( cTemp, iPosIni, iPosEnd ) ;
                                                cBsField   := Trim( Copy( cBsField, 1, Pos ( ',', cBsField ) - 3 ) ) ;

                                                if cBsField <> '' then
                                                begin
                                                   // field content
                                                   try
                                                       if DataTypeIsNumber( pQryMaster.FieldByName( cBsField ).DataType ) then
                                                          cBsTempVal := varIIF( pQryMaster.FieldByName( cBsField ).IsNull, -1, pQryMaster.FieldByName( cBsField ).Value )
                                                       else
                                                          cBsTempVal := varIIF( pQryMaster.FieldByName( cBsField ).IsNull, '', pQryMaster.FieldByName( cBsField ).Value );
                                                   except on e:exception do
                                                          begin
                                                               dm_rc.rc_ShowError( cBsField + ' ' + e.Message )
                                                          end;
                                                   end;

                                                   iPosIni := Pos( 'type="radio"' , cTemp );
                                                   iPosEnd := Pos( 'onclick="ajaxRequest' , cTemp );

                                                   cTemp2 := Copy( cTemp, iPosIni, iPosEnd ) ;

                                                   // rc_RgpCheck / rc_RgpInitialize
                                                   if ( iBsTempVal = 999 ) or ( iBsTempVal = -999 ) then
                                                   begin
                                                      if iBsTempVal = 999 then
                                                      begin
                                                         iBsTempVal := 1;

                                                         if pQryMaster.State in [dsInsert, dsEdit ] then
                                                            pQryMaster.FieldByName( cBsField ).Value := cBsTemp;

                                                      end
                                                      else
                                                      if iBsTempVal = -999 then
                                                      begin
                                                         iBsTempVal := 0;

                                                         if pQryMaster.State in [dsInsert, dsEdit ] then
                                                            pQryMaster.FieldByName( cBsField ).Clear;
                                                      end;
                                                   end
                                                   else
                                                   if iBsTempVal <> -1 then
                                                      iBsTempVal := varIIF( cBsTempVal = cBsTemp , 1, 0 )
                                                   else
                                                      iBsTempVal := 0;

                                                   cTemp := StringReplace( cTemp, ' checked="" ', '',[rfReplaceAll] );
                                                   cTemp := StringReplace( cTemp, ' disabled="" ', '',[rfReplaceAll] );

                                                   if iBsTempVal = -1 then
                                                      TUniControl( oObj ).Caption :=
                                                         Copy( cTemp, 1, iPosIni + 12 ) + '' +
                                                         varIIF( pQryMaster.State in [dsInsert, dsEdit ] , '', ' disabled="" ' ) +
                                                         Trim( Copy( cTemp, iPosIni + 12, 500 ) )
                                                   else
                                                      TUniControl( oObj ).Caption :=
                                                         Copy( cTemp, 1, iPosIni + 12 ) + varIIF( iBsTempVal = 1, ' checked="" ', '' ) +
                                                         varIIF( pQryMaster.State in [dsInsert, dsEdit ] , '', ' disabled="" ' ) +
                                                         Trim( Copy( cTemp, iPosIni + 12, 500 ) );

                                                   cTemp := cTemp ;
                                                end;
                                           end;
                                        end;
                                     end
                                     else
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
                                           // v. 3.3.3.0
                                           TUniControl( oObj ).Caption :=
                                             '<div class="custom-control custom-radio"><input class="custom-control-input" type="radio" ' + varIIF( iBsTempVal = 1, ' checked="" ', '' ) +
                                                'onclick="ajaxRequest( MainForm.htmlFrame, ' + QuotedStr( cBsComponent ) + ' , [' +
                                                   QuotedStr( cBsComponent + '=' + TUniControl( oObj ).Name ) + ', ' +
                                                   QuotedStr( 'field=' + cBsField ) + ' , ' +
                                                   QuotedStr( 'value=' + cBsTempVal ) + ' , ' +
                                                   QuotedStr( 'radio=' + iPos.ToString ) + ' , ' +
                                                   QuotedStr( 'query=' + cQuery ) + ' , ' +
                                                   QuotedStr( 'form=' + TComponent( pForm ).Name ) + '] );" name="customRadio' + TUniControl( oObj ).Name + '__' + cBsID + '" id="customRadio' + TUniControl( oObj ).Name + '__' + cBsID +
                                                      '"><label class="custom-control-label" for="customRadio' + TUniControl( oObj ).Name + '__' + cBsID +
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
                                               // v. 3.3.3.0
                                               varSL_HtmlPage.Add( '         <li class="nav-item">' )  ;
                                               varSL_HtmlPage.Add( '            <a class="nav-link ' + cBsTemp + '" id="custom-tabs-four-' + pPageControl.Name + cBsID + '-tab" data-toggle="pill" href="#custom-tabs-four-' + pPageControl.Name + cBsID +  '" onclick="ajaxRequest( MainForm.htmlFrame, ' + QuotedStr( cBsComponent ) + ' , [' +
                                                                                QuotedStr( cBsComponent + '=' + cTemp ) + ', ' +
                                                                                QuotedStr( 'tab=Tab' + f.ToString ) + ', ' +
                                                                                QuotedStr( 'form=' + TComponent( pForm ).Name ) + ', ' +
                                                                                QuotedStr( 'pgcontrol=' + pPageControl.Name ) + '] );" role="tab" aria-controls="custom-tabs-four-' + pPageControl.Name + cBsID + '" aria-selected="' + varIIF( cBsTemp = 'active', 'true', 'false' )  + '">' +
                                                                                cTemp2 );
                                               varSL_HtmlPage.Add( '            </a>' );
                                               varSL_HtmlPage.Add( '         </li>' );                                                                                                                                                       //       ^
                                            end;
                                         end;

                                         varSL_HtmlPage.Add( '           </ul>' );
                                         varSL_HtmlPage.Add( '        </div>' );

                                         // complemento..

                                         varSL_HtmlPage.Add( '<div class="card-body">' );
                                         varSL_HtmlPage.Add( '  <div class="tab-content" id="custom-tabs-four-tabContent' + cBsID + '">' ); // v. 3.3.3.0

                                         for F := pTabIni to pTabEnd do
                                         begin
                                            if pPageControl.Pages[ f ].TabVisible then
                                            begin
                                               cTemp  := trim( TUniTabSheet( pPageControl.Pages[ f ] ).Name );
                                               cTemp2 := trim( TUniTabSheet( pPageControl.Pages[ f ] ).Caption );

                                               cBsTemp := IfThen( cTemp = pPageControl.ActivePage.Name , ' active show' , '' );

                                               varSL_HtmlPage.Add( '<div class="tab-pane fade' + cBsTemp + '" id="custom-tabs-four-' + pPageControl.Name + cBsID + '" role="tabpanel" aria-labelledby="custom-tabs-four-' + pPageControl.Name + cBsID + '-tab">' ); // v. 3.3.3.0
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
                              // v. 4.0.0.0
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
                                     // v. 4.0.0.0
                                     cBsCaption := Trim(Copy( cHint, Pos( 'pgc:' , cHint ) + 4 , 100 ) ) + ' ';
                                     cBsCaption := Copy( cBsCaption, 1, Pos( ' ' , cBsCaption ) - 1 );

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
                                         varSL_HtmlPage.Add( '     <ul class="nav nav-tabs" id="custom-content-below-tab' + pPageControl.Name + cBsID + '" role="tablist">' ); // v. 3.3.3.0

                                         for F := pTabIni to pTabEnd do
                                         begin
                                            if pPageControl.Pages[ f ].TabVisible then
                                            begin
                                               cTemp  := trim( TUniTabSheet( pPageControl.Pages[ f ] ).Name );
                                               cTemp2 := trim( TUniTabSheet( pPageControl.Pages[ f ] ).Caption );

                                               cBsTemp := IfThen( cTemp = pPageControl.ActivePage.Name , 'active color-gray' , 'color-silver' );

                                               // v. 4.0.0.0
                                               if ( ( f > 0 ) and ( f = pTabIni ) ) and ( pPageControl.PageCount - 1 > ( iReduc ) ) then // and ( f = 0 ) then
                                               begin
                                                  //cBsTemp := 'ButtonThemeTab';

                                                  varSL_HtmlPage.Add( '        <button onclick="ajaxRequest( MainForm.htmlFrame, ' + QuotedStr( cBsComponent ) + ' , [' +
                                                                            QuotedStr( cBsComponent + '=' + cTemp ) + ', ' +
                                                                            QuotedStr( 'tab=TabLeft' ) + ', ' +
                                                                            QuotedStr( 'form=' + TComponent( pForm ).Name ) + ', ' +
                                                                            QuotedStr( 'pgcontrol=' + pPageControl.Name ) + '] );" id="' + pPageControl.Name + '_Tab' + f.ToString + cBsID + '" type="button" class="btn ' + cBsClass + ' ' + cBsTemp + '">' + '<i class="fa fa-arrow-left fa-1x"></i>' + // v. 3.3.3.0
                                                                            '</button>' );                                                               //       ^
                                               end;

                                               varSL_HtmlPage.Add( '<li class="nav-item">' +
                                                                                 '  <a class="nav-link ' + cBsTemp + '" id="custom-content-below-home-tab' + pPageControl.Name + f.ToString + cBsID + '" data-toggle="pill" href="#custom-content-below-home-tab' + pPageControl.Name + cBsID + '" onclick="ajaxRequest( MainForm.htmlFrame, ' + QuotedStr( cBsComponent ) + ' , [' + // v. 3.3.3.0
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
                                               // v. 4.0.0.0
                                               if ( pPageControl.PageCount - 1 > ( iReduc ) ) and ( ( f = pTabEnd ) and ( f <> pPageControl.PageCount - 1 ) ) then
                                               begin
                                                  //cBsTemp := 'ButtonThemeTab';
                                                  varSL_HtmlPage.Add( '        <button onclick="ajaxRequest( MainForm.htmlFrame, ' + QuotedStr( cBsComponent ) + ' , [' +
                                                                            QuotedStr( cBsComponent + '=' + cTemp ) + ', ' +
                                                                            QuotedStr( 'tab=TabRight' ) + ', ' +
                                                                            QuotedStr( 'form=' + TComponent( pForm ).Name ) + ', ' +
                                                                            QuotedStr( 'pgcontrol=' + pPageControl.Name ) + '] );" id="' + pPageControl.Name + f.ToString + cBsID + '_TabRight" type="button" class="btn ' + cBsClass + ' ' + cBsTemp + '">' + '<i class="fa fa-arrow-right fa-1x"></i>' + // v. 3.3.3.0
                                                                            '</button>' );                                                               //       ^

                                               end;
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
                                     cBsCaption := Trim(Copy( cHint, Pos( 'pgc:' , cHint ) + 4 , 100 ) ) + ' '; // v. 3.2.0.8
                                     cBsCaption := Copy( cBsCaption, 1, Pos( ' ' , cBsCaption ) - 1 );             // v. 3.2.0.8

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

                                               cCloseBtn := 'tab=_closeTab';
                                               If Pos( 'closebtn:false' , TUniTabSheet( pPageControl.Pages[ f ] ).Hint ) > 0 then
                                                  cCloseBtn := '';

                                               if Pos( '<span>', cTemp2 ) = 0 then
                                                  cTemp2 := '<i class=""></i><span> ' + cTemp2 + '</span>';

                                               cTemp3 := '';
                                               if ( TUniTabSheet( pPageControl.Pages[ f ] ).Name = pPageControl.ActivePage.Name ) and ( cCloseBtn <> '' ) then
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
                                                                            QuotedStr( 'pgcontrol=' + pPageControl.Name ) + '] );" id="' + pPageControl.Name + '_Tab' + f.ToString + cBsID + '" type="button" class="btn ' + cBsClass + ' ' + cBsTemp + '">' + '<i class="fa fa-arrow-left fa-1x"></i>' + // v. 3.3.3.0
                                                                            '</button>' );                                                               //       ^
                                               end;
                                               // v. 3.3.3.0
                                               //cls-active:ButtonTabPurple
                                               //cls-tab1-active: ...
                                               cTemp4 := '';
                                               If Pos( 'cls-active:' , cHint ) > 0 then
                                               begin
                                                  cTemp4 := Copy( cHint, Pos( 'cls-active:' , cHint ) + 11 ) + ' ' ;
                                                  cTemp4 := Copy( cTemp4, 1, pos( ' ', cTemp4 ) - 1 );
                                               end;
                                               If Pos( 'cls-tab' + (f+1).ToString + '-active:' , cHint ) > 0 then
                                               begin
                                                  cTemp4 := Copy( cHint, Pos( 'cls-tab' + (f+1).ToString + '-active:' , cHint ) + 16 ) + ' ' ;
                                                  cTemp4 := Copy( cTemp4, 1, pos( ' ', cTemp4 ) - 1 );
                                               end;
                                               if cTemp4 = '' then
                                                  cTemp4 := 'ButtonThemeTab';
                                               cBsTemp := IfThen( cTemp = pPageControl.ActivePage.Name , cTemp4 , 'ButtonThemeInactive' );

                                               cBsDisabled := varIIF( not TUniTabSheet( pPageControl.Pages[ f ] ).Enabled, 'disabled = "disable"', '' ); // v. 3.3.3.0

                                               varSL_HtmlPage.Add( '    <button onclick="ajaxRequest( MainForm.htmlFrame, ' + QuotedStr( cBsComponent ) + ' , [' +
                                                                            QuotedStr( cBsComponent + '=' + cTemp ) + ', ' +
                                                                            QuotedStr( 'tab=Tab' + f.ToString ) + ', ' +
                                                                            QuotedStr( 'form=' + TComponent( pForm ).Name ) + ', ' +
                                                                            QuotedStr( 'pgcontrol=' + pPageControl.Name ) + '] );" id="' + pPageControl.Name + f.ToString + cBsID + '_TabLeft" type="button" ' + cBsDisabled + ' class="btn ' + cBsClass + ' ' + cBsTemp + '">' + cTemp2 + // v. 3.3.3.0

                                                                            IfThen( ( cTemp3 <> '' ) and ( pPageControl.ActivePageIndex > 0 ) , '<a onclick="ajaxRequest( MainForm.htmlFrame , ' + QuotedStr( cBsComponent ) + ' , [' +
                                                                                                   QuotedStr( cBsComponent + '=' + cTemp ) + ', ' +
                                                                                                   QuotedStr( cCloseBtn ) + ', ' + //QuotedStr( 'tab=_closeTab' ) + ', ' +
                                                                                                   QuotedStr( 'form=' + TComponent( pForm ).Name ) + ', ' +
                                                                                                   QuotedStr( 'pgcontrol=' + pPageControl.Name ) +

                                                                                                   ']);"><span> ' + cTemp3 + '</span></a>', '' ) +
                                                                         '</button>' );                                                               //       ^

                                                // close all
                                                if ( f = pTabEnd ) and ( pTabEnd > 1 ) and ( Pos( 'closeall:off', TUniLabel( oObj ).Hint ) = 0 ) then // v. 3.2.0.8
                                                begin
                                                    cBsTemp := 'ButtonThemeTab';//'ButtonThemeCloseAllTab';

                                                    varSL_HtmlPage.Add( '        <button onclick="ajaxRequest( MainForm.htmlFrame, ' + QuotedStr( cBsComponent ) + ' , [' +
                                                                              QuotedStr( cBsComponent + '=' + cTemp ) + ', ' +
                                                                              QuotedStr( 'tab=_closeAllTabs' ) + ', ' +
                                                                              QuotedStr( 'form=' + TComponent( pForm ).Name ) + ', ' +
                                                                              QuotedStr( 'pgcontrol=' + pPageControl.Name ) + '] );" id="' + pPageControl.Name + f.ToString + cBsID + '_closeAllTabs" type="button" class="btn ' + cBsClass + ' ' + cBsTemp + '">' + '<i class="fas fa-window-close"></i>' + // v. 3.3.3.0
                                                                              '</button>' );                                                               //       ^

                                                end;

                                                if ( pPageControl.PageCount - 1 > ( iReduc ) ) and ( ( f = pTabEnd ) and ( f <> pPageControl.PageCount - 1 ) ) then
                                                begin
                                                   cBsTemp := 'ButtonThemeTab';
                                                   varSL_HtmlPage.Add( '        <button onclick="ajaxRequest( MainForm.htmlFrame, ' + QuotedStr( cBsComponent ) + ' , [' +
                                                                             QuotedStr( cBsComponent + '=' + cTemp ) + ', ' +
                                                                             QuotedStr( 'tab=TabRight' ) + ', ' +
                                                                             QuotedStr( 'form=' + TComponent( pForm ).Name ) + ', ' +
                                                                             QuotedStr( 'pgcontrol=' + pPageControl.Name ) + '] );" id="' + pPageControl.Name + f.ToString + cBsID + '_TabRight" type="button" class="btn ' + cBsClass + ' ' + cBsTemp + '">' + '<i class="fa fa-arrow-right fa-1x"></i>' + // v. 3.3.3.0
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
                                  varSL_HtmlPage.Add( '<div id="carouselIndicators' + cBsID + '" class="carousel slide" data-ride="carousel">' ); // v. 3.3.3.0

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
                                  varSL_HtmlPage.Add( '  <a class="carousel-control-prev" id="btncarouselprev' + cBsID + '" href="#carouselIndicators' + cBsID + '" role="button" data-slide="prev">' ); // v. 3.3.3.0
                                  varSL_HtmlPage.Add( '    <span class="carousel-control-prev-icon" aria-hidden="true"></span>' );
                                  varSL_HtmlPage.Add( '    <span class="sr-only">Previous</span>' );
                                  varSL_HtmlPage.Add( '  </a>' );
                                  varSL_HtmlPage.Add( '  <a class="carousel-control-next" id="btncarouselnext' + cBsID + '" href="#carouselIndicators' + cBsID + '" role="button" data-slide="next">' ); // v. 3.3.3.0
                                  varSL_HtmlPage.Add( '    <span class="carousel-control-next-icon" aria-hidden="true"></span>' );
                                  varSL_HtmlPage.Add( '    <span class="sr-only">Next</span>' );
                                  varSL_HtmlPage.Add( '  </a>' );
                                  varSL_HtmlPage.Add( ' </div>' );
                                  varSL_HtmlPage.Add( '</div>' );

                                  varSL_HtmlPage.Text := RemoveLineBreaks( varSL_HtmlPage.Text );
                                  varSL_HtmlPage.Text := StringReplace( varSL_HtmlPage.Text, '?', '&amp;', [rfReplaceAll] );
                               end
                               else
                               if Pos( 'bsimg:' , cHint ) > 0 then
                               begin
                                      // v. 3.3.1.0
                                      cImgCls := rc_GetHintProperty( 'img-cls:', cHint );
                                      cTemp :='<img id="bsimg' + TUniControl( oObj ).name + cBsID + '" ' + // v. 3.3.3.0
                                              'class="img-responsive ' + cImgCls + '" ' + //img-fluid mx-auto d-block
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
                                                 'encrypted-media; gyroscope; picture-in-picture" allowfullscreen>' +
                                                 '</iframe>' +
                                               '</div>' ;

                                      cHint := RemoveLineBreaks( cHint );
                                      cHint := trim( rc_NormalizeHintProperty( cHint )) + ' ';

                                      iH := TUniControl( TUniControl( oObj ).GetParentComponent ).Height;
                                      // todo conteudo de bsvideo
                                      cTemp3 := rc_GetHintProperty( 'bsvideo:', cHint );
                                      // v. 3.3.0.0
                                      //apenas o video
                                      cTemp2 := rc_GetHintProperty( 'bsvideo:', cHint );//, true );
                                      cTemp2 := Copy( cTemp2, 1, Pos( ' ', cTemp2 ) - 1 );
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
                        // v. 4.0.0.0
                        if ( oObj is TUniPanel ) or
                           ( oObj is TUniSimplePanel ) or
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
                         dm_rc.rc_ShowError( 'rc_BootStrapRenderExecute ( ' + i.ToString + ' | obj: ' + TUniControl( oObj ).name + ') : ' + e.Message  );
                    end;
             End;
         end;
     end;
     //UniSession.ResumeLayouts();
     varSL_HtmlPage.Free;
end;
// v. 4.0.0.0
function DynamicAlignment_CENTER( pFrame: TObject; pObj : TUniControl ; pParam1, pParam2 : string ):boolean;
var
   oComponent : TComponent;
   oObjTemp, oObjTemp2 : TUniControl;

   cCaption,
   cCmd, cTemp, cTemp2, cTemp3, cTemp4, cHint : string;

   iOffSet,
   iii,
   i,n,x,y,w,h, iLeft, iTop, iRight, iBottom, iWidth, iHeight,
   iPos, iPos2, iTemp : integer;

   bDots : boolean;
begin
   cTemp3   := pParam1;//rc_GetHintProperty( 'center:', cTemp );
   cTemp    := pParam2;//rc_GetHintProperty( 'center:', cTemp );
   oObjTemp := pObj;
   if cTemp3 <> '' then
   begin
      x := 0;
      y := 0;

      cTemp3 := Copy( cTemp3, 1, Pos( ' ' , cTemp3 ) - 1 );

      oObjTemp2 := nil;

      Result := true;

      if cTemp3 = 'parent' then
      begin
         // on l inux have probles without .HasParent
         if oObjTemp.HasParent then
           oComponent := oObjTemp.GetParentComponent
         else
           // v. 3.2.0.0
           //oComponent := nil;
           oComponent := oObjTemp.Owner;

         oObjTemp2   := TUniControl( oComponent );
      end
      else
         oObjTemp2 := rc_FindControl( cTemp3, pFrame );

      cTemp3 := Trim (StringReplace( cTemp, 'center:' + cTemp3, '', [rfReplaceAll] ) );
      // v. 3.3.0.0
      if ( cTemp3 = 'x' ) or ( cTemp3 = 'y' ) or ( cTemp3 = 'xy' ) then
      begin
         rc_CenterObj( oObjTemp, oObjTemp2 , ( cTemp3 = 'y' ) or ( cTemp3 = 'xy' ), ( cTemp3 = 'x' ) or ( cTemp3 = 'xy' ) , y, x );
      end
      else
      if ( cTemp3 = 'x-mobile-y' ) then
      begin
         cTemp3 := Copy( cTemp3, 1, 1 );
         if ( not mm.varB_Mobile_Screen ) then
            rc_CenterObj( oObjTemp, oObjTemp2 , false, true , y, x )
         else
         if ( mm.varB_Mobile_Screen ) then
            rc_CenterObj( oObjTemp, oObjTemp2 , true, false , y, x );
      end
      else
      if ( cTemp3 = 'y-mobile-x' )then
      begin
         cTemp3 := Copy( cTemp3, 1, 1 );
         if ( not mm.varB_Mobile_Screen ) then
            rc_CenterObj( oObjTemp, oObjTemp2 , true, false , y, x )
         else
         if ( mm.varB_Mobile_Screen ) then
            rc_CenterObj( oObjTemp, oObjTemp2 , false, true , y, x );
      end
      else
      if oObjTemp2 <> nil then
      begin
         if ( Pos( 'x:', cTemp ) = 0 ) and ( Pos( 'y:', cTemp ) = 0 ) then
         begin
            cTemp3 := StringReplace( cTemp , 'center:' , '', [rfReplaceAll] );
            cTemp3 := Trim( StringReplace( cTemp3, oObjTemp2.Name , '', [rfReplaceAll] ) );

            x := 0;
            y := 0;
         end
         else
         begin
              cTemp3 := '';

              if ( Pos( 'x:', cTemp ) > 0 ) then
              begin
                   cTemp2 := Copy( cTemp, Pos( 'x:' , cTemp ) + 2 , 300 ) + ' ';
                   cTemp2 := Trim( Copy( cTemp2, 1, Pos( ' ' , cTemp2 ) ) );

                   n := StrToIntDef( ReturnNumbers( cTemp2 ), 0 );
                   w := oObjTemp2.Width;

                   if Pos( '%', cTemp2 ) > 0 then
                      x := Trunc(( n / 100 ) * ( w ) )
                   else
                      x := StrToIntDef( cTemp2 , 0 );

                   cTemp3 := 'x';
              end;

              if ( Pos( 'y:', cTemp ) > 0 ) then
              begin
                   cTemp4 := Copy( cTemp, Pos( 'y:' , cTemp ) + 2, 300 ) + ' ';
                   cTemp4 := Trim( Copy( cTemp4, 1, Pos( ' ' , cTemp4 ) ) );

                   n := StrToIntDef( ReturnNumbers( cTemp4 ), 0 );
                   h := oObjTemp2.Height;

                   if Pos( '%', cTemp4 ) > 0 then
                      y := Trunc(( n / 100 ) * ( h ) )
                   else
                      y := StrToIntDef( cTemp4 , 0 );

                   cTemp3 := cTemp3 + 'y';
              end;
         end;
         rc_CenterObj( oObjTemp, oObjTemp2 , ( cTemp3 = 'y' ) or ( cTemp3 = 'xy' ), ( cTemp3 = 'x' ) or ( cTemp3 = 'xy' ) , y, x );
      end
      else
      begin
           dm_rc.rc_ShowError( 'CENTER Obj:' + cTemp3 + ' not found.' );
           Result := false;
      end;
   end;
end;
// v. 4.0.0.0
procedure rc_DynamicAlignment( pFrame: TObject );
var
   oComponent : TComponent;
   oObjTemp, oObjTemp2 : TUniControl;

   cCaption,
   cCmd, cTemp, cTemp2, cTemp3, cTemp4, cHint : string;

   iOffSet,
   iii,
   i,n,x,y,w,h, iLeft, iTop, iRight, iBottom, iWidth, iHeight,
   iPos, iPos2, iTemp : integer;

   bDots : boolean;
begin
   // align components
   //
   // [[cls:btngreen | align:btncancel r:-10]]
   // [[cls:btnred | align:memo l:0 b:4]]
   // [[center:parent xy]]

   x := 0;
   oObjTemp := nil;
    iii := 0;
   //UniSession.SuspendLayouts();
   try
      for I := 1 to TComponent(pFrame).ComponentCount - 1 do
      begin

         oObjTemp  := TUniControl( TComponent(pFrame).Components[ I ] );
         // conflito com novo col-attr: ( uniDbGrid só recebe col-attr como atributos )
         // v. 3.3.0.2
         If ( Pos( 'TAction' , TComponent( pFrame ).Components[I].ClassName ) = 0 ) and
            ( Pos( 'THelp' , TComponent( pFrame ).Components[I].ClassName ) = 0 ) and
            ( Pos( 'TUniDBGrid' , TComponent( pFrame ).Components[I].ClassName ) = 0 ) then
         begin

            if GetPropInfo( oObjTemp.ClassInfo, 'Hint' ) <> nil then
            begin
                cHint :=  oObjTemp.Hint;

                //if ( oObjTemp.ClassName = 'TUniLabel' ) and ( TComponent( pFrame ).Name <> 'MainForm' ) then
                if ( oObjTemp.Name = 'rcLabel_percent83' ) then
                   cHint := cHint;

                if Pos( '[[' , oObjTemp.Hint ) > 0 then
                begin
                   cTemp3  := oObjTemp.Hint;

                   if ( oObjTemp is TUniLabel ) then
                   begin
                      // FONT responsive
                      // font-size:50 mobile-v-24 mobile-h-32 |
                      cTemp := rc_GetHintProperty( 'fontsize-r:', cTemp3 );

                      if cTemp <> '' then
                      begin
                         iPos := StrToIntDef( Copy( cTemp, 1, Pos( ' ', cTemp ) - 1 ), TUnilabel( oObjTemp ).Font.Size );

                         if mm.varB_Mobile_Screen_Portrait then
                         begin
                            iPos  := Pos( 'mobile-v-' , cTemp ) + 9;
                            cTemp := Copy( cTemp, iPos, 100 );
                            cTemp := Copy( cTemp, 1, Pos( ' ', cTemp ) - 1 );
                            iPos  := StrToIntDef( cTemp, TUnilabel( oObjTemp ).Font.Size );
                         end
                         else
                         if mm.varB_Mobile_Screen_Landscape then
                         begin
                            iPos  := Pos( 'mobile-h-' , cTemp ) + 9;
                            cTemp := Copy( cTemp, iPos, 100 ) + ' ';
                            cTemp := Copy( cTemp, 1, Pos( ' ', cTemp ) - 1 );
                            iPos  := StrToIntDef( cTemp, TUnilabel( oObjTemp ).Font.Size );
                         end;

                         TUnilabel( oObjTemp ).Font.Size := iPos;
                      end;

                      // caption-dots
                      //
                      // mobile-v  : in MOBILE PORTRAIT MODE
                      // mobile-h  : in MOBILE LANDSCAPE MODE
                      // mobile    : in MOBILE MODE
                      cTemp3 := rc_GetHintProperty( 'caption-dots:', cHint );
                      // v. 3.3.3.0
                      if cTemp3 <> '' then
                      begin
                         cTemp3 := rc_GetHintProperty( 'caption-dots:', cHint );
                         cTemp4 := rc_GetHintProperty( 'caption-dots-default:', cHint );

                         iTemp  := StrToIntDef( ReturnNumbers( cTemp3 ), 0 );

                         bDots  := ( ( Pos( 'mobile-v-', cTemp3 ) > 0 ) and ( mm.varB_Mobile_Screen_Portrait ) ) or
                                   ( ( Pos( 'mobile-h-', cTemp3 ) > 0 ) and ( mm.varB_Mobile_Screen_Landscape ) ) or
                                   ( ( Pos( 'mobile-', cTemp3 ) > 0 )   and ( mm.varB_Mobile_Screen_Portrait ) );

                         if ( bDots ) and ( Length( oObjTemp.Caption ) >= iTemp ) then
                         begin
                             if ( Pos(  '...', oObjTemp.Caption ) = 0 ) then
                                oObjTemp.Hint := rc_SetHintProperty( oObjTemp.Caption, 'caption-dots-default:', oObjTemp.Hint );

                             oObjTemp.Caption := Copy( oObjTemp.Caption, 1, iTemp ) + '...';
                         end
                         else
                         if ( cTemp4 <> '' ) then
                            oObjTemp.Caption := cTemp4;
                      end;
                      // v. 4.0.0.0
                      if ( Pos( 'percent', oObjTemp.Name ) > 0  ) then // or ( Pos( 'dashboard', lowercase(tcomponent(pFrame).name) ) > 0 ) then
                         cTemp3 := cTemp3 ;
                      cTemp3 := rc_GetHintProperty( 'center:', cHint );
                      if cTemp3 <> '' then
                      begin
                         cTemp := 'center:' + cTemp3;
                         if not DynamicAlignment_CENTER( pFrame, oObjTemp, cTemp3, cTemp ) then
                            Break;
                      end;
                   end
                   else
                   if ( oObjTemp is TUniBitBtn ) then
                   begin
                      // caption-hide
                      //
                      // mobile-v  : in MOBILE PORTRAIT MODE
                      // mobile-h  : in MOBILE LANDSCAPE MODE
                      // mobile    : in MOBILE MODE
                      if Pos( 'caption-hide:', cHint ) > 0 then
                      begin
                         cTemp3 := ( rc_GetHintProperty( 'caption-hide:', cHint ) );

                         cCaption := Copy( oObjTemp.Caption, 1, Pos( '</span>', oObjTemp.Caption ) - 1 );
                         cCaption := ReverseStr( cCaption );
                         cCaption := ReverseStr( Copy( cCaption, 1, Pos( '>', cCaption )-1 ) );

                         cTemp4   := rc_GetHintProperty( 'caption:', cHint );

                         TUniControl( oObjTemp ).Caption := StringReplace( oObjTemp.Caption, cCaption, '[-]', [rfReplaceAll] );

                         if ( cTemp3 = 'mobile-v' ) and
                            ( mm.varB_Mobile_Screen_Portrait ) then
                            cTemp4 := ''
                         else
                         if ( cTemp3 = 'mobile-h' ) and
                            ( mm.varB_Mobile_Screen_Landscape ) then
                            cTemp4 := ''
                         else
                         if ( cTemp3 = 'mobile' ) and
                            ( mm.varB_Mobile_Screen ) then // v. 3.3.0.1
                            cTemp4 := '';

                         if cCaption <> '' then
                            TUniControl( oObjTemp ).Caption := StringReplace( oObjTemp.Caption, '[-]' ,cTemp4 , [rfReplaceAll] )
                         else
                         begin
                              cCaption := Copy( oObjTemp.Caption, 1, Pos( '></span>', oObjTemp.Caption ) );
                              cCaption := cCaption + cTemp4 + '</span>';
                              TUniControl( oObjTemp ).Caption := cCaption;
                         end;
                      end;
                   end;

                   cTemp2 := rc_NormalizeHintProperty( oObjTemp.Hint );
                   oObjTemp.Hint := '[[' + cTemp2 + ']]';

                   cTemp2 := cTemp2 + '|';

                   cCmd := cTemp2;

                   iPos2 := Pos( '|' , cTemp2 );

                   While ( iPos2 > 0 ) do
                   begin
                        cTemp  := Trim( Copy( cCmd, 1 , iPos2 ) );
                        cTemp2 := Trim( StringReplace( cCmd, cTemp, '', [rfReplaceAll] ) );

                        cCmd := cTemp2;

                        cTemp  := StringReplace( cTemp, '|', '', [rfReplaceAll] ) + ' ';
                        // v. 3.3.3.1
                        // hide:
                        // mobile-v  : in MOBILE PORTRAIT MODE
                        // mobile-h  : in MOBILE LANDSCAPE MODE
                        // mobile    : in MOBILE MODE
                        // desktop   : in DESKTOP MODE
                        cTemp3 := ( rc_GetHintProperty( 'hide:', cTemp ) );
                        if cTemp3 <> '' then
                        begin
                           if ( cTemp3 = 'mobile-v' ) and
                              ( mm.varB_Mobile_Screen_Portrait ) then
                              oObjTemp.Visible := False
                           else
                           if ( cTemp3 = 'mobile-h' ) and
                              ( mm.varB_Mobile_Screen_Landscape ) then
                              oObjTemp.Visible := False
                           else
                           if ( cTemp3 = 'mobile' ) and
                             ( mm.varB_Mobile_Screen ) then
                             oObjTemp.Visible := False
                           else
                           if ( cTemp3 = 'desktop' ) and
                             ( not mm.varB_Mobile_Screen ) then
                             oObjTemp.Visible := False
                           else
                              oObjTemp.Visible := True;
                        end;

                        cTemp3 := rc_GetHintProperty( 'disable:', cTemp ) ;

                        if cTemp3 <> '' then
                        begin
//                             if ( cTemp3 = 'mobile-v' ) and
//                                ( mm.varB_Mobile_Screen_Portrait ) then
//                             begin
//                                  oObjTemp.Enabled := False;
//                             end
//                             else
//                             if ( cTemp3 = 'mobile-h' ) and
//                                ( mm.varB_Mobile_Screen_Landscape ) then
//                             begin
//                                  oObjTemp.Enabled := False;
//                             end
//                             else
//                              if ( cTemp3 = 'mobile' ) and
//                                ( mm.varB_Mobile_Screen ) then
//                             begin
//                                  oObjTemp.Enabled := False;
//                             end
//                             else
//                             begin
//                                  oObjTemp.Enabled := True;
//                             end;
                        end;

                        if ( oObjTemp.Visible ) and ( oObjTemp.Enabled ) then
                        begin
                            //pos-l:5%
                            if Pos( 'pos-l:', cTemp ) > 0 then
                            begin
                               // on l inux have probles without .HasParent
                               if oObjTemp.HasParent then
                                 oObjTemp2 := TUniControl( oObjTemp.GetParentComponent )
                               else
                                 oObjTemp2 := nil;

                               n := StrToIntDef( ReturnNumbers( cTemp ), 0 );

                               if Pos( '%', cTemp ) > 0 then
                                  x := Trunc(( n / 100 ) * ( oObjTemp2.Width ))
                               else
                                  x := n;

                               oObjTemp.Left := x;
                            end;

                            //pos-r:5%
                            if Pos( 'pos-r:', cTemp ) > 0 then
                            begin
                               // on l inux have probles without .HasParent
                               if oObjTemp.HasParent then
                                 oObjTemp2 := TUniControl( oObjTemp.GetParentComponent )
                               else
                                 oObjTemp2 := nil;

                               n := StrToIntDef( ReturnNumbers( cTemp ), 0 );

                               if Pos( '%', cTemp ) > 0 then
                                  x := Trunc(( n / 100 ) * ( oObjTemp2.Width ))
                               else
                                  x := n;

                               oObjTemp.Left := oObjTemp2.Width - x;
                            end;

                            //pos-t:5%
                            if Pos( 'pos-t:', cTemp ) > 0 then
                            begin
                               // on l inux have probles without .HasParent
                               if oObjTemp.HasParent then
                                 oObjTemp2 := TUniControl( oObjTemp.GetParentComponent )
                               else
                                 oObjTemp2 := nil;

                               n := StrToIntDef( ReturnNumbers( cTemp ), 0 );

                               if Pos( '%', cTemp ) > 0 then
                                  x := Trunc(( n / 100 ) * ( oObjTemp2.Height ))
                               else
                                  x := n;

                               oObjTemp.Top := x;
                            end;

                            //pos-bottom:5%
                            if Pos( 'pos-b:', cTemp ) > 0 then
                            begin
                               // on l inux have probles without .HasParent
                               if oObjTemp.HasParent then
                                 oObjTemp2 := TUniControl( oObjTemp.GetParentComponent )
                               else
                                 oObjTemp2 := nil;

                               n := StrToIntDef( ReturnNumbers( cTemp ), 0 );

                               if Pos( '%', cTemp ) > 0 then
                                  x := Trunc(( n / 100 ) * ( oObjTemp2.Height ))
                               else
                                  x := n;

                               oObjTemp.Top := oObjTemp2.Height - x;
                            end;
                            // v. 4.0.0.0
                            // scale  scale:rcBlock34 x:45% pad:0 5 0 5
                            cTemp3 := rc_GetHintProperty( 'scale:', cTemp );
                            // v. 3.4.0.0
                            if cTemp3 <> '' then
                            begin
                               if ( not ( ( Pos( ' mobile-off', cTemp3 ) > 0 ) and ( mm.varB_Mobile_Screen ) ) ) then
                               begin
                                  cTemp  := StringReplace( cTemp , ' mobile-off', '', [rfReplaceAll] );
                                  cTemp3 := StringReplace( cTemp3, ' mobile-off', '', [rfReplaceAll] );
                                  cTemp3 := Copy( cTemp3, 1, Pos( ' ' , cTemp3 ) - 1 );

                                  oObjTemp2 := nil;

                                  if cTemp3 = 'parent' then
                                  begin
                                     if oObjTemp.HasParent then
                                       oObjTemp2 := TUniControl( oObjTemp.GetParentComponent )
                                     else
                                       oObjTemp2 := nil;
                                  end
                                  else
                                     oObjTemp2 := rc_FindControl( cTemp3, pFrame );

                                  x := 0;
                                  y := 0;

                                  if oObjTemp2 <> nil then
                                  begin
                                     if ( Pos( 'w:', cTemp ) = 0 ) and ( Pos( 'h:', cTemp ) = 0 ) then
                                     begin
                                        cTemp3 := StringReplace( cTemp , 'scale:' , '', [rfReplaceAll] );
                                        cTemp3 := Trim( StringReplace( cTemp3, oObjTemp2.Name , '', [rfReplaceAll] ) );
                                     end
                                     else
                                     begin
                                          cTemp3 := '';
                                          // v. 3.3.0.2
                                          if ( Pos( 'w:', cTemp ) > 0 ) then
                                          begin
                                               cTemp2 := Copy( cTemp, Pos( 'w:' , cTemp ) + 2 , 300 ) + ' ';
                                               cTemp2 := Trim( Copy( cTemp2, 1, Pos( ' ' , cTemp2 ) ) );

                                               if Pos( '-left' , cTemp2 ) > 0 then
                                                  cTemp3 := Trim( Copy( cTemp2, Pos( '-left' , cTemp2 ) , 300 ) + ' ' ); // v. 3.3.3.1

                                               if cTemp3 <> '' then
                                                  cTemp2 := StringReplace( cTemp4, cTemp3, '' , [rfReplaceAll] );

                                               n := StrToIntDef( ReturnNumbers( cTemp2 ), 0 );

                                               iOffSet := 0;
                                               if Pos( ' off:' , cTemp ) > 0 then
                                                  iOffSet := StrToIntDef( ReturnNumbers( Copy( cTemp, Pos( ' off:' , cTemp ) , Pos( ' ' , cTemp ) ) ), 0 );

                                               iWidth := oObjTemp2.Width ;

                                               if Pos( '%', cTemp2 ) > 0 then
                                                  x := Trunc(( n / 100 ) * ( iWidth ))
                                               else
                                                  x := StrToIntDef( cTemp2 , 0 );

                                               x := x - iOffSet;

                                               if cTemp3 <> '' then
                                                  x := x - oObjTemp.Left;
                                          end;
                                          // v. 3.3.0.2
                                          if ( Pos( 'h:', cTemp ) > 0 ) then
                                          begin
                                               cTemp4 := Copy( cTemp, Pos( 'h:' , cTemp ) + 2, 300 ) + ' ';
                                               cTemp4 := Trim( Copy( cTemp4, 1, Pos( ' ' , cTemp4 ) ) );

                                               if Pos( '-top' , cTemp4 ) > 0 then
                                                  cTemp3 := Trim( Copy( cTemp4, Pos( '-top' , cTemp4 ) , 300 ) + ' ' );

                                               if cTemp3 <> '' then
                                                  cTemp4 := StringReplace( cTemp4, cTemp3, '' , [rfReplaceAll] );

                                               n := StrToIntDef( ReturnNumbers( cTemp4 ), 0 );
                                               // v. 3.3.3.1
                                               iHeight := oObjTemp2.Height ;
                                               iOffSet := 0;
                                               if Pos( ' off:' , cTemp ) > 0 then
                                               begin
                                                  cTemp3 := Copy( cTemp, Pos( ' off:' , cTemp ) + 5 ) + '+' ;
                                                  cTemp3 := Copy( cTemp3, 1, Pos( '+', cTemp3 )-1 );
                                                  if ReturnLetters( cTemp3 ) <> '' then
                                                  begin
                                                     oObjTemp2 := nil;
                                                     oObjTemp2 := rc_FindControl( cTemp3, pFrame );
                                                     if oObjTemp2 <> nil then
                                                     begin
                                                        iOffSet := oObjTemp2.Height;
                                                        if Pos( '+', cTemp ) > 0 then
                                                        begin
                                                           cTemp3 := Copy( cTemp, Pos( '+', cTemp ) + 1 ) + ' ';
                                                           cTemp3 := Copy( cTemp3, 1, Pos( ' ', cTemp3 ) - 1 ) ;
                                                           iOffSet := iOffSet + StrToIntDef( cTemp3, 0 );
                                                        end;
                                                     end;
                                                  end
                                                  else
                                                    iOffSet := iOffSet + StrToIntDef( ReturnNumbers( Copy( cTemp, Pos( ' off:' , cTemp ) , Pos( ' ' , cTemp ) ) ), 0 );
                                               end;
                                               // v. 3.3.3.1
                                               //iHeight := oObjTemp2.Height ;

                                               if Pos( '%', cTemp4 ) > 0 then
                                                  y := Trunc(( n / 100 ) * ( iHeight ) )
                                               else
                                                  y := StrToIntDef( cTemp4 , 0 );

                                               y := y - iOffSet;

                                               if cTemp3 <> '' then
                                                  y := y - oObjTemp.Top;
                                          end;
                                     end;
                                  end
                                  else
                                  begin
                                       dm_rc.rc_ShowError( 'SCALE Obj:' + cTemp3 + ' not found.' );
                                       Break;
                                  end;

                                  if x > 0 then
                                     oObjTemp.Width := x ;
                                  if y > 0 then
                                     oObjTemp.Height := y ;

                               end;
                            end; // scale
                            // v. 4.0.0.0
                            cTemp3 := rc_GetHintProperty( 'max-height:', oObjTemp.Hint ) ;
                            if cTemp3 <> '' then
                            begin
                               cTemp3 := cTemp3 + '.';//rc_GetHintProperty( 'max-width:', oObjTemp.Hint ) ;
                               cTemp3 := Copy( cTemp3, 1, Pos( '.', cTemp3 ) - 1 );

                               if ( Pos( 'mobile-v', cTemp3 ) > 0 ) and
                                  ( mm.varB_Mobile_Screen_Portrait ) then
                               begin
                                    cTemp3          := rc_GetHintProperty( 'mobile-v-', cTemp3, true ) ;
                                    x := StrToIntDef( cTemp3, oObjTemp.Height );
                                    if oObjTemp.Height > x then
                                       oObjTemp.Height := x;
                               end
                               else
                               if ( Pos( 'mobile-h', cTemp3 ) > 0 ) and
                                  ( mm.varB_Mobile_Screen_Landscape ) then
                               begin
                                    cTemp3          := rc_GetHintProperty( 'mobile-h-', cTemp3, true ) ;
                                    x := StrToIntDef( cTemp3, oObjTemp.Height );
                                    if oObjTemp.Height > x then
                                       oObjTemp.Height := x;
                               end
                               else
                               if ( Pos( 'mobile-', cTemp3 ) > 0 ) and
                                  ( mm.varB_Mobile_Screen ) then
                               begin
                                    cTemp3          := rc_GetHintProperty( 'mobile-', cTemp3, true ) ;
                                    x := StrToIntDef( cTemp3, oObjTemp.Height );
                                    if oObjTemp.Height > x then
                                       oObjTemp.Height := x;
                               end
                               else
                               //desktop
                               if ( not mm.varB_Mobile_Screen ) then // v. 4.0.0.0 test
                               begin
                                  cTemp3 := cTemp3 + ' ';
                                  cTemp3 := Copy( cTemp3, 1, Pos( ' ', cTemp3 ) - 1 );
                                  if ( StrToIntDef( cTemp3 , -99999) <> -99999 ) then
                                  begin
                                     x  := StrToIntDef( cTemp3, oObjTemp.Height );
                                     if oObjTemp.Height > x then
                                        oObjTemp.Height := x;
                                  end;
                               end;
                            end;
                            cTemp3 := rc_GetHintProperty( 'min-height:', oObjTemp.Hint ) ;
                            if cTemp3 <> '' then
                            begin
                               cTemp3 := cTemp3 + '.';//rc_GetHintProperty( 'max-width:', oObjTemp.Hint ) ;
                               cTemp3 := Copy( cTemp3, 1, Pos( '.', cTemp3 ) - 1 );

                               if ( Pos( 'mobile-v', cTemp3 ) > 0 ) and
                                  ( mm.varB_Mobile_Screen_Portrait ) then
                               begin
                                    cTemp3          := rc_GetHintProperty( 'mobile-v-', cTemp3, true ) ;
                                    x := StrToIntDef( cTemp3, oObjTemp.Height );
                                    if oObjTemp.Height < x then
                                       oObjTemp.Height := x;
                               end
                               else
                               if ( Pos( 'mobile-h', cTemp3 ) > 0 ) and
                                  ( mm.varB_Mobile_Screen_Landscape ) then
                               begin
                                    cTemp3          := rc_GetHintProperty( 'mobile-h-', cTemp3, true ) ;
                                    x := StrToIntDef( cTemp3, oObjTemp.Height );
                                    if oObjTemp.Height < x then
                                       oObjTemp.Height := x;
                               end
                               else
                               if ( Pos( 'mobile-', cTemp3 ) > 0 ) and
                                  ( mm.varB_Mobile_Screen ) then
                               begin
                                    cTemp3          := rc_GetHintProperty( 'mobile-', cTemp3, true ) ;
                                    x   := StrToIntDef( cTemp3, oObjTemp.Height );
                                    if oObjTemp.Height < x then
                                       oObjTemp.Height := x;
                               end
                               else
                               //desktop
                               if ( not mm.varB_Mobile_Screen ) then // v. 4.0.0.0 test
                               begin
                                  cTemp3 := cTemp3 + ' ';
                                  cTemp3 := Copy( cTemp3, 1, Pos( ' ', cTemp3 ) - 1 );
                                  if ( StrToIntDef( cTemp3 , -99999) <> -99999 ) then
                                  begin
                                     x  := StrToIntDef( cTemp3, oObjTemp.Height );
                                     if oObjTemp.Height < x then
                                        oObjTemp.Height := x;
                                  end;
                               end;
                            end;
                            cTemp3 := rc_GetHintProperty( 'height:', oObjTemp.Hint ) ;
                            if cTemp3 <> '' then
                            begin
                               cTemp3 := cTemp3 + '.';//rc_GetHintProperty( 'max-width:', oObjTemp.Hint ) ;
                               cTemp3 := Copy( cTemp3, 1, Pos( '.', cTemp3 ) - 1 );

                               if ( Pos( 'mobile-v', cTemp3 ) > 0 ) and
                                  ( mm.varB_Mobile_Screen_Portrait ) then
                               begin
                                    cTemp3          := rc_GetHintProperty( 'mobile-v-', cTemp3, true ) ;
                                    x := StrToIntDef( cTemp3, oObjTemp.Height );
                                    oObjTemp.Height := x;
                               end
                               else
                               if ( Pos( 'mobile-h', cTemp3 ) > 0 ) and
                                  ( mm.varB_Mobile_Screen_Landscape ) then
                               begin
                                    cTemp3          := rc_GetHintProperty( 'mobile-h-', cTemp3, true ) ;
                                    x := StrToIntDef( cTemp3, oObjTemp.Height );
                                    oObjTemp.Height := x;
                               end
                               else
                               if ( Pos( 'mobile-', cTemp3 ) > 0 ) and
                                  ( mm.varB_Mobile_Screen ) then
                               begin
                                    cTemp3          := rc_GetHintProperty( 'mobile-', cTemp3, true ) ;
                                    x   := StrToIntDef( cTemp3, oObjTemp.Height );
                                    oObjTemp.Height := x;
                               end
                               else
                               //desktop
                               if ( not mm.varB_Mobile_Screen ) then // v. 4.0.0.0 test
                               begin
                                  cTemp3 := cTemp3 + ' ';
                                  cTemp3 := Copy( cTemp3, 1, Pos( ' ', cTemp3 ) - 1 );
                                  if ( StrToIntDef( cTemp3 , -99999) <> -99999 ) then
                                  begin
                                     x  := StrToIntDef( cTemp3, oObjTemp.Height );
                                     oObjTemp.Height := x;
                                  end;
                               end;
                            end;
                            cTemp3 := rc_GetHintProperty( 'max-width:', oObjTemp.Hint ) ;
                            if cTemp3 <> '' then
                            begin
                               cTemp3 := cTemp3 + '.';//rc_GetHintProperty( 'max-width:', oObjTemp.Hint ) ;
                               cTemp3 := Copy( cTemp3, 1, Pos( '.', cTemp3 ) - 1 );

                               if ( Pos( 'mobile-v', cTemp3 ) > 0 ) and
                                  ( mm.varB_Mobile_Screen_Portrait ) then
                               begin
                                    cTemp3          := rc_GetHintProperty( 'mobile-v-', cTemp3, true ) ;
                                    x := StrToIntDef( cTemp3, oObjTemp.Width );
                                    if oObjTemp.Width > x then
                                       oObjTemp.Width := x;
                               end
                               else
                               if ( Pos( 'mobile-h', cTemp3 ) > 0 ) and
                                  ( mm.varB_Mobile_Screen_Landscape ) then
                               begin
                                    cTemp3          := rc_GetHintProperty( 'mobile-h-', cTemp3, true ) ;
                                    x := StrToIntDef( cTemp3, oObjTemp.Width );
                                    if oObjTemp.Width > x then
                                       oObjTemp.Width := x;
                               end
                               else
                               if ( Pos( 'mobile-', cTemp3 ) > 0 ) and
                                  ( mm.varB_Mobile_Screen ) then
                               begin
                                    cTemp3          := rc_GetHintProperty( 'mobile-', cTemp3, true ) ;
                                    x := StrToIntDef( cTemp3, oObjTemp.Width );
                                    if oObjTemp.Width > x then
                                       oObjTemp.Width := x;
                               end
                               else
                               //desktop
                               if ( not mm.varB_Mobile_Screen ) then // v. 4.0.0.0 test
                               begin
                                  cTemp3 := cTemp3 + ' ';
                                  cTemp3 := Copy( cTemp3, 1, Pos( ' ', cTemp3 ) - 1 );
                                  if ( StrToIntDef( cTemp3 , -99999) <> -99999 ) then
                                  begin
                                     x  := StrToIntDef( cTemp3, oObjTemp.Width );
                                     if oObjTemp.Width > x then
                                        oObjTemp.Width := x;
                                  end;
                               end;
                            end;
                            cTemp3 := rc_GetHintProperty( 'min-width:', oObjTemp.Hint ) ;
                            if cTemp3 <> '' then
                            begin
                               cTemp3 := cTemp3 + '.';//rc_GetHintProperty( 'max-width:', oObjTemp.Hint ) ;
                               cTemp3 := Copy( cTemp3, 1, Pos( '.', cTemp3 ) - 1 );

                               if ( Pos( 'mobile-v', cTemp3 ) > 0 ) and
                                  ( mm.varB_Mobile_Screen_Portrait ) then
                               begin
                                    cTemp3          := rc_GetHintProperty( 'mobile-v-', cTemp3, true ) ;
                                    x := StrToIntDef( cTemp3, oObjTemp.Width );
                                    if oObjTemp.Width < x then
                                       oObjTemp.Width := x;
                               end
                               else
                               if ( Pos( 'mobile-h', cTemp3 ) > 0 ) and
                                  ( mm.varB_Mobile_Screen_Landscape ) then
                               begin
                                    cTemp3          := rc_GetHintProperty( 'mobile-h-', cTemp3, true ) ;
                                    x := StrToIntDef( cTemp3, oObjTemp.Width );
                                    if oObjTemp.Width < x then
                                       oObjTemp.Width := x;
                               end
                               else
                               if ( Pos( 'mobile-', cTemp3 ) > 0 ) and
                                  ( mm.varB_Mobile_Screen ) then
                               begin
                                    cTemp3          := rc_GetHintProperty( 'mobile-', cTemp3, true ) ;
                                    x   := StrToIntDef( cTemp3, oObjTemp.Width );
                                    if oObjTemp.Width < x then
                                       oObjTemp.Width := x;
                               end
                               else
                               //desktop
                               if ( not mm.varB_Mobile_Screen ) then // v. 4.0.0.0 test
                               begin
                                  cTemp3 := cTemp3 + ' ';
                                  cTemp3 := Copy( cTemp3, 1, Pos( ' ', cTemp3 ) - 1 );
                                  if ( StrToIntDef( cTemp3 , -99999) <> -99999 ) then
                                  begin
                                     x  := StrToIntDef( cTemp3, oObjTemp.Width );
                                     if oObjTemp.Width < x then
                                        oObjTemp.Width := x;
                                  end;
                               end;
                            end;
                            cTemp3 := rc_GetHintProperty( 'width:', oObjTemp.Hint ) ;
                            if cTemp3 <> '' then
                            begin
                               cTemp3 := cTemp3 + '.';//rc_GetHintProperty( 'max-width:', oObjTemp.Hint ) ;
                               cTemp3 := Copy( cTemp3, 1, Pos( '.', cTemp3 ) - 1 );

                               if ( Pos( 'mobile-v', cTemp3 ) > 0 ) and
                                  ( mm.varB_Mobile_Screen_Portrait ) then
                               begin
                                    cTemp3          := rc_GetHintProperty( 'mobile-v-', cTemp3, true ) ;
                                    x := StrToIntDef( cTemp3, oObjTemp.Width );
                                    oObjTemp.Width := x;
                               end
                               else
                               if ( Pos( 'mobile-h', cTemp3 ) > 0 ) and
                                  ( mm.varB_Mobile_Screen_Landscape ) then
                               begin
                                    cTemp3          := rc_GetHintProperty( 'mobile-h-', cTemp3, true ) ;
                                    x := StrToIntDef( cTemp3, oObjTemp.Width );
                                    oObjTemp.Width := x;
                               end
                               else
                               if ( Pos( 'mobile-', cTemp3 ) > 0 ) and
                                  ( mm.varB_Mobile_Screen ) then
                               begin
                                    cTemp3          := rc_GetHintProperty( 'mobile-', cTemp3, true ) ;
                                    x   := StrToIntDef( cTemp3, oObjTemp.Width );
                                    oObjTemp.Width := x;
                               end
                               else
                               //desktop
                               if ( not mm.varB_Mobile_Screen ) then // v. 4.0.0.0
                               begin
                                  cTemp3 := cTemp3 + ' ';
                                  cTemp3 := Copy( cTemp3, 1, Pos( ' ', cTemp3 ) - 1 );
                                  if ( StrToIntDef( cTemp3 , -99999) <> -99999 ) then
                                  begin
                                     x  := StrToIntDef( cTemp3, oObjTemp.Width );
                                     oObjTemp.Width := x;
                                  end;
                               end;
                            end;
                            // v. 4.0.0.0
                            cTemp3 := rc_GetHintProperty( 'alignment:', oObjTemp.Hint ) ;
                            if ( cTemp3 <> '' ) and ( GetPropInfo( oObjTemp.ClassInfo, 'Alignment') <> nil ) then
                            begin
                               cTemp3 := cTemp3 + '.';
                               cTemp3 := Copy( cTemp3, 1, Pos( '.', cTemp3 ) - 1 );

                               if ( Pos( 'mobile-v-', cTemp3 ) > 0 ) and
                                  ( mm.varB_Mobile_Screen_Portrait ) then
                               begin
                                    cTemp3 := rc_GetHintProperty( 'mobile-v-', cTemp3, true ) ;
                               end
                               else
                               if ( Pos( 'mobile-h-', cTemp3 ) > 0 ) and
                                  ( mm.varB_Mobile_Screen_Landscape ) then
                               begin
                                    cTemp3 := rc_GetHintProperty( 'mobile-h-', cTemp3, true ) ;
                               end
                               else
                               if ( Pos( 'mobile-', cTemp3 ) > 0 ) and
                                  ( mm.varB_Mobile_Screen ) then
                               begin
                                    cTemp3 := rc_GetHintProperty( 'mobile-', cTemp3, true ) ;
                               end
                               else
                               //desktop
                               if ( not mm.varB_Mobile_Screen ) then // v. 4.0.0.0 test
                               begin
                                  cTemp3 := cTemp3 + ' ';
                                  cTemp3 := Copy( cTemp3, 1, Pos( ' ', cTemp3 ) - 1 );
                               end;
                               if ( cTemp3 = 'right' ) then
                                  oObjTemp.Alignment := taRightJustify
                               else
                               if ( cTemp3 = 'left' ) then
                                  oObjTemp.Alignment := taLeftJustify
                               else
                               if ( cTemp3 = 'center' ) then
                                  oObjTemp.Alignment := taCenter;
                            end;
                            // conflito com novo col-attr:
                            cTemp3 := rc_GetHintProperty( 'align:', cTemp );
                            if cTemp3 <> '' then
                            begin
                               cTemp3 := Copy( cTemp3, 1, Pos( ' ' , cTemp3 ) - 1 );

                               if cTemp3 = 'parent' then
                               begin
                                  // on l inux have probles without .HasParent
                                  if oObjTemp.HasParent then
                                    oComponent := oObjTemp.GetParentComponent
                                  else
                                    oComponent := nil;

                                  oObjTemp2   := TUniControl( oComponent );
                               end
                               else
                                  oObjTemp2 := rc_FindControl( cTemp3, pFrame );

                               if oObjTemp2 <> nil then
                               begin
                                   if Pos( 'r:', cTemp ) > 0 then
                                   begin
                                      cTemp3 := Copy( cTemp, Pos( 'r:', cTemp ) + 2, 300 ) + ' ';

                                      if Pos( 'w', cTemp3 ) > 0 then
                                      begin
                                          cTemp4 := Copy( cTemp3, Pos( 'w', cTemp3 ) + 1, 10 );
                                          cTemp4 := Trim( Copy( cTemp4, 1, Pos( ' ', cTemp4 ) - 1 ) );
                                          n := StrToIntDef( cTemp4, 0 );

                                          cTemp3 := StringReplace( cTemp3, cTemp4, '', [rfReplaceAll] );
                                          iRight := oObjTemp.Width * varIIF( Pos( '-w', cTemp3 ) > 0, (-1) , 1 ) + n;
                                      end
                                      else
                                         iRight := StrToIntDef( Copy( cTemp3, 1, Pos( ' ' , cTemp3 ) - 1 ), 0 );

                                      oObjTemp.Left := oObjTemp2.Left + oObjTemp2.Width + iRight;
                                   end;

                                   if Pos( 'l:', cTemp ) > 0 then
                                   begin
                                      cTemp3 := Copy( cTemp, Pos( 'l:', cTemp ) + 2, 300 ) + ' ';

                                      if Pos( 'w', cTemp3 ) > 0 then
                                      begin
                                          cTemp4 := Copy( cTemp3, Pos( 'w', cTemp3 ) + 1, 10 );
                                          cTemp4 := Trim( Copy( cTemp4, 1, Pos( ' ', cTemp4 ) - 1 ) );
                                          n := StrToIntDef( cTemp4, 0 );

                                          cTemp3 := StringReplace( cTemp3, cTemp4, '', [rfReplaceAll] );
                                          iLeft := oObjTemp.Width * varIIF( Pos( '-w', cTemp3 ) > 0, (-1) , 1 ) + n;
                                      end
                                      else
                                         iLeft := StrToIntDef( Copy( cTemp3, 1, Pos( ' ' , cTemp3 ) - 1 ), 0 );

                                      oObjTemp.Left := oObjTemp2.Left + iLeft;
                                   end;

                                   if Pos( 't:', cTemp ) > 0 then
                                   begin
                                      cTemp3 := Copy( cTemp, Pos( 't:', cTemp ) + 2, 300 ) + ' ';

                                      if Pos( 'h', cTemp3 ) > 0 then
                                      begin
                                          cTemp4 := Copy( cTemp3, Pos( 'h', cTemp3 ) + 1, 10 );
                                          cTemp4 := Trim( Copy( cTemp4, 1, Pos( ' ', cTemp4 ) - 1 ) );
                                          n := StrToIntDef( cTemp4, 0 );

                                          cTemp3 := StringReplace( cTemp3, cTemp4, '', [rfReplaceAll] );
                                          iTop := oObjTemp.Height * varIIF( Pos( '-h', cTemp3 ) > 0, (-1) , 1 ) + n;
                                      end
                                      else
                                         iTop := StrToIntDef( Copy( cTemp3, 1, Pos( ' ' , cTemp3 ) - 1 ), 0 );

                                      oObjTemp.Top := oObjTemp2.Top + iTop;
                                   end;

                                   if Pos( 'b:', cTemp ) > 0 then
                                   begin
                                      cTemp3 := Copy( cTemp, Pos( 'b:', cTemp ) + 2, 300 ) + ' ';

                                      if Pos( 'h', cTemp3 ) > 0 then
                                      begin
                                          cTemp4 := Copy( cTemp3, Pos( 'h', cTemp3 ) + 1, 10 );
                                          cTemp4 := Trim( Copy( cTemp4, 1, Pos( ' ', cTemp4 ) - 1 ) );
                                          n := StrToIntDef( cTemp4, 0 );

                                          cTemp3 := StringReplace( cTemp3, cTemp4, '', [rfReplaceAll] );
                                          iBottom := oObjTemp.Height * varIIF( Pos( '-h', cTemp3 ) > 0, (-1) , 1 ) + n;
                                      end
                                      else
                                          iBottom := StrToIntDef( Copy( cTemp3, 1, Pos( ' ' , cTemp3 ) - 1 ), 0 );

                                      oObjTemp.Top := oObjTemp2.Top + oObjTemp2.Height + iBottom;
                                   end;
                               end
                               else
                               begin
                                    dm_rc.rc_ShowError( 'ALIGN Obj:' + cTemp3 + ' not found.' );
                                    Break;
                               end;
                            end;
                            // v. 4.0.0.0
                            cTemp3 := rc_GetHintProperty( 'center:', cTemp );
                            if cTemp3 <> '' then
                               if not DynamicAlignment_CENTER( pFrame, oObjTemp, cTemp3, cTemp ) then
                                  Break;
                        end;
                        iPos2 := Pos( '|' , cCmd );
                   end;
                end;
            end;
         end;
      end;
   except on e:exception do
          begin
               //UniSession.ResumeLayouts();
               dm_rc.rc_ShowSweetAlert( 'Error' , 'rc_DynamicAlignment error(' + varIIF( oObjTemp <> nil, oObjTemp.Name, '' ) + '): ' + e.Message , 'error' );
               //Abort;
          end;
   end;
  //UniSession.ResumeLayouts();
end;

procedure rc_CenterObj(pObj: TObject; pObjParent : TObject; pV : boolean; pH : boolean; pV_OffSet : integer; pH_OffSet : integer );
var
   pWidthParent,
   pHeightParent : integer;
begin
                if ( TUniControl( pObj ).Name = 'rcLabel_percent83' ) then
                   pWidthParent := pWidthParent;

     if pObjParent = nil then
     begin
          pWidthParent  := mm.varI_ScreenWidth ;
          pHeightParent := mm.varI_ScreenHeight;
     end
     else
     begin
          pWidthParent  := TUniControl( pObjParent ).Width;
          pHeightParent := TUniControl( pObjParent ).Height;
     end;

     pWidthParent  := pWidthParent  + pH_OffSet;
     pHeightParent := pHeightParent + pV_OffSet;

     if pH then
     begin
        TUniControl( pObj ).Left := ( pWidthParent div 2 ) - ( TUniControl( pObj ).Width div 2 );
        if TUniControl( pObj ).Left < 0 then
           TUniControl( pObj ).Left := 0;
     end;

     if pV then
     begin
        TUniControl( pObj ).Top  := ( pHeightParent div 2 ) - ( TUniControl ( pObj ).Height div 2 );
        if TUniControl( pObj ).Top < 0 then
           TUniControl( pObj ).Top := 0;
     end;
end;
// v. 3.2.0.4
procedure rc_GenerateRuntimeDebugBlocksFile(pFrame: TObject);
var
  i: Integer;
  IniFile   : TIniFile;
  sCompName : string;
  oObj      : TUniContainerPanel;
begin
  IniFile := TiniFile.Create( ExtractFilePath(Application.ExeName) +'\files\rc-forms\'+ TComponent(pFrame).Name +'.ini' );
  for i := 0 to TComponent(pFrame).ComponentCount - 1 do
  begin
       if (TComponent(pFrame).Components[I] is TUniContainerPanel) then
       begin
            oObj      := TUniContainerPanel( TComponent(pFrame).Components[I] );
            sCompName := oObj.Name;
//            sLabel    := EmptyStr;
//            for j := 0 to TComponent(pFrame).ComponentCount - 1 do
//            begin
//                 if (TComponent(pFrame).Components[j] is TUniLabel) then
//                 begin
//                      if (TUniLabel(TComponent(pFrame).Components[j]).Parent.Name = sCompName ) then
//                      begin
//                           sLabel := TUniLabel(TComponent(pFrame).Components[j]).Caption;
//                           Break;
//                      end;
//                 end;
//            end;
            {escreve a linha no arquivo texto}
            if (Pos('rcBlock', sCompName ) > 0) then
            begin
                 IniFile.WriteString( sCompName , 'cmd' , RemoveLineBreaks( oObj.hint ) ) ;//+ ' ' + sLabel );
            end;
       end;
  end;
end;
// v. 4.0.0.0
procedure rc_Collapse( Sender, pForm : TObject; pObj : TUniControl );
var
   iH, iAccordion, iFirst : integer;
   oObjAccordion, oObjCollapse, oObj : TUniControl;
   bIconOff : boolean;     // v. 4.0.0.0
   cIconOpen, cIconClose,  // v. 4.0.0.0
   cTmp, cTmp2, cTmpTarget, cTmpTargetAccordion, cTargetProcessed : string;
   bTargetClosed : boolean;
begin
    iAccordion := 1;
    oObjAccordion := pObj;
    cTargetProcessed := '';
    bTargetClosed := false;
    iFirst        := 0;
    repeat
       cTmp := rc_GetHintProperty( 'collapse:', oObjAccordion.Hint );
       if cTmp <> '' then
       begin
          // v. 4.0.0.0
          cIconOpen  := '-angle-down';
          cIconClose := '-angle-up';
          if cTmp <> '' then
          begin
              bIconOff   := Pos( 'icons:off', oObjAccordion.Hint ) > 0;
              cIconOpen  := rc_GetHintProperty( 'icons:', oObjAccordion.Hint ) ;
              cIconClose := trim( Copy( cIconOpen, pos( ' ', cIconOpen ) ) );
              cIconClose := Copy( cIconClose , 4 );
              cIconOpen  := Copy( cIconOpen, 1, pos( ' ', cIconOpen ) - 1 );
              cIconOpen  := Copy( cIconOpen , 4 );
          end;

          oObj := TUniControl( TComponent( pForm ).FindComponent( Copy( cTmp, 1, Pos( ' ', cTmp ) - 1 ) ) );
          if oObj <> nil then
          begin
             cTmpTarget := rc_GetHintProperty( 'hr-childs:', oObj.Hint, false, true );
             if Pos( 'off-', cTmp ) > 0 then
                iH := StrToIntDef ( ReturnNumbers( rc_GetHintProperty( 'off-', cTmp, true ) ) , 0 );

             cTmp2 := rc_GetHintProperty( 'expanded-', cTmpTarget, true );
             if ( cTmpTargetAccordion = '' ) then
             begin
                if Pos( 'expanded-', cTmpTarget ) = 0 then
                begin
                   oObj.Hint := rc_SetHintProperty( ' expanded-' + iH.ToString, 'hr-childs:' , oObj.Hint, true );
                   // v. 4.0.0.0
                   //oObjAccordion.caption := StringReplace( oObjAccordion.caption, '-angle-up', '-angle-down' , [rfReplaceAll] );
                   if not bIconOff then
                      oObjAccordion.caption := StringReplace( oObjAccordion.caption, cIconClose, cIconOpen , [rfReplaceAll] );
                   if ( iAccordion = 1 ) and ( iFirst <> -1 ) then bTargetClosed := false;
                end
                else
                begin
                   oObj.Hint := StringReplace( oObj.Hint, ' expanded-' + cTmp2, '', [rfReplaceAll] );
                   // v. 4.0.0.0
                   //oObjAccordion.caption := StringReplace( oObjAccordion.caption, '-angle-down', '-angle-up' , [rfReplaceAll] );
                   if not bIconOff then
                      oObjAccordion.caption := StringReplace( oObjAccordion.caption, cIconOpen, cIconClose , [rfReplaceAll] );
                   bTargetClosed := true;
                end;
             end
             else
             begin
                if ( bTargetClosed )  then
                begin
                   // abriu um, fecha os outros....
                   if ( Pos( 'expanded-', cTmpTarget ) = 0 ) then
                   begin
                      oObj.Hint := rc_SetHintProperty( ' expanded-' + iH.ToString, 'hr-childs:' , oObj.Hint, true );
                      // v. 4.0.0.0
                      //oObjAccordion.caption := StringReplace( oObjAccordion.caption, '-angle-up', '-angle-down' , [rfReplaceAll] );
                      if not bIconOff then
                         oObjAccordion.caption := StringReplace( oObjAccordion.caption, cIconClose, cIconOpen , [rfReplaceAll] );
                   end;
                end;
             end;
          end;
       end;
       cTargetProcessed := cTargetProcessed + ' ' + oObjAccordion.Name;
       if ( iAccordion = 1 ) and ( iFirst <> -1 ) then
       begin
          cTmpTargetAccordion := oObjAccordion.Name;
          iFirst              := StrToIntDef( Copy( cTmpTargetAccordion, Length( cTmpTargetAccordion ) - 1 ), 0 );
          iAccordion          := iFirst;
       end;
       Inc( iAccordion );
       cTmp          := Copy( cTmpTargetAccordion, 1, Length( cTmpTargetAccordion ) - 2 ) + Zeros( IntToStr(iAccordion), 2 ) ;
       oObjAccordion := rc_FindControl( cTmp, pForm );
       if ( oObjAccordion = nil ) and ( iFirst > 1 ) and ( iAccordion > 1 ) and ( Pos( cTmp, cTargetProcessed ) = 0 ) then
       begin
            iFirst     := -1;
            iAccordion := 1;
            cTmp       := Copy( cTmpTargetAccordion, 1, Length( cTmpTargetAccordion ) - 2 ) + Zeros( IntToStr(iAccordion), 2 ) ;
            if Pos( cTmp, cTargetProcessed ) = 0 then
               oObjAccordion := rc_FindControl( cTmp, pForm );
       end;
       if ( Pos( cTmp, cTargetProcessed ) > 0 ) then
       begin
          oObjAccordion := nil;
       end;
    until oObjAccordion = nil;
    dm_rc.rc_ResizeBlocks( pForm, true, true );
end;

end.
