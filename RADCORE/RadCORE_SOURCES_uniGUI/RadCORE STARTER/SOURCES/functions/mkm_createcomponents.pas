unit mkm_createcomponents; // v. 4.0.0.0

interface

uses
    System.SysUtils, System.Classes ,       System.TypInfo, JSON, DBXJSON, DBXJSONReflect, // v. 4.0.0.0
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
    // v. 4.0.0.0
    procedure rc_ClearBlocks( pForm : TObject; p1 : integer = 0; p2 : integer = 0);
    function rc_CreateBlock( pForm:TObject;
                             pParent:TuniControl;
                             pNum:integer;
                             pW:integer=100;
                             pH:integer=30;
                             pHint:string = '[[cols:12]]' ):TUniContainerPanel;
    function rc_CreateContainer( pForm:TObject;
                                 pParent:TuniControl;
                                 pName:string;
                                 pW:integer=100;
                                 pH:integer=30;
                                 pX:integer=0;
                                 pY:integer=0;
                                 pHint:string = '' ):TUniContainerPanel;
    function rc_CreatePanel( pForm:TObject;
                                 pParent:TuniControl;
                                 pName:string;
                                 pW:integer=100;
                                 pH:integer=30;
                                 pX:integer=0;
                                 pY:integer=0;
                                 pHint:string = '' ):TUniPanel;
    function rc_CreateLabel( pForm:TObject;
                             pParent:TuniControl;
                             pName:string;
                             pW:integer=100;
                             pH:integer=30;
                             pX:integer=0;
                             pY:integer=0;
                             pHint:string = '' ):TUniLabel;
    function rc_CreateDBText( pForm:TObject;
                              pParent:TuniControl;
                              pName:string;
                              pDatasource:TDataSource;
                              pDatafield:string;
                              pW:integer=100;
                              pH:integer=30;
                              pX:integer=0;
                              pY:integer=0;
                              pHint:string = '' ):TUniDBText;
    function rc_CreateEdit( pForm:TObject;
                            pParent:TuniControl;
                            pName:string;
                            pW:integer=100;
                            pH:integer=30;
                            pX:integer=0;
                            pY:integer=0;
                            pHint:string = '' ):TUniEdit;
    function rc_CreateDBEdit( pForm:TObject;
                              pParent:TuniControl;
                              pName:string;
                              pDatasource:TDataSource;
                              pDatafield:string;
                              pW:integer=100;
                              pH:integer=30;
                              pX:integer=0;
                              pY:integer=0;
                              pHint:string = '' ):TUniDBEdit;
    function rc_CreateMemo( pForm:TObject;
                            pParent:TuniControl;
                            pName:string;
                            pW:integer=100;
                            pH:integer=30;
                            pX:integer=0;
                            pY:integer=0;
                            pHint:string = '' ):TUniMemo;
    function rc_CreateDBMemo( pForm:TObject;
                              pParent:TuniControl;
                              pName:string;
                              pDatasource:TDataSource;
                              pDatafield:string;
                              pW:integer=100;
                              pH:integer=30;
                              pX:integer=0;
                              pY:integer=0;
                              pHint:string = '' ):TUniDBMemo;
    // v. 4.0.0.6
    function rc_CreateScrollBox( pForm:TObject;
                                 pParent:TuniControl;
                                 pName:string;
                                 pW:integer=100;
                                 pH:integer=30;
                                 pX:integer=0;
                                 pY:integer=0;
                                 pHint:string = '' ):TUniScrollBox;


implementation

uses untdm_rc, str_func, mkm_func_web, MainModule, Main, mkm_gridblock, mkm_layout;

procedure rc_ClearBlocks( pForm : TObject; p1 : integer; p2 : integer);
var
   i : integer;
   pComp : TUniContainerPanel;
begin
   if p1 = 0 then p1 := 1;
   if p2 = 0 then p2 := 1000;
   for I := p1 to p2 do
   begin
        pComp := TUniContainerPanel( TComponent( pForm ).FindComponent( 'rcBlock' + ( i ).tostring ) );
        if pComp <> nil then
        begin
           pComp.Visible := False;
           FreeAndNil( pComp );
        end;
   end;
end;

function rc_CreateBlock( pForm:TObject; pParent:TuniControl; pNum:integer; pW:integer; pH:integer; pHint:string ):TUniContainerPanel;
var
   i : integer;
   pComp : TUniContainerPanel;
