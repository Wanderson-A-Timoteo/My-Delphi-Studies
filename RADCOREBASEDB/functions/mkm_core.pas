unit mkm_core; // v. 2.0.0.152


interface

uses
    System.SysUtils, System.Classes ,       System.TypInfo, JSON, DBXJSON, DBXJSONReflect,
    System.DateUtils, math, System.Rtti, System.StrUtils, Vcl.Graphics,
    // v. 2.0.0.141
    // feedback: Mesut from Turkey
    {$ifdef LINUX}
    System.UIConsts,
    {$endif}

    uconsts,
    uconsts_msgs_portuguese,

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

    procedure rc_GetRCProperty( pProp, pProps : string ) : string;


implementation


uses untDM_RADCORE, str_func, mkm_func_web, MainModule, Main;

procedure rc_GetRCProperty( pProp, pProps : string ) : string;
var
   cTmp : string;
   iPos : integer;
begin

    cTmp := '';

    iPos := Pos( pProp, pProps );
    if iPos > 0 then
    begin
       cTmp := pProps;
       cTmp := Trim( StringReplace( cTmp , ']]', '', [rfReplaceAll] ) );
       cTmp := Trim( StringReplace( cTmp , '[[', '', [rfReplaceAll] ) );
       cTmp := Trim( Copy( cTmp, iPos , 200 ) ) + ' ';
       if Pos( '|', cTmp ) > 0 then
          cTmp := Trim( Copy( cTmp, 1, Pos( '|', cTmp ) - 1 ) )
       else
          cTmp := Trim( Copy( cTmp, 1, Pos( ' ', cTmp ) - 1 ) );

    end;

    Result := Trim( cTmp );
end;

end.
