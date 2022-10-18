
Orientacação para ajustar para versão 2.0.0.156 para 3.0.0.0
------------------------------------------------------------




Files( new or updated ) - C:\inetpub\wwwroot\radcore\files
----------------------------------------------------------
	
	PASTA			ARQUIVO(S)
	----------------------	-----------------------------------------
	css			servermodule_customcss.css
	
	js                	toda a pasta "chart-apex"


	images			colortable.jpg

	themes			todos os arquivos

	translate		todos os arquivos

	lib			todos os arquivos




Folders
-------

	Renomear a pasta "padrao" para "default" em C:\inetpub\wwwroot\radcore\files\images 

	Renomear a pasta "mensagem" para "messages" em C:\inetpub\wwwroot\radcore\files\

	Renomear a pasta "bd" para "database" em C:\inetpub\wwwroot\radcore\files\bd 

	Nova pasta "sample-products" em C:\inetpub\wwwroot\radcore\files\images 
	Nova pasta "slides" em C:\inetpub\wwwroot\radcore\files\images\slides
	


Forms/Units
-----------

	- Remover do projeto: untFrmMensagemTour
	- Remover do projeto: untFrmCadParametros
	- Remover do projeto: uSp_estoque.pas
	- Remover do projeto: uSp_financeiro.pas
	- Remover do projeto: uSqp_vendas_oses.pas
	- Remover do projeto: DM_TOTALS
	- Remover do projeto: DM_LOOKUPS
	- Remover do projeto: relFuncionariosSimples
	- Remover do projeto: relMenuFuncionarios
	- Remover do projeto: frmExclusaoReg
	- Remover do projeto: frmCadTB_SISTEMA
	- Remover do projeto: frmCadUSUARIOS_GRUPO
	- Remover do projeto: frmCadBANCOS
	- Remover do projeto: uProcessReportThread


	- Alterando a propriedade NAME:

    	- Renomear uniMainModule 		para mm
	  - SQLConn				alterar propriedade "database" para "C:\inetpub\wwwroot\radcore\files\database\RC_DB.FDB"
	  - remover SQLConnLICENCE		

	- Renomear uniServerModule 		para sm

	- Renomear DM_RADCORE 			para dm_rc		( save as untDM_RC.pas )
	  - remover CUSTOMER_LICENCE		
	  - remover PARAMETERS_SW		
	  - remover GERAL			
	  - remover CLIENTES			
	  - remover sqlUsuarios	
	  - remover sqlParametros / dssqlParametros / mem_Parametros
	  - remover sqlUsuarios / dssqlUsuarios
	  - remover sqlRestricoes
	  - remover sqlRestricoes_secundaria
	  - remover sqlLogExecucao
	  - remover sqlLogExecucaoInsert
	  - remover sqlHouve_Mov
	  - remover sqlConsultaGeral
	  - remover sqlSP_Funcs
	  - remover mem_CreditoCliente
	  - remover mem_Deletado
	  - remover zQryMem_Registros
	  - remover dsMetaInfo
	  - remover mem_Financeiro
	  - remover mem_Estoque
	  - remover mem_CustosProd
	  - remover mem_Pesquisa
	  - remover mem_ConsultaGeral
	  - remover mem_Empresas_Param
	  - remover mem_Logradouros
	  - remover mem_GRID
	  - remover RestSQL_SP_Funcs
	
	- DM_LOOKUPS
	  - remover EMPRESAS
	  - copiar sqlLookUpSearch e dsLookUpSearch para DM_RC

	- Renomear frmMenssagem			para frmMessage			( save as untFrmMessage.pas)
	- Renomear frmBaseCad			para frmBaseCRUD		( save as untFrmBaseCRUD.pas)
	  - Renomear uniButton1			para btnGroupGrd
	  - Remover cbxSearchCRUDPaged
	  - Remover cbxSearchCRUDOrder
	  - Remover cbxGroupCRUDField
	  - Remover cbxGroupCRUDField_Fields
	  - Remover btnGroupGrd


    	- Renomear frmBaseCadFilhos 		para frmBaseCRUDDetail		( save as untFrmBaseCRUDDetail.pas)
	- Renomear frmCadBasicos 		para frmCadBasics		( save as untCadBASICS.pas )
	- Renomear frmBaseMenuRel		para frmBaseReportMenu		( save as untFrmBaseReportMenu.pas )
	- Renomear frmBaseRelBASICOPadrao	para frmBaseReportDefault      	( save as untFrmBaseReportDefault.pas )
	- Renomear frmBaseRel			para frmBaseReport      	( save as untFrmBaseReport.pas )

	- Renomear frmRelClientesCompleto	para frmReportClientesCompleto	( save as untReportClientesCompleto.pas )
	- Renomear frmRelClientesSimples	para frmReportClientesSimples	( save as untReportClientesSimples.pas )
	- Renomear frmRelMenuClientes		para frmReportMenuClientes	( save as untReportMenuClientes.pas )
	- Renomear frmRelReciboSimples		para frmReportReciboSimples	( save as untReportReciboSimples.pas )


	  *** after rename, close DELPHI and reopen

	- frmBaseCRUD				- ícones de FILTRO e PESQUISA foram aprimorados
						- "hidden fields" adicionados: ed_GenNextID_OnNew e ed_AskNewRec_AfterPost

	- frmBaseReportMenu			- copiado os mesmos "hidden fields" de frmBaseCRUD


