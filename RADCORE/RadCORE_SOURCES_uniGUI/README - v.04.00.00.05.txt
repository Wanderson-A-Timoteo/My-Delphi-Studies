RadCORE 4.0.0.5


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
	'invalid: 								{v. 4.0.0.5}'invalidate:



RC ELEMENTS

- Adição dos Novos atributos
- ajuste para compatibilizar com FMX


RC WIZARD

- Pequenos Ajustes


RESPONSIVIDADE

- Ajuste para evitar o processamento de blocos ENABLED=FALSE


FUNÇÔES / PROCEDURES

- rc_GetRecord
  Correção de bug com "LIMIT"

- rc_RenderLookUpControls
  Melhorias na renderição do combobox dinâmico( "cbbx:" )

- rc_PosHintProperty
  Melhoria e prevenção contra bug

frmCadCOMPRAS

- BUG Fixes
- Alteração na estrutura das tabelas COMPRAS e COMPRAS_PRODUTOS


frmTHEMES

- Ajuste nos controles "spin"


frmBaseCRUD / frmBaseCRUDDetail

- Ajustes na renderização de combobox dinâmico
- Ajustes para novos atributos da validação dinâmica


MainForm

- Ajuste na exibição do MENU para RTL


mkm_validate

- Novos atributos e parâmetros de validação

  valid:not-exists
  valid:blank ifvisible:aaaa
  valid:blank ifenabled:aaaa

- BUG FIX para validação dinâmica de CPF/CNPJ

- Refatoração para adequação aos novos recursos

mkm_translate

- Nova msg para novo atributo de validação dinâmica



