unit mkm_anim;     // v. 3.2.0.7


interface

uses
    System.SysUtils, System.Classes ,       System.TypInfo, JSON, DBXJSON, DBXJSONReflect,
    System.DateUtils, math, System.Rtti, System.StrUtils, Vcl.Graphics,

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
    UniDBRadioGroup, uniDBCheckBox, uniDBImage, uniDBText, uniHTMLFrame;

    // animar panels, forms...
    procedure rc_MoveAnimationForm( moveobj: TUniForm; leftfrom: Integer; leftto: Integer; topfrom: Integer; topto, duration, opacity: Integer; bClose : boolean = false );
    procedure rc_MoveAnimationObj( moveobj: TUniControl; leftfrom, leftto, topfrom, topto, duration, opacity: Integer);

    procedure rc_jQueryAnimate( pObj      : TObject      ;
                                pProp     : string       ; pValue    : string ;
                                pDuration : string       ; pOpacity  : string = '';
                                pLeft     : string = '0' ; pTop      : string = '0';
                                pHeight   : string = '0' ; pWidth    : string = '0' ;
                                pFunction : string = '') ;
                                //pRotate : string = '0' ; pScale     : string = '0' ) ;


    procedure rc_Anim( pObj    : TObject      ; pProp      : string       ; pValue    : string ; pDuration : string;
                       pEase   : TRCGSAPEase = gsEaseNone  ; pEaseValue : string = '0' ; pEaseType : TRCGSAPEaseType = gsEaseTypeOut;
                       pRotate : string = '0' ; pScale     : string = '0' ) ;

    procedure rc_AnimTimeLineCreate( pTimeLineName : string );

    procedure rc_AnimTimeLineAdd( pTimeLineName : string ; pObj    : TObject      ; pProp      : string       ; pValue    : string ; pDuration : string;
                                  pEase   : TRCGSAPEase = gsEaseNone  ; pEaseValue : string = '0' ; pEaseType : TRCGSAPEaseType = gsEaseTypeOut;
                                  pRotate : string = '0' ; pScale     : string = '0' ) ;
    procedure rc_AnimTimeLinePlay( pTimeLineName : string );
    // inspired on http://forums.unigui.com/index.php?/topic/7934-animate-controls-using-greensock-gsap-library/
    procedure rc_LoadGSAPAnimFunctions( pForm : TObject );


implementation


uses untdm_rc, str_func, mkm_func_web, MainModule;

procedure rc_LoadGSAPAnimFunctions( pForm : TObject );
begin
     TUniForm(pForm).Script.Add(
       '         function gsapAnimFormShow(frm)' +
       '         {' +
       '           gsap.set($(''#''+frm), {scale:0.5, rotationX:70, autoAlpha:0, y:-500, z:-500, transformPerspective:600, display:"block"});' +
       '           gsap.to ($(''#''+frm), 0.95, {autoAlpha:1, scale:1, ease:Back.easeOut.config(1.5), delay:0.1});' +
       '           gsap.to ($(''#''+frm), 1.1 , {rotationX:0, y:0, z:0, ease:Back.easeOut.config(1), delay:0.15, clearProps:"transform"});' +
       '         }' +
       '         function gsapAnimZoom(frm)' +
       '         {' +
       '           gsap.to($(''#''+frm), 0.7,{scale:0.1, rotation:0.1, autoAlpha:0, delay: 2});' +
       '           gsap.to($(''#''+frm), 1  , {scale:1, ease:Linear.easeNone, autoRound:false, delay:3});' +
       '           gsap.to($(''#''+frm), 0.7, {autoAlpha:1, rotationX:0, transformOrigin:"50% 50% -35px", delay:3});' +
       '         }' +
       '         function gsapAnimRotateZoom(frm)' +
       '         {' +
       '           gsap.set($(''#''+frm),{scale:0.1, rotation:0.1, autoAlpha:0});' +
       '           gsap.to($(''#''+frm) , 0.4, {autoAlpha:1, delay:0.5});' +
       '           gsap.to($(''#''+frm) , 0.4, {scale:1, ease:Linear.easeNone, autoRound:false, delay:0.5});' +
       '           gsap.to($(''#''+frm) , 0.4, {rotation:360.2, delay:0.5});' +
       '         }'
       );
end;

procedure rc_MoveAnimationForm( moveobj: TUniForm; leftfrom, leftto, topfrom, topto, duration, opacity: Integer; bClose : boolean );
var
  iDuration,
  iOpacity : Integer;