begin
   i := pNum;
   Result := nil;
   try
      pComp := TUniContainerPanel( TComponent( pForm ).FindComponent( 'rcBlock' + ( i ).tostring ) );
      if pComp = nil then
      begin
         pComp        := TUniContainerPanel.Create( TComponent(pForm) );
         pComp.name   := 'rcBlock' + i.ToString;
      end;
      pComp.Parent := pParent;
      pComp.Width  := pW;
      pComp.Height := pH;
      pComp.Color  := clBtnFace;
      pComp.Hint   := pHint;
      Result        := pComp;
   except on e:exception do
          begin
               dm_rc.rc_ShowError('rc_CreateBlock Error: ' + e.Message);
          end;
   end;
end;

function rc_CreateContainer( pForm:TObject; pParent:TuniControl; pName:string; pW:integer; pH:integer; pX:integer; pY:integer; pHint:string ):TUniContainerPanel;
var
   i : integer;
   pComp : TUniContainerPanel;
begin
   Result := nil;
   try
      pComp := TUniContainerPanel( TComponent( pForm ).FindComponent( 'rcBlock' + pName) );
      if pComp = nil then
      begin
         pComp        := TUniContainerPanel.Create( TComponent(pForm) );
         pComp.name   := 'rcContainer_' + pName;
      end;
      pComp.Parent := pParent;
      pComp.Width  := pW;
      pComp.Height := pH;
      pComp.Left   := pX;
      pComp.Top    := pY;
      pComp.Color  := clBtnFace;
      pComp.Hint   := pHint;
      Result        := pComp;
   except on e:exception do
          begin
               dm_rc.rc_ShowError('rc_CreateContainer Error: ' + e.Message);
          end;
   end;
end;

function rc_CreatePanel( pForm:TObject; pParent:TuniControl; pName:string; pW:integer; pH:integer; pX:integer; pY:integer; pHint:string ):TUniPanel;
var
   i : integer;
   pComp : TUniPanel;
begin
   Result := nil;
   try
      pComp := TUniPanel( TComponent( pForm ).FindComponent( 'rcPanel_' + pName ) );
      if pComp = nil then
      begin
         pComp        := TUniPanel.Create( TComponent(pForm) );
         pComp.name   := 'rcPanel_' + pName;
      end;
      pComp.Parent := pParent;
      pComp.Width  := pW;
      pComp.Height := pH;
      pComp.Left   := pX;
      pComp.Top    := pY;
      pComp.Color  := clBtnFace;
      pComp.Hint   := pHint;
      Result        := pComp;
   except on e:exception do
          begin
               dm_rc.rc_ShowError('rc_CreatePanel Error: ' + e.Message);
          end;
   end;
end;

function rc_CreateLabel( pForm:TObject; pParent:TuniControl; pName:string; pW:integer; pH:integer; pX:integer; pY:integer; pHint:string ):TUniLabel;
var
   i : integer;
   pComp : TUniLabel;
begin
   Result := nil;
   try
      pComp := TUniLabel( TComponent( pForm ).FindComponent( 'rcLabel_' + pName) );
      if pComp = nil then
      begin
         pComp        := TUniLabel.Create( TComponent(pForm) );
         pComp.name   := 'rcLabel_' + pName;
      end;
      pComp.Parent := pParent;
      pComp.Width  := pW;
      pComp.Height := pH;
      pComp.Left   := pX;
      pComp.Top    := pY;
      pComp.Hint   := pHint;
      Result       := pComp;
   except on e:exception do
          begin
               dm_rc.rc_ShowError('rc_CreateLabel Error: ' + e.Message);
          end;
   end;
end;

function rc_CreateDBText( pForm:TObject; pParent:TuniControl; pName:string; pDatasource:TDataSource; pDatafield:string; pW:integer; pH:integer; pX:integer; pY:integer; pHint:string ):TUniDBText;
var
   i : integer;
   pComp : TUniDBText;
begin
   Result := nil;
   try
      pComp := TUniDBText( TComponent( pForm ).FindComponent( 'rcDBText_' + pName) );
      if pComp = nil then
      begin
         pComp            := TUniDBText.Create( TComponent(pForm) );
         pComp.name       := 'rcDBText_' + pName;
      end;
      pComp.Parent     := pParent;
      pComp.DataSource := pDatasource;
      pComp.DataField  := pDatafield;
      pComp.Width      := pW;
      pComp.Height     := pH;
      pComp.Left       := pX;
      pComp.Top        := pY;
      pComp.Hint       := pHint;
      Result           := pComp;
   except on e:exception do
          begin
               dm_rc.rc_ShowError('rc_CreateDBText Error: ' + e.Message);
          end;
   end;
end;

function rc_CreateEdit( pForm:TObject; pParent:TuniControl; pName:string; pW:integer; pH:integer; pX:integer; pY:integer; pHint:string ):TUniEdit;
var
   i : integer;
   pComp : TUniEdit;
