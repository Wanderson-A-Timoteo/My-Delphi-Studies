unit untfrmBaseReportMenu; // v. 3.3.0.1

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  System.StrUtils, Maskutils,  uniSpeedButton,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, untFrmBase, uniGUIBaseClasses, uniScrollBox,
  uniPanel, uniPageControl, uniBasicGrid, uniDBGrid, uniEdit, uniDBEdit,
  uniLabel, Data.DB, uniButton, uniBitBtn, uniMultiItem, uniComboBox,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uniDateTimePicker, uniDBDateTimePicker, uniCheckBox, uniMenuButton, Vcl.Menus, uniMainMenu,
  uniURLFrame, uniListBox, uniHTMLFrame;

type
  TfrmBaseReportMenu = class(TfrmBase)
    dsMaster: TDataSource;
    dsSearchMaster: TDataSource;
    sqlSearchMaster: TFDQuery;
    sqlMaster: TFDQuery;
    labState: TUniLabel;
    popMenuOptions: TUniPopupMenu;
    btnOptions: TUniBitBtn;
    btnExit: TUniBitBtn;
    btnSaveReport: TUniBitBtn;
    btnProcessReport: TUniBitBtn;
    pgBaseCadControl: TUniPageControl;
    tabSearch: TUniTabSheet;
    paBaseRegSearch: TUniContainerPanel;
    sbox: TUniScrollBox;
    tabReport: TUniTabSheet;
    paBaseRegData1: TUniContainerPanel;
    UniURLFrameReport: TUniURLFrame;
    paRelatorioOpcoes: TUniContainerPanel;
    paReportFilters: TUniContainerPanel;
    labTitleForm: TUniLabel;
    mem_Master: TFDMemTable;
    rcBlock80: TUniContainerPanel;
    rcBlock10: TUniContainerPanel;
    rcBlock100: TUniContainerPanel;
    UniContainerPanel3: TUniContainerPanel;
    UniLabel3: TUniLabel;
    paOpcoes: TUniPanel;
    lbxReportOptions: TUniListBox;
    rcBlock3: TUniContainerPanel;
    UniLabel1: TUniLabel;
    paRepFilters: TUniPanel;
    paReportPeriod: TUniPanel;
    rcBlock15: TUniContainerPanel;
    labReportPeriod: TUniLabel;
    cbxSearchCRUDPeriod: TUniComboBox;
    rcBlock20: TUniContainerPanel;
    labReportFieldFilter: TUniLabel;
    cbxSearchCRUDFieldDate: TUniComboBox;
    cbxSearchCRUDFieldDate_Fields: TUniComboBox;
    rcBlock25: TUniContainerPanel;
    labDtIni: TUniLabel;
    edSearchCRUDDtIni: TUniEdit;
    rcBlock30: TUniContainerPanel;
    labDtFim: TUniLabel;
    edSearchCRUDDtEnd: TUniEdit;
    cbxModelReport_form: TUniComboBox;
    chkReportGreenBar: TUniCheckBox;
    chkReportHeader: TUniCheckBox;
    paOutrasOpcoes: TUniPanel;
    UniListBox1: TUniListBox;
    rcBlock110: TUniContainerPanel;
    UniLabel2: TUniLabel;
    UniHTMLFrame1: TUniHTMLFrame;
    ed_Table_ItemSel: TUniEdit;
    ed_FormOrigin: TUniEdit;
    ed_FormOrigin_Tab: TUniEdit;
    ed_Table_Status: TUniEdit;
    ed_Order_Search: TUniEdit;
    ed_Where_Search: TUniEdit;
    ed_CodMaster: TUniEdit;
    ed_PK: TUniEdit;
    ed_FieldMasks: TUniEdit;
    ed_OldPKValue: TUniEdit;
    ed_Table_Status_OLD: TUniEdit;
    ed_GenNextID_OnNew: TUniEdit;
    ed_AskNewRec_AfterPost: TUniEdit;
    labExit: TUniLabel;
    labShowReport: TUniLabel;
    labDownloadReport: TUniLabel;
    labOptionsReport: TUniLabel;
    procedure UniFrameCreate(Sender: TObject);
    procedure UniFrameDestroy(Sender: TObject);
    procedure cbxSearchCRUDFieldDateChange(Sender: TObject);
    procedure cbxSearchCRUDPeriodChange(Sender: TObject);
    procedure btnOptionsClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure lbxReportOptionsChange(Sender: TObject);
    procedure btnProcessReportClick(Sender: TObject);
    procedure dsMasterStateChange(Sender: TObject);
    procedure btnSaveReportClick(Sender: TObject);
    procedure pgBaseCadControlChange(Sender: TObject);
    procedure UniFrameReady(Sender: TObject);
    procedure labExitClick(Sender: TObject);
    procedure labShowReportClick(Sender: TObject);
    procedure labDownloadReportClick(Sender: TObject);
    procedure labOptionsReportClick(Sender: TObject);
  // v. 3.3.0.1
  private
    { Private declarations }
    cMSG_SELECT_REPORT,
    cMSG_PREPARING_REPORT : string;
  public
    { Public declarations }
    procedure rc_CloseQuerys;
  end;

implementation

{$R *.dfm}

uses Main, MainModule, uconsts, mkm_func_web, ServerModule, untdm_rc,
  mkm_func_report, untFrmLookUp_Lite, mkm_layout, mkm_translate;

procedure TfrmBaseReportMenu.btnOptionsClick(Sender: TObject);
begin
  inherited;

  if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;

  popMenuOptions.PopupBy( TUniButton( sender ) );
end;

procedure TfrmBaseReportMenu.btnSaveReportClick(Sender: TObject);
begin
  inherited;

  if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;
end;

procedure TfrmBaseReportMenu.btnProcessReportClick(Sender: TObject);
begin
  inherited;

  if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;

  // ao selecionar um item no LISTBOX( opcoes de relatorio ) é selecionado o item
  // equivalente no combobox contendo o NOME do FORM
  if lbxReportOptions.Items.Count - 1 > 0 then
  begin
     if ( cbxModelReport_form.Text = '' ) then
     begin
        dm_rc.rc_ShowMessage( cMSG_SELECT_REPORT );
        Abort;
     end;
  end
  else
  begin
      lbxReportOptions.ItemIndex := 0;
      cbxModelReport_form.ItemIndex := 0;
  end;

  mm.varC_Frame_ReportMenu := Self;

  //   durante o procssamento do relatorio...pode haver congelamento( ainda estou estudando isso )
  //   mas percebi que comentando a linha abaixo.. a tela permance ativa...permitindo um click
  //   e isso, em teoria, evita o congelamento
  //   estou estudando criar um servidor de impressao( com RDW )
  MainForm.ShowMask( cMSG_PREPARING_REPORT );
  UniSession.Synchronize();
end;

procedure TfrmBaseReportMenu.btnExitClick(Sender: TObject);
var
   I : integer;
begin
  inherited;

  if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;

  ed_Table_Status.Text := '';

  if pgBaseCadControl.ActivePage = tabReport then
     pgBaseCadControl.ActivePage := tabSearch
  else
  begin
     // fechar querys abertas mas nao fechar a de consulta padrao
     for I := 0 to Self.ComponentCount - 1 do
     begin
       if Self.Components[I] is TFDQuery then
       begin
          if TFDQuery( Self.Components[I] ).Name <> 'sqlSearchMaster' then
          begin
             TFDQuery( Self.Components[I] ).Cancel;
             TFDQuery( Self.Components[I] ).Close;
          end;
       end
       else
       if Self.Components[I] is TDataSource then
       begin
          if TDataSource( Self.Components[I] ).DataSet.Name <> 'sqlSearchMaster' then
          begin
             TDataSource( Self.Components[I] ).DataSet.Cancel;
             TDataSource( Self.Components[I] ).DataSet.Close;
          end;
       end;
     end;

     if mm.oPgGeneral <> nil then
        mm.oPgGeneral.ActivePage.Close;

  end;
end;

procedure TfrmBaseReportMenu.cbxSearchCRUDFieldDateChange(Sender: TObject);
begin
  inherited;
  cbxSearchCRUDFieldDate_Fields.ItemIndex := cbxSearchCRUDFieldDate.ItemIndex;
end;

procedure TfrmBaseReportMenu.cbxSearchCRUDPeriodChange(Sender: TObject);
begin
  inherited;
  dm_rc.rc_ReportDateInterval( cbxSearchCRUDPeriod.Text );

  edSearchCRUDDtIni.Text := DateToStr( mm.varD_DtIni );
  edSearchCRUDDtEnd.Text := DateToStr( mm.varD_DtEnd );
end;

procedure TfrmBaseReportMenu.dsMasterStateChange(Sender: TObject);
begin
  inherited;

  dm_rc.rc_BootStrapRender( self );
  //ajustar mascaras de data
  dm_rc.rc_ApplyEditMasks( Self );
