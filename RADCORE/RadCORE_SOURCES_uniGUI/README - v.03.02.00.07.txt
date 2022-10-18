RadCORE 3.2.0.7

NOVAS FUNÇÕES / MELHORIAS

rc_addHintProperty

Agora ficará mais fácil adicionar / atualizar os atributos de qualquer objeto dinamicamente.

NOVOS ATRIBUTOS

Por padrão, os blocos responsivos quando se reagrupam , fazem isso com uma animação de movimento suave e um "fade".

Agora, além de desligar isso globalmente no controle de temas, você poderá fazer em blocos específicos, basta utilizar os atributos:

- animate:off
- fade:off



Por padrão, o componente UniDBCOMBOBOX não permite adicionarmos valores relacionados aos ítens.

Agora, poderemos fazer de uma maneira muito simples, rápida e sem códificação.

Nos ítens do seu componente, basta adicionar os respectivos valores ao lado separado com um pipe( | ) e pronto, o RadCORE irá controlar isso em todos os CRUDS herdados de "frmBaseCRUD".

Você poderá usar em qualquer formulário não herdado, através do atributo:

- cbbx{v1,v2...vn}** , basta seguir as intruções em nosso HELP.

** thanks to mr. Josauro



Sabe aquele recurso clássico que quando iniciamos um cadastro /  edição ou estamos visualizando um registro e precisamos codificar o estado, cor etc dos botões CADASTRAR, EDITAR, CANCELAR etc ou qualquer outro objeto sensível ao "datasource.state" ?

Agora, tudo ficará mais simples!

- state-visible

- state-enable

- state-color

- state-font-color

- state-caption

- state-cls