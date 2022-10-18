unit untCadBASICS; // v. 3.2.0.7

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, System.StrUtils, str_func,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, untfrmBaseCRUD, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniEdit,
  uniDateTimePicker, uniCheckBox, uniMultiItem, uniComboBox, uniBasicGrid,
  uniDBGrid, uniPanel, uniPageControl, uniButton, uniBitBtn, uniLabel,
  uniGUIBaseClasses, uniDBComboBox, uniDBDateTimePicker, uniDBEdit,
  uniDBCheckBox, uniSpeedButton, Vcl.Menus, uniMainMenu, uniScrollBox,
  uniHTMLFrame, uniSweetAlert;

type
  TfrmCadBASICS = class(TfrmBaseCRUD)
    rcBlock1: TUniContainerPanel;
    edID: TUniDBEdit;
    rcBlock4: TUniContainerPanel;
    edDescription: TUniDBEdit;
    labDescription: TUniLabel;
    labID: TUniLabel;
    procedure UniFrameCreate(Sender: TObject);
    procedure UniFrameDestroy(Sender: TObject);
    procedure btnDeleteRegClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

implementation

{$R *.dfm}

uses untdm_rc,
     //uconsts_msgs_portuguese,
     MainModule, untFrmLookUp, Main, uconsts; //untDM_LOOKUPs,




procedure TfrmCadBASICS.btnDeleteRegClick(Sender: TObject);
begin

     // aqui você pode customizar a mensagem de exclusão de registro
     // use essa variável em qualquer form antes do inherited
     //
     // here you can customize the record deletion message
     // use this variable in any form before inherited

     // mm.varC_CustomMsg := 'Quer mesmo excluir o registro ?';

  inherited;

  // no frmBaseCRUD já tem a critica de MOVIMENTACAO pra o registro que
  // esta sendo deletado...
  //
  // dm_rc.rc_HasCodeRegistered
  //

  // criticas antes da exclusao
  //

  if mm.varB_OperationProcessed then
  begin

       // procedimentos pós-exclusao
       //

  end;
end;

procedure TfrmCadBASICS.UniFrameCreate(Sender: TObject);
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
  sqlMaster.SQL.Text := ' SELECT [[fields]]  ' +
                        '   FROM [[table]] tab ' +
                        '  WHERE tab.[[pk]] = :table_pk ' +  // Apenas cadastro MESTRE é necessário o WHERE( por enquanto )

                        '[grid]' +

                        ' SELECT ' +

                        ' tab.[[pk]] as "' + mm.ARRAY_BASICS_FLD_ID_ALIAS + '" , ' +
                        ' tab.'            + mm.ARRAY_BASICS_FLD_DESCRIPTION_NAME + ' as "' + mm.ARRAY_BASICS_FLD_DESCRIPTION_ALIAS + '", ' +
                        ' [[allpks]] '     +   // só é necessário o [[allpks]] aqui se estiver usando ALIAS em um campo CHAVE PRIMARIA( as "CÓDIGO" )
                        ' FROM [[table]] tab ';

  // usado na formação da query da pesquisa dinâmica do grid( sqlSearchMaster )
  //
  ed_Where_Search.Text    := '' ;
  ed_Order_Search.Text    := 'tab.' + mm.ARRAY_BASICS_FLD_DESCRIPTION_NAME;


  edID.ReadOnly           := not AnsiMatchStr( ed_Table_ItemSel.Text , ARRAY_PK_NO_INC ) ;
  edID.Color              := varIIF( edID.ReadOnly, clGray, clWhite );
  //LABELS
  labID.Caption           := mm.MSG_FIELD_NAME_CODE;
  labDescription.Caption  := mm.MSG_FIELD_NAME_DESCRIPTION;
  // BASIC CRUD field names
  edID.DataField          := mm.ARRAY_BASICS_FLD_ID_NAME;
  edDescription.DataField := mm.ARRAY_BASICS_FLD_DESCRIPTION_NAME;

  // se a tabela atual permitir pesquisas por intervalo de datas...
  // parametros de pesquisa especifica por datas( pesq. por periodo )  - ANTES DO INHERITED
  // os periodos de pesq. de data só serão exibidos se houver algum campo adicionado
  //
  // dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDFieldDate.name, 'tab.data' , 'DATA' );

  inherited;

  // parametros de pesquisa padrao - DEPOIS DO INHERITED
  //
  // caso no SELECT do [grid] acima...vc use ALIAS e este campo for usado pra pesquisa, coloque o alias TAMBÉM abaixo
  // sempre use o ' as ' pra definir o ALIAS Ex: tab.nome as CLIENTE -> NÃO use: (tab.nome)CLIENTE
  //
  dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField1.name   , 'tab.' + ed_PK.Text + ' as "' + mm.ARRAY_BASICS_FLD_ID_ALIAS + '"' , mm.ARRAY_BASICS_FLD_ID_ALIAS  );
  dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField1.name   , 'tab.' + mm.ARRAY_BASICS_FLD_DESCRIPTION_NAME + ' as "' + mm.ARRAY_BASICS_FLD_DESCRIPTION_ALIAS + '"' , mm.ARRAY_BASICS_FLD_DESCRIPTION_ALIAS );

  // parametros de pesquisa composta( opcional )
  //
  // dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField2.name   , '' , '' );

  // adicione aqui codificação específica para este form, caso seja necessário
  //

end;

procedure TfrmCadBASICS.UniFrameDestroy(Sender: TObject);
begin
  inherited;

//  dica cor da font dos botoes
//
// mas serve pra criar CSS dinamico herdado
//
(*
 with WebForm, JSInterface do
  begin
    JSCallGlobal('Ext.util.CSS.createStyleSheet',['#'+WebForm.JSName+'_id .x-css-shadow { box-shadow: none !important;}']);
  end;
*)
//  // on create
//  with btnSearch, JSInterface do
//  begin
//    JSCallGlobal('Ext.util.CSS.createStyleSheet',
//                  ['#' + JSId +'.x-btn .x-btn-inner { color: red !important;}',
//                  JSName + '_css1']);
//    JSCallGlobal('Ext.util.CSS.createStyleSheet',
//                  ['#' + JSId +'.x-btn-over .x-btn-inner { color: yellow !important;}',
//                  JSName + '_css2']);
//  end;
//
//  //on destroy
//  with btnSearch, JSInterface do
//  begin
//    JSCallGlobal( 'Ext.util.CSS.removeStyleSheet',[JSName + '_css1']);
//    JSCallGlobal( 'Ext.util.CSS.removeStyleSheet',[JSName + '_css2']);
//  end;

end;

initialization
  RegisterClass(TfrmCadBASICS);

end.
