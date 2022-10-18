unit untCadCLIENTES;// v.4.0.0.5
(*
[PT]edLkpCLIENTES demonstra o uso simultâneo de 2 pesquisas
[EN]edLkpCLIENTES demonstrates the simultaneous use of 2 searches


WebOptions.Paged deve estar TRUE
WebOptions.Paged must be TRUE
*)

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, StrUtils, // v. 3.2.0.7
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIApplication, uniGUIClasses, uniGUIFrame, untfrmBaseCRUD, Data.DB, uniBasicGrid, uniDBGrid,
  uniPanel, uniPageControl, uniGUIBaseClasses, uniScrollBox, uniDBEdit,
  uniMultiItem, uniComboBox, uniEdit, uniLabel, uniButton, uniBitBtn,
  uniDateTimePicker, uniDBDateTimePicker, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniCheckBox, uniFieldSet,
  uniDBComboBox, uniDBLookupComboBox, uniSpeedButton, uniDBCheckBox,
  uniMainMenu, uniHTMLFrame, Data.FMTBcd, Data.SqlExpr, uniSpinEdit, uniMemo, Vcl.Menus, uniSweetAlert, uniDBNavigator;

type
  TfrmCadCLIENTES = class(TfrmBaseCRUD)
    pgComplementData: TUniPageControl;
    UniTabSheet2: TUniTabSheet;
    tabComercial: TUniTabSheet;
    tabLicencas: TUniTabSheet;
    tabGeral: TUniTabSheet;
    sboxGridBlockTab2: TUniScrollBox;
    sboxTab4: TUniScrollBox;
    sboxTab5: TUniScrollBox;
    Revisoes: TUniMenuItem;
    Veculos1: TUniMenuItem;
    rcBlock370: TUniContainerPanel;
    UniLabel74: TUniLabel;
    UniDBEdit32: TUniDBEdit;
    rcBlock380: TUniContainerPanel;
    UniLabel75: TUniLabel;
    UniDBEdit34: TUniDBEdit;
    rcBlock410: TUniContainerPanel;
    UniLabel78: TUniLabel;
    edLkpUFS__ENTREGA: TUniDBEdit;
    rcBlock420: TUniContainerPanel;
    UniLabel79: TUniLabel;
    edLkpCIDADES__ENTREGA: TUniDBEdit;
    rcBlock430: TUniContainerPanel;
    UniLabel80: TUniLabel;
    UniDBEdit43: TUniDBEdit;
    rcBlock450: TUniContainerPanel;
    UniLabel23: TUniLabel;
    UniDBEdit12: TUniDBEdit;
    rcBlock460: TUniContainerPanel;
    UniLabel24: TUniLabel;
    UniDBEdit14: TUniDBEdit;
    rcBlock490: TUniContainerPanel;
    UniLabel28: TUniLabel;
    edLkpUFS__COBRANCA: TUniDBEdit;
    rcBlock500: TUniContainerPanel;
    UniLabel29: TUniLabel;
    edLkpCIDADES__COBRANCA: TUniDBEdit;
    rcBlock510: TUniContainerPanel;
    UniLabel59: TUniLabel;
    UniDBEdit42: TUniDBEdit;
    rcBlock350: TUniContainerPanel;
    UniLabel30: TUniLabel;
    rcBlock435: TUniContainerPanel;
    UniLabel31: TUniLabel;
    rcBlock550: TUniContainerPanel;
    rcBlock360: TUniContainerPanel;
    UniLabel73: TUniLabel;
    edCepEntrega: TUniDBEdit;
    rcBlock440: TUniContainerPanel;
    UniLabel22: TUniLabel;
    edCepCobranca: TUniDBEdit;
    rcBlock650: TUniContainerPanel;
    UniLabel1: TUniLabel;
    rcBlock660: TUniContainerPanel;
    UniLabel32: TUniLabel;
    rcBlock670: TUniContainerPanel;
    UniLabel33: TUniLabel;
    rcBlock680: TUniContainerPanel;
    UniLabel34: TUniLabel;
    rcBlock690: TUniContainerPanel;
    UniLabel36: TUniLabel;
    UniDBDateTimePicker3: TUniDBDateTimePicker;
    UniDBDateTimePicker4: TUniDBDateTimePicker;
    UniDBEdit31: TUniDBEdit;
    UniDBEdit46: TUniDBEdit;
    edMonthValue: TUniDBFormattedNumberEdit;
    rcBlock710: TUniContainerPanel;
    UniLabel38: TUniLabel;
    rcBlock720: TUniContainerPanel;
    UniLabel39: TUniLabel;
    UniDBCheckBox10: TUniDBCheckBox;
    UniDBCheckBox11: TUniDBCheckBox;
    UniDBCheckBox12: TUniDBCheckBox;
    UniDBCheckBox21: TUniDBCheckBox;
    UniDBCheckBox22: TUniDBCheckBox;
    UniDBCheckBox2: TUniDBCheckBox;
    UniDBCheckBox7: TUniDBCheckBox;
    sboxGridBlockTab1: TUniScrollBox;
    edHiddenCompanyID: TUniDBEdit;
    rcBlock10: TUniContainerPanel;
    edCodigo: TUniDBEdit;
    UniLabel3: TUniLabel;
    rcBlock20: TUniContainerPanel;
    labDtCad: TUniLabel;
    edDtCad: TUniDBDateTimePicker;
    rcBlock30: TUniContainerPanel;
    UniLabel5: TUniLabel;
    UniDBDateTimePicker1: TUniDBDateTimePicker;
    rcBlock50: TUniContainerPanel;
    UniLabel10: TUniLabel;
    edCnpjCpf: TUniDBEdit;
    rcBlock40: TUniContainerPanel;
    UniLabel37: TUniLabel;
    edTipoPessoa: TUniDBComboBox;
    rcBlock60: TUniContainerPanel;
    UniLabel42: TUniLabel;
    UniDBEdit10: TUniDBEdit;
    rcBlock80: TUniContainerPanel;
    UniLabel6: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    rcBlock90: TUniContainerPanel;
    UniLabel12: TUniLabel;
    edRazSoc: TUniDBEdit;
    rcBlock110: TUniContainerPanel;
    UniLabel21: TUniLabel;
    UniDBEdit4: TUniDBEdit;
    rcBlock120: TUniContainerPanel;
    UniLabel13: TUniLabel;
    UniDBEdit5: TUniDBEdit;
    rcBlock180: TUniContainerPanel;
    UniLabel16: TUniLabel;
    UniDBEdit8: TUniDBEdit;
    rcBlock170: TUniContainerPanel;
    UniLabel45: TUniLabel;
    edLkpCIDADES_SetDS_CODIIBGE: TUniDBEdit;
    rcBlock190: TUniContainerPanel;
    UniLabel35: TUniLabel;
    UniDBEdit3: TUniDBEdit;
    rcBlock210: TUniContainerPanel;
    UniLabel47: TUniLabel;
    UniDBEdit17: TUniDBEdit;
    rcBlock230: TUniContainerPanel;
    UniLabel18: TUniLabel;
    edPhone: TUniDBEdit;
    UniDBEdit19: TUniDBEdit;
    UniLabel40: TUniLabel;
    rcBlock240: TUniContainerPanel;
    UniLabel19: TUniLabel;
    UniDBEdit20: TUniDBEdit;
    UniDBEdit21: TUniDBEdit;
    UniLabel17: TUniLabel;
    rcBlock250: TUniContainerPanel;
    UniLabel20: TUniLabel;
    UniDBEdit23: TUniDBEdit;
    UniDBEdit24: TUniDBEdit;
    UniLabel49: TUniLabel;
    rcBlock260: TUniContainerPanel;
    UniLabel50: TUniLabel;
    UniDBEdit25: TUniDBEdit;
    UniEdit1: TUniEdit;
    btnSendZap: TUniSpeedButton;
    rcBlock270: TUniContainerPanel;
    rcBlock100: TUniContainerPanel;
    UniLabel4: TUniLabel;
    edCep: TUniDBEdit;
    rcBlock520: TUniContainerPanel;
    UniLabel25: TUniLabel;
    rcBlock525: TUniContainerPanel;
    UniLabel26: TUniLabel;
    edLkpCLIENTES: TUniDBEdit;
    ed_lkp_Email: TUniEdit;
    rcBlock530: TUniContainerPanel;
    UniLabel41: TUniLabel;
    rcBlock535: TUniContainerPanel;
    UniLabel43: TUniLabel;
    ed_lkp_fone: TUniEdit;
    ed_lkp_block: TUniEdit;
    rcBlock540: TUniContainerPanel;
    labAlert: TUniLabel;
    btnPayment: TUniSpeedButton;
    rcBlock150: TUniContainerPanel;
    UniLabel2: TUniLabel;
    edLkpUFS: TUniDBEdit;
    rcBlock160: TUniContainerPanel;
    UniLabel7: TUniLabel;
    edLkpCIDADES: TUniDBEdit;
    procedure UniFrameCreate(Sender: TObject);
    procedure edTipoPessoaChange(Sender: TObject);
    procedure edCepExit(Sender: TObject);
    procedure UniDBEdit2Exit(Sender: TObject);
    procedure Veculos1Click(Sender: TObject);
    //procedure edLkpCIDADESClick(Sender: TObject); // v. 3.3.1.0
    procedure RevisoesClick(Sender: TObject);
    procedure edLkpCIDADES__ENTREGAClick(Sender: TObject);
    procedure edLkpCIDADES__COBRANCAClick(Sender: TObject);
    procedure dsMasterStateChange(Sender: TObject);
    procedure btnSendZapClick(Sender: TObject);
    procedure pgComplementDataChange(Sender: TObject);
    procedure edLkpCLIENTESExit(Sender: TObject);
    procedure btnNewRegClick(Sender: TObject);
    procedure btnDeleteRegClick(Sender: TObject);
    procedure edCepEntregaExit(Sender: TObject);
    procedure edCepCobrancaExit(Sender: TObject);
    procedure edLkpCLIENTESClick(Sender: TObject);
    procedure dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure edLkpUFSClick(Sender: TObject);
    procedure edLkpCLIENTESEnter(Sender: TObject);
    procedure dsSearchMasterStateChange(Sender: TObject);
    procedure btnSaveRegClick(Sender: TObject);

    //REMOVER procedure dbgSearchCRUDDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

