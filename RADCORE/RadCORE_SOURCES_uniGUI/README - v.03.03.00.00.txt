RadCORE 3.3.0.0

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
	0 2 0 0 					

        Obs: Replace by nothing !!! it´s to remove.



BLOCOS RESPONSIVOS

Novos atributos, muitas melhorias e novos exemplos.

max-width:nn
max-width:xxx mobile-v-yyy

noborder-left:mobile 
noborder-right:mobile 
noborder-top:mobile 
noborder-bottom:mobile 
noborder-all:mobile 

** Obrigado pela ideia Sr. SANTIAGO RICHARD


NOVAS FUNÇÕES / MELHORIAS

rc_AddCssClass / rc_RemoveCssClass: Melhoria na prevenção de erros.

rc_RenderControlsExecute: Melhorias na prevenção de erros e novas funcionalidades.

rc_BootStrapRenderExecute: Melhoria na prevenção de erros do "bsvideo:"

rc_DynamicAlignment: Novas funcionalidades( center:parent x-mobile-y e center:parent y-mobile-x )



NOVOS ATRIBUTOS

COLLAPSE

Agora adicionando o atributo "collapsed" o bloco já iniciará fechado.
As setas também mudaram o sentido original para dar o contexto mais correto.


MAIS RECURSOS REATIVOS

Sabe aquele recurso clássico que quando acessamos um registro e precisamos codificar o estado, cor, ícone etc de algum botão ou qualquer outro objeto para chamar atenção do usuário ?

Ex: Cliente BLOQUEADO por pagamento, Venda em ABERTO/FECHADO etc onde temos um campo com um valor para Sim ou Não( S ou N ), ou Aberto e Fechado( A ou F ).

Agora, tudo ficará mais simples!

- field-cls

- field-cls-ico

- field-ico

** thanks to Mr. Fábio Oliveira by your idea


DM_RC

Adicionado Inglês REINO UNIDO( en_GB ) para tratamento de mensagens internas e padrões regionais


rc_BuildMENUS: Adicionado controle para opções marcadas como ESCONDIDA / HIDDEN

** thanks to Mr. Zilav


frmCadCOMPRAS

Adicionado exemplo de "Header Title" e sumário nos campos QTDE e TOTALPROD



frmCadUSUARIOS

Corrigido tradução para RUSSO

** thanks to Mr. Zilav


Controle de Permissão Dinâmico

Se em seu projeto atual, em alguma instrução "rc_BuildMenuItem" para montar os ítens do menu, houver a definição dos parâmetros de tabela e formulário, 
o parâmetro "pRestrictionField" deverá ser preenchido de acordo com o nome do campo declarado na tabela "USUARIOS_RESTRICOES".


uconst

Adicionado Inglês REINO UNIDO( en_GB )


MainModule

Adicionado itens para tradução do MENU OPÇÃO

Adicionado tradução para ÁRABE
** thanks to mr. Mohammed Boullal


frmMESSAGE

Adicionado a tradução para o botão "SUPORTE"

** thanks to mr. Mohammed Boullal


FREEFRAME

Otimizado responsividade do demo "qrcode" 


RC WIZARD

Novos modelos baseados na versão BRASIL e GLOBAL para poder testar recursos de relaórios ou removê-los para testar apenas as funcionalidades gerais.


RC ELEMENTS

Novo comando extra CLONE.

Agora você poderá selecionar um ou vários blocos de componentes para reaproveitar dentro da mesma tela, mesmo projeto em outro formulário ou até mesmo entre instâncias diferentes do DELPHI.


RC TRANSLATE

Corrigido e melhorado a tradução para o ÁRABE.
Adicionado mais alguns termos.
Adicionado opção para traduzir o "Header Title" do unidbrid

** thanks to mr. Mohammed Boullal