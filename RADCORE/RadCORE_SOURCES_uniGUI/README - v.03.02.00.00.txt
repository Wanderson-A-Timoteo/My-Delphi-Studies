

Orientacação para ajustar para versão 3.1.0.63 para 3.2.0.0
Guidance to adjust for version 3.1.0.63 to 3.2.0.0
------------------------------------------------------------


Pesquisar e substituir nos arquivos
Search and replace in files
------------------------------------

Gosto muito de usar o "GExperts" para essa finalidade. 
https://blog.dummzeuch.de/experimental-gexperts-version/

Creio que o "cnPack" também faça, mas como ele deixa a IDE do Delphi mais lenta, prefiro o "GExperts"
NotePad++ também pode fazer essa operação.

*** lembrando que tem que fazer a busca em "*.pas" e "*.dfm"( o pesquisador do delphi não tem esse recurso )

I really enjoy using "GExperts" for this purpose.
https://blog.dummzeuch.de/experimental-gexperts-version/

I think "cnPack" does too, but as it slows down the Delphi IDE, I prefer "GExperts".
NotePad++ can also do this operation.

*** remembering that you have to search in "*.pas" and "*.dfm" (the delphi searcher does not have this feature)

	SEARCH..					REPLACE..
	--------------------------------------------    --------------------------------------------
	bsh5: cls					bsh5:|cls




lista de melhorias
-------------------

- RC WIZARD( super ajuda do CICERO BILLO )

- RC ELEMENTS
  - edição composta - super ajuda do CICERO BILLO
  - criação múltipla de componentes
  - adição direta no formulário/container que acionou o rc elements
  - blockfy
 
- REAL TIME blocks

- Novas animações
  - animacao nas mensagens padrão do unigui
  - animacao nas mensagens do RadCORE
  - animacao na abertura dos formularios/frames

- mais melhorias para RTL( árabe )

- botão HOME no dashboard

- melhorias e bug fixes atributos dinamicos para UniDBGrid
- correção "grid-noforcefit" 
- correção "width:" 
  - necessário o "grid-resize"
  Obs1: o atributo "width" é um processo muito "oneroso" para o servidor
  Obs2: o atributo "width" não funciona bem com o atributo "locked"
  ( feedback GUSTAVO GrSoft )
- retorno a página inicial( iCurrentPage )

- novas classes CSS
  - reticulado( exemplo no freeframe )

- novo rcfeature
- novo rcalert

- untFormBase
  - ajustado NavigateKeys para responder ao ENTER
  ( feedback de RODRIGO BALTAZAR )