implementation

{$R *.dfm}

uses untdm_rc, MainModule, untFrmLookUp, Main, //untDM_LOOKUPs,
  untFrmMessage, untCadCLIENTES_REVISOES, untCadCLIENTES_VEICULOS, uconsts,
  mkm_func_web, mkm_layout; // v. 3.2.0.7

procedure TfrmCadCLIENTES.edTipoPessoaChange(Sender: TObject);
begin
  inherited;
  dm_rc.rc_MaskAdjust( edCnpjCpf, varIIF( sqlMaster.FieldByName('PESSOA').AsString = 'F', mtCPF, mtCNPJ ) );
end;
// v. 3.2.0.5
procedure TfrmCadCLIENTES.pgComplementDataChange(Sender: TObject);
var
   bPermission : boolean;
begin
  inherited;
    if pgComplementData.ActivePage = tabLicencas then
    begin
       bPermission := dm_rc.rc_PermissionVerify( ed_FormOrigin_Tab.Text ,
                                                 Trim( ed_Table_ItemSel.Text ) ,
                                                 6, dm_rc.memUsers.FieldByName('master').AsString = mm.VALUE_YES, false );
       If not bPermission then
       begin
          //Fechar_Tela;
          pgComplementData.ActivePage := tabGeral;
          dm_rc.rc_ShowSweetAlert( mm.MSG_INFO, mm.MSG_USER_DO_NOT_HAVE_ACCESS + '( Licence Tab )' , 'warning' ); // v. 3.3.1.0
          Abort;
       end;
    end;
end;
// v. 3.3.1.0
// podemos criar críticas manuais para uso do lookup dinâmico ou usar o atributo "lkpfilter:"
// podemos usar o rc_LookUpSearchFilter para por filtros mais complexos e usá-lo com o lkpfilter dinâmico
//procedure TfrmCadCLIENTES.edLkpCIDADESClick(Sender: TObject);
//begin
//  inherited;
// exemplo de uso MANUAL de filtros para seleção do lookup edLkpCIDADES
// está comentado pois estamos usando neste exemplo o atributo dinâmico "lkpfilter" no HINT de edLKPCIDADES
//  if ( edLkpUFS.Text ) = '' then
//     dm_rc.rc_ShowMessage( 'Selecione uma UF' )
//  else
//  begin
//      dm_rc.rc_LookUpSearchFilter( Sender, 'uf = ' + QuotedStr( edLkpUFS.Text ), '', 'codiibge' );
//  end;
//end;

procedure TfrmCadCLIENTES.edLkpCIDADES__COBRANCAClick(Sender: TObject);
begin
  inherited;
  if ( edLkpUFS__COBRANCA.Text ) = '' then
     dm_rc.rc_ShowMessage( 'Selecione uma UF' )
  else
  begin
      dm_rc.rc_LookUpSearchFilter( Sender, 'uf = ' + QuotedStr( edLkpUFS__COBRANCA.Text ), '', '' );
  end;
end;

procedure TfrmCadCLIENTES.edLkpCIDADES__ENTREGAClick(Sender: TObject);
begin
  inherited;
  if ( edLkpUFS__ENTREGA.Text ) = '' then
     dm_rc.rc_ShowMessage( 'Selecione uma UF' )
  else
  begin
      dm_rc.rc_LookUpSearchFilter( Sender, 'uf = ' + QuotedStr( edLkpUFS__ENTREGA.Text ), '', '' );
  end;
end;
// este evento será transferido em RUNTIME ao botao de pesquisa que será criado
// this event will be transferred in RUNTIME to the search button that will be created
procedure TfrmCadCLIENTES.edLkpCLIENTESClick(Sender: TObject);
begin
  inherited;
      dm_rc.rc_LookUpSearchFilter( Sender, 'codigo <> ' + sqlMaster.FieldByName( 'codigo' ).AsString, '', 'email;fone1 as Telefone;bloqueado;codibairro;codicidade' );
      // v. 4.0.0.0
//      if ( sqlMaster.State in [ dsEdit, dsInsert ] ) then
//      begin
//           ed_lkp_Email.Text  := dm_rc.rc_GetLookUpField( Self, TUniDBEdit( sender ) , 'email' )  ;
//           ed_lkp_fone.Text   := dm_rc.rc_GetLookUpField( Self, TUniDBEdit( sender ) , 'fone1'  )  ;
//           ed_lkp_block.Text  := dm_rc.rc_GetLookUpField( Self, TUniDBEdit( sender ) , 'bloqueado' ) ;
//
//           // se o retorno de um lookup for para preencher um outro lookup vc pode atribuir o campo de retorno e em seguida
//           // if the return of a lookup is to fill another lookup you can assign the return field and then
//           //sqlMaster.FieldByName( 'codibairro' ).AsInteger := StrToIntDef( dm_rc.rc_GetLookUpField( Self, TUniDBEdit( sender ) , 'codibairro' ), 0 ) ;
//           // atualizar todos os LOOKUPs dinamicamente
//           // update all LOOKUPs dynamically
//           //dm_rc.rc_LookUpUpdateData(  self, nil );
//      end;
end;
// v. 4.0.0.0
procedure TfrmCadCLIENTES.edLkpCLIENTESEnter(Sender: TObject);
begin
  inherited;
      if ( sqlMaster.State in [ dsEdit, dsInsert ] ) then
      begin
           ed_lkp_Email.Text  := dm_rc.rc_GetLookUpField( Self, TUniDBEdit( sender ) , 'email' )  ;
           ed_lkp_fone.Text   := dm_rc.rc_GetLookUpField( Self, TUniDBEdit( sender ) , 'fone1'  )  ;
           ed_lkp_block.Text  := dm_rc.rc_GetLookUpField( Self, TUniDBEdit( sender ) , 'bloqueado' ) ;

           // se o retorno de um lookup for para preencher um outro lookup vc pode atribuir o campo de retorno e em seguida
           // if the return of a lookup is to fill another lookup you can assign the return field and then
           //sqlMaster.FieldByName( 'codibairro' ).AsInteger := StrToIntDef( dm_rc.rc_GetLookUpField( Self, TUniDBEdit( sender ) , 'codibairro' ), 0 ) ;
           // atualizar todos os LOOKUPs dinamicamente
           // update all LOOKUPs dynamically
           //dm_rc.rc_LookUpUpdateData(  self, nil );
      end;
end;
// v. 4.0.0.0
procedure TfrmCadCLIENTES.edLkpCLIENTESExit(Sender: TObject);
begin
  inherited;

