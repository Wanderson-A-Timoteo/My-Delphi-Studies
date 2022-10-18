unit mkm_func_report; // v. 3.2.0.7

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses, maskutils, Vcl.Imaging.jpeg, uniPanel, DB,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIFrame, uniGUIBaseClasses, uniButton,
  uniCheckBox, uniComboBox, uniListBox, uniURLFrame, uniPageControl,
  //----------[[FORTESREPORT
  RLFilters, RLPDFFilter, RLReport;
  //----------FORTESREPORT]]
  //frxGradient, frxClass, frxDBSet, frxExportBaseDialog, frxExportPDF;

//----------[[FORTESREPORT
procedure rc_fortesReportSavePDF( pFrame : TUniFrame; pForm : TUniform );
procedure rc_fortesReportHeader( pFrame : TUniFrame; pForm : TUniForm );
//----------FORTESREPORT]]
//procedure rc_FastReportHeader( pFrame : TUniFrame; pForm : TUniForm );
//procedure rc_FastReportSavePDF( pFrame : TUniFrame; pForm : TUniform );


implementation

uses uconsts ,   uniGUIVars, MainModule, uniGUIApplication, ServerModule,
  untdm_rc, mkm_func_web;

//----------[[FORTESREPORT
procedure rc_fortesReportSavePDF( pFrame : TUniFrame; pForm : TUniform );
var
   fn : string;
begin
  // Desativa a Barra de Progresso do RLPDFFilter
  TRLPDFFilter( pForm.FindComponent( 'RLPDFFilter' ) ).ShowProgress := False;

  // Desativa a Barra de Progresso e o Dialog do RLReport
  TRLReport( pForm.FindComponent( 'RLReport' ) ).ShowProgress := False;
  TRLReport( pForm.FindComponent( 'RLReport' ) ).PrintDialog := False;

  // Oculta o RLReport no Form
  TRLReport( pForm.FindComponent( 'RLReport' ) ).Visible := False;

  fn := pForm.Name + '_' + FormatDateTime('yyyymmdd_hhmmss', Now() ) + '.pdf';

  //TRLReport( pForm.FindComponent( 'RLReport' ) ).SaveToFile( sm.LocalCachePath + fn );
  //fn := pForm.Name + '_' + FormatDateTime('yyyymmdd_hhmmss', Now() ) + '.pdf';
  //fn := sm.NewCacheFileUrl( False, 'pdf', fn, '', AUrl, True);

  //if WebMode then
  begin
    TRLReport( pForm.FindComponent( 'RLReport' ) ).Prepare;
    UniSession.SendFile( sm.LocalCachePath + fn, fn );
    //UniSession.SendFile( sm.NewCacheFileUrl( False, 'pdf', '', '', AUrl, True ), fn );
  end;
end;
// v. 3.2.0.0
procedure rc_fortesReportHeader( pFrame : TUniFrame; pForm : TUniForm );
var
   I : integer;
