unit untCadCLIENTES_VEICULOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, untfrmBaseCRUDDetail, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  uniGUIBaseClasses, uniTimer, FireDAC.Comp.Client, Vcl.Menus, uniMainMenu,
  Data.DB, FireDAC.Comp.DataSet, uniEdit, uniPanel, uniBasicGrid, uniDBGrid,
  uniPageControl, uniButton, uniBitBtn, uniLabel, uniScrollBox, uniDBEdit,
  uniSpeedButton;

type
  TfrmCadCLIENTES_VEICULOS = class(TfrmBaseCRUDDetail)
    rcBlock10: TUniContainerPanel;
    edID: TUniDBEdit;
    UniLabel4: TUniLabel;
    rcBlock30: TUniContainerPanel;
    UniLabel6: TUniLabel;
    rcBlock20: TUniContainerPanel;
    UniLabel5: TUniLabel;
    edLkpCARROS: TUniDBEdit;
    UniDBEdit1: TUniDBEdit;
    procedure UniFormCreate(Sender: TObject);
    procedure btnDeleteRegClick(Sender: TObject);
    procedure btnNewRegClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmCadCLIENTES_VEICULOS: TfrmCadCLIENTES_VEICULOS;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untdm_rc;

function frmCadCLIENTES_VEICULOS: TfrmCadCLIENTES_VEICULOS;
begin
  Result := TfrmCadCLIENTES_VEICULOS(mm.GetFormInstance(TfrmCadCLIENTES_VEICULOS));
end;

procedure TfrmCadCLIENTES_VEICULOS.btnDeleteRegClick(Sender: TObject);
begin
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

procedure TfrmCadCLIENTES_VEICULOS.btnNewRegClick(Sender: TObject);
begin
  inherited;

  //codigo do FORM MESTRE  
  //
 // sqlMaster.FieldByName( 'codicli' ).AsInteger := StrToIntDef( mm.varC_Code_ID , 0 );

end;

procedure TfrmCadCLIENTES_VEICULOS.UniFormCreate(Sender: TObject);
begin

  // tab.codigo por tab.[[pk]]
  //
  // O objetivo foi facilitar deixando o 'coringa' [[pk]]' ser substituido no frmBaseCRUD pela respectiva
  // chave primaria da tabela atual que foi vinculada no click do menu principal
  //
  // haverá situações que precisarão de alteraçao, mas seguindo a estrutura proposta, já ajuda
  //
//  sqlMaster.SQL.Text := ' SELECT [[fields]] ' +  //, tab.codicli ' +
//                        '   FROM [[table]] tab ' +   // o WHERE de acordo com as PK´s da tabela serão
//                                                     // adicionados dinamicamente
//                        ' [grid] ' + // este 'coringa' indica ao RadCORE o início da query usada na pesquisa padrão
//
//                        ' SELECT ' +
//                        '   tab.placa , ' +
//                        '   c.descricao as veiculo, ' +
//                        '   [[allpks]] ' +  // <- inserir todas as PKs dinamicamente
//                                            //    serão usadas no momento de uma ALTERACAO/EXCLUSAO pra montar o filtro corretamente
//                        ' FROM [[table]] tab ' +
//
//                        ' LEFT JOIN carros c ' +
//                        ' ON c.codigo = tab.codicarro ' ;//+

                        //' WHERE tab.codicli = ' + mm.varC_Code_ID ;

  ed_Where_Search.Text := '';//' tab.codicli = ' + mm.varC_Code_ID ;
                            // é pra exibir TODAS as EMPRESAS
                            //
                            //' tab.codiemp = ' + IntToStr( mm.varI_Code_Company ) +

  ed_Order_Search.Text := '';

  inherited;

end;

initialization
              RegisterClass( TfrmCadCLIENTES_VEICULOS );
end.