//      if ( sqlMaster.State in [ dsEdit, dsInsert ] ) then // and ( TUniComponent ( Sender ).Tag = 1 )then
//      begin
//           ed_lkp_Email.Text  := dm_rc.rc_GetLookUpField( Self, TUniDBEdit( sender ) , 'email' )  ;
//           ed_lkp_fone.Text   := dm_rc.rc_GetLookUpField( Self, TUniDBEdit( sender ) , 'fone1'  )  ;
//           ed_lkp_block.Text  := dm_rc.rc_GetLookUpField( Self, TUniDBEdit( sender ) , 'bloqueado' ) ;
//
//           //sqlMaster.FieldByName( 'codibairro' ).AsInteger := StrToIntDef( dm_rc.rc_GetLookUpField( Self, TUniDBEdit( sender ) , 'codibairro' ), 0 ) ;
//
//           // atualizar todos os LOOKUPs dinamicamente
//           //dm_rc.rc_LookUpUpdateData(  self  );
//      end;
end;
// v. 3.4.0.0
procedure TfrmCadCLIENTES.edLkpUFSClick(Sender: TObject);
begin
  inherited;
  dm_rc.rc_LookUpSearchFilter( Sender, '', '', '', '[[fieldmasks:descricao[[title:DESCRIÇÃO]];' );
end;

procedure TfrmCadCLIENTES.UniDBEdit2Exit(Sender: TObject);
begin
  inherited;
  dm_rc.rc_SearchPostalCodeCEP( sqlMaster.FieldByName( 'cepentrega' ).AsString, 'entrega',  Self.Name, TFDQuery( TUniDBEdit( sender ).DataSource.DataSet ) );
end;
// v. 4.0.0.6
procedure TfrmCadCLIENTES.btnDeleteRegClick(Sender: TObject);
begin
  // no frmBaseCRUD já tem a critica de MOVIMENTACAO pra o registro que
  // esta sendo deletado...
  //
  // dm_rc.rc_HasCodeRegistered
  //

  // criticas antes da exclusao
  //
   //[PT]
   // se vc precisa validar alguma informação antes de excluir o registro, você pode usar a global "mm.varB_OperationProcessed"
   // e condicionar a execução do "inherited"
   //[EN]
   // if you need to validate some information before delete the record, you can use the global "mm.varB_OperationProcessed"
   // and condition the execution of "inherited"
   (*
   if field = 'x' then
      mm.varB_OperationProcessed := false
   else
      mm.varB_OperationProcessed := true

   if mm.varB_OperationProcessed then
      inherited;
   *)

  inherited;

  //[PT]
  // se algum erro ocorreu no processo de execução do "inherited" você pode validar a global "mm.varB_OperationProcessed" para
  // processar mais alguma sequência de código após a exclusão do registro
  //[EN]
  // if an error occurred in the "inherited" execution process you can validate the global "mm.varB_OperationProcessed" to
  // process some more code sequence after deleting the record
  if mm.varB_OperationProcessed then //dbgSearchCRUD.Tag > 0 then
  begin

       // procedimentos pós-exclusao
       //

  end;
end;

procedure TfrmCadCLIENTES.btnNewRegClick(Sender: TObject);
begin
  inherited;
     sqlMaster.FieldByName('pessoa').AsString := 'F';
     dm_rc.rc_MaskAdjust( edCnpjCpf , mtCPF );
end;

procedure TfrmCadCLIENTES.dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  inherited;
  dm_rc.rc_GridDrawCell( dbgSearchCRUD , ACol, ARow, Column, Attribs ) ;
end;

procedure TfrmCadCLIENTES.dsMasterStateChange(Sender: TObject);
begin
  inherited;
  dm_rc.rc_MaskAdjust( edCnpjCpf, varIIF( sqlMaster.FieldByName('PESSOA').AsString = 'F', mtCPF, mtCNPJ ) );

  if sqlMaster.State in [dsInsert, dsEdit] then
  begin
     ed_lkp_Email.Text := '';
     ed_lkp_fone.Text  := '';
     ed_lkp_block.Text := '';
  end;
end;
procedure TfrmCadCLIENTES.dsSearchMasterStateChange(Sender: TObject);
begin
  inherited;

end;

// v. 3.2.0.7
procedure TfrmCadCLIENTES.edCepCobrancaExit(Sender: TObject);
begin
  inherited;
  dm_rc.rc_SearchPostalCodeCEP( sqlMaster.FieldByName( 'cepcobranca' ).AsString, 'cobranca',  Self.Name, TFDQuery( TUniDBEdit( sender ).DataSource.DataSet ) );