uconst
------

	ARRAY_BASICS_FLD_ID_NAME           = 'CODIGO';    // CODIGO, ID, SEQ...
	ARRAY_BASICS_FLD_ID_ALIAS          = 'CÓDIGO';
	ARRAY_BASICS_FLD_DESCRIPTION_NAME  = 'DESCRICAO'; // DESCRICAO, DESCRIPTION, TEXT...
	ARRAY_BASICS_FLD_DESCRIPTION_ALIAS = 'DESCRIÇÃO'
	


Pesquisar e substituir nos arquivos
------------------------------------

Gosto muito de usar o "GExperts" para essa finalidade. 
Creio que o "cnPack" também faça, mas como ele deixa a IDE do Delphi mais lenta, prefiro o "GExperts"
NotePad++ também pode fazer essa operação.

*** lembrando que tem que fazer a busca em "*.pas" e "*.dfm"


	SEARCH..					REPLACE..
	--------------------------------------------    --------------------------------------------
	frmMensagem.					frmMessage.
	'frmMensagem'					'frmMessage'

	dm_lookups.sqlLookUpSearch			dm_rc.sqlLookUpSearch
	dm_lookups.dsLookUpSearch			dm_rc.dsLookUpSearch

	frmBaseCadFilhos				frmBaseCRUDDetail
	frmBaseCad					frmBaseCRUD
	frmBaseRelBASICOPadrao				frmBaseReportDefault
	frmBaseRel					frmBaseReport
	frmBaseMenuRel					frmBaseReportMenu
	MenuRel						ReportMenu
	temp_relatorios					tb_reports

	frmBaseCRUDFilho				frmBaseCRUDDetail
	paBaseCadFilho 					paBaseCrudDetail


	frmCad						frmCrud

	sqlGetRegistros					sqlGetRecords
	sqlGeral					sqlGeneric
	dssqlgeral					dsSqlGeneric
	sqlEmpresas					sqlCompanies
	dsEmpresas					dsSqlCompanies
	mem_UsuariosSecundario 				memUsersSecondary 
	dsMem_Pk					dsMemPk
	mem_PK						memPK
	mem_GRID_PK					memGridPK
	mem_Estrutura					memStructure
	mem_Registros 					memRecords
	mem_Temp					memTemp
	mem_Usuarios					memUsers
	mem_Restricoes_Edicao 				memUsersPermissionsEdit
	mem_RestricoesSecundaria 			memUsersPermissionsSecondary
	mem_Restricoes 					memUsersPermissions
	mem_TotRegs 					memTotRecords
	RestSQL_GetRegistros 				sqlRdwGetRecords
	RestSQL_Ins_Upd 				sqlRdwInsUpd
	RestSQL_NextID 					sqlRdwNextID
	ConsultaCNPJ					ACBrConsultaCNPJ
	ConsultaCEP					ACBrConsultaCEP
	rc_DinamicAlignment				rc_DynamicAlignment

    	varC_SGBD_RDW        				CONFIG_DATABASE_RDW
	varC_SGBD_FIREDAC				CONFIG_DATABASE_FIREDAC
	varC_IP_SERV_CLIENTE				CONFIG_DATABASE_HOST_IP
	varI_PORT_SERV_CLIENTE				CONFIG_DATABASE_PORT
	varC_USER_SERV_CLIENTE				CONFIG_DATABASE_USERNAME
	varC_SERVERPASS_CLIENTE 			CONFIG_DATABASE_PASSWORD
	varC_APP_BDNAME					CONFIG_DATABASE_NAME
	varC_APP_RDW_BDNAME				CONFIG_DATABASE_NAME_RDW
	varC_SGBD_ACTIVE				DATABASE_ACTIVE
	varC_APP_TYPE					CONFIG_APP_TYPE
	varC_APP_SUBTYPE				CONFIG_APP_SUBTYPE
	APPLY_FONT_ALL					CONFIG_LAYOUT_APPLY_FONT_ALL
	APP_LANGUAGE					CONFIG_LANGUAGE

	mm.LABEL_WRAP					mm.CONFIG_LAYOUT_LABEL_WRAP
	mm.ROUND_EDIT					mm.CONFIG_LAYOUT_ROUND_EDIT
	mm.LABEL_FORMS_DEFAULT				mm.CONFIG_LAYOUT_LABEL_FORMS_DEFAULT
	mm.GRIDBLOCK_OFFSET				mm.CONFIG_LAYOUT_GRIDBLOCK_OFFSET
	mm.MENUFONT_SIZE				mm.CONFIG_LAYOUT_MENUFONT_SIZE
	mm.LINK_COLOR					mm.CONFIG_LAYOUT_LINK_COLOR
	mm.LINKHOVER_COLOR				mm.CONFIG_LAYOUT_LINKHOVER_COLOR
	mm.BG_COLOR					mm.CONFIG_LAYOUT_BG_COLOR
	mm.LABEL_COLOR					mm.CONFIG_LAYOUT_LABEL_COLOR
	mm.MENU_LOGO_BG_COLOR				mm.CONFIG_LAYOUT_MENU_LOGO_BG_COLOR
	mm.MENU_LOGO_FONT_COLOR				mm.CONFIG_LAYOUT_MENU_LOGO_FONT_COLOR
	mm.TAB_BACKGROUND_DEFAULT			mm.CONFIG_LAYOUT_TAB_BACKGROUND_DEFAULT
	mm.TAB_COLOR_FOCUS				mm.CONFIG_LAYOUT_TAB_COLOR_FOCUS
	mm.TAB_COLOR_HOVER				mm.CONFIG_LAYOUT_TAB_COLOR_HOVER
	mm.APP_FONT					mm.CONFIG_LAYOUT_APP_FONT
	mm.MENU_COLOR					mm.CONFIG_LAYOUT_MENU_COLOR
	mm.MENUFONT_COLOR				mm.CONFIG_LAYOUT_MENUFONT_COLOR
	mm.LOGIN_COLOR					mm.CONFIG_LAYOUT_LOGIN_COLOR
	mm.BUTTON_COLOR					mm.CONFIG_LAYOUT_BUTTON_COLOR
	mm.EDIT_COLOR					mm.CONFIG_LAYOUT_EDIT_COLOR
	mm.EDIT_FONT_COLOR				mm.CONFIG_LAYOUT_EDIT_FONT_COLOR
	mm.EDIT_FOCUS_COLOR				mm.CONFIG_LAYOUT_EDIT_FOCUS_COLOR
	mm.EDLKP					mm.CONFIG_LAYOUT_EDLKP
	
	mkmdatafile.fdb					rc_db.fdb
	_component_active				Active_Component
	vGuideSeq					varI_GuideTourSeq
	vGenerateLog					CONFIG_SESSION_LOG
	varC_RequestQuery				varC_MenuGroup
	ARRAY_NAOGERARSQL				ARRAY_DO_NOT_SHOW_DBGRID
	ARRAY_ATUACOES 					ARRAY_COMPANY_TYPE
	UniServerModule.				sm.		
	UniMainModule.					mm.		
	DM_RADCORE					dm_rc
	'Aviso!'					mm.MSG_INFO
	'Erro!'						mm.MSG_ERROR
	'portapadrao'					'defaultport'
	'paginador_cmd'					'cmd_paginate'
	retornanumeros					ReturnNumbers
	retornaletras					ReturnLetters
	FixaDecimal					FixDecimals
	VALUE_UNCHECKED					VALUE_NO
	VALUE_CHECKED					VALUE_YES
	:codigo						:table_pk
	paramByName('codigo'				paramByName( 'table_pk'
	paramByName( 'codigo'				paramByName( 'table_pk'

	'data_alt'					'date_update'
	'data_acesso'					'date_access'
	'hora_acesso'					'hour_access'

	TAB_CODIGO_ZEROS				TABLE_PK_WITH_LEFT_ZEROS
	rc_AjustFormsSize				rc_AdjustFormsSize
	bFormNaoExiste 					bFormDoNotExists
	sCriticaRestricao 				sAccessControl
	bFormSemCRUD 					bFormWithoutCRUD

	bsSwt						bsswt
	bsChk						bschk
	bsRgp						bsrgp
	bsH5						bsh5

	mm.varC_SQL_Insert				varC_SQL_Insert
	mm.varC_SQL_Update				varC_SQL_Update

	dm_rc.rc_Normalize				rc_Normalize
	dm_rc.rc_PosHintProperty			rc_PosHintProperty
	dm_rc.rc_Find					rc_Find
	dm_rc.rc_GetHintProperty			rc_GetHintProperty
	dm_rc.rc_SetHintProperty			rc_SetHintProperty
	dm_rc.rc_AddCssClass				rc_AddCssClass
	dm_rc.rc_RemoveCssClass				rc_RemoveCssClass
	dm_rc.rc_AlignLabel				rc_AlignLabel
	dm_rc.rc_RenderLayout				rc_RenderLayout

	dm_rc.rc_MoveAnimationForm			rc_MoveAnimationForm
	dm_rc.rc_MoveAnimationObj			rc_MoveAnimationObj
	rc_FillSeachFieldsCRUD				rc_FillSearchFieldsCRUD

	-----------------------------------------------------------------------------------------
	Obs: abaixo estou removendo todas as mensagens para deixar o "loadmask" mais "padrão web"
	     ou seja, apenas o ícone de processamento sem textos
	-----------------------------------------------------------------------------------------
	SEARCH						REPLACE

	mm.ServerMessages.LoadingMessage		//mm.ServerMessages.LoadingMessage
	LoadMask.Message = 'Loading data...'		LoadMask.Message = ''
	LoadMask.Message = 'Carregando...'		LoadMask.Message = ''
	ScreenMask.Message = 'Aguarde...'		ScreenMask.Message = ''
	ScreenMask.Message = 'Carregando...'		ScreenMask.Message = ''
	ScreenMask.Message = 'Aguarde...'		ScreenMask.Message = ''



Novos recursos / Correções / Melhorias
--------------------------------------

	01. RadCORE Elements( HINT EDITOR )
	    --------------------------------
	    - Editar os atributos / parâmetros do RadCORE ficou mais fácil e intuitivo
	      
	      - Edição colorizada destacando os atributos e seus parâmetros
	      - Consulta dos parâmetros de cada elemento
	      - Consulta do HELP de cada elemento
	      - inserção de componentes pré-definidos

	
	02. Banco de dados reescrito e com versões para:
	    ---------------------------------------------
	    - firebird
	    - sqlite
	    - mysql / mariadb
	    - postgresSQL
	    - sqlserver


	03. rc_Translate 
	    ---------------------------------------------------------------------------------------
	    Melhorias e internacionalização do RadCORE com 8 idiomas e facilmente expansível para outros idiomas.

	    - português
	    - inglês
	    - espanhol
	    - francês
	    - alemão
	    - italiano
	    - turco
	    - russo


	04. Layout
	    ------------------------
	    - corrigido carregamento do "avatar" do usuário
	    - "paGridBlock" agora é "rcBlock"
	    - substituído ícone do FULLSCREEN
	    - substituído ícones de FILTRO e PESQUISA no CRUD padrão	    
	    - melhorias na responsividade 
	    - rc_BootStrapRender específico para um único objeto
	    - corrigido conflito com ícones em botões
	    - melhoria no "hover" dos botões "outline"
	    - melhoria no radiogroup padrão do unigui para se adequar ao TEMA do RadCORE atual
	    - melhoria no "disabled" dos botões para se adequar ao TEMA do RadCORE atual
	    - melhoria no "disabled" dos "bsSwt", "bsChk" e "bsRgp" para se adequar ao TEMA do RadCORE atual
	    - correções no rc_DinamicAlignment	
	    - resolvido problema com o VerticalScrollBar Position( ScrollBox ) em tempo de design.
	    - melhorias no "hr-childs:"
	    - efeito "zoom" aplicado nos ícones do Menu Principal
	    - efeito "shadow" aplicado nos blocos do Menu Principal
	    - Novos "screen mask" transparentes.
	    - Novo estilo global para ScrollBars


	05. Novo Controle de Temas 
	    ------------------------
	    Extendido para também fazer configurações diversas da aplicação

	    - novos temas de cores
	    - configuração de "border-radius" 
	    - config. do acesso ao Banco de dados
	    - config. de envio de email


	06. Ítens removidos para simplificar o uso do RadCORE
	    -------------------------------------------------
	    - Removido dependência ACBr para envio de email	    
  	      - mas cada usuário poderá incluir o ACBr em suas aplicações da mesma maneira do VCL

	    - Removido datamodules adicionais( dm_totals, dm_lookups... )
	    - Removido conexão com banco de dados softwarehouse
	    - Removido diversos formulários que na prática, não eram usados
	    - Removido globais que não estavam sendo usadas
	    - Removido querys que não estavam sendo usadas
	

	07. Novos elementos
	    ------------------------
	    - cbx-fill:

	    - link: geração dinâmica de links para botões e campos de edição
	  
	    - dial: geração dinâmica de discagem( mobile ) 
	  
	    - mask: além das máscaras padrões, agora com máscara customizada 

	      Ex: mask:99.99 ( ex: campo carteira no cad. de bancos )

	    - específicos para formulários
	      
	      - height:max / width:max 
	      - height:fix / width:fix
	      - modal:

		Ex: frmTHEMES	
		Ex: frmDEMOWITHFORMMODAL


	    - ico-stack:
	    - fontsize-r:

	    - video: e bsvideo: 	agora com vídeos locais e 'embeded'( YouTube )
	    - img: e bsimg:
	    - carousel: e melhorado responsividade do "bscarousel:"
	    - pdf:			

	      Ex: frmFREEFRAME



	08. Menus
	    ------------------------
	    Melhorias no acionamento dinâmico

	    - novo parametro "link:" para definir uma opção do menu que automaticamente abre um link externo.
	      Ex: mm.MNU_OTHERS_OPEN_TICKET

	    - Título das opções abertas( "breadcrumb" ) em Camel Case


	09. Melhorias no tratamento de exceções e segurança
	    -----------------------------------------------

	    - Mensagens e geração de LOG
	    - Proteção ao acesso externo de pastas
	    - Proteção contra "RIGHT CLICK" melhorada
	    - Proteção contra F12


	10. Validação dinâmica com rc_Validate
	    -----------------------------------
  	    valid:min-nn
	    valid:max-nn


	11. Novas Funções / Procedures( e Melhorias )
	    -------------------------------------------
	    - Normalização e tradução dos títulos, parâmetros, constantes e variáveis de todas funções / procedures
	
	    - rc_ReportDateInterval traduzida para funcionar em qualquer idioma configurado.

	      Obs: apesar de originalmente usada para uso com o FORTES REPORT, poderá ser utilizada com qualquer gerador

  	    Nova: procedure rc_DBGridExport
    	    Nova: procedure rc_DBGridUpdataAll
    	    Nova: function  rc_NormalizeAllTrim
    	    Nova: procedure rc_BitmapClear  	   // windows and linux
    	    Nova: procedure DinamicOnClickLink
    	    Nova: procedure DinamicOnClickDial
    	    Nova: procedure DinamicOnClickMail
	    Refatorada: rc_MailSend
	    Melhorada:rc_SetHintProperty agora pode SETAR e ADICIONAR
	    Nova: rc_ProtectForm para proteger contra captura de CSS / JS

	    Transferida: rc_MoveAnimationForm	para unit mkm_anim
	    Transferida: rc_MoveAnimationObj	para unit mkm_anim



	12. Normalização de formulários padrões
	    -------------------------------------------
	    - ServerModule 		-> sm
	    - MainModule		-> mm
	    - dm_radcore		-> dm_rc
	    - frmBaseCAD		-> frmBaseCRUD
	    - frmBaseCADFilhos		-> frmBaseCRUDDetail
	    - frmMenssagem		-> frmMessage
	    - frmCadBasicos		-> frmCadBasics
	    - frmBaseRel		-> frmBaseReport
	    - frmBaseMenuRel		-> frmBaseReportMenu
	    - frmBaseRelBASICOPadrao	-> frmBaseReportDefault
	    - frmCadFREEFRAME		-> frmFREEFRAME
	    - parâmetro 'codigo'	-> table_pk	    

	13. Novos Exemplos
	    -------------------------------------------
	    - Form "in line" responsivo
	    - Basic Chat Sample
	    - "ico-stack:" e "fontsize-r:"
	    - YouTube Video Responsivo
	    - Imagem Responsiva
	    - Visualizador de PDF
	    - Carousel aprimorado
	    - FishFacts aprimorado


	14. UniDBGrid
	    --------------------------------------------
	    - Novo menu de exportação nos CRUDs herdados
		
	      - Excel
	      - Html
	      - Xml
	      - Csv

	    - Melhorias na responsividade
	    - "norender" removido.. Se não houver "fieldmask:" não renderiza
	    - Adição do "grid-resize"

	    Obs: Por padrão o "grid-resize" está desabilitado


	15. Relatórios
	    ----------------------------------------------
	    - Novo MENU PADRÃO para Relatórios( responsivo )

