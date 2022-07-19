unit Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ComCtrls, RXSpeedBar, ExtCtrls, RxGrdCpt, DB, Vcl.Imaging.pngimage, Vcl.Buttons,
  Vcl.AppEvnts;

type
  TFormPrincipal = class(TForm)
    StatusBarPrincipal: TStatusBar;
    LabelLoja: TLabel;
    Label3: TLabel;
    LabelVersao: TLabel;
    PanelCabecalho: TPanel;
    ImageLogoFontdata: TImage;
    Label1: TLabel;
    PanelMenu: TPanel;
    SpbFechar: TSpeedButton;
    SpbMinimizar: TSpeedButton;
    SpbMenuCadastro: TSpeedButton;
    SpbMenuEncerrar: TSpeedButton;
    SpbMenuPesquisar: TSpeedButton;
    Image1: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MnuSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PesquisarStatusdaCriana1Click(Sender: TObject);
    procedure SpbFecharMouseEnter(Sender: TObject);
    procedure SpbMinimizarClick(Sender: TObject);
    procedure SpbMinimizarMouseEnter(Sender: TObject);
    procedure SpbMinimizarMouseLeave(Sender: TObject);
    procedure SpbFecharMouseLeave(Sender: TObject);
    procedure SpbFecharClick(Sender: TObject);
    procedure SpbMenuCadastroMouseEnter(Sender: TObject);
    procedure SpbMenuCadastroMouseLeave(Sender: TObject);
    procedure SpbMenuPesquisarMouseEnter(Sender: TObject);
    procedure SpbMenuPesquisarMouseLeave(Sender: TObject);
    procedure SpbMenuEncerrarMouseEnter(Sender: TObject);
    procedure SpbMenuEncerrarMouseLeave(Sender: TObject);
    procedure SpbMenuCadastroClick(Sender: TObject);
    procedure SpbMenuPesquisarClick(Sender: TObject);
    procedure SpbMenuEncerrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure ControlarMenu( Botao: TSpeedButton; Ativar : Boolean);
    procedure OnModalBegin(ASender: TObject);
    procedure OnModalEnd(ASender: TObject);
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;


implementation

uses BibMarco, BibVariavel, Login, DMDados, PesquisarCriancas, CadastrarCrianca, Fundo;


{$R *.dfm}

procedure TFormPrincipal.SpbFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFormPrincipal.SpbFecharMouseEnter(Sender: TObject);
begin
  SpbFechar.Font.Color := clRed;
end;

procedure TFormPrincipal.SpbFecharMouseLeave(Sender: TObject);
begin
  SpbFechar.Font.Color := $00DFDFDF;
end;

procedure TFormPrincipal.SpbMenuCadastroClick(Sender: TObject);
begin
  try
     FormCadastrarCrianca := TFormCadastrarCrianca.Create(nil);
     FormCadastrarCrianca.ShowModal;
   finally
     FreeAndNil(FormCadastrarCrianca);
   end;
end;

procedure TFormPrincipal.SpbMenuCadastroMouseEnter(Sender: TObject);
begin
  SpbMenuCadastro.Font.Color := clBlack;
end;

procedure TFormPrincipal.SpbMenuCadastroMouseLeave(Sender: TObject);
begin
  SpbMenuCadastro.Font.Color := clWhite;
end;

procedure TFormPrincipal.SpbMenuEncerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TFormPrincipal.SpbMenuEncerrarMouseEnter(Sender: TObject);
begin
  SpbMenuEncerrar.Font.Color := clBlack;
end;

procedure TFormPrincipal.SpbMenuEncerrarMouseLeave(Sender: TObject);
begin
  SpbMenuEncerrar.Font.Color := clWhite;
end;

procedure TFormPrincipal.SpbMenuPesquisarClick(Sender: TObject);
begin
  try
     FormPesquisarCriancas := TFormPesquisarCriancas.Create(nil);
     FormPesquisarCriancas.ShowModal;
   finally
     FreeAndNil(FormPesquisarCriancas);
   end;
end;

procedure TFormPrincipal.SpbMenuPesquisarMouseEnter(Sender: TObject);
begin
  SpbMenuPesquisar.Font.Color := clBlack;
end;