end;
// v. 3.2.0.7
procedure TfrmCadCLIENTES.edCepEntregaExit(Sender: TObject);
begin
  inherited;
  dm_rc.rc_SearchPostalCodeCEP( sqlMaster.FieldByName( 'cepentrega' ).AsString, 'entrega',  Self.Name, TFDQuery( TUniDBEdit( sender ).DataSource.DataSet ) );
end;

procedure TfrmCadCLIENTES.edCepExit(Sender: TObject);
begin
  inherited;
  dm_rc.rc_SearchPostalCodeCEP( sqlMaster.FieldByName( 'cep' ).AsString, '',  Self.Name, TFDQuery( TUniDBEdit( sender ).DataSource.DataSet ) );
end;

procedure TfrmCadCLIENTES.UniFrameCreate(Sender: TObject);
begin


  // PT
  //
  // O 'coringa' [[fields]] será substituído pela sequência de todos os DATAFIELD existentes
  // no seu formulário. Os campos que não serão acessíveis/visíveis para o usuário devem ser
  // adicionados como um "HIDDNE FIELD" no form ou simplesmente, adicione após o coringa [[field]]
  //
  // Ex: SELECT [[fields]], field1, field2 etc como um select normal
  //
  // O 'coringa' [[table]] será substituido no frmBaseCRUD pela respectiva tabela que foi vinculada no click do menu principal
  //
  // O 'coringa' [[pk]] será substituido no frmBaseCRUD pela respectiva chave primaria da tabela
  // atual que foi vinculada no click do menu principal, por padrão ele não é exibido, para que a chave primária seja exibida
  // substitua [[pk]] por [[pk-show]]
  //
  // haverá situações que precisarão de alteraçao, adicionando JOINS etc.., mas seguindo a estrutura proposta,
  // a maioria dos forms terá pouquíssima mudança
  //
  // EN
  //
  // The 'wildcard' [[fields]] will be replaced by the string of all existing DATAFIELDs
  // in your form. Fields that will not be accessible/visible to the user must be
  // added as a "HIDDNE FIELD" in the form or simply add it after the wildcard [[field]]
  //
  // Ex: SELECT [[fields]], field1, field2 etc like a normal select
  //
  // The 'wildcard' [[table]] will be replaced in frmBaseCRUD by the respective table that was linked in the main menu click
  //
  // The 'wildcard' [[pk]] will be replaced in frmBaseCRUD by the respective primary key of the table
  // current one that was linked on the main menu click, by default it is not displayed, so the primary key is displayed
  // replace [[pk]] with [[pk-show]]
  //
  // there will be situations that will need to be changed, adding JOINS etc.., but following the proposed structure,
  // most forms will have very little change
  sqlMaster.close;
  sqlMaster.SQL.Text := ' SELECT [[fields]]   ' +
                        '   FROM [[table]] tab ' +
                        '  WHERE tab.[[pk]] = :table_pk ' +  // Apenas cadastro MESTRE é necessário o WHERE( por enquanto )

                        ' [grid] ' + // este 'coringa' indica ao RadCORE o início da query usada na pesquisa padrão

                        ' SELECT ' +

                        //' [[firstshow:20]] ' +
                        '   tab.[[pk]] as "CÓDIGO", tab.nome, tab.cnpj_cpf ,' +
                        '   tab.Fone1 , ' +
                        // se você quiser concatenar conteúdo de campos e manter compatibilidade sem recorrer ao FireDac pode usar a função abaixo:
                        // if you want to concatenate field content and maintain compatibility without resorting to FireDac you can use the function below:
                        //'   ( ' + dm_rc.rc_GetSQL( mm.CONFIG_DATABASE_FIREDAC, 'cmd_concat',0,0,'tab.ddd1,tab.fone1:15' ) + ' ) as Fone1 , tab.descrifone1 , ' +
                        //'   tab.email , ' +
                        '   tab.cep , ' +
                        '   tab.endereco , tab.numero , tab.complemento , ' +
                        '   cidades.descricao as cidade , ' +
                        '   ufs.descricao as uf , ' +
                        '   tab.valor_contrato, ' +
                        '        [[allpks]] ' +   // só é necessário o [[allpks]] aqui se estiver usando ALIAS em um campo CHAVE PRIMARIA
                                                  // only need [[allpks]] here if using ALIAS in a PRIMARY KEY field
                        ' , tab.dtcadastro ' + // v. 4.0.0.0 ( If need to search by date only not a period )
                        ' , tab.dtaniversario ' + // v. 4.0.0.0 ( If need to search by date only not a period )

                        ' FROM  [[table]] tab ' +

                        ' LEFT JOIN ufs ufs ON ufs.codigo = tab.codiuf ' +
                        ' LEFT JOIN cidades cidades ON cidades.codigo = tab.codicidade ' ;

  // [PT]
  // usado na formação da query da pesquisa dinâmica do grid( sqlSearchMaster )
  // você pode usar para criar filtros multiempresa, registro excluido logicamente etc.
  // [EN]
  // used in the formation of the dynamic grid search query ( sqlSearchMaster )
  // you can use to create multi-company filters, logically excluded record, etc.
  ed_Where_Search.Text := ' tab.codiemp = ' + IntToStr( mm.varI_Code_Company ) ;
  ed_Order_Search.Text := '';
  //[PT]
  // se esta global estiver preenchida, ao clicar em EXCLUIR , o registro não será excluído fisicamente do banco de dados
  // toda codificação para filtrar os registros por esse campo fica por conta do desenvolvedor, o RadCORE apenas não vai executar a rotina que exclui o registro
  //[EN]
  // if this global is filled, when clicking on DELETE , the record will not be physically deleted from the database
  // all coding to filter records by this field is up to the developer, RadCORE just won't execute the routine that deletes the record
  ed_Table_Deleted_Field.Text := '';

  // v. 3.1.0.60
  // pre-defined grid columns attributes
  //
  dbgSearchCRUD.Hint := '[[' +
                        'fieldmasks:' +
                        //'no-paged|' +
                        //'grid-noforcefit|' +
                        'grid-forcefit:10 mobile-v-5 mobile-h-8|' + // v. 4.0.0.0
                        'model-crud:1|' +
                        'grid-resize|' +
                        'firstshow:0|'+  // v. 3.2.0.2
                        'grid-paginator:center|' + // v. 4.0.0.0
                        'código[[' +
                        //'   locked|' +
                        '   title:translate(codigo)|' +
                        '   titlealign:c|' +
                        '   align:c|' +
                        '   width:135 mobile:90]];' +
                        // v. 4.0.0.0
                        // [PT]
                        // alguns campos com strings muito grandes são interpretados pelo unigui como MEMO e não
                        // sao exibidos, este atributo força a exibição do texto
                        // [EN]
                        // some fields with very large strings are interpreted by unigui as MEMO and not
                        // are displayed, this attribute forces the text to be displayed
                        //'memotest[[' +
                        //'   displaymemo|]];' +

                        'nome[[' +
                        '   title:translate(nome)]];' +

                        'email[[' +
                        '     visible:false mobile]];' +

                        'endereco[[' +
                        '     visible:false mobile]];' +

                        'numero[[' +
                        '   visible:false mobile|' +
                        '   align:r]];' +

                        'complemento[[' +
                        '     visible:false]];' +

                        'cidade[[' +
                        '     visible:false mobile]];' +

                        'uf[[' +
                        '     visible:false mobile]];' +

                        'fone1[[' +
                        '     visible:false mobile]];' +

                        'cnpj_cpf[[' +
                        '     visible:false mobile]];' +
                        // v. 4.0.0.0
                        'dtcadastro[[' +
                        '     visible:false]];' +
                        'dtaniversario[[' +
                        '     visible:false]];' +

                        'cep[['+
                        '   visible:false mobile|' +
                        '   align:c|'+
                        '   mask:' + mm.varC_Mask_cep + ']];' +

                        'valor_contrato[[' +
                        '   visible:false mobile|' +
                        '   cls:{<130,color-red,color-black}|'+
                        '   mask:' + PFmtSettings.CurrencyString + ' ' + mm.varC_Mask_float + ']]; ' +

                        'limitecredito[[' +
                        '   visible:false mobile|' +
                        '   cls:color-blue]];' +

                        ']]';

  // parametros de pesquisa especifica por datas( pesq. por periodo )  - ANTES DO INHERITED
  dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDFieldDate.name, 'tab.dtcadastro'    , 'CADASTRO' );
  dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDFieldDate.name, 'tab.dtaniversario' , 'NASCIMENTO' );

  inherited;

  //exclusivo da sua software house
  //

  tabLicencas.TabVisible := ( mm.varC_Doc_Customer = SOFTWAREHOUSE_CNPJ );  //se o sistema rodando atual for da sua software house

  // parametros de pesquisa padrao - DEPOIS DO INHERITED
  //
  // caso no SELECT do GRID acima...vc use ALIAS e este campo for usado pra pesquisa, coloque o alias TAMBÉM abaixo
  // sempre use o ' as ' pra definir o ALIAS Ex: tab.nome as CLIENTE -> NÃO use: (tab.nome)CLIENTE
  dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField1.name   , 'tab.' + ed_PK.Text + ' as "CÓDIGO"', 'CÓDIGO' );
  dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField1.name   , 'tab.nome'          , 'NOME ou FANTASIA' );
  //dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField1.name   , 'tab.razsoc as "RAZÃO SOCIAL"'        , 'RAZÃO SOCIAL' ); // v. 3.2.0.3
  dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField1.name   , 'tab.cnpj_cpf'      , 'CNPJ ou CPF' );
  // v. 4.0.0.0
  dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField1.name   , 'tab.dtcadastro'    , 'DATA CADASTRO' );
  dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField1.name   , 'tab.dtaniversario'    , 'DATA NASCIMENTO' );

  // parametros de pesquisa complementar( opcional )
  //
  // particularidades do form
  //

