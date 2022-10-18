unit untCadCOMPRAS; // v. 4.0.0.5
(*
// v. 3.3.0.0
Adicionado exemplo de "sumário" e Header Title ( com opção de tradução )
*)
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, untfrmBaseCRUD, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniEdit,
  uniDateTimePicker, uniCheckBox, uniMultiItem, uniComboBox, uniBasicGrid,
  uniDBGrid, uniPanel, uniPageControl, uniButton, uniBitBtn, uniLabel,
  uniGUIBaseClasses, uniDBComboBox, uniDBDateTimePicker, uniDBEdit,
  uniDBCheckBox, uniSpeedButton, uniDBLookupComboBox,
  uniScrollBox, Vcl.Menus, uniMainMenu, uniHTMLFrame, uniSweetAlert, uniDBNavigator;

type
  TfrmCadCOMPRAS = class(TfrmBaseCRUD)
    pgComplementData: TUniPageControl;
    dsMemTipoOS: TDataSource;
    memTipoOS: TFDMemTable;
    tabGeral: TUniTabSheet;
    sboxTab1: TUniScrollBox;
    COMPRAS_PRODUTOS: TFDQuery;
    dsCOMPRAS_PRODUTOS: TDataSource;
    UniDBEdit5: TUniDBEdit;
    rcBlock10: TUniContainerPanel;
    edCodigo: TUniDBEdit;
    UniLabel3: TUniLabel;
    rcBlock20: TUniContainerPanel;
    UniLabel5: TUniLabel;
    UniDBDateTimePicker1: TUniDBDateTimePicker;
    rcBlock50: TUniContainerPanel;
    rcBlock90: TUniContainerPanel;
    UniLabel12: TUniLabel;
    edLkpFORNECEDORES: TUniDBEdit;
    rcBlock100: TUniContainerPanel;
    rcBlock110: TUniContainerPanel;
    rcBlock120: TUniContainerPanel;
    UniLabel14: TUniLabel;
    edQtde: TUniDBFormattedNumberEdit;
    UniLabel15: TUniLabel;
    edLkpPRODUTOS: TUniDBEdit;
    UniLabel16: TUniLabel;
    UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit;
    UniLabel17: TUniLabel;
    UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit;
    rcBlock70: TUniContainerPanel;
    UniLabel18: TUniLabel;
    rcBlock130: TUniContainerPanel;
    btnOk: TUniBitBtn;
    btnDel: TUniBitBtn;
    rcBlock460: TUniContainerPanel;
    dbgProdutos: TUniDBGrid;
    paNotFound_dbgProdutos: TUniContainerPanel;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    procedure UniFrameCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure dsMasterStateChange(Sender: TObject);
    procedure sqlMasterAfterOpen(DataSet: TDataSet);
    procedure btnDeleteRegClick(Sender: TObject);
    procedure dbgProdutosDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure btnDelClick(Sender: TObject);
    procedure dsCOMPRAS_PRODUTOSStateChange(Sender: TObject);
    procedure COMPRAS_PRODUTOSBeforePost(DataSet: TDataSet);
    procedure dbgProdutosCellClick(Column: TUniDBGridColumn);
    procedure edQtdeEnter(Sender: TObject);
    procedure edLkpPRODUTOSClick(Sender: TObject);
    procedure FDSchemaAdapter1AfterApplyUpdate(Sender: TObject);
    procedure btnSaveRegClick(Sender: TObject);
    procedure dbgProdutosColumnSummary(Column: TUniDBGridColumn; GroupFieldValue: Variant);
    procedure dbgProdutosColumnSummaryResult(Column: TUniDBGridColumn; GroupFieldValue: Variant; Attribs: TUniCellAttribs; var Result: string);
    procedure COMPRAS_PRODUTOSAfterOpen(DataSet: TDataSet);
    procedure COMPRAS_PRODUTOSError(ASender, AInitiator: TObject; var AException: Exception);
    procedure dbgProdutosTitleClick(Column: TUniDBGridColumn);
    procedure btnNewRegClick(Sender: TObject);
    procedure edLkpPRODUTOSExit(Sender: TObject);
  private
    { Private declarations }
    // v. 3.3.0.0 - Extracted from UNIGUI DEMOS
    FInited : Boolean;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses untdm_rc, MainModule, untFrmLookUp, uniGUIApplication, // v. 3.3.0.0
  Main, str_func, mkm_dbfuncs;


procedure TfrmCadCOMPRAS.btnDeleteRegClick(Sender: TObject);
begin
  // no frmBaseCRUD já tem a critica de MOVIMENTACAO pra o registro que
  // esta sendo deletado...
  //
  // dm_rc.rc_HasCodeRegistered
  //

  // criticas antes da exclusao
  //

  inherited;

  if mm.varB_OperationProcessed then
  begin
       // procedimentos pós-exclusao
       //
  end;
end;

procedure TfrmCadCOMPRAS.btnNewRegClick(Sender: TObject);
begin
  inherited;
  // v. 4.0.0.0
  sqlMaster.FieldByName('dtcadastro').AsDateTime := date;
end;

procedure TfrmCadCOMPRAS.btnDelClick(Sender: TObject);
begin
  inherited;

  if not ( dsCOMPRAS_PRODUTOS.State in [dsEdit, dsInsert ] ) then
  begin
     COMPRAS_PRODUTOS.Delete;
     COMPRAS_PRODUTOS.ApplyUpdates();
     dm_rc.rc_OpenQuery( COMPRAS_PRODUTOS );
  end
  else
     COMPRAS_PRODUTOS.Cancel;

  dm_rc.rc_LookUpUpdateData(  self  ); // v. 4.0.0.0
end;

procedure TfrmCadCOMPRAS.btnOkClick(Sender: TObject);
begin
  inherited;
  COMPRAS_PRODUTOS.Post;

  if ( ed_Table_Status.Text = 'E' ) then
  begin
     mm.varI_ApplyUpdateErrors := COMPRAS_PRODUTOS.ApplyUpdates(-1);

     if mm.varI_ApplyUpdateErrors > 0 then
     begin
        dm_rc.rc_ApplyUpdatesError( sqlMaster, mm.varI_ApplyUpdateErrors, mm.MSG_BUGERROR_POST );
     end;

     dm_rc.rc_OpenQuery( COMPRAS_PRODUTOS );
  end;
end;

procedure TfrmCadCOMPRAS.btnSaveRegClick(Sender: TObject);
begin
  inherited;
  // como não uso campo autoincremento, atualizo o codigo do MASTER nos respectivos registros DETAIL após a gravação
  dm_rc.rc_UpdateDetailField( mm.varI_ApplyUpdateErrors,
                              ed_Table_Status_OLD.Text,
                              COMPRAS_PRODUTOS,
                              'codicompra',
                              sqlMaster.FieldByName('codigo').AsInteger );
end;
// v. 3.3.0.0
procedure TfrmCadCOMPRAS.COMPRAS_PRODUTOSAfterOpen(DataSet: TDataSet);
begin
  inherited;
  FInited := True;
end;

procedure TfrmCadCOMPRAS.COMPRAS_PRODUTOSBeforePost(DataSet: TDataSet);
begin
  inherited;
  if COMPRAS_PRODUTOS.FieldByName('codiprod').AsInteger > 0 then
  begin
     COMPRAS_PRODUTOS.FieldByName('totalprod').AsCurrency := COMPRAS_PRODUTOS.FieldByName('qtde').AsFloat * COMPRAS_PRODUTOS.FieldByName('valorunit').AsCurrency;
  end
  else
     COMPRAS_PRODUTOS.Cancel;
end;
// v. 3.3.3.2
procedure TfrmCadCOMPRAS.COMPRAS_PRODUTOSError(ASender, AInitiator: TObject; var AException: Exception);
begin
  inherited;
  dm_rc.rc_ShowError( AException.Message );
  Abort;
end;

procedure TfrmCadCOMPRAS.dbgProdutosCellClick(Column: TUniDBGridColumn);
begin
  inherited;
  COMPRAS_PRODUTOS.Cancel;
  // atualizar todos os LOOKUPs dinamicamente
  dm_rc.rc_LookUpUpdateData(  self  );
end;
// v. 3.3.0.0
procedure TfrmCadCOMPRAS.dbgProdutosColumnSummary(Column: TUniDBGridColumn; GroupFieldValue: Variant);
var
  I : Integer;
  F : Real;
begin
  inherited;
  if not FInited then Exit;
  if SameText(Column.FieldName, 'qtde') then
  begin
    if Column.AuxValue = NULL then
       Column.AuxValue := 0;
    Column.AuxValue := Column.AuxValue + Column.Field.AsInteger;
  end
  else
  if SameText(Column.FieldName, 'totalprod') then
  begin
    if Column.AuxValue = NULL then
       Column.AuxValue := 0.0;
    Column.AuxValue := Column.AuxValue + ( Column.Field.AsFloat * COMPRAS_PRODUTOS.FieldByName('qtde').AsInteger );
  end;
end;
// v. 3.3.0.0
procedure TfrmCadCOMPRAS.dbgProdutosColumnSummaryResult(Column: TUniDBGridColumn; GroupFieldValue: Variant; Attribs: TUniCellAttribs; var Result: string);
var
  I : Integer;
  F : Real;
begin
  inherited;
  if not FInited then Exit;
  if SameText(Column.FieldName, 'qtde') then
  begin
    I := varIIF( Column.AuxValue = null, 0 , Column.AuxValue ) ;
    Result := Format('Qtde Total: %d', [I]);
    Attribs.Font.Style := [fsBold];
    //Attribs.Font.Color := clGreen;
  end
  else
  if SameText(Column.FieldName, 'totalprod') then
  begin
    F := varIIF( Column.AuxValue = null, 0 , Column.AuxValue ) ;
    Result := 'Total: ' + FmtSettings.CurrencyString + FormatCurr(' 0,0.00', F) ;
    Attribs.Font.Style := [fsBold];
    //Attribs.Font.Color := clNavy;
  end;
  Column.AuxValue:=NULL;
end;

procedure TfrmCadCOMPRAS.dbgProdutosDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  inherited;
   dm_rc.rc_GridDrawCell( TUniDBGrid( sender ) , ACol, ARow, Column, Attribs ) ;
end;

procedure TfrmCadCOMPRAS.dbgProdutosTitleClick(Column: TUniDBGridColumn);
begin
  inherited;
//  if Column.FieldName = 'PRODUTO' then
//  begin
//    if dbgProdutos.Columns[2].Visible then
//    begin
//      //Collapse
//      dbgProdutos.Columns[2].Visible := False;
//      dbgProdutos.Columns[3].Visible := False;
//    end
//    else
//    begin
//      //Expand
//      dbgProdutos.Columns[2].Visible := True;
//      dbgProdutos.Columns[3].Visible := True;
//    end;
//  end;
end;

procedure TfrmCadCOMPRAS.dsCOMPRAS_PRODUTOSStateChange(Sender: TObject);
begin
  inherited;
  // v. 4.0.0.0
  if TDataSource( sender ).State in [ dsInsert, dsEdit, dsBrowse ] then
     rc_DSReactiveCheck( self , TDataSource( sender ) );

  // caso utilize algum 'componente BS_COMPONENTS' utilize as instruções abaixo
  // para renderização correta de CRUDS
  if ( dsMaster.State <> dsInactive ) then
        dm_rc.rc_BootStrapRender( self, True );

  btnOk.Enabled  := ( dsCOMPRAS_PRODUTOS.State in [dsInsert, dsEdit] ) and ( sqlMaster.State in [dsInsert, dsEdit] );
end;

procedure TfrmCadCOMPRAS.dsMasterStateChange(Sender: TObject);
begin
  inherited;
  if not ( sqlMaster.State in [dsInsert, dsEdit] ) then
     COMPRAS_PRODUTOS.Cancel;

  btnOk.Enabled  := ( dsCOMPRAS_PRODUTOS.State in [dsInsert, dsEdit] ) and ( sqlMaster.State in [dsInsert, dsEdit] );
end;

procedure TfrmCadCOMPRAS.edLkpPRODUTOSClick(Sender: TObject);
begin
  inherited;
      dm_rc.rc_LookUpSearchFilter( Sender, '', '', 'valor_venda' );
      // [PT] Se o lookup for normal a atualização dos valores ocorrerá após a seleção do produto
      // [EN] If the lookup is normal, the values will be updated after selecting the product
      if ( sqlMaster.State in [ dsEdit, dsInsert ] ) then
      begin
           // v. 4.1.0.0
           if edLkpPRODUTOS.Text <> '' then           begin
              COMPRAS_PRODUTOS.FieldByName('valorunit').AsCurrency := dm_rc.rc_GetLookUpField( Self, TUniDBEdit( sender ) , 'valor_venda' ) ;
              COMPRAS_PRODUTOS.FieldByName('produto').ReadOnly     := false;
              COMPRAS_PRODUTOS.FieldByName('produto').AsString     := edLkpPRODUTOS.Text;
           end;
      end;
end;

procedure TfrmCadCOMPRAS.edLkpPRODUTOSExit(Sender: TObject);
begin
  inherited;
      // [PT] Se o lookup for lite( ! ) a atualização dos valores ocorrerá no OnExit
      // [EN] If the lookup is lite( ! ) the values update will occur in OnExit
//      if ( sqlMaster.State in [ dsEdit, dsInsert ] ) then
//      begin
//           COMPRAS_PRODUTOS.FieldByName('valorunit').AsCurrency := dm_rc.rc_GetLookUpField( Self, TUniDBEdit( sender ) , 'valor_venda' ) ;
//           COMPRAS_PRODUTOS.FieldByName('produto').ReadOnly     := false;
//           COMPRAS_PRODUTOS.FieldByName('produto').AsString     := edLkpPRODUTOS.Text;
//      end;
end;

