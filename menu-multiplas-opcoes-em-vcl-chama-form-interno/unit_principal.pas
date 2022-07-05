unit unit_principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Imaging.pngimage;

type
  Tform_principal = class(TForm)
    pnl_fundo: TPanel;
    pnl_topo: TPanel;
    pnl_borda_topo: TPanel;
    btn_fechar_sistema: TSpeedButton;
    btn_minimizar_sistema: TSpeedButton;
    Image_logo_sistema: TImage;
    lbl_nome_sistema: TLabel;
    pnl_menu: TPanel;
    btn_menu_suporte: TSpeedButton;
    btn_menu_configuracoes: TSpeedButton;
    btn_menu_usuarios: TSpeedButton;
    btn_menu_hamburgue: TSpeedButton;
    pnl_opcoes_usuarios: TPanel;
    btn_usuarios_log_acesso: TSpeedButton;
    btn_usuarios_permissoes: TSpeedButton;
    btn_usuarios_grupo_usuarios: TSpeedButton;
    btn_usuarios_novo_usuario: TSpeedButton;
    pnl_opcoes_sistema: TPanel;
    btn_sistema_minhas_empresas: TSpeedButton;
    btn_sistema_caixa: TSpeedButton;
    btn_sistema_vendas: TSpeedButton;
    btn_sistema_orcamentos: TSpeedButton;
    btn_sistema_servicos: TSpeedButton;
    btn_sistema_financeiro: TSpeedButton;
    btn_sistema_estoque: TSpeedButton;
    btn_sistema_funcionarios: TSpeedButton;
    btn_sistema_fornecedores: TSpeedButton;
    btn_sistema_clientes: TSpeedButton;
    pnl_opcoes_configuracoes: TPanel;
    btn_configuracoes_backup_restauracoes: TSpeedButton;
    btn_configuracoes_atualizacoes_versoes: TSpeedButton;
    btn_configuracoes_configurar_sistema: TSpeedButton;
    btn_configuracoes_servidor: TSpeedButton;
    pnl_opcoes_suporte: TPanel;
    btn_suporte_sobre_sistema: TSpeedButton;
    btn_suporte_whatsapp: TSpeedButton;
    btn_suporte_chat: TSpeedButton;
    btn_suporte_ajuda: TSpeedButton;
    pnl_borda_sistema_financeiro: TPanel;
    pnl_borda_sistema_clientes: TPanel;
    pnl_borda_sistema_funcionarios: TPanel;
    pnl_borda_sistema_fornecedores: TPanel;
    pnl_borda_sistema_estoque: TPanel;
    pnl_borda_sistema_servicos: TPanel;
    pnl_borda_sistema_orcamentos: TPanel;
    pnl_borda_sistema_vendas: TPanel;
    pnl_borda_sistema_caixa: TPanel;
    pnl_borda_sistema_relatorios: TPanel;
    btn_sistema_relatorios: TSpeedButton;
    pnl_borda_usuarios_novo_usuario: TPanel;
    pnl_borda_usuarios_grupo_usuarios: TPanel;
    pnl_borda_usuarios_permissoes: TPanel;
    pnl_borda_configuracoes_atualizacoes_versoes: TPanel;
    pnl_borda_configuracoes_configurar_sistema: TPanel;
    pnl_borda_configuracoes_servidor: TPanel;
    pnl_borda_suporte_chat: TPanel;
    pnl_borda_suporte_ajuda: TPanel;
    pnl_borda_suporte_whatsapp: TPanel;
    pnl_formularios: TPanel;
    procedure btn_fechar_sistemaClick(Sender: TObject);
    procedure btn_minimizar_sistemaClick(Sender: TObject);
    procedure btn_menu_hamburgueMouseEnter(Sender: TObject);
    procedure pnl_fundoMouseEnter(Sender: TObject);
    procedure btn_usuarios_novo_usuarioClick(Sender: TObject);
  private
    { Private declarations }
    procedure prc_controlar_menu( Botao: TSpeedButton; Ativar : Boolean);
  public
    { Public declarations }
  end;

var
  form_principal: Tform_principal;

implementation

{$R *.dfm}

uses unit_modelo1;

procedure Tform_principal.btn_menu_hamburgueMouseEnter(Sender: TObject);
begin
  prc_controlar_menu(TComponent(Sender) as TSpeedButton, True);
end;

procedure Tform_principal.pnl_fundoMouseEnter(Sender: TObject);
begin
  prc_controlar_menu(nil, False);
end;

procedure Tform_principal.prc_controlar_menu(Botao: TSpeedButton; Ativar: Boolean);
var
  i: Integer;
begin

  if Ativar then  // Se Ativar = True
  begin
    // Percorrer todos os componentes do form
    for I := 0 to form_principal.ComponentCount - 1 do
      begin
        // Testa se o componente é painel e se for tag <> 0 então é um painel de menu
        if ( form_principal.Components[i] is TPanel) and
           (( form_principal.Components[i] as TPanel).Tag <> 0) then
        begin
          // Testa se o panel é o associado ao botão que foi passado por parâmetro
          if (form_principal.Components[i] as TPanel).Tag = Botao.Tag then
          begin
            // Mostra o painel associado ao botão
            (form_principal.Components[i] as TPanel).Visible := True;
            (form_principal.Components[i] as TPanel).Left    := Botao.Left;
          end else
          begin
            // Se não for o painel associado ao botão que o mouse esta, então esconde
            (form_principal.Components[i] as TPanel).Visible := False;
          end;
        end;

      end; // Fim do for
  end else // Fim do Ativar = True
  begin  // Se Ativar = False
    for I := 0 to form_principal.ComponentCount - 1 do
      begin
        // Testa se o componente é painel e se for tag <> 0 então é um painel de menu
        if ( form_principal.Components[i] is TPanel) and
           (( form_principal.Components[i] as TPanel).Tag <> 0) then
          (form_principal.Components[i] as TPanel).Visible := False;
      end; // Fim do for
  end;
end;

procedure Tform_principal.btn_fechar_sistemaClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure Tform_principal.btn_minimizar_sistemaClick(Sender: TObject);
begin
  Application.Minimize;
end;

procedure Tform_principal.btn_usuarios_novo_usuarioClick(Sender: TObject);
begin
  form_modelo1        :=  Tform_modelo1.Create(Self); // Cria o formulário

  // Adiciona o formulario modelo 1 dentro do pnl_formularios da tela principal
  form_modelo1.Parent := form_principal.pnl_formularios;

  prc_controlar_menu(nil, False);  // Desabilita para não mostrar as opções do menu

  pnl_menu.Enabled := False; // Desabilita Menu de opções

  form_modelo1.Show;
end;

end.
