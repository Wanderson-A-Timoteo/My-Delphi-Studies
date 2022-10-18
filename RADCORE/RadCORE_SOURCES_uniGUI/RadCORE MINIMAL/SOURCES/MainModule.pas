unit MainModule;

interface
// v. 3.2.0.3
uses
  uniGUIMainModule, SysUtils, Classes, UniPageControl, uniGUITypes, uniGUIForm;
  //FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  //FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client;

type
  Tmm = class(TUniGUIMainModule)
    procedure UniGUIMainModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    varB_DefaulPageBar,
    varB_iOS,
    varB_Android,
    varB_Desktop,
    varB_Tablet,
    varB_Screen_LandScape,
    varB_Mobile_Screen,
    varB_Mobile_Screen_Portrait,
    varB_Mobile_Screen_Landscape,
    varB_Resizing: Boolean;

    varI_BlockWidth,
    varI_ScreenWidth,
    varI_ScreenHeight,
    varI_TabIni,
    varI_TabEnd: Integer;

    oPgGeneral: TUniPageControl;

    uPlat: TUniPlatforms;

    varC_Form_Modal, varC_Form_Detail: TUniForm;

    CONFIG_LAYOUT_GRIDBLOCK_OFFSET,
    MSG_ERROR,MSG_INFO,
    MSG_WARNING,
    MSG_DANGER,
    MSG_SUCCESS,
    VALUE_YES: string;
  end;

const
     // v. 3.2.0.2 // bugfix
     BS_COMPONENTS = 'bslabel bschk bsswt bsrgp bstabs bspills bsh1 bsh2 bsh3 bsh4 bsh5 bsh6 bsqrcode bscarousel bsvideo bsimg bshint bsalert rcalert rcfeature' +
                     'bsbnt bsedit bsdate bsemail bspassword bsmemo bsbtngroup bscardtabs bscard bscardheader bscardfooter';

function mm: Tmm;

implementation

{$R *.dfm}

uses
  UniGUIVars, ServerModule, uniGUIApplication, untRCMinimal;

function mm: Tmm;
begin
  Result := Tmm(UniApplication.UniMainModule)
end;

procedure Tmm.UniGUIMainModuleCreate(Sender: TObject);
begin
     // v. 4.0.0.0
     rc_GetDeviceType;
end;

initialization

RegisterMainModuleClass(Tmm);

end.
