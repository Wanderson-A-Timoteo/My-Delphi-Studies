
RadCORE 3.3.1.0

Pesquisar e substituir nos arquivos
Search and replace in files
------------------------------------
Gosto muito de usar o "GExperts" para essa finalidade. 
https://blog.dummzeuch.de/experimental-gexperts-version/

Creio que o "cnPack" também faça, mas como ele deixa a IDE do Delphi mais lenta, prefiro o "GExperts"
NotePad++ também pode fazer essa operação.

*** lembrando que tem que fazer a busca em "*.pas" e "*.dfm"( o pesquisador do delphi não tem esse recurso )


	SEARCH..					                   REPLACE..
	--------------------------------------------    --------------------------------------------
	RemoveAcentos 								RemoveAccents
	'error' , false );							'error' ); // v. 3.3.1.0
	'warning' , false );						'warning' ); // v. 3.3.1.0
     'success' , false );						'success' ); // v. 3.3.1.0
	'info' , false );							'info' ); // v. 3.3.1.0
	ico:fa-									ico:fas-		             ( icones fontawesome "solid" = "fas-"  )


DOCUMENTAÇÃO

Melhoria e/ou novos tópicos adicionados


- Analisando e aplicando os recursos > Hint Editor

- Analisando e aplicando os recursos > Layout > Renderizando o Layout

   - Alteração importante em: "Renderizando um FORM"

- Analisando e aplicando os recursos > Layout > Renderizando o Layout > Labels: FontAwesome Icons

- Analisando e aplicando os recursos > Mensagens

- Analisando e aplicando os recursos > LookUps Dinâmicos > Lookup com Filtro Dinâmico




CSS PADRÃO

Novas classes 


RESPONSIVIDADE

Melhorias na renderização para FORMS.
 
	
frmGenericModalForm

Novo modelo de form MODAL que pode ser herdado.


formBASE

Ajustes para o novo padrão de renderização de FORMS.


Novo frmMessage

- agora herdado de frmGenericModalForm
- Novos efeitos visuais
- Layout aprimorado

Novo frmInputBox

- agora herdado de frmGenericModalForm
- Novos efeitos visuais
- Layout aprimorado


Novo frmWEBCAM

- agora herdado de frmGenericModalForm
- erros corrigidos
- arquivo js corrigido
  C:\RadCORE_SOURCES_uniGUI\inetpub\wwwroot\radcore\files\js\rc_webcam\rc_webcam.js



NOVOS ATRIBUTOS

Aplicação de efeitos para imagens  

  - img-cls: 

Lookup Dinâmico

  Mais opções para otimizar operações com lookup sem uso de programação

  - lkpfilter:quoted(uf=edLkpUFS<text>) 
  - lkpfilter-empty:Selecione uma UF<translate>
  - lkpfilter-order: 
  - lkpfilter-searchfields:codiibge 
  - lkpfilter-gridattr: 
	
  ( exemplo de uso: frmCadCLIENTES -> edLkpCIDADES )


frmBaseCRUD

Pequenas melhorias
Novos alertas sobre uso incorreto de alguns "coringas"


frmBaseCRUDDetail

Pequenas melhorias
Novos alertas sobre uso incorreto de alguns "coringas"


frmFREEFRAME

Exemplo de uso do "img-cls:" aplicando efeito ZOOM
Exemplo de uso do rc_ShowSweetAlert com retorno de foco em componente especificado.
Exemplo de CLIPBOARD

RC ELEMENTS

Alterada descrição do package de acordo com a versão do DELPHI
Adicionado o recurso "COMPLETE" para alguns atributos / botões.
Adicionado o recurso "FONTAWESOME" 
Adicionado novo menu de seleção de temas do editor de código
Otimizado a colorização dos elementos do código do RadCORE.

RC WIZARD

Alterada descrição do package de acordo com a versão do DELPHI
Adicionado opção no Menu do DELPHI para exibir um HELP sobre teclas de atalho.


DM_RC

Otimizado várias funções de controle aos lookups dinâmicos

NOVAS FUNÇÕES PARA MENSAGENS ESPECÍFICAS

  - rc_ShowSweetAlertSuccess
  - rc_ShowSweetAlertWarning
  - rc_ShowSweetAlertInfo
  - rc_ShowSweetAlertError

  - rc_ShowSuccess
  - rc_ShowInfo
  - rc_ShowWarning
  - rc_ShowError

  - rc_ShowInputBox

    Otimizado para usar qualquer um dos campos como "senha"
    ( Exemplo de uso ao clicar no ícone de configurações - frmTHEMES )

  - rc-ShowSweetAlert

    Agora traz um parâmetro para por o foco em um componente específico ao fechar a mensagem.


- rc_MaskAdjust

  correção do UNMASK para remover uma máscara previamente definida


mkm_layout

- Ajustes em várias funções de controle de reponsividade
- Ajustes para evitar conflito no uso do atributo "ds:" de alguns atributos de banco de dados


mkm_translate

- Adicionado opção para tradução do novo atributo de mensagem dinâmica "lkpfilter-empty"


MainForm

- Restringido o acesso ao botão CONFIG ( frmTHEMES ) com a senha ADMIM PADRÃO( veja uCONST.PAS )


frmTHEMES

- Ajustado a exibição correta do Switch Button( rcSwt ) para TLS e SSL na configuração de email


ServerModule ( sm )

- Corrigido a apresentação correta da porta no Tray Icon.


OUTROS

- Ajustado em todas as funções de tratamento de strings para evitar erros.
( thanks M VAKILI )

- Adicionado dlls para uso com envio de emails x32 e x64

  C:\RadCORE_SOURCES_uniGUI\inetpub\wwwroot\radcore\files\lib\Email Indy x32 x64




