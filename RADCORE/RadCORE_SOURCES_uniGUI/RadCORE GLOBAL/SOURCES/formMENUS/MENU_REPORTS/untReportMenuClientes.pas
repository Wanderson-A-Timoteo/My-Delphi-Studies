unit untReportMenuClientes; // v. 3.2.0.7

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIForm, untfrmBaseReportMenu, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.Menus, uniMainMenu, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uniURLFrame, uniEdit, uniCheckBox, uniDateTimePicker, uniMultiItem,
  uniComboBox, uniScrollBox, uniPanel, uniPageControl, uniButton, uniBitBtn,
  uniLabel, uniGUIBaseClasses,

  str_func,

  RLParser, RLFilters, RLPDFFilter, RLReport, uniListBox, uniHTMLFrame,
  uniDBEdit, uniSpeedButton, uniDBDateTimePicker;

type
  TfrmReportMenuClientes = class(TfrmBaseReportMenu)
    rcBlock120: TUniContainerPanel;
    UniLabel7: TUniLabel;
    edLkpCLIENTES: TUniDBEdit;
    rcBlock130: TUniContainerPanel;
    cbAtivos: TUniCheckBox;
    cbBloqueados: TUniCheckBox;
    rcBlock200: TUniContainerPanel;
    procedure btnProcessReportClick(Sender: TObject);
    procedure btnSaveReportClick(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
    procedure labShowReportClick(Sender: TObject);
    procedure labDownloadReportClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fFormAtual : TUniForm;

    function ConfiguraQueryProcessamento( _Item: String): String;
  end;

implementation

{$R *.dfm}

uses untdm_rc, ServerModule, uniGUIApplication, uconsts, mkm_func_web, untReportClientesSimples,
  mkm_func_report, MainModule, Main;

procedure TfrmReportMenuClientes.btnProcessReportClick(Sender: TObject);
var
   pClassFormAtual : TUniFormClass;
   pFormAtual : TUniForm;

   pSqlMaster : TFDQuery;

   cTemp,
   WhereAnd ,  FClassName,
   AUrl : string;
begin
  inherited;

  mm.varDW_LastTick := GetTickCount;

  If not dm_rc.rc_PermissionVerify( mm.varC_Selected_FormFrame ,
                                    Trim( 'relatorios' ) , 1 ) then  // 'relatorios' = 'reports'
  begin
       Abort;
  end;


  FClassName := 'T' + cbxModelReport_form.Text ;
  pClassFormAtual := TUniFormClass( FindAnyClass( FClassName ) );
  pFormAtual := pClassFormAtual.Create( UniApplication );
  pSqlMaster := TFDQuery( pFormAtual.FindComponent( 'sqlMaster' ) );

  Try

     // preenche dados cabecalho e rodape
     //
     rc_fortesReportHeader( Self, pFormAtual );

     WhereAnd := '';

     btnSaveReport.Enabled := False;

     if TRLLabel( pFormAtual.FindComponent( 'labReportPeriod' ) ) <> nil then
        TRLLabel( pFormAtual.FindComponent( 'labReportPeriod' ) ).Visible := false;

     // O trecho ANTERIOR e POSTERIOR, tentei deixar o mais GENERICO e padrão possível
     // claro que sempre pode ser melhorado...
     //
     // Esta função vai SELECIONAR por relatorio e configurar sua respectiva query e filtros
     // pois cada opção pode ter 'N' filtros ou nenhum
     //
     pSqlMaster.SQL.Text := ConfiguraQueryProcessamento( cbxModelReport_form.Text );

     pSqlMaster.SQL.Text := RemoveLineBreaks( pSqlMaster.Sql.Text);

     // Exibir periodo se houver selecionado algum filtro por data
     //
     if cbxSearchCRUDFieldDate.Text <> '' then
     begin

          if TRLLabel( pFormAtual.FindComponent( 'labReportPeriod' ) ) <> nil then
          begin

             cTemp := cbxSearchCRUDFieldDate.Text;

             TRLLabel( pFormAtual.FindComponent( 'labReportPeriod' ) ).Visible := True;

             TRLLabel( pFormAtual.FindComponent( 'labReportPeriod' ) ).Caption := 'Período( ' + cTemp + ' ) de ' + edSearchCRUDDtIni.Text + ' a ' + edSearchCRUDDtEnd.Text;
          end;

     end;

     if not dm_rc.rc_OpenQuery( pSqlMaster ) then
     begin
        pSqlMaster.close;
        Abort;
     end;


     pgBaseCadControl.ActivePage := tabReport;

     // Informa o caminho temporario do PDF
     TRLReport( pFormAtual.FindComponent( 'RLReport' ) ).SaveToFile( sm.NewCacheFileUrl(False, 'pdf', '', '', AUrl, True));

     // Gera o PDF
     TRLReport( pFormAtual.FindComponent( 'RLReport' ) ).Prepare;

     // Mostra o PDF
     UniURLFrameReport.URL := AUrl;

     if UniApplication.FindComponent('MainForm' ) <> nil then MainForm.HideMask;

  Finally
         btnSaveReport.Enabled := True;
         pFormAtual.Free;

         //ShowMessage(  'Tempo( sem RDW ): ' + FloatToStr( GetTickCount - mm.varDW_LastTick ) );
  End;

end;

function TfrmReportMenuClientes.ConfiguraQueryProcessamento(_Item: String): String;
var
   cItemMenuSelecionado : String;
begin

   cItemMenuSelecionado := AnsiLowerCase ( _Item );

   // na minha estrutura praticamente TODOS relatorios de clientes vao usar a mesma critica abaixo
   //
   // mas a ideia é que pra CADA opção vc possa configurar a QUERY de RETORNO para geração do RELATÓRIO
   // selecionado nas opções

   if ( cItemMenuSelecionado = ansilowercase( 'frmReportClientesSimples' ) ) or
      ( cItemMenuSelecionado = ansilowercase( 'frmReportClientesCompleto' ) ) or
      ( cItemMenuSelecionado = ansilowercase( 'frmReportClientesAniversariante' ) ) then
   begin

      Result := ' SELECT tab.* ' +
                ' FROM clientes tab ' +
                ' WHERE 1 = 1';          // isso é pra poder inserir os ANDs dos filtros abaixo

      // tratar filtros de data
      // estes filtros poderão variar de acordo com a necessidade do relatório
      //
      if cbxSearchCRUDFieldDate.Text <> '' then
      begin

           Result := Result +
           ' AND ( ( ' + cbxSearchCRUDFieldDate_Fields.Text + ' >= ' + QuotedStr( FormatDateTime( 'dd.mm.yyyy', StrToDateDef( edSearchCRUDDtIni.Text, 0 ) ) ) + ')' +
           ' AND   ( ' + cbxSearchCRUDFieldDate_Fields.Text + ' <= ' + QuotedStr( FormatDateTime( 'dd.mm.yyyy', StrToDateDef( edSearchCRUDDtEnd.Text, 0 ) ) ) + ') )';

      end;

      // esses filtros são EXCLUSIVOS pra minha estrutura de tabela
      //
      // as referencias pra tabela tb_reports( em sqlMaster ) podem ser mantidas se desejar
      // pois essa tabela é de apoio para APROVEITAMENTO da rotina de controle dinamico dos LOOKUPs
      //
      if sqlMaster.FieldByName( 'codicli' ).AsInteger > 0 then
         Result := Result + ' AND tab.codigo = ' + sqlMaster.FieldByName( 'codicli' ).AsString;

      if cbAtivos.Checked then
         Result := Result + ' AND tab.ativo = ''S''' ;

      if cbBloqueados.Checked then
         Result := Result + ' AND tab.bloqueado = ''S''' ;

   end;

end;

procedure TfrmReportMenuClientes.labDownloadReportClick(Sender: TObject);
var
   pClassFormAtual : TUniFormClass;
   pFormAtual : TUniForm;

   FClassName: string;
begin
  inherited;
  FClassName      := 'T' + cbxModelReport_form.Text ;
  pClassFormAtual := TUniFormClass( FindAnyClass( FClassName ) );
  pFormAtual      := pClassFormAtual.Create( UniApplication );
  try
     rc_fortesReportSavePDF( Self, pFormAtual );
  finally
         pFormAtual.Free;
  End;
end;

procedure TfrmReportMenuClientes.labShowReportClick(Sender: TObject);
var
   pClassFormAtual : TUniFormClass;
   pFormAtual : TUniForm;

   pSqlMaster : TFDQuery;

   cTemp,
   WhereAnd ,  FClassName,
   AUrl : string;
begin
  // v. 3.2.0.7
  // PT:deve ser feita a verificação antes do 'inherited'
  //
  // EN:verification must be done before 'inherited'
  //
  // PT:'reportMenuClientes' é o campo em USUARIOS_RESTRICOES para controle de permissão aos relatórios de clientes
  //
  // EN:'reportMenuClientes' is the field in USUARIOS_RESTRICOES to control permission to client reports
  //
  // PT:'cbxModelReport_form.ItemIndex + 2': o parâmetro inicia normalmente com o valor 1,
  //    cbxModelReport_form.ItemIndex inicia com 0 e o valor 1 é referente ao ACESSO( no controle de permissões )
  //    então adiciona 2 ( ...+2 ) para fazer o controle de permissão as opções de relatório que desejar
  //
  // EN:'cbxModelReport_form.ItemIndex + 2': the parameter normally starts with the value 1,
  //    cbxModelReport_form.ItemIndex starts with 0 and the value 1 refers to ACCESS( in the permissions control)
  //    then add 2 ( ...+2 ) to make the permission control the reporting options you want
  if cbxModelReport_form.ItemIndex >= 0 then
     If not dm_rc.rc_PermissionVerify( mm.varC_Selected_FormFrame ,
                                       Trim( 'reportMenuClientes' ) ,
                                       cbxModelReport_form.ItemIndex + 2 ) then
     begin
          Abort;
     end;

  inherited;

  mm.varDW_LastTick := GetTickCount;

  FClassName      := 'T' + cbxModelReport_form.Text ;
  pClassFormAtual := TUniFormClass( FindAnyClass( FClassName ) );
  pFormAtual      := pClassFormAtual.Create( UniApplication );
  pSqlMaster      := TFDQuery( pFormAtual.FindComponent( 'sqlMaster' ) );

  Try
     // preenche dados cabecalho e rodape
     //
     rc_fortesReportHeader( Self, pFormAtual );

     WhereAnd := '';

     btnSaveReport.Enabled := False;

     if TRLLabel( pFormAtual.FindComponent( 'labReportPeriod' ) ) <> nil then
        TRLLabel( pFormAtual.FindComponent( 'labReportPeriod' ) ).Visible := false;

     // O trecho ANTERIOR e POSTERIOR, tentei deixar o mais GENERICO e padrão possível
     // claro que sempre pode ser melhorado...
     //
     // Esta função vai SELECIONAR por relatorio e configurar sua respectiva query e filtros
     // pois cada opção pode ter 'N' filtros ou nenhum
     //
     pSqlMaster.SQL.Text := ConfiguraQueryProcessamento( cbxModelReport_form.Text );

     pSqlMaster.SQL.Text := RemoveLineBreaks( pSqlMaster.Sql.Text);

     // Exibir periodo se houver selecionado algum filtro por data
     //
     if cbxSearchCRUDFieldDate.Text <> '' then
     begin

          if TRLLabel( pFormAtual.FindComponent( 'labReportPeriod' ) ) <> nil then
          begin

             cTemp := cbxSearchCRUDFieldDate.Text;

             TRLLabel( pFormAtual.FindComponent( 'labReportPeriod' ) ).Visible := True;

             TRLLabel( pFormAtual.FindComponent( 'labReportPeriod' ) ).Caption := 'Período( ' + cTemp + ' ) de ' + edSearchCRUDDtIni.Text + ' a ' + edSearchCRUDDtEnd.Text;
          end;

     end;

     if not dm_rc.rc_OpenQuery( pSqlMaster ) then
     begin
        pSqlMaster.close;
        Abort;
     end;

     pgBaseCadControl.ActivePage := tabReport;

     // Informa o caminho temporario do PDF
     TRLReport( pFormAtual.FindComponent( 'RLReport' ) ).SaveToFile( sm.NewCacheFileUrl(False, 'pdf', '', '', AUrl, True));

     // Gera o PDF
     TRLReport( pFormAtual.FindComponent( 'RLReport' ) ).Prepare;

     // Mostra o PDF
     UniURLFrameReport.URL := AUrl;

     if UniApplication.FindComponent('MainForm' ) <> nil then MainForm.HideMask;

  Finally
         btnSaveReport.Enabled := True;
         pFormAtual.Free;
         //ShowMessage(  'Tempo( sem RDW ): ' + FloatToStr( GetTickCount - mm.varDW_LastTick ) );
  End;
end;

procedure TfrmReportMenuClientes.UniFrameCreate(Sender: TObject);
begin
  inherited;

  //UniSession.JSCode('$("#' + edSearchCRUDDtIni.JSName + '_id-inputEl").inputmask("99/99/9999");');

  // Cada MENU DE RELATORIOS que vc criar herdade de frmBaseReportMenu precisa ser preenchido com os filtros de data
  // CASO este relatorio PRECISE de filtros por data, logo abaixo, o PANEL de selecao só será VISUALIZADO se tiver
  // alguma opção de DATA, tentei deixar o MAIS GENERICO possivel
  //
  // Após vem suas OPÇÕES de IMPRESSAO para esse MENU ATUAL, sempre associado ao nome do form que conteu o relatorio
  // pois ao clicar em PROCESSAR, o RadCORE pesquisa e encontra o rel. informado e faz a parte REPETITIVA automática
  //
  // Foi utilizado o FORTES REPORT, mas creio que pode ser adequado a outros ou simplesmente, você não usar este recurso.
  //
  // parametros de pesquisa especifica por datas( pesq. por periodo )  - ANTES DO INHERITED
  //
  // o alias 'tab.' é padrão, se for filtrar por outro campo de data, é só preencher com seu respectivo alias( caso tenha )
  //
  dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDFieldDate.name, 'tab.dtcadastro'    , 'CADASTRO' );
  dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDFieldDate.name, 'tab.dtaniversario' , 'NASCIMENTO' );

  // opções de relatorio                                        Texto a ser exibido                Nome do For ref. ao rel.
  //
  dm_rc.rc_FillSearchFieldsCRUD( Self, lbxReportOptions.name, 'Clients - Simple'         , 'frmReportClientesSimples' );
  dm_rc.rc_FillSearchFieldsCRUD( Self, lbxReportOptions.name, 'Clients - Complete'       , 'frmReportClientesCompleto' );
  dm_rc.rc_FillSearchFieldsCRUD( Self, lbxReportOptions.name, 'Clients - Birthdays'      , 'frmReportClientesAniversariantes' );

  // habilitar os filtros de DATA ?
  //
  paReportPeriod.Visible := cbxSearchCRUDFieldDate.Items.Count > 1;

  // Caso ESTE RELATÓRIO não use FILTRO POR CAMPO DE DATA mas use por PERIODO vc pode DESABILITAR o cbxSearchCRUDFieldDate e deixar
  // visivel o paReportPeriod..como abaixo...
  //
  // paReportPeriod.Visible    := True;
  // cbxSearchCRUDFieldDate.Enabled := cbxSearchCRUDFieldDate.Items.Count > 1; // se for criticar pelo conteudo ou fazer direto...
  // cbxSearchCRUDFieldDate.Enabled := False;

  // configura para a DATA DE HOJE na seleção dinâmica de PERÍODOS
  //
  if paReportPeriod.Visible then
     cbxSearchCRUDPeriod.ItemIndex := 1;


end;

procedure TfrmReportMenuClientes.btnSaveReportClick(Sender: TObject);
var
   pClassFormAtual : TUniFormClass;
   pFormAtual : TUniForm;

   FClassName : string;
begin
  inherited;
  FClassName      := 'T' + cbxModelReport_form.Text ;
  pClassFormAtual := TUniFormClass( FindAnyClass( FClassName ) );
  pFormAtual      := pClassFormAtual.Create( UniApplication );
  try
     rc_fortesReportSavePDF( Self, pFormAtual );
  finally
         pFormAtual.Free;
  End;
end;

initialization
  RegisterClass(TfrmReportMenuClientes);

end.
