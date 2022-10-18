unit untCadT040001;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, untfrmBaseCRUD, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.Menus, uniMainMenu, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uniHTMLFrame, uniDateTimePicker, uniCheckBox, uniEdit, uniMultiItem,
  uniComboBox, uniScrollBox, uniPanel, uniBasicGrid, uniDBGrid, uniPageControl,
  uniButton, uniBitBtn, uniLabel, uniGUIBaseClasses, uniDBEdit, uniSweetAlert;

type
  TfrmCadT040001 = class(TfrmBaseCRUD)
    rcBlock10: TUniContainerPanel;
    edID: TUniDBEdit;
    UniLabel4: TUniLabel;
    rcBlock20: TUniContainerPanel;
    UniLabel5: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    procedure UniFrameCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses untdm_rc;

procedure TfrmCadT040001.UniFrameCreate(Sender: TObject);
begin
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

                        ' SELECT  tab.[[pk]] , ' +
                        '        tab.descricao ' +
                        //'        [[allpks]] ' +   // só é necessário o [[allpks]] aqui se estiver usando ALIAS em um campo CHAVE PRIMARIA
                        ' FROM [[table]] tab ';

  // usado na formação da query da pesquisa dinâmica do grid
  //
  // sqlSearchMaster
  //
  ed_Where_Search.Text := '' ;
  ed_Order_Search.Text := 'tab.descricao';

  inherited;

  // parametros de pesquisa padrao - DEPOIS DO INHERITED
  //
  // caso no SELECT do GRID acima...vc use ALIAS e este campo for usado pra pesquisa, coloque o alias TAMBÉM abaixo
  // sempre use o ' as ' pra definir o ALIAS Ex: tab.nome as CLIENTE -> NÃO use: (tab.nome)CLIENTE
  //
  dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField1.name   , 'tab.' + ed_PK.Text , 'CÓDIGO' );
  dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField1.name   , 'tab.descricao'     , 'DESCRIÇÃO' );

end;

initialization

   RegisterClass( TfrmCadT040001 );

end.