procedure TFormPrincipal.SpbMenuPesquisarMouseLeave(Sender: TObject);
begin
  SpbMenuPesquisar.Font.Color := clWhite;
end;

procedure TFormPrincipal.SpbMinimizarClick(Sender: TObject);
begin
  Application.Minimize;
end;

procedure TFormPrincipal.SpbMinimizarMouseEnter(Sender: TObject);
begin
  SpbMinimizar.Font.Color := clRed;
end;

procedure TFormPrincipal.SpbMinimizarMouseLeave(Sender: TObject);
begin
  SpbMinimizar.Font.Color := $00DFDFDF;
end;

procedure TFormPrincipal.OnModalBegin(ASender: TObject);
begin
  FormFundo.Show;
end;

procedure TFormPrincipal.OnModalEnd(ASender: TObject);
begin
  FormFundo.Hide;
end;

procedure TFormPrincipal.ControlarMenu(Botao: TSpeedButton; Ativar: Boolean);
var
  i: Integer;
begin

  if Ativar then  // Se Ativar = True
  begin
    // Percorrer todos os componentes do form
    for I := 0 to FormPrincipal.ComponentCount - 1 do
      begin
        // Testa se o componente � painel e se for tag <> 0 ent�o � um painel de menu
        if ( FormPrincipal.Components[i] is TPanel) and
           (( FormPrincipal.Components[i] as TPanel).Tag <> 0) then
        begin
          // Testa se o panel � o associado ao bot�o que foi passado por par�metro
          if (FormPrincipal.Components[i] as TPanel).Tag = Botao.Tag then
          begin
            // Mostra o painel associado ao bot�o
            (FormPrincipal.Components[i] as TPanel).Visible := True;
            (FormPrincipal.Components[i] as TPanel).Left    := Botao.Left;
          end else
          begin
            // Se n�o for o painel associado ao bot�o que o mouse esta, ent�o esconde
            (FormPrincipal.Components[i] as TPanel).Visible := False;
          end;
        end;

      end; // Fim do for
  end else // Fim do Ativar = True
  begin  // Se Ativar = False
    for I := 0 to FormPrincipal.ComponentCount - 1 do
      begin
        // Testa se o componente � painel e se for tag <> 0 ent�o � um painel de menu
        if ( FormPrincipal.Components[i] is TPanel) and
           (( FormPrincipal.Components[i] as TPanel).Tag <> 0) then
          (FormPrincipal.Components[i] as TPanel).Visible := False;
      end; // Fim do for
  end;
end;


procedure TFormPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Mensagem('Deseja sair do sistema?',mtConfirmation,[mbYes,mbNo]) = mrNo then
  begin
     Action := caNone;
  end;
end;

procedure TFormPrincipal.MnuSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFormPrincipal.PesquisarStatusdaCriana1Click(Sender: TObject);
begin
  try
     FormPesquisarCriancas := TFormPesquisarCriancas.Create(nil);
     FormPesquisarCriancas.ShowModal;
   finally
     FreeAndNil(FormPesquisarCriancas);
   end;
end;

procedure TFormPrincipal.FormCreate(Sender: TObject);
begin
  if FormLogin.Showmodal <> mrOk then
    Application.Terminate;
  LabelVersao.Caption := FormLogin.RxLabelVersao.Caption;
  LabelLoja.Caption   := FormLogin.Fantasia_Loja;
  LabelLoja.Left      := (FormPrincipal.Width - LabelLoja.Width) div 2;
  FormLogin.Free;
  FormPrincipal.StatusBarPrincipal.Panels[0].Text := 'Banco de Dados';
  FormPrincipal.StatusBarPrincipal.Panels[1].Text := 'PostgreSQL';
  //Pega o Nome do Banco
  with DataModuleDados.QueryParametros do
  begin
    SQL.Clear;
    SQL.Add('SELECT current_database() as servidor_atual ');
    Prepare;
    Open;
    FormPrincipal.StatusBarPrincipal.Panels[2].Text:= FieldByName('servidor_atual').AsString;
  end;
end;

procedure TFormPrincipal.FormShow(Sender: TObject);
begin
  Application.CreateForm(TFormFundo, FormFundo);
  Application.OnModalBegin := Self.OnModalBegin;
  Application.OnModalEnd   := Self.OnModalEnd;
end;

end.