end;
// v. 4.0.0.6
procedure TfrmCadCLIENTES.btnSaveRegClick(Sender: TObject);
begin
   //[PT]
   // se vc precisa validar alguma informação antes de gravar o registro, você pode usar a global "mm.varB_OperationProcessed"
   // e condicionar a execução do "inherited"
   //[EN]
   // if you need to validate some information before writing the record, you can use the global "mm.varB_OperationProcessed"
   // and condition the execution of "inherited"
   (*
   if field = 'x' then
      mm.varB_OperationProcessed := false
   else
      mm.varB_OperationProcessed := true

   if mm.varB_OperationProcessed then
      inherited;
   *)

  inherited;

  //[PT]
  // se algum erro ocorreu no processo de execução do "inherited" você pode validar a global "mm.varB_OperationProcessed" para
  // processar mais alguma sequência de código após a gravação do registro
  //[EN]
  // if an error occurred in the "inherited" execution process you can validate the global "mm.varB_OperationProcessed" to
  // process some more code sequence after recording the record
  if mm.varB_OperationProcessed then //dbgSearchCRUD.Tag > 0 then
  begin

       // procedimentos pós-exclusao
       //

  end;
end;

procedure TfrmCadCLIENTES.btnSendZapClick(Sender: TObject);
begin
  inherited;
  // forum unigui: http://forums.unigui.com/index.php?/topic/14517-call-phone/
  UniSession.AddJS( 'window.location.href="tel://' + edPhone.Text + '"');