begin
   Result := nil;
   try
      pComp := TUniEdit( TComponent( pForm ).FindComponent( 'rcEdit_' + pName) );
      if pComp = nil then
      begin
         pComp            := TUniEdit.Create( TComponent(pForm) );
         pComp.name       := 'rcEdit_' + pName;
      end;
      pComp.Parent     := pParent;
      pComp.Width      := pW;
      pComp.Height     := pH;
      pComp.Left       := pX;
      pComp.Top        := pY;
      pComp.Hint       := pHint;
      Result           := pComp;
   except on e:exception do
          begin
               dm_rc.rc_ShowError('rc_CreateEdit Error: ' + e.Message);
          end;
   end;
end;

function rc_CreateDBEdit( pForm:TObject; pParent:TuniControl; pName:string; pDatasource:TDataSource; pDatafield:string; pW:integer; pH:integer; pX:integer; pY:integer; pHint:string ):TUniDBEdit;
var
   i : integer;
   pComp : TUniDBEdit;
begin
   Result := nil;
   try
      pComp := TUniDBEdit( TComponent( pForm ).FindComponent( 'rcDBEdit_' + pName) );
      if pComp = nil then
      begin
         pComp            := TUniDBEdit.Create( TComponent(pForm) );
         pComp.name       := 'rcDBEdit_' + pName;
      end;
      pComp.Parent     := pParent;
      pComp.DataSource := pDatasource;
      pComp.DataField  := pDatafield;
      pComp.Width      := pW;
      pComp.Height     := pH;
      pComp.Left       := pX;
      pComp.Top        := pY;
      pComp.Hint       := pHint;
      Result           := pComp;
   except on e:exception do
          begin
               dm_rc.rc_ShowError('rc_CreateDBEdit Error: ' + e.Message);
          end;
   end;
end;

function rc_CreateMemo( pForm:TObject; pParent:TuniControl; pName:string; pW:integer; pH:integer; pX:integer; pY:integer; pHint:string ):TUniMemo;
var
   i : integer;
   pComp : TUniMemo;
begin
   Result := nil;
   try
      pComp := TUniMemo( TComponent( pForm ).FindComponent( 'rcMemo_' + pName) );
      if pComp = nil then
      begin
         pComp            := TUniMemo.Create( TComponent(pForm) );
         pComp.name       := 'rcMemo_' + pName;
      end;
      pComp.Parent     := pParent;
      pComp.Width      := pW;
      pComp.Height     := pH;
      pComp.Left       := pX;
      pComp.Top        := pY;
      pComp.Hint       := pHint;
      Result           := pComp;
   except on e:exception do
          begin
               dm_rc.rc_ShowError('rc_CreateMemo Error: ' + e.Message);
          end;
   end;
end;

function rc_CreateDBMemo( pForm:TObject; pParent:TuniControl; pName:string; pDatasource:TDataSource; pDatafield:string; pW:integer; pH:integer; pX:integer; pY:integer; pHint:string ):TUniDBMemo;
var
   i : integer;
   pComp : TUniDBMemo;
begin
   Result := nil;
   try
      pComp := TUniDBMemo( TComponent( pForm ).FindComponent( 'rcDBMemo_' + pName) );
      if pComp = nil then
      begin
         pComp            := TUniDBMemo.Create( TComponent(pForm) );
         pComp.name       := 'rcDBMemo_' + pName;
      end;
      pComp.Parent     := pParent;
      pComp.DataSource := pDatasource;
      pComp.DataField  := pDatafield;
      pComp.Width      := pW;
      pComp.Height     := pH;
      pComp.Left       := pX;
      pComp.Top        := pY;
      pComp.Hint       := pHint;
      Result           := pComp;
   except on e:exception do
          begin
               dm_rc.rc_ShowError('rc_CreateDBMemo Error: ' + e.Message);
          end;
   end;
end;
// v. 4.0.0.6
function rc_CreateScrollBox( pForm:TObject; pParent:TuniControl; pName:string; pW:integer; pH:integer; pX:integer; pY:integer; pHint:string ):TUniScrollBox;
var
   i : integer;
   pComp : TUniScrollBox;
begin
   Result := nil;
   try
      pComp := TUniScrollBox( TComponent( pForm ).FindComponent( 'rcSbox_' + pName) );
      if pComp = nil then
      begin
         pComp            := TUniScrollBox.Create( TComponent(pForm) );
         pComp.name       := 'rcSBox_' + pName;
      end;
      pComp.Parent     := pParent;
      pComp.Width      := pW;
      pComp.Height     := pH;
      pComp.Left       := pX;
      pComp.Top        := pY;
      pComp.Hint       := pHint;
      Result           := pComp;
   except on e:exception do
          begin
               dm_rc.rc_ShowError('rc_CreateScrollBox Error: ' + e.Message);
          end;
   end;
end;

end.