begin
  // Desativa a Barra de Progresso do RLPDFFilter
  if TRLPDFFilter( pForm.FindComponent( 'RLPDFFilter' ) ) <> nil then
     TRLPDFFilter( pForm.FindComponent( 'RLPDFFilter' ) ).ShowProgress := False;

  // Desativa a Barra de Progresso e o Dialog do RLReport
  TRLReport( pForm.FindComponent( 'RLReport' ) ).ShowProgress := False;
  TRLReport( pForm.FindComponent( 'RLReport' ) ).PrintDialog := False;

  // Oculta o RLReport no Form
  TRLReport( pForm.FindComponent( 'RLReport' ) ).Visible := False;

  //preencher dados padrao
  if TRLLabel( pForm.FindComponent( 'labAppName' ) ) <> nil then
     TRLLabel( pForm.FindComponent( 'labAppName' ) ).Caption := APP_NAME;

  if TRLLabel( pForm.FindComponent( 'labSite' ) ) <> nil then
     TRLLabel( pForm.FindComponent( 'labSite' ) ).Caption := SOFTWAREHOUSE_SITE;

  // Titulo do Relatorio é o MODELO selecionado na tela de origem
  if TRLLabel( pForm.FindComponent( 'labTitleRep' ) ) <> nil then
     if TUnilistbox( pFrame.FindComponent( 'lbxreportoptions' ) ) <> nil then
        TRLLabel( pForm.FindComponent( 'labTitleRep' ) ).Caption := TUnilistbox( pFrame.FindComponent( 'lbxreportoptions' ) ).Text ;//   lbxReportOptions.ItemIndex TUniComboBox( pFrame.FindComponent( 'cbxModeloRel' ) ).Text;

  // Cabecalho - dados da empresa

  //TRLLabel( pForm.FindComponent( 'labCompanyName' ) ).Caption  := mm.varC_CompanyName;
  if TRLLabel( pForm.FindComponent( 'labCompanyName' ) ) <> nil then
  begin
      TRLLabel( pForm.FindComponent( 'labCompanyName' ) ).Caption  := mm.varC_CompanyName;
  end;

  // cabecalho
  if TUniCheckBox( pFrame.FindComponent( 'chkReportHeader' ) ) <> nil then
  begin
     if TRLBand ( pForm.FindComponent( 'paDataCompany' ) ) <> nil then
        TRLBand ( pForm.FindComponent( 'paDataCompany' ) ).Height := varIIF( not TUniCheckBox( pFrame.FindComponent( 'chkReportHeader' ) ).Checked, 117, 0 );

     if TRLBand ( pForm.FindComponent( 'bandHeader' ) ) <> nil then
         if TUniCheckBox( pFrame.FindComponent( 'chkReportHeader' ) ).Checked then
            TRLBand ( pForm.FindComponent( 'bandHeader' ) ).Height := 58
         else
            TRLBand ( pForm.FindComponent( 'bandHeader' ) ).Height := 58 + 117;
  end;

  //zebrado
  for I := 0 to pForm.ComponentCount - 1 do
  begin
    if ( pForm.Components[I] is TRLBand ) then
    begin
       if TRLBand ( pForm.Components[I] ).BandType = btDetail then
          if TUniCheckBox( pFrame.FindComponent( 'chkReportGreenBar' ) ) <> nil then
             TRLBand ( pForm.Components[I] ).GreenBarPrint := TUniCheckBox( pFrame.FindComponent( 'chkReportGreenBar' ) ).Checked;
    end;
  end;
