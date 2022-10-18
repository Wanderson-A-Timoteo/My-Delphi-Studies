{$define UNIGUI_VCL} // Comment out this line to turn this project into an ISAPI module

(*
colar UNIGUI_VCL; antes do DEBUG em DELPHI COMPILER

ai vai gerar EXE pra DEBUG
e DLL pra PRODUCAO

    aaaaaaaaaaaaaa        aaaaaaaaaaaaa          aaaaaaaa      aaaaaaaa
    aaaaaaaaaaaaaaaa     aaaaaaaaaaaaaaa         aaaa aaaa    aaaa aaaa
    aaaa         aaaa    aaaa        aaa         aaaa  aaaa  aaaa  aaaa
    aaaa         aaaa    aaaa                    aaaa  aaaa  aaaa  aaaa
    aaaa         aaaa    aaaa                    aaaa   aaaaaaa    aaaa
    aaaaaaaaaaaaaa       aaaa                    aaaa     aaa      aaaa
    aaaaaaaaaaaaaaaa     aaaa                    aaaa              aaaa
    aaaa         aaaa    aaaa                    aaaa              aaaa
    aaaa         aaaa    aaaa        aaa         aaaa              aaaa
    aaaa         aaaa    aaaaaaaaaaaaaaa         aaaa              aaaa
    aaaa         aaaa     aaaaaaaaaaaaa          aaaa              aaaa

    thanks to Felipe DDS !!!

    last version: 4.1.0.0
*)

{$ifndef UNIGUI_VCL}
library
{$else}
program
{$endif}
(*<prj-name*)RadCORE(*prj-name>*);

uses
  {$ifdef MSWINDOWS}
  uniGUIISAPI,
  {$endif }
  Forms,
  //MidasLib, // v. 3.2.0.3
  ServerModule in 'ServerModule.pas' {sm: TUniGUIServerModule},
  MainModule in 'MainModule.pas' {mm: TUniGUIMainModule},
  Main in 'Main.pas' {MainForm: TUniForm},
  untRCMinimal in 'untRCMinimal.pas';

{$R *.res}

{$ifndef UNIGUI_VCL}
exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;
{$endif}

begin
{$ifdef UNIGUI_VCL}
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Tsm.Create(Application);
  Application.Run;
{$endif}
end.