begin
    iDuration := duration;
    iOpacity  := opacity;

    // mov. vertical
    if topfrom <> topto then
    begin
       UniSession.AddJS( moveobj.WebForm.JSName +
                         '.animate({ ' +
                         '    duration: ' + inttostr( iDuration ) + ', ' +
                         '    to: {  y:' + inttostr( topto  ) + ', ' +
                         '    opacity: ' + inttostr( iOpacity  ) + ' } } );')
    end
    else
    begin
       // mov. horizontal
       UniSession.AddJS( moveobj.WebForm.JSName +
                         '.animate({ ' +
                         '    duration: ' + inttostr( iDuration ) + ', ' +
                         '    to: { x:' + inttostr( leftto  ) + ', ' +
                         '    opacity: ' + inttostr( iOpacity  ) + ' } });');
    end;
end;

procedure rc_MoveAnimationObj( moveobj: TUniControl; leftfrom, leftto, topfrom, topto, duration, opacity: Integer);
var
  iDuration,
  iOpacity: Integer;
begin
    iDuration := duration;
    iOpacity  := opacity;

    UniSession.AddJS( TUniControl(moveobj).JSName +
                      '.animate({ duration: ' + inttostr( iDuration ) +
                      ', to: {      x:' + inttostr( leftto  ) +
                      ',            y:' + inttostr( topto  ) +
                      ',      opacity: ' + inttostr( iOpacity  ) + ' } } );');
end;

//animacao com jquery by flavio Motta
procedure rc_jQueryAnimate( pObj      : TObject ;
                            pProp     : string  ; pValue    : string ;
                            pDuration : string  ; pOpacity  : string ;
                            pLeft     : string  ; pTop      : string ;
                            pHeight   : string  ; pWidth    : string ;
                            pFunction : string );
var
   cEase   ,
   cEaseType,
   cRotate ,
   cHeight ,
   cWidth  ,
   cOpacity,
   cFunction,
   cId     : string;
begin

     cEase     := '';
     cEaseType := '';
     cRotate   := '';
     cFunction := '';
     cHeight   := '';
     cWidth    := '';
     cOpacity  := '';


     if pObj is TUniForm then
        cId := TUniForm( pObj ).WebForm.JSId
     else
        cId := TUniControl(pObj).JSId;

     if pFunction <> '' then
        pFunction := ', function() { ' + pFunction + '}';

     UniSession.AddJS( '$("#' + cId + '").animate({ ' +

                          pProp + ': "' + pValue + '"} , ' +
                          pDuration +
                          pFunction +
                       ');');

end;

procedure rc_AnimTimeLineCreate( pTimeLineName : string );
begin
     mm.varC_RCAnimTimeLine := 'let ' + pTimeLineName + ' = gsap.timeline();';
end;
// v. 3.1.0.60
procedure rc_AnimTimeLineAdd( pTimeLineName : string ; pObj    : TObject ; pProp      : string ; pValue    : string ; pDuration : string;
                              pEase   : TRCGSAPEase  ; pEaseValue : string ; pEaseType : TRCGSAPEaseType ;
                              pRotate : string  ; pScale     : string ) ;
var
   cEase   ,
   cEaseType,
   cRotate ,
   cScale  ,
   cId     : string;
