
Orientacação para ajustar para versão 3.0.0.48 para 3.1.0.60
Guidance to adjust for version 3.0.0.48 to 3.1.0.60
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
	cMSG_ACCESS_ 					mm.MSG_ACCESS_
	ltar    : begin					ltar_SA : begin









Novos arquivos e/ou arquivos alterados
New files and/or changed files

- C:\RadCORE_SOURCES_uniGUI\BD updates
	- v-03-01-0-60.txt

- files/libs
	- midas.dll

- files/css
	- servermodule_customcss.css

- servermodule
	- adicionado nome da aplicacao, versão e porta no Tray Icon
	- added application name, version and port to Tray Icon

- ajustes/melhorias no frmBaseCRUD
- bug fixes/improvements on frmBaseCRUD
	- "model-crud:1"
	- UniLabel7 renamed to UniLabelPd1
	- UniLabel9 renamed to UniLabelFd1
	- UniLabel8 renamed to UniLabelDtIni
	- UniLabel2 renamed to UniLabelDtEnd
	- "firstshow" / no-paged

- layout
	- comboboxes
	- classes para EDITs com BOTÕES e/ou grupo de botões
	- classes for EDITs with BUTTONS and/or group of buttons
  	  Ex: frmBaseCRUD

- corrigido problemas com ISAPI 
- fixed problems with ISAPI