end;

procedure TfrmBaseReportMenu.UniFrameCreate(Sender: TObject);
begin

  inherited;

    Self.Color             := StringToColor( mm.CONFIG_LAYOUT_BG_COLOR );
    //paBaseTop.Color        := clWhite;
    paBaseBackGround.Color := clWhite;

    btnOptions.Enabled := ( popMenuOptions.Items.Count > 0 );

    paOutrasOpcoes.Height := 100;

    rc_RenderLayout( Self );

    // configurar lookups...mascaras...etc.. preparar query [[fields]]...
    // adjust the lookup tables according to the query name
    dm_rc.rc_RenderLookUpControls( Self );

    // deixar  invisivel pra ganhar mais espaço vertical
    tabReport.TabVisible := false;
    tabSearch.TabVisible := false;
    pgBaseCadControl.TabBarVisible := false;

    if Self.FindComponent('pgComplementData' ) <> nil then
       if TUniPageControl( Self.FindComponent('pgComplementData' ) ).Pages[0].TabVisible then
          TUniPageControl( Self.FindComponent('pgComplementData' ) ).ActivePageIndex := 0;

    pgBaseCadControl.ActivePage := tabSearch;

    // no modelo de menu de relatorio..uso a tabela temporaria: tb_reports
    // ela fica em edição enquanto estamos usando o menu de impressão

    // ao entrar na tela setar os EDITs que guardam dados
    // referente ao FORM atual
    Self.ed_Table_ItemSel.Text  := mm.varC_Table_Search  ;
    Self.ed_Where_Search.Text   := mm.varC_SearchWhere ;
    Self.ed_Order_Search.Text   := mm.varC_SearchOrder ;
    Self.ed_FormOrigin.Text     := mm.varC_FormSource_Search ;
    Self.ed_FormOrigin_Tab.Text := mm.varC_Selected_FormFrame ;
    Self.ed_Table_Status.Text   := mm.varC_StatusSearch ;
    Self.ed_PK.Text             := dm_rc.rc_GetPrimaryKey( 'tb_reports' );

    // inicia um novo registro no tb_reports
    sqlMaster.Tag := Random(100000) + Random(50000);
    sqlMaster.close;
    sqlMaster.SQL.Text := 'select * from tb_reports where ' + Self.ed_PK.Text + ' = :table_pk';
    sqlMaster.ParamByName( 'table_pk' ).AsInteger := sqlMaster.Tag;

    dm_rc.rc_OpenQuery( sqlMaster );

    // o uso da tab. tb_reports é exclusivamente para reaproveitar a geração de LOOKUps dinamicos
    // que serão usados como FILTROS para os relatórios
    //
    // Nenhum registro será EFETIVAMENTE inserido..ao sair desta tela, existe um CANCEL padrão
    sqlMaster.Insert;
    sqlMaster.FieldByName( Self.ed_PK.Text ).AsInteger := sqlMaster.Tag;

    // atualizar todos os LOOKUPs dinamicamente
    mm.varC_Lookup_Code := '';
    dm_rc.rc_LookUpUpdateData(  self  );

    // parametros de pesquisa especifica por datas( pesq. por periodo )  - ANTES DO INHERITED
    dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDFieldDate.name   , '' , '' );

    edSearchCRUDDtIni.Text := DateToStr( date );
    edSearchCRUDDtEnd.Text := DateToStr( date );

    // translate messages
    case mm.varLT_Lang of

         ltpt_BR : begin
                     cMSG_SELECT_REPORT    := 'Selecione um relatório';
                     cMSG_PREPARING_REPORT := 'Preparando Relatório...';
                   end;
         lten_US, lten_GB   : begin
                     cMSG_SELECT_REPORT    := 'Select a report';
                     cMSG_PREPARING_REPORT := 'Preparing Report ...';
                   end;
         ltes_ES   : begin
                     cMSG_SELECT_REPORT    := 'Seleccionar un informe';
                     cMSG_PREPARING_REPORT := 'Preparando informe ...';
                   end;
         ltfr_FR   : begin
                     cMSG_SELECT_REPORT    := 'Sélectionner un rapport';
                     cMSG_PREPARING_REPORT := 'Préparation du rapport...';
                   end;
         ltde_DE   : begin
                     cMSG_SELECT_REPORT    := 'Bericht auswählen';
                     cMSG_PREPARING_REPORT := 'Bericht wird vorbereitet...';
                   end;
         ltit_IT   : begin
                     cMSG_SELECT_REPORT    := 'Seleziona un rapporto';
                     cMSG_PREPARING_REPORT := 'Preparazione rapporto...';
                   end;
         lttr_TR    : begin
                     cMSG_SELECT_REPORT    := 'Selecione um relatório';
                     cMSG_PREPARING_REPORT := 'Preparando Relatório...';
                   end;
         ltru_RU    : begin
                     cMSG_SELECT_REPORT    := 'Выберите отчет';
                     cMSG_PREPARING_REPORT := 'Подготовка отчета ...';
                   end;
         ltzn_CH : begin

                   end;
         ltin_ID : begin

                   end;
         ltth_TH : begin

                   end;
         lthi_IN : begin

                   end;
         ltar_SA    : begin

                   end;
    end;

    cbxSearchCRUDPeriod.Clear;
    cbxSearchCRUDPeriod.Items.Add( '' );
    cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_TODAY );
    cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_YESTERDAY );
    cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_BEFORE_YESTERDAY );
    cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_TOMORROW );
    cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_AFTER_TOMORROW );
    cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_THIS_WEEK );
    cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_LAST_WEEK );
    cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_NEXT_WEEK );
    cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_THIS_FORTNIGHT );
    cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_LAST_FORTNIGHT );
    cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_NEXT_FORTNIGHT );
    cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_THIS_MONTH );
    cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_LAST_MONTH );
    cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_NEXT_MONTH );
    cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_THIS_BIMESTER );
    cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_THIS_QUARTER );
    cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_THIS_SEMESTER );
    cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_THIS_YEAR );
    cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_LAST_YEAR );
    cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_ALL );
    cbxSearchCRUDPeriod.Items.Add( mm.MSG_DATE_INTERVALS_ALL_UNTIL_TODAY );
