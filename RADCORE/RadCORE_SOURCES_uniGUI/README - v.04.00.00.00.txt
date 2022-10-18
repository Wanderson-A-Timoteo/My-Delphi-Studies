RadCORE 4.0.0.0



DOCUMENTAÇÃO

Melhoria e/ou novos tópicos adicionados


RESPONSIVIDADE

- Ajuste para resolução HD( thanks to FABIO OLIVEIRA )

RC ELEMENTS

- Ajuste na exibição de todos atributos disponíveis e seus respectivos parâmetros

RC WIZARD

- Ajuste na configuração do Idioma
- Idioma inglês atualizado para "English US" e "English GB"

CONTROLE DE TEMAS / LAYOUT

- Novas Opções de Fontes
- Nova opção para definir a largura da barra de scroll
- Nova opção para parametrizar as cores do UniDBGRID
- Nova opção para parametrizar o layout UniDBGRID
- Nova opção para padronizar a exibição da nova barra de navegação
- Nova opção para definir a animação e o tipo de "load mask" com ou sem background
- Ajuste na opção de formulários sem bordas arredondadas
- Prévia do DARK MODE

MAIN FORM

- Exibição de um ícone "KEY" na base do MENU LATERAL quando usuário for MASTER
- Menu Desacoplado. Animação mais suave.
- Carregamento do Dashboard inicial na aba principal

MENU DINÂMICO

- Melhoria no controle de HIDDEN OPTIONS
- Nova opção para geração de opções que pedem obrigatoriamente acesso MASTER
- Nova opção para "não exibir" uma opção do menu MESMO SENDO "ADMIN"

DASHBOARDS

- Novos modelos de Dashboard
  - CRM
  - E-Commerce
  - Hospital
  - School

CSS PADRÂO

- Novos modelos de botões sem background 
- Novo modelo com cor do caption respondendo corretamente ao HOVER
- Criação do arquivo secundário para o usuário do radcore possa adicionar suas classes sem alterar o arquivo padrão
- Melhoria layout DateTimePicker
- Dezenas de novas classes

UNIDBGRID

- Nova barra de navegação dinâmica
  - Botão refresh que atualiza a query 
- Novos elementos de layout vinculados ao controle de temas

frmBASECRUD / frmBASECRUDDETAIL

- Diversas melhorias no layout/responsividade
  - Modelo de CRUD com Botões Laterais se ajustam para MOBILE
  - Modelo de CRUD com Captions nos Botões
    - Em mobile os captions ficam ocultos
  - Escolha do padrão de cor
  - Escolha do padrão do Botão de Ações
  - Painel de pesquisa avançada animada

- Novos modelos configuráveis 
  - Novos modelos de botões
  - Parametrização do padrão de PESQUISA

- Refatoração dos "Action Buttons" sem uso de "widgets" e "fields editor ( sem uso de OnGetText )"
  - Melhoria no layout
  - Vinculação a qualquer botão contido no formulário herdado do frmBaseCRUD

NOVA UNIT "mkm_createcomponents"

Criação dinâmica de blocos responsivos, labels, edits etc.


NOVOS ATRIBUTOS DINÂMICOS

> "border:"
- Criação de bordas totais ou parciais em um container

MELHORIAS EM ATRIBUTOS DINÂMICOS

> "rc_RenderControls" agora permite renderizar apenas um objeto.

> "collapse:"
- Parâmetro "icons:" 
  - "icons:aaaa aaaa" para customização dos ícones do "collapse:"
  - "icons:off" para permitir que qualquer objeto seja o acionador do "collapse:" sem uso de ícones

> "state-color" e "state-font-color"
- Poderão ser aplicados em componentes de edição( uniEDIT etc )
- uso dos identificadores do controle de TEMAS nos campos de edição para manter o padrão do TEMA ATUAL:
  - [[EDIT_COLOR]]
  - [[EDIT_FONT_COLOR]]
  - [[EDIT_COLOR_READONLY]]
  - [[EDIT_FONT_COLOR_READONLY]]

> "ico-stack:"
- Parâmetro "type:"
  - circle
  - square
- Parâmetro "size:"

> "valid-required:"
- Ajuste no posicionamento do marcado( Thanks FABIO SALVIANO )

> "cbx-fill:" Preenche um combobox com uma lista de arquivos
- Parâmetro "folder:"
  - folder:files\images\loaders filter:*.gif,*.svg 

LOOKUP DINÂMICO

> "getsearchfield:"
> "lkponlysearch"
- Permite criar um lookup sem vínculo com datafield

DEMO: frmCadCOMPRAS

- Adicionado atributos reativos no grid DETAIL
- Ajuste na atualização do lookup de produtos( limpeza ao incluir )
- IMPORTANTE: Atualização na estrutura da tabela "COMPRAS_PRODUTOS". Verifique o modelo padrão.


RC_TRANSLATE

- Ajuste para prevenir erros
- Tradução da mensagem de erro referente ao controle de LIMITE MAXIMO DE ABAS ABERTAS

OUTRAS MELHORIAS

- Ajuste para manter um possível "_"( digitado pelo usuário ) no nome da aplicação criada pelo WIZARD
- exibição das setas laterais no "bsTABS" em MOBILE( Issue feedback: Andrew Stepanchuk from Ukraine )
- Ajuste na validação "min-" e "max-" quando em conjunto com o "notblank"
- Ajustes diversos






