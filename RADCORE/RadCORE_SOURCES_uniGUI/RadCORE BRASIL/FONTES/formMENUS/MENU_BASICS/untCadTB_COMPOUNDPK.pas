unit untCadTB_COMPOUNDPK; // v. 3.2.0.5

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIApplication, uniGUIClasses, uniGUIFrame, untfrmBaseCRUD, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.Menus, uniMainMenu, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uniHTMLFrame, uniDateTimePicker, uniCheckBox, uniEdit, uniMultiItem,
  uniComboBox, uniScrollBox, uniPanel, uniBasicGrid, uniDBGrid, uniPageControl,
  uniButton, uniBitBtn, uniLabel, uniGUIBaseClasses, uniDBEdit,
  uniDBDateTimePicker;

type
  TfrmCadTB_COMPOUNDPK = class(TfrmBaseCRUD)
    rcBlock10: TUniContainerPanel;
    UniLabel5: TUniLabel;
    rcBlock20: TUniContainerPanel;
    UniLabel6: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    UniDBDateTimePicker1: TUniDBDateTimePicker;
    rcBlock15: TUniContainerPanel;
    rcBlock5: TUniContainerPanel;
    edCodigo: TUniDBEdit;
    UniLabel3: TUniLabel;
    procedure UniFrameCreate(Sender: TObject);
    procedure UniBitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses MainModule, untdm_rc;

procedure TfrmCadTB_COMPOUNDPK.UniBitBtn3Click(Sender: TObject);
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
       // como um ajuste de saldo...etc...

  end;

end;

procedure TfrmCadTB_COMPOUNDPK.UniFrameCreate(Sender: TObject);
begin
  // -----------------------------------------------------------------
  //
  //
  // tab.codigo por tab.[[pk]]
  //
  // O objetivo foi facilitar deixando o 'coringa' [[pk]]' ser substituido no frmBaseCRUD pela respectiva
  // chave primaria da tabela atual que foi vinculada no click do menu principal
  //
  // haverá situações que precisarão de alteraçao, mas seguindo a estrutura proposta, já ajuda
  //
  sqlMaster.close;
  sqlMaster.SQL.Text := ' SELECT [[fields]] ' +
                        ' FROM [[table]] tab ' +
                        ' WHERE tab.[[pk]] = :table_pk ' +  // Apenas cadastro MESTRE é necessário o WHERE( por enquanto )
                        //' AND   tab.[[pk2]] = [[fpk1:date]] ' +

                        ' [grid] ' + // este 'coringa' indica ao RadCORE o início da query usada na pesquisa padrão

                        ' SELECT ' +

                        '   tab.[[pk]] , ' +
                        //'   tab.[[pk2]], ' +
                        '   tab.ItemDate , ' +
                        '   tab.Description  ' +
                        //'        [[allpks]] ' +   // só é necessário o [[allpks]] aqui se estiver usando ALIAS em um campo CHAVE PRIMARIA

                        ' FROM  [[table]]  tab ' ;

  // parametros de pesquisa especifica por datas( pesq. por periodo )  - ANTES DO INHERITED
  //
  //dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDFieldDate.name, 'tab.data' , 'DATA' );

  // pre-defined grid columns attributes
  dbgSearchCRUD.Hint := '[[' +
                        //'no-paged|' +
                        'fieldmasks:' +
                        'grid-resize|' +

//                        'saldo_ini[[' +
//                        '   cls:{<0,color-red,color-black}|'+
//                        '   mask:' + PFmtSettings.CurrencyString + ' ' + mm.varC_Mask_float + ']]; ' +

                        ']]' ;
  inherited;
  // particularidades do form
  //
end;

initialization

   RegisterClass( TfrmCadTB_COMPOUNDPK );

end.
