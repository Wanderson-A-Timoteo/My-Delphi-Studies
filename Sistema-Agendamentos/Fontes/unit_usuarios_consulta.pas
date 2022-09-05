unit unit_usuarios_consulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Buttons, Vcl.DBCtrls,
  Vcl.Mask, unit_dados, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, classe.cliente;

type
  Tform_usuario_consulta = class(TForm)
    shape_fundo_form_agendamento: TShape;
    PanelAgrupaCamposConsulta: TPanel;
    PanelContainer: TPanel;
    LabelConsultaNomeCliente: TLabel;
    LabelTituloConsultarUsuarios: TLabel;
    PanelBotaoConsultar: TPanel;
    SpeedButtonConsultarUsuario: TSpeedButton;
    EditConsultaNomeUsuario: TEdit;
    PanelBordaConsultaNomeCliente: TPanel;
    dbg_registros_consulta_usuarios: TDBGrid;
    LabelClientesCadastrados: TLabel;
    ds_usuario_consulta: TDataSource;
    Label1: TLabel;
    PanelBotaoCadastrarNovoCliente: TPanel;
    SpeedButtonCadastrarNovoUsuario: TSpeedButton;
    PanelBotoesCadastrarNovoClienteFechar: TPanel;
    PanelBotaoCancelar: TPanel;
    SpeedButtonCancelarConsulta: TSpeedButton;
    labelMsnDELouEdit: TLabel;
    PanelBordaGrid: TPanel;
    procedure SpeedButtonCancelarConsultaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButtonCancelarConsultaMouseEnter(Sender: TObject);
    procedure SpeedButtonCancelarConsultaMouseLeave(Sender: TObject);
    procedure SpeedButtonCadastrarNovoUsuarioMouseLeave(Sender: TObject);
    procedure SpeedButtonCadastrarNovoUsuarioMouseEnter(Sender: TObject);
    procedure SpeedButtonCadastrarNovoUsuarioClick(Sender: TObject);
    procedure EditConsultaNomeUsuarioKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButtonConsultarUsuarioClick(Sender: TObject);
    procedure SpeedButtonConsultarUsuarioMouseEnter(Sender: TObject);
    procedure SpeedButtonConsultarUsuarioMouseLeave(Sender: TObject);
    procedure dbg_registros_consulta_usuariosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbg_registros_consulta_usuariosDblClick(Sender: TObject);
    procedure dbg_registros_consulta_usuariosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
      Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    //LUsuarios : TUsuario;
  end;

type
  TDBGridPadrao = class(TDBGrid);

var
  form_usuario_consulta: Tform_usuario_consulta;

implementation

{$R *.dfm}

uses unit_funcoes, unit_clientes, classe_conexao, unit_mensagens, unit_agendamento, unit_agenda, classe.agendamento,
  unit_cliente_consulta, unit_usuarios_cadastro, classe.usuarios;


procedure Tform_usuario_consulta.dbg_registros_consulta_usuariosDblClick(Sender: TObject);
begin
  if not dbg_registros_consulta_usuarios.DataSource.DataSet.IsEmpty then
  begin
    try
      form_usuarios_cadastro := Tform_usuarios_cadastro.Create(Self);

      form_usuarios_cadastro.EditNomeUsuario.Text  := dbg_registros_consulta_usuarios.DataSource.DataSet.FieldByName('ds_usuario').AsString;
      form_usuarios_cadastro.EditLogin.Text        := dbg_registros_consulta_usuarios.DataSource.DataSet.FieldByName('ds_login').AsString;
      form_usuarios_cadastro.EditSenha.Text        := dbg_registros_consulta_usuarios.DataSource.DataSet.FieldByName('ds_senha').AsString;
      form_usuarios_cadastro.EditRepetirSenha.Text := dbg_registros_consulta_usuarios.DataSource.DataSet.FieldByName('ds_senha').AsString;

      // Recebe a senha criptografada do Banco de Dados para poder ser alterada caso o usuário altere a senha.
      form_usuarios_cadastro.senha_original        := dbg_registros_consulta_usuarios.DataSource.DataSet.FieldByName('ds_senha').AsString;

      DataModule1.Usuarios.id_usuarios             := dbg_registros_consulta_usuarios.DataSource.DataSet.FieldByName('id_usuarios').AsInteger;

      form_usuarios_cadastro.ShowModal;
    finally
      form_usuarios_cadastro.Free;
    end;
  end;
end;

procedure Tform_usuario_consulta.dbg_registros_consulta_usuariosDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  // Zebrando o DBGrid
  if Odd(dbg_registros_consulta_usuarios.DataSource.DataSet.RecNo) then
    dbg_registros_consulta_usuarios.Canvas.Brush.Color := $00E9E9E9
  else
    dbg_registros_consulta_usuarios.Canvas.Brush.Color := clWhite; // $00F9F9F9;

  // Mudando a cor da seleção
  if (gdSelected in State) then
  begin
    dbg_registros_consulta_usuarios.Canvas.Brush.Color := $00FF8000;
    dbg_registros_consulta_usuarios.Canvas.Font.Color  := clWhite; // $00844726;
    dbg_registros_consulta_usuarios.Canvas.Font.Style  := [fsBold]; // $00844726;
  end;

  dbg_registros_consulta_usuarios.Canvas.FillRect(Rect);
  dbg_registros_consulta_usuarios.DefaultDrawColumnCell(Rect, DataCol, Column, State);


  // Mudando a posição e alinhando vertical do texto de cada linha
  dbg_registros_consulta_usuarios.Canvas.TextRect(Rect, Rect.Left + 8, Rect.Top + 8, Column.Field.DisplayText);