procedure TfrmCadCOMPRAS.edQtdeEnter(Sender: TObject);
begin
  inherited;
  if ( sqlMaster.State in [dsInsert, dsEdit] ) then
  begin
     if not ( dsCOMPRAS_PRODUTOS.State in [dsInsert, dsEdit] ) then
        COMPRAS_PRODUTOS.Insert;

     COMPRAS_PRODUTOS.FieldByName('codicompra').AsInteger  := sqlMaster.FieldByName('codigo').AsInteger;
     COMPRAS_PRODUTOS.FieldByName('qtde').AsFloat          := 1;
     COMPRAS_PRODUTOS.FieldByName('codiemp').AsInteger     := mm.varI_Code_Company;
     COMPRAS_PRODUTOS.FieldByName('data').AsDateTime       := sqlMaster.FieldByName('dtcadastro').AsDateTime;

     dm_rc.rc_LookUpUpdateData(  self  );
  end;
end;

procedure TfrmCadCOMPRAS.FDSchemaAdapter1AfterApplyUpdate(Sender: TObject);
begin
  inherited;
  //COMPRAS_PRODUTOS.CommitUpdates; // v. 3.2.0.0
end;

procedure TfrmCadCOMPRAS.sqlMasterAfterOpen(DataSet: TDataSet);
begin
  inherited;
  COMPRAS_PRODUTOS.close;
  COMPRAS_PRODUTOS.ParamByName('codicompra').AsInteger := sqlMaster.FieldByName( 'codigo' ).AsInteger;
  dm_rc.rc_OpenQuery( COMPRAS_PRODUTOS );
end;

procedure TfrmCadCOMPRAS.UniFrameCreate(Sender: TObject);
begin
  sqlMaster.close;
  sqlMaster.SQL.Text := ' SELECT [[fields]] ' +
                        '   FROM [[table]] tab ' +
                        '  WHERE tab.[[pk]] = :table_pk ' +  // Apenas cadastro MESTRE é necessário o WHERE( por enquanto )

                        ' [grid] ' + // este 'coringa' indica ao RadCORE o início da query usada na pesquisa padrão

                        ' SELECT ' +

                        '   tab.[[pk]] as "CÓDIGO", f.nome as Fornecedor, tab.dtcadastro, ' +
                        '        [[allpks]] ' +   // só é necessário o [[allpks]] aqui se estiver usando ALIAS em um campo CHAVE PRIMARIA

                        ' FROM  compras tab ' +

                        ' LEFT JOIN empresas e On e.Codigo = tab.CodiEmp  ' +
                        ' LEFT JOIN fornecedores f On f.Codigo = tab.CodiForn ' ;

  ed_Where_Search.Text := ' tab.codiemp = ' + IntToStr( mm.varI_Code_Company );
  ed_Order_Search.Text := '';

  // parametros de pesquisa especifica por datas( pesq. por periodo )  - ANTES DO INHERITED
  dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDFieldDate.name, 'tab.dtcadastro'    , 'CADASTRO' );

  dbgProdutos.Hint :=
  '[[' +
  'fieldmasks:' +
  'grid-resize|' +
  'no-paged|' +        // v. 3.3.0.0
  'grid-header:translate()|'+ // v. 3.3.0.0
  //'grid-noforcefit|' +
  'grid-paginator|' +
  'codiemp[[' +
  '  visible:false]];' +
  'data[[' +
  '  visible:false]];' +
  'codicompra[[' +
  '  visible:false]];' +
  'codiprod[[' +
  '  visible:false]];|' +
  'state-visible:empty-false ds:dsCOMPRAS_PRODUTOS|' +
  ']]' ;

  inherited;
  // parametros de pesquisa padrao - DEPOIS DO INHERITED
  dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField1.name   , 'tab.' + ed_PK.Text + ' as "CÓDIGO"', 'CÓDIGO' );
  dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField1.name   , 'f.nome as Fornecedor'        , 'FORNECEDOR' );
  // parametros de pesquisa complementar( opcional )

  // particularidades do form
  //
  //FInited := True;
  //GetCOMPRAS_Summary;
  COMPRAS_PRODUTOS.Open; // para executar "rc_GridDrawCell" / to run "rc_GridDrawCell" // v. 4.0.0.0
  //COMPRAS_PRODUTOS.close;
end;

initialization
  RegisterClass(TfrmCadCOMPRAS);

end.
