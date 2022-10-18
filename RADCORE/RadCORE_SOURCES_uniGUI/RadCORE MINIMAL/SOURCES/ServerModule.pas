unit ServerModule;

interface

uses
  Classes, SysUtils, uniGUIServer, uniGUIMainModule, uniGUIApplication, uIdCustomHTTPServer,
  uniGUITypes;

type
  Tsm = class(TUniGUIServerModule)
  private
    { Private declarations }
  protected
    procedure FirstInit; override;
  public
    { Public declarations }
  end;

function sm: Tsm;

implementation

{$R *.dfm}

uses
  UniGUIVars;

function sm: Tsm;
begin
  Result:=Tsm(UniGUIServerInstance);
end;

procedure Tsm.FirstInit;
begin
  InitServerModule(Self);
end;

initialization
  RegisterServerModuleClass(Tsm);
end.