begin

     if Pos( 'let ' + pTimeLineName , mm.varC_RCAnimTimeLine ) = 0  then
        //dm_rc.rc_ShowSweetAlertSimple( 'A TimeLine with that name has not been defined:' + pTimeLineName )
        rc_AnimTimeLineCreate( pTimeLineName );
     //else
     begin
         cEase     := '';
         cEaseType := '';
         cRotate   := '';

         if pEase <> gsEaseNone then
         begin
            cEase := 'ease: "' ;

            case pEase of
               gsEasePower1  : cEase := cEase + 'power1';
               gsEasePower2  : cEase := cEase + 'power2';
               gsEasePower3  : cEase := cEase + 'power3';
               gsEasePower4  : cEase := cEase + 'power4';
               gsEaseBack    : cEase := cEase + 'back';
               gsEaseElastic : cEase := cEase + 'elastic';
               gsEaseBounce  : cEase := cEase + 'bounce';
               gsEaseRough   : cEase := cEase + 'rough';
               gsEaseSlow    : cEase := cEase + 'slow';
               gsEaseSteps   : cEase := cEase + 'steps';
               gsEaseCirc    : cEase := cEase + 'circ';
               gsEaseExpo    : cEase := cEase + 'expo';
               gsEaseSine    : cEase := cEase + 'sine';
            end;

            case pEaseType of
               gsEaseTypeIn    : cEaseType := 'in';
               gsEaseTypeOut   : cEaseType := 'out';
               gsEaseTypeInOut : cEaseType := 'inout';
            end;

            cEase := cEase + '.' + cEaseType + '(' + pEaseValue + ')"';

         end;

         if StrToIntDef( pRotate, 0 ) > 0 then
            cRotate := ', rotate: ' + pRotate;

         if StrToIntDef( pScale, 0 ) > 0 then
            cScale  := ', scale: ' + pScale;

         if pObj is TUniForm then
            cId := TUniForm( pObj ).WebForm.JSName
         else
            cId := TUniControl(pObj).JSName;

    //let tl = gsap.timeline(); //create the timeline
    //tl.to(".class1", {x: 100}) //start sequencing
    //  .to(".class2", {y: 100, ease: "elastic"})
    //  .to(".class3", {rotation: 180});

         if Pos( pTimeLineName + '.to' , mm.varC_RCAnimTimeLine ) = 0  then
            mm.varC_RCAnimTimeLine := mm.varC_RCAnimTimeLine +
               pTimeLineName + '.to(' + cId + '_id, {'
         else
            mm.varC_RCAnimTimeLine := mm.varC_RCAnimTimeLine +
               '    .to(' + cId + '_id, {' ;

         mm.varC_RCAnimTimeLine := mm.varC_RCAnimTimeLine +
            '  duration: ' + pDuration + ', ' +
            cEase + ', ' +
            '  '  + pProp + ':' + pValue +
            cRotate +
            cScale +
            '})' ;

     end;
end;

procedure rc_AnimTimeLinePlay( pTimeLineName : string );
begin

     if Pos( 'let ' + pTimeLineName , mm.varC_RCAnimTimeLine ) = 0  then
        dm_rc.rc_ShowSweetAlertSimple( 'A TimeLine with that name has not been defined:' + pTimeLineName )
     else
        uniSession.AddJS( mm.varC_RCAnimTimeLine + ';' );

end;

procedure rc_Anim( pObj    : TObject ; pProp      : string ; pValue    : string ; pDuration : string;
                   pEase   : TRCGSAPEase  ; pEaseValue : string ; pEaseType : TRCGSAPEaseType ;
                   pRotate : string  ; pScale     : string ) ;
var
   cEase   ,
   cEaseType,
   cRotate ,
   cScale  ,
   cId     : string;
begin

//gsap.to(graph, { duration: 2.5,
//                 ease: "back.out(1.7)",
//                 y: -500 });

     cEase     := '';
     cEaseType := '';
     cRotate   := '';

     if pEase <> gsEaseNone then
     begin
        cEase := 'ease: "' ;

        case pEase of
           //gsEaseNone    : cEase := cEase + ;
           gsEasePower1  : cEase := cEase + 'power1';
           gsEasePower2  : cEase := cEase + 'power2';
           gsEasePower3  : cEase := cEase + 'power3';
           gsEasePower4  : cEase := cEase + 'power4';
           gsEaseBack    : cEase := cEase + 'back';
           gsEaseElastic : cEase := cEase + 'elastic';
           gsEaseBounce  : cEase := cEase + 'bounce';
           gsEaseRough   : cEase := cEase + 'rough';
           gsEaseSlow    : cEase := cEase + 'slow';
           gsEaseSteps   : cEase := cEase + 'steps';
           gsEaseCirc    : cEase := cEase + 'circ';
           gsEaseExpo    : cEase := cEase + 'expo';
           gsEaseSine    : cEase := cEase + 'sine';
        end;

        case pEaseType of
           gsEaseTypeIn    : cEaseType := 'in';
           gsEaseTypeOut   : cEaseType := 'out';
           gsEaseTypeInOut : cEaseType := 'inout';
        end;

        cEase := cEase + '.' + cEaseType + '(' + pEaseValue + ')"';

     end;

     if StrToIntDef( pRotate, 0 ) > 0 then
        cRotate := ', rotate: ' + pRotate;

     if StrToIntDef( pScale, 0 ) > 0 then
        cScale  := ', scale: ' + pScale;

     if pObj is TUniForm then
        cId := TUniForm( pObj ).WebForm.JSName
     else
        cId := TUniControl(pObj).JSName;

     UniSession.AddJS(
        'gsap.to(' + cId + '_id, {' +
        '  duration: ' + pDuration + ', ' +
        cEase + ', ' +
        '  '  + pProp + ':' + pValue +
        cRotate +
        cScale +
        '});' );

end;


end.
