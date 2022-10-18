unit untCadEMPRESAS;

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
  uniDBCheckBox, uniSpeedButton, uniScrollBox, Vcl.Menus, uniMainMenu,
  uniHTMLFrame, uniSweetAlert;

type
  TfrmCadEMPRESAS = class(TfrmBaseCRUD)
    pgComplementData: TUniPageControl;
    tabGeral: TUniTabSheet;
    sqlGeneric: TFDQuery;
    sqlCadGeral: TFDQuery;
    sboxTab1: TUniScrollBox;
    rcBlock10: TUniContainerPanel;
    edCodigo: TUniDBEdit;
    UniLabel3: TUniLabel;
    rcBlock50: TUniContainerPanel;
    UniLabel4: TUniLabel;
    edCnpj: TUniDBEdit;
    rcBlock80: TUniContainerPanel;
    UniLabel6: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    rcBlock90: TUniContainerPanel;
    UniLabel11: TUniLabel;
    edRazSoc: TUniDBEdit;
    rcBlock110: TUniContainerPanel;
    UniLabel21: TUniLabel;
    UniDBEdit4: TUniDBEdit;
    rcBlock120: TUniContainerPanel;
    UniLabel13: TUniLabel;
    UniDBEdit5: TUniDBEdit;
    rcBlock150: TUniContainerPanel;
    UniLabel14: TUniLabel;
    edLkpUFS: TUniDBEdit;
    rcBlock160: TUniContainerPanel;
    UniLabel15: TUniLabel;
    edLkpCIDADES: TUniDBEdit;
    rcBlock180: TUniContainerPanel;
    UniLabel16: TUniLabel;
    UniDBEdit6: TUniDBEdit;
    rcBlock190: TUniContainerPanel;
    UniLabel27: TUniLabel;
    UniDBEdit3: TUniDBEdit;
    rcBlock210: TUniContainerPanel;
    UniLabel28: TUniLabel;
    UniDBEdit7: TUniDBEdit;
    rcBlock230: TUniContainerPanel;
    UniLabel18: TUniLabel;
    edPhone: TUniDBEdit;
    UniDBEdit8: TUniDBEdit;
    UniLabel29: TUniLabel;
    rcBlock100: TUniContainerPanel;
    UniLabel22: TUniLabel;
    edCep: TUniDBEdit;
    rcBlock270: TUniContainerPanel;
    rcBlock60: TUniContainerPanel;
    procedure UniFrameCreate(Sender: TObject);
    procedure btnDeleteRegClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

implementation

{$R *.dfm}

uses untdm_rc, MainModule, untFrmLookUp, Main; // untDM_LOOKUPs, 


procedure TfrmCadEMPRESAS.btnDeleteRegClick(Sender: TObject);
begin
  // no frmBaseCRUD já tem a critica de MOVIMENTACAO pra o registro que
  // esta sendo deletado...
  //
  // dm_rc.rc_HasCodeRegistered
  //

  // criticas antes da exclusao
  //
  // -----------------------------------------------------------------
  //
  //
  //mm.varI_Temp1 := StrToIntDef( dsSearchMaster.DataSet.FieldByName( 'codigo' ).AsString , 0 ) ;//StrToIntDef( edCodigo.Text , 0 );
  mm.varI_Temp1 := StrToIntDef( dsSearchMaster.DataSet.FieldByName( ed_PK.Text ).AsString , 0 ) ;//StrToIntDef( edCodigo.Text , 0 );

  if mm.varI_Temp1 = 1 then //Matriz
  begin

       dm_rc.rc_ShowMessage( 'Não Posso Excluir a Matriz! ' );
       Abort;

  end;

  if mm.varI_Temp1 > 0 then
  begin

       sqlGeneric.Tag := 0;

       //sqlGeneric.Tag := sqlGeneric.Tag + sqlGeneric.FieldByName('TotReg').AsInteger; // v. 4.1.0.0

       sqlGeneric.Sql.Text := ' Select Count(*) as TotReg from Compras ' +
                             ' Where CodiEmp = ' + IntToStr( mm.varI_Temp1 );

       dm_rc.rc_OpenQuery( sqlGeneric );

       sqlGeneric.Tag := sqlGeneric.Tag + sqlGeneric.FieldByName('TotReg').AsInteger;

       sqlGeneric.Sql.Text := ' Select Count(*) as TotReg from Clientes ' +
                             ' Where CodiEmp = ' + IntToStr( mm.varI_Temp1 );

       dm_rc.rc_OpenQuery( sqlGeneric );

       sqlGeneric.Tag := sqlGeneric.Tag + sqlGeneric.FieldByName('TotReg').AsInteger;

       if sqlGeneric.Tag > 0 then
       begin

            dm_rc.rc_ShowMessage( 'Não Posso Excluir a Empresa. Houve Movimentação! ' );
            Abort;

       end;

  end;

  inherited;

  if mm.varB_OperationProcessed then //dbgSearchCRUD.Tag > 0 then
  begin


       // procedimentos pós-exclusao
       //


  end;
end;

procedure TfrmCadEMPRESAS.UniFrameCreate(Sender: TObject);
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

                        '   tab.[[pk]] as "CÓDIGO", tab.descricao as fantasia , ' + // v. 3.3.0.2
                        '   tab.Fone1 , tab.descrifone1 , ' + // v. 3.1.0.63
                        // se você quiser concatenar conteúdo de campos e manter compatibilidade sem recorrer ao FireDac pode usar a função abaixo:
                        // if you want to concatenate field content and maintain compatibility without resorting to FireDac you can use the function below:
                        //'   ( ' + dm_rc.rc_GetSQL( mm.CONFIG_DATABASE_FIREDAC, 'cmd_concat',0,0,'tab.ddd1,tab.fone1:15' ) + ' ) as Fone1 , tab.descrifone1 , ' +

                        '   tab.email , ' +
                        '   tab.cep , ' +
                        '   tab.endereco , tab.numero ,  ' +
                        '   cidades.descricao as cidade , ' +
                        '   ufs.descricao as uf , ' +
                        '        [[allpks]] ' +   // só é necessário o [[allpks]] aqui se estiver usando ALIAS em um campo CHAVE PRIMARIA

                        ' FROM  empresas  tab ' +

                        ' LEFT JOIN ufs ufs ON ufs.codigo = tab.codiuf ' +
                        ' LEFT JOIN cidades cidades ON cidades.codigo = tab.codicidade ' ;

  // parametros de pesquisa especifica por datas( pesq. por periodo )  - ANTES DO INHERITED
  //

  inherited;

  // parametros de pesquisa padrao - DEPOIS DO INHERITED
  //
  dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField1.name   , 'tab.' + ed_PK.Text        , 'CÓDIGO' );
  dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField1.name   , 'tab.nome'        , 'NOME ou FANTASIA' );
  // parametros de pesquisa complementar( opcional )
  //
  dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField2.name   , '' , '' );


  // particularidades do form
  //

end;

initialization
  RegisterClass(TfrmCadEMPRESAS);

end.
