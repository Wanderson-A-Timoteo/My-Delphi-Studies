unit untCadREVISOES;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, untFrmBaseCRUD, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.Client, Vcl.Menus, uniMainMenu, Data.DB, FireDAC.Comp.DataSet, uniHTMLFrame, uniBasicGrid, uniDBGrid, uniDateTimePicker, uniCheckBox, uniMultiItem, uniComboBox,
  uniScrollBox, uniPanel, uniPageControl, uniButton, uniBitBtn, uniEdit, uniLabel, uniGUIBaseClasses, uniDBDateTimePicker, uniDBEdit;

type
  TfrmCadREVISOES = class(TfrmBaseCRUD)
    rcBlock10: TUniContainerPanel;
    rcLabel10: TUniLabel;
    edLkpCLIENTES_VEICULOS: TUniDBEdit;
    rcBlock20: TUniContainerPanel;
    UniLabel5: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    rcBlock40: TUniContainerPanel;
    UniLabel6: TUniLabel;
    UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit;
    rcBlock30: TUniContainerPanel;
    UniLabel7: TUniLabel;
    UniDBDateTimePicker1: TUniDBDateTimePicker;
    rcBlock5: TUniContainerPanel;
    UniLabel1: TUniLabel;
    edLkpCLIENTES: TUniDBEdit;
    procedure edLkpCLIENTES_VEICULOSClick(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses untDM_RC, MainModule;

procedure TfrmCadREVISOES.edLkpCLIENTES_VEICULOSClick(Sender: TObject);
begin
  inherited;
  dm_rc.rc_LookUpSearchFilter( Sender, 'codicli = ' + sqlMaster.FieldByName('codicli').Asstring , '', 'placa' );
end;

procedure TfrmCadREVISOES.UniFrameCreate(Sender: TObject);
begin
  // tab.codigo por tab.[[pk]]
  //
  // O objetivo foi facilitar deixando o 'coringa' [[pk]]' ser substituido no frmBaseCRUD pela respectiva
  // chave primaria da tabela atual que foi vinculada no click do menu principal
  //
  // haverá situações que precisarão de alteraçao, mas seguindo a estrutura proposta, já ajuda
  sqlMaster.close;
  sqlMaster.SQL.Text := ' SELECT [[fields]]  ' +
                        '   FROM [[table]] tab ' +
                        '  WHERE tab.[[pk]] = :table_pk ' +  // Apenas cadastro MESTRE é necessário o WHERE( por enquanto )

                        ' [grid] ' +                 // este 'coringa' indica ao RadCORE o início da query usada na pesquisa padrão

                        ' SELECT ' +
                        // v. 3.1.0.63
                        // se você quiser concatenar conteúdo de campos e manter compatibilidade sem recorrer ao FireDac pode usar a função abaixo:
                        // if you want to concatenate field content and maintain compatibility without resorting to FireDac you can use the function below:
                        '   ( ' + dm_rc.rc_GetSQL( mm.CONFIG_DATABASE_FIREDAC, 'cmd_concat',0,0,'v.placa,'' '',c.descricao:35' ) + ' ) as Veiculo , ' +

                        '   tab.km_revisao as Revisao, ' +
                        '   tab.data, ' +
                        '   tab.total ,' +
                        '   [[allpks]] ' +  // <- inserir todas as PKs dinamicamente
                                            //    serão usadas no momento de uma ALTERACAO/EXCLUSAO pra montar o filtro corretamente

                        ' FROM [[table]] tab ' +

                        ' LEFT JOIN clientes_veiculos v ' +
                        ' ON v.codigo = tab.codiveiculo ' +

                        ' LEFT JOIN carros c ' +
                        ' ON c.codigo = v.codicarro ' ;//+

                        //' WHERE tab.codicli = ' + mm.varC_Code_ID ; // <- filtro PRINCIPAL de um mestre/detalhe

  ed_Where_Search.Text := '';
  ed_Order_Search.Text := '';

  // pre-defined grid columns attributes
  dbgSearchCRUD.Hint :=
    '[[' +
    //'no-paged|' +
    'fieldmasks:' +
    'grid-resize|' +


   // 'total[[' +
   // '  mask:#,#0.00##]]; ' +

    'Revisao[[' +
    '  mask:###### km]]; ' +

    ']]' ;
  inherited;

end;

initialization
   RegisterClass( TfrmCadREVISOES );

end.