end;

procedure TfrmCadCLIENTES.Veculos1Click(Sender: TObject);
begin
  inherited;
  //                              MASTER  DETAIL TABLE  MASTER FIELD   DETAIL FORM TITLE
  if dm_rc.rc_PrepareDetailForm( Self , 'clientes_veiculos' , 'codicli' , labTitleForm.Caption + ' ( ' + TMenuItem(Sender).Caption + ' )' ) > 0 then
  begin
      frmCadCLIENTES_VEICULOS.ShowModal(
         procedure(Sender: TComponent; Result:Integer)
         begin
           //callback....nesse caso, não é necessário tratar o retorno

           //atualiza pesquisa pois os ToTAIS podem ter sido alterados
           //
           dm_rc.rc_OpenQuery( sqlSearchMaster );

         end );
  end;
end;

procedure TfrmCadCLIENTES.RevisoesClick(Sender: TObject);
begin
  inherited;

  //                              MASTER  DETAIL TABLE          MASTER FIELD   DETAIL FORM TITLE
  if dm_rc.rc_PrepareDetailForm( Self , 'clientes_revisoes' , 'codicli'   ,  labTitleForm.Caption + ' ( ' + TMenuItem(Sender).Caption + ' )' ) > 0 then
  begin
      frmCadCLIENTES_REVISOES.ShowModal(
         procedure(Sender: TComponent; Result:Integer)
         begin
           //callback....nesse caso, não é necessário tratar o retorno

           //atualiza pesquisa pois os ToTAIS podem ter sido alterados
           //
           dm_rc.rc_OpenQuery( sqlSearchMaster );

         end );
  end;
end;

initialization
  RegisterClass(TfrmCadCLIENTES);

end.
