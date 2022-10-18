unit untCadRECIBOS;

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
  uniDBCheckBox, uniSpeedButton, Vcl.Menus, uniMainMenu, uniScrollBox,

  uniGUIForm,

  uniHTMLFrame, uniSweetAlert;

type
  TfrmCadRECIBOS = class(TfrmBaseCRUD)
    EmitirReciboSimples1: TUniMenuItem;
    UniDBEdit10: TUniDBEdit;
    UniScrollBox2: TUniScrollBox;
    rcBlock40: TUniContainerPanel;
    UniLabel4: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    rcBlock50: TUniContainerPanel;
    UniLabel6: TUniLabel;
    UniDBEdit5: TUniDBEdit;
    rcBlock60: TUniContainerPanel;
    UniLabel1: TUniLabel;
    UniDBEdit2: TUniDBEdit;
    rcBlock70: TUniContainerPanel;
    UniLabel5: TUniLabel;
    UniDBEdit3: TUniDBEdit;
    rcBlock90: TUniContainerPanel;
    UniLabel7: TUniLabel;
    UniDBEdit4: TUniDBEdit;
    rcBlock100: TUniContainerPanel;
    UniLabel8: TUniLabel;
    UniDBEdit7: TUniDBEdit;
    rcBlock120: TUniContainerPanel;
    UniLabel9: TUniLabel;
    UniDBEdit8: TUniDBEdit;
    rcBlock110: TUniContainerPanel;
    UniLabel10: TUniLabel;
    UniDBEdit6: TUniDBEdit;
    rcBlock30: TUniContainerPanel;
    UniLabel11: TUniLabel;
    rcBlock80: TUniContainerPanel;
    UniLabel12: TUniLabel;
    rcBlock20: TUniContainerPanel;
    rcBlock10: TUniContainerPanel;
    edCodigo: TUniDBEdit;
    UniLabel3: TUniLabel;
    procedure UniFrameCreate(Sender: TObject);
    procedure UniBitBtn3Click(Sender: TObject);
    procedure EmitirReciboSimples1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

implementation

{$R *.dfm}

uses untdm_rc, MainModule, untFrmLookUp, Main, // untDM_LOOKUPs,
     untReportReciboSimples, mkm_func_report, mkm_func_web;
// v. 3.2.0.7

procedure TfrmCadRECIBOS.EmitirReciboSimples1Click(Sender: TObject);
var
   pFormAtual : TUniForm;
   pSqlMaster : TFDQuery;

   WhereAnd  : string;
begin
  inherited;
  dbgSearchCRUD.Tag := StrToIntDef( dsSearchMaster.DataSet.FieldByName( ed_PK.Text ).AsString , 0 ) ;

  if dbgSearchCRUD.Tag > 0 then
  begin
     pFormAtual := frmReportReciboSimples;
     pSqlMaster := TFDQuery( pFormAtual.FindComponent( 'sqlMaster' ) );
     Try
       // preenche dados cabecalho e rodape
       //
       rc_fortesReportHeader( Self, pFormAtual );

       WhereAnd := '';

       pSqlMaster.SQL.Text := sqlMaster.SQL.Text;

       pSqlMaster.ParamByName( 'table_pk' ).AsInteger := dbgSearchCRUD.Tag;

       pSqlMaster.SQL.Text := RemoveLineBreaks( pSqlMaster.Sql.Text);

       if not dm_rc.rc_OpenQuery( pSqlMaster ) then
       begin
          pSqlMaster.close;
          Abort;
       end;

       TUniLabel( pFormAtual.FindComponent( 'labTitleFrm' ) ).Caption := TMenuItem(Sender).Caption;

       // -----------------------------------------------------------------
       //
       //
       pFormAtual.ShowModal;
     Finally
            pFormAtual.Free;
     End;
  end
   else
       dm_rc.rc_ShowMessage( mm.MSG_SELECT_VALID_RECORD );
end;

procedure TfrmCadRECIBOS.UniBitBtn3Click(Sender: TObject);
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

procedure TfrmCadRECIBOS.UniFrameCreate(Sender: TObject);
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

                        '[grid]' +

                        ' SELECT ' +

                        ' tab.[[pk]] as "CÓDIGO", ' +
                        ' tab.descricao , ' +
                        '        [[allpks]] ' +   // só é necessário o [[allpks]] aqui se estiver usando ALIAS em um campo CHAVE PRIMARIA

                        ' FROM [[table]] tab ';

  inherited;

  // parametros de pesquisa padrao - DEPOIS DO INHERITED
  //
  dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField1.name   , 'tab.' + ed_PK.Text + ' as "CÓDIGO"' , 'CÓDIGO' );
  dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField1.name   , 'tab.descricao'        , 'DESCRIÇÃO' );

  // particularidades do form
  //

end;

initialization
  RegisterClass(TfrmCadRECIBOS);

end.