end;

procedure Tform_usuario_consulta.dbg_registros_consulta_usuariosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  sErro : String;
begin
   if (NOT ( dbg_registros_consulta_usuarios.DataSource.DataSet.IsEmpty ) ) and ( key = VK_DELETE )
   and ( fnc_criar_mensagem('CONFIRMAÇÃO',
                            'Excluir Dados do Usuário',
                            'Deseja excluir este Usuário?',
                            ExtractFilePath(Application.ExeName) + 'imagens\aviso.png',
                            'CONFIRMAR')) then
  begin
    if (not ( DataModule1.Usuarios.fnc_operacoes_crud('EXCLUIR',
               dbg_registros_consulta_usuarios.DataSource.DataSet.FieldByName('id_usuarios').AsString,
               sErro))) then
    begin
      fnc_criar_mensagem('EXCLUIR USUÁRIO',
                         'Erro ao excluir Usuário',
                         sErro,
                         ExtractFilePath(Application.ExeName) + 'imagens\erro.png',
                         'ERRO');
    end;

  end;
end;

procedure Tform_usuario_consulta.EditConsultaNomeUsuarioKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  sErro : String;
begin
  if key = VK_RETURN then
  begin
    if DataModule1.Usuarios.fnc_operacoes_crud('CONSULTAR', EditConsultaNomeUsuario.Text, sErro) then
    begin
      ds_usuario_consulta.DataSet := DataModule1.Usuarios.QryConsulta;
      // prcAjustaTamanhoLinha(dbg_Registros, 30);
          DataModule1.Usuarios.QryConsulta.Active := True;

      // Define o tamanho de cada linha do DBGrid após ativar a Query
          TDBGridPadrao(dbg_registros_consulta_usuarios).DefaultRowHeight := 30;
          TDBGridPadrao(dbg_registros_consulta_usuarios).ClientHeight     := (30 * TDBGridPadrao(dbg_registros_consulta_usuarios).RowCount) + 30
    end else
    begin
      fnc_criar_mensagem('CONSULTAR USUÁRIO',
                         'Erro ao Consultar Usuário',
                         sErro,
                         ExtractFilePath(Application.ExeName) + 'imagens\erro.png',
                         'ERRO');

      EditConsultaNomeUsuario.SetFocus;
    end;
  end;
end;

procedure Tform_usuario_consulta.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
  begin
    //ds_usuario_consulta.DataSet := LClientes.fnc_consulta( EditConsultaNomeUsuario.Text );
  end;

end;

procedure Tform_usuario_consulta.SpeedButtonCadastrarNovoUsuarioClick(Sender: TObject);
begin
   try
    form_usuarios_cadastro := Tform_usuarios_cadastro.Create(Self);
    form_usuarios_cadastro.ShowModal;
  finally
    form_usuarios_cadastro.Free;
  end;
end;

procedure Tform_usuario_consulta.SpeedButtonCadastrarNovoUsuarioMouseEnter(Sender: TObject);
begin
  SpeedButtonCadastrarNovoUsuario.Font.Color := $00591A05;
end;

procedure Tform_usuario_consulta.SpeedButtonCadastrarNovoUsuarioMouseLeave(Sender: TObject);
begin
  SpeedButtonCadastrarNovoUsuario.Font.Color := clWhite;
end;

procedure Tform_usuario_consulta.SpeedButtonCancelarConsultaClick(Sender: TObject);
begin
  Close;
end;

procedure Tform_usuario_consulta.SpeedButtonCancelarConsultaMouseEnter(Sender: TObject);
begin
  SpeedButtonCancelarConsulta.Font.Color := $00591A05;
end;

procedure Tform_usuario_consulta.SpeedButtonCancelarConsultaMouseLeave(Sender: TObject);
begin
  SpeedButtonCancelarConsulta.Font.Color := clWhite;
end;

procedure Tform_usuario_consulta.SpeedButtonConsultarUsuarioClick(Sender: TObject);
var
  sErro : String;
begin
  if DataModule1.Usuarios.fnc_operacoes_crud('CONSULTAR', EditConsultaNomeUsuario.Text, sErro) then
  begin
    ds_usuario_consulta.DataSet := DataModule1.Usuarios.QryConsulta;
    // prcAjustaTamanhoLinha(dbg_Registros, 30);
    DataModule1.Usuarios.QryConsulta.Active := True;

    // Define o tamanho de cada linha do DBGrid após ativar a Query
    TDBGridPadrao(dbg_registros_consulta_usuarios).DefaultRowHeight := 30;
    TDBGridPadrao(dbg_registros_consulta_usuarios).ClientHeight     := (30 * TDBGridPadrao(dbg_registros_consulta_usuarios).RowCount) + 30
  end else
  begin
    fnc_criar_mensagem('CONSULTAR USUÁRIO',
                       'Erro ao Consultar Usuário',
                       sErro,
                       ExtractFilePath(Application.ExeName) + 'imagens\erro.png',
                       'ERRO');

    EditConsultaNomeUsuario.SetFocus;
  end;
end;

procedure Tform_usuario_consulta.SpeedButtonConsultarUsuarioMouseEnter(Sender: TObject);
begin
  SpeedButtonConsultarUsuario.Font.Color := $00591A05;
end;

procedure Tform_usuario_consulta.SpeedButtonConsultarUsuarioMouseLeave(Sender: TObject);
begin
  SpeedButtonConsultarUsuario.Font.Color := clWhite;
end;

end.
