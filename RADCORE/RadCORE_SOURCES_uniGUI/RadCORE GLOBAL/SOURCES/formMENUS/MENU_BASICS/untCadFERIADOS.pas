unit untCadFERIADOS; // v. 3.3.3.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, untfrmBaseCRUD, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, Vcl.Menus, uniMainMenu, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniHTMLFrame, uniButton, uniBitBtn, uniDateTimePicker, uniCheckBox, uniEdit, uniMultiItem, uniComboBox,
  uniScrollBox, uniPanel, uniBasicGrid, uniDBGrid, uniPageControl, uniLabel, uniGUIBaseClasses, uniDBDateTimePicker, uniDBEdit,
  uniDBCheckBox, uniRadioGroup, uniSweetAlert;

type
  TfrmCadFERIADOS = class(TfrmBaseCRUD)
    rcBlock10: TUniContainerPanel;
    edCodigo: TUniDBEdit;
    UniLabel3: TUniLabel;
    rcBlock20: TUniContainerPanel;
    edDataCad: TUniDBDateTimePicker;
    UniLabel5: TUniLabel;
    rcBlock30: TUniContainerPanel;
    UniLabel4: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    rcBlock40: TUniContainerPanel;
    labFeriados: TUniLabel;
    UniLabel54: TUniLabel;
    UniLabel1: TUniLabel;
    rcBlock50: TUniContainerPanel;
    labRcCollapseSwt: TUniLabel;
    UniLabel6: TUniLabel;
    UniLabel11: TUniLabel;
    UniLabel14: TUniLabel;
    UniLabel10: TUniLabel;
    UniLabel12: TUniLabel;
    UniLabel15: TUniLabel;
    rcBlock60: TUniContainerPanel;
    UniLabel18: TUniLabel;
    bsrgpTipo01_M_db: TUniLabel;
    UniLabel17: TUniLabel;
    bsrgpTipo02_E_db: TUniLabel;
    UniLabel19: TUniLabel;
    bsrgpTipo03_F_db: TUniLabel;
    UniLabel21: TUniLabel;
    rcBlock35: TUniContainerPanel;
    labRcCollapse01: TUniLabel;
    labRcCollapse02: TUniLabel;
    labRcCollapse03: TUniLabel;
    procedure UniFrameCreate(Sender: TObject);
    procedure bsrgpTipo01_M_dbClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses untdm_rc, mkm_layout;

procedure TfrmCadFERIADOS.bsrgpTipo01_M_dbClick(Sender: TObject);
begin
  inherited;

  //dm_rc.rc_ShowMessage( 'Selected ItemIndex = ' + dm_rc.rc_GetItemIndexFromRgp( TUniLAbel( sender ) ).ToString );

end;

procedure TfrmCadFERIADOS.UniFrameCreate(Sender: TObject);
begin

  sqlMaster.close;
  sqlMaster.SQL.Text := ' SELECT [[fields]] ' +
                        '   FROM [[table]] tab ' +
                        '  WHERE tab.[[pk]] = :table_pk ' +

                        '[grid]' +

                        ' SELECT ' +

                        '        tab.[[pk]] as "CÓDIGO" , tab.data,' +
                        '        tab.descricao as "DESCRIÇÃO", ' +
                        '        tab.facultativo, ' +
                        '        case coalesce( tab.tipo, '''' ) ' +
                        '          when ''M'' then ''municipal'' ' +
                        '          when ''E'' then ''estadual'' ' +
                        '          when ''F'' then ''federal'' ' +
                        '        end as Tipo, ' +
                        '        [[allpks]] ,' +

                        // New Dynamic Actions COLUMNS
                        //
                        // Essas configurações são apenas para demonstrar o recurso do RadCORE
                        // E não somente para executar acções de CRUD..vc pode criar qualquer tipo de ACTION BUTTON
                        // apenas lembre de adicionar o EVENTO respectivo em [gridname]CellClick do seu formulário
                        //
                        // These settings are just to demonstrate the RadCORE feature
                        // And not only do CRUD..vc actions, you can create any type of ACTION BUTTON
                        // just remember to add the respective EVENT in [gridname] CellClick of your form
                        //
                        // Abaixo ( grid-btn:( new ) também é para demonstrar que podemos configurar a classe CSS e o ícone da action
                        // O recurso de action buttons poderá ainda ser melhorado
                        //
                        // Below (grid-btn :( new) is also to demonstrate that we can configure the CSS class and the action icon
                        // The action buttons feature can still be improved
                        //
// v. 4.0.0.0
//                        '        [[grid-btn:edo]] '    + // create default action buttons: EDIT DELETE OPTIONS
                        '        [[grid-btn:edit]] '    + // create default action button: EDIT
                        '        [[grid-btn:delete]] '  + // create default action button: DELETE
                        '        [[grid-btn:options]] ' + // create default action button: OPTIONS
//                        '        [[grid-btn:edit|cls:ButtonGreenNoBg]] '   + // you can add "ico:" attribute too
//                        '        [[grid-btn:delete|cls:ButtonRedNoBg]] '   + // you can add "ico:" attribute too
//                        '        [[grid-btn:options|cls:ButtonGrayNoBg]] ' + // you can add "ico:" attribute too

                        ' FROM [[table]] tab ';


  // in design time
  dbgSearchCRUD.Hint := '[[' +
                        'fieldmasks:' +
                        'grid-resize|' +
                        //'model-crud:3(search:full)|'+ //only for model-crud-3 // v. 4.0.0.0
                        'model-crud:3(btns:nobg)|'+   //only for model-crud-3 // v. 4.0.0.0
                        //'model-crud:3|'+ //actions // v. 4.0.0.0
                        'grid-paginator:center|'+         // v. 4.0.0.0
                        //'grid-forcefit:5 mobile-v-4 mobile-h-8|' + // v. 3.3.3.0
                        //'grid-noforcefit|' +
                        'código[[' +
                        '      align:c|' +
                        '      visible:false mobile-v]];' +       // visible=false ON MOBILE PORTRAIT

                        'data[['+
                        '    visible:false mobile-v]];' +         // visible=false ON MOBILE PORTRAIT

                        'tipo[[' +
                        '    visible:false mobile]];' +           // visible=false ON MOBILE

                        'facultativo[[' +    // v. 4.0.0.0
                        //'    checkbox:S;N dv:Sim;Não|' + // dv = display values
                        '    checkbox:S;N|' + // dv = display values
                        '    titlealign:c|' +
                        '    align:c|' +
                        '    visible:false mobile]];' +           // visible=false ON MOBILE

                        ']]';


  ed_Where_Search.Text := '' ;
  ed_Order_Search.Text := 'tab.descricao';

  dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDFieldDate.name, 'tab.data' , 'DATA' );

  inherited;

  dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField1.name   , 'tab.' + ed_PK.Text + ' as "CÓDIGO"' , 'CÓDIGO' );
  dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField1.name   , 'tab.descricao as "DESCRIÇÃO"'       , 'DESCRIÇÃO' );
  dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField1.name   , 'tab.data'                           , 'DATA' );
  dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField1.name   , 'tab.tipo'                           , 'TIPO' );

end;

initialization
  RegisterClass(TfrmCadFERIADOS);

end.
