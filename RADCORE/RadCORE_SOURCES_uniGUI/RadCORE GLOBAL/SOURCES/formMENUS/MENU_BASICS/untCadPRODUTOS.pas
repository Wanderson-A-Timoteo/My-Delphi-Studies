unit untCadPRODUTOS;

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
  uniDBCheckBox, uniSpeedButton, uniDBLookupComboBox, uniScrollBox, Vcl.Menus,
  uniMainMenu, uniHTMLFrame;

type
  TfrmCadPRODUTOS = class(TfrmBaseCRUD)
    pgComplementData: TUniPageControl;
    tabGeral: TUniTabSheet;
    sboxTab1: TUniScrollBox;
    rcBlock10: TUniContainerPanel;
    edCodigo: TUniDBEdit;
    UniLabel1: TUniLabel;
    rcBlock30: TUniContainerPanel;
    UniLabel3: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    rcBlock60: TUniContainerPanel;
    UniLabel4: TUniLabel;
    UniDBNumberEdit1: TUniDBFormattedNumberEdit;
    rcBlock70: TUniContainerPanel;
    UniLabel5: TUniLabel;
    UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit;
    rcBlock40: TUniContainerPanel;
    rcLabel4400: TUniLabel;
    edLKPGRUPOS: TUniDBEdit;
    rcBlock50: TUniContainerPanel;
    UniLabel6: TUniLabel;
    edLKPMARCAS: TUniDBEdit;
    procedure UniFrameCreate(Sender: TObject);
    procedure btnDeleteRegClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

implementation

{$R *.dfm}

uses untdm_rc, MainModule, untFrmLookUp, //untDM_LOOKUPs, 
     mkm_func_web, uconsts; 

procedure TfrmCadPRODUTOS.btnDeleteRegClick(Sender: TObject);
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

procedure TfrmCadPRODUTOS.UniFrameCreate(Sender: TObject);
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
                        '   FROM [[table]] tab ' +
                        '  WHERE tab.[[pk]] = :table_pk ' +  // Apenas cadastro MESTRE é necessário o WHERE( por enquanto )

                        ' [grid] ' + // este 'coringa' indica ao RadCORE o início da query usada na pesquisa padrão

                        ' SELECT ' +

                        '   tab.[[pk]] as "CÓDIGO", tab.descricao , tab.valor_compra, tab.valor_venda, ' +
                        '        [[allpks]] ' +   // só é necessário o [[allpks]] aqui se estiver usando ALIAS em um campo CHAVE PRIMARIA

                        ' FROM  [[table]] tab ' ;
  // -----------------------------------------------------------------
  //
  //
  // é pra exibir TODAS as EMPRESAS
  //
  ed_Where_Search.Text := '';//' tab.codiemp = ' + IntToStr( mm.varI_Code_Company ) ;

  ed_Order_Search.Text := '';


  // parametros de pesquisa especifica por datas( pesq. por periodo )  - ANTES DO INHERITED
  //

  inherited;

  // parametros de pesquisa padrao - DEPOIS DO INHERITED
  //
  dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField1.name   , 'tab.' + ed_PK.Text + ' as "CÓDIGO"', 'CÓDIGO' );
  dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField1.name   , 'tab.descricao'          , 'DESCRICAO' );
  // parametros de pesquisa complementar( opcional )
  //
  dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField2.name   , '' , '' );


  // particularidades do form
  //


end;

initialization
  RegisterClass(TfrmCadPRODUTOS);

end.