end;

procedure TfrmBaseReportMenu.UniFrameDestroy(Sender: TObject);
begin
  inherited;
  // fechar querys abertas
  dm_rc.rc_CloseQuerys( Self , False, False );
end;

procedure TfrmBaseReportMenu.UniFrameReady(Sender: TObject);
begin
  inherited;
    // in development
    rc_Translate( Self, nil , '' , mm.CONFIG_LANGUAGE );

    Self.ed_FormOrigin.Text      := mm.varC_FormSource_Search ;

    rcBlock10.Enabled        := paReportPeriod.Visible;
    rcBlock10.visible        := rcBlock10.Enabled;

    dm_rc.rc_ResizeBlocks( Self );
end;

procedure TfrmBaseReportMenu.labShowReportClick(Sender: TObject);
begin
  inherited;
  btnProcessReportClick( self );
end;

procedure TfrmBaseReportMenu.labDownloadReportClick(Sender: TObject);
begin
  inherited;
  btnSaveReportClick( self );
end;

procedure TfrmBaseReportMenu.labOptionsReportClick(Sender: TObject);
begin
  inherited;
  btnOptionsClick( self );
end;

procedure TfrmBaseReportMenu.rc_CloseQuerys;
var
   I : integer;
begin
     for I := 0 to Self.ComponentCount - 1 do
     begin
       if Self.Components[I] is TFDQuery then
       begin
          if TFDQuery( Self.Components[I] ).Name <> 'sqlSearchMaster' then
          begin
             TFDQuery(Self.Components[I]).Cancel;
             TFDQuery(Self.Components[I]).Close;
          end;
       end
       else
       if Self.Components[I] is TFDMemTable then
       begin
          TFDMemTable(Self.Components[I]).Close;
       end
       else
       if Self.Components[I] is TDataSource then
       begin
          if TDataSource( Self.Components[I] ).DataSet <> nil then
             if TDataSource( Self.Components[I] ).DataSet.Name <> 'sqlSearchMaster' then
             begin
                TDataSource(Self.Components[I]).DataSet.Cancel;
                TDataSource(Self.Components[I]).DataSet.Close;
             end;
       end;
     end;
end;

procedure TfrmBaseReportMenu.labExitClick(Sender: TObject);
begin
  inherited;
  btnExitClick( self );
end;

procedure TfrmBaseReportMenu.lbxReportOptionsChange(Sender: TObject);
begin
  inherited;

  cbxModelReport_form.ItemIndex := lbxReportOptions.ItemIndex;
end;

procedure TfrmBaseReportMenu.pgBaseCadControlChange(Sender: TObject);
begin
  inherited;

  if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;
end;

end.
