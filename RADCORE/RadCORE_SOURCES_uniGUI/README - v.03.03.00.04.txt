RadCORE 3.3.1.0

Pesquisar e substituir nos arquivos
Search and replace in files
------------------------------------
Gosto muito de usar o "GExperts" para essa finalidade. 
https://blog.dummzeuch.de/experimental-gexperts-version/

Creio que o "cnPack" também faça, mas como ele deixa a IDE do Delphi mais lenta, prefiro o "GExperts"
NotePad++ também pode fazer essa operação.

*** lembrando que tem que fazer a busca em "*.pas" e "*.dfm"( o pesquisador do delphi não tem esse recurso )


	SEARCH..					REPLACE..
	--------------------------------------------    --------------------------------------------
	RemoveAcentos 					RemoveAccents
	Centraliza					Centralizes


RESPONSIVIDADE

formBase será descontinuado.
o modelo equivalente a ser usado como herança agora é o frmGenericModalForm.
Se você tem em suas aplicações formulários herdados de "formBase" é de grande importância recriá-los.
frmMessage e frmInputBox agora herdam de frmGenericModalForm

WEBCAM

arquivo js


DOCUMENTAÇÃO

Melhorar a explicacao de OCULTANDO BLOCOS



Em "Erros comuns de compilação / execução", foi adicionado "Blocos Responsivos"

No tópíco "Analisando e aplicando os recursos -> Menu", foram adicionados mais detalhes.

No tópíco "Analisando e aplicando os recursos -> Login", foi totalmente refeito.
Novo tópíco "Analisando e aplicando os recursos -> MainModule".
Novo tópíco "Analisando e aplicando os recursos -> ServerModule".

No tópíco "Analisando e aplicando os recursos -> Cadastros e Grids", foi adicionado o tópico "Máscaras de Edição"


frmMESSAGE


rc_ShowMessage



RC ELEMENTS

Ajustado resposta do click do HINT/CAPTION quando em ambiente VCL.


RC WIZARD

Adicionado novos parâmetros configuráveis para criação de projetos


DM_RC

Ajustado mensagem após apagar um registro

Ajustado renderização de lookups dinâmicos quando estão dentro de um bloco responsivo.


mkm_layout

Corrigido o parâmetro "collpased" do atributo "collapse:" para iniciar fechado/aberto.