end;
//----------FORTESREPORT]]
(*
procedure rc_FastReportHeader( pFrame : TUniFrame; pForm : TUniForm );
var
   I : integer;

   pRLLabel : TRLLabel;

   pReport : TfrxReport;
   pMemo : TfrxMemoView;

begin


  // Desativa a Barra de Progresso do RLPDFFilter
//  if TRLPDFFilter( pForm.FindComponent( 'RLPDFFilter' ) ) <> nil then
//     TRLPDFFilter( pForm.FindComponent( 'RLPDFFilter' ) ).ShowProgress := False;

  // Desativa a Barra de Progresso e o Dialog do RLReport
  With TfrxReport( pForm.FindComponent( 'frxReport' ) ) do
  begin
     ShowProgress                       := False;
     PrintOptions.ShowDialog            := False;
     EngineOptions.SilentMode           := True;
     EngineOptions.EnableThreadSafe     := True;
     EngineOptions.DestroyForms         := False;
     EngineOptions.UseGlobalDataSetList := False;
  end;

  //preencher dados padrao
  //
  if TfrxMemoView( pForm.FindComponent( 'labNomeSistema' ) ) <> nil then
     TfrxMemoView( pForm.FindComponent( 'labNomeSistema' ) ).Text := 'Sistema ' + APP_NAME;

  if TfrxMemoView( pForm.FindComponent( 'labSiteEmpresa' ) ) <> nil then
     TfrxMemoView( pForm.FindComponent( 'labSiteEmpresa' ) ).Text := SOFTWAREHOUSE_SITE;

  // Titulo do Relatorio é o MODELO selecionado na tela de origem
  //
  if TfrxMemoView( pForm.FindComponent( 'labTitleRep' ) ) <> nil then
     if TUnilistbox( pFrame.FindComponent( 'lbxreportoptions' ) ) <> nil then
        TfrxMemoView( pForm.FindComponent( 'labTitleRep' ) ).Text := TUnilistbox( pFrame.FindComponent( 'lbxreportoptions' ) ).Text ;//   lbxReportOptions.ItemIndex TUniComboBox( pFrame.FindComponent( 'cbxModeloRel' ) ).Text;

  // Cabecalho - dados da empresa

  //TRLLabel( pForm.FindComponent( 'labCompanyName' ) ).Caption  := mm.varC_CompanyName;
  if TfrxMemoView( pForm.FindComponent( 'labCompanyName' ) ) <> nil then
  begin
      TfrxMemoView( pForm.FindComponent( 'labCompanyName' ) ).Text  := mm.varC_CompanyName;

  end;


  // cabecalho
  if TUniCheckBox( pFrame.FindComponent( 'chkReportHeader' ) ) <> nil then
  begin
     TfrxBand ( pForm.FindComponent( 'paDataCompany' ) ).Height := varIIF( not TUniCheckBox( pFrame.FindComponent( 'chkReportHeader' ) ).Checked, 117, 0 );

     if TUniCheckBox( pFrame.FindComponent( 'chkReportHeader' ) ).Checked then
        TfrxBand ( pForm.FindComponent( 'bandHeader' ) ).Height := 58
     else
        TfrxBand ( pForm.FindComponent( 'bandHeader' ) ).Height := 58 + 117;
  end;

  //zebrado
  //
  for I := 0 to pForm.ComponentCount - 1 do
  begin

    if ( pForm.Components[I] is TRLBand ) then
    begin


       if TfrxBand ( pForm.Components[I] ).ClassName = 'TfrxMasterData'  then
          if TUniCheckBox( pFrame.FindComponent( 'chkReportGreenBar' ) ) <> nil then
             TfrxMemoView( pForm.FindComponent( 'zebrado' ) ).Visible := TUniCheckBox( pFrame.FindComponent( 'chkReportGreenBar' ) ).Checked;

    end;

  end;


end;

procedure rc_FastReportSavePDF( pFrame : TUniFrame; pForm : TUniform );
var
   aUrl,
   fn : string;
begin

  // Desativa a Barra de Progresso do RLPDFFilter
  //TRLPDFFilter( pForm.FindComponent( 'RLPDFFilter' ) ).ShowProgress := False;

  // Desativa a Barra de Progresso e o Dialog do RLReport
  //TRLReport( pForm.FindComponent( 'RLReport' ) ).ShowProgress := False;
  //TRLReport( pForm.FindComponent( 'RLReport' ) ).PrintDialog := False;

  // Oculta o RLReport no Form
  //TRLReport( pForm.FindComponent( 'RLReport' ) ).Visible := False;

  fn := pForm.Name + '_' + FormatDateTime('yyyymmdd_hhmmss', Now() ) + '.pdf';

  //TRLReport( pForm.FindComponent( 'RLReport' ) ).SaveToFile( sm.LocalCachePath + fn );


  With TfrxPDFExport( pForm.FindComponent( 'frxPDFExport' ) ) do
  begin
      Background   := True;
      ShowProgress := False;
      ShowDialog   := False;
      FileName     := sm.LocalCachePath + fn;
      //FileName     := sm.NewCacheFileUrl( False, 'pdf', fn, '', AUrl, True);
      DefaultPath  := '';
  end;

  With TfrxReport( pForm.FindComponent( 'frxReport' ) ) do
  begin

    PreviewOptions.AllowEdit := False;
    PrepareReport;
    Export( TfrxPDFExport( pForm.FindComponent( 'frxPDFExport' ) ) );

  end;

  //UniURLFrame1.URL := AUrl;

  //TRLReport( pForm.FindComponent( 'RLReport' ) ).Prepare;
  UniSession.SendFile( sm.LocalCachePath + fn, fn );


end;
 *)

end.
