unit unit_usuarios_permissoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Buttons, Vcl.DBCtrls,
  Vcl.Mask, unit_dados, classe.profissionais, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, ACBrBase, ACBrEnterTab, Datasnap.DBClient, System.ImageList,
  Vcl.ImgList;

type
  Tform_usuarios_permissoes = class(TForm)
    shape_fundo_form_agendamento: TShape;
    PanelAgrupaCamposAgendamento: TPanel;
    PanelContainer: TPanel;
    LabelNoemProfissional: TLabel;
    LabelTituloCadastrarProfissional: TLabel;
    PanelBotoesAgendarCancelar: TPanel;
    PanelBotaoAgendar: TPanel;
    PanelBotaoCancelar: TPanel;
    SpeedButtonSalvar: TSpeedButton;
    SpeedButtonCancelar: TSpeedButton;
    EditNomeGrupoUsuarios: TEdit;
    PanelBordaNomeProfissional: TPanel;
    dbg_registros: TDBGrid;
    Label1: TLabel;
    ds_permissoes: TDataSource;
    Label10: TLabel;
    ACBrEnterTab1: TACBrEnterTab;
    PnlBordaDBGrid: TPanel;
    cds_modulos: TClientDataSet;
    cds_modulosid_item: TIntegerField;
    cds_modulosabrir: TBooleanField;
    cds_modulosinserir: TBooleanField;
    cds_modulosalterar: TBooleanField;
    cds_modulosexcluir: TBooleanField;
    cds_modulosimprimir: TBooleanField;
    cds_modulosds_modulo: TStringField;
    ImageList: TImageList;
    procedure SpeedButtonCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButtonSalvarMouseEnter(Sender: TObject);
    procedure SpeedButtonSalvarMouseLeave(Sender: TObject);
    procedure SpeedButtonCancelarMouseEnter(Sender: TObject);
    procedure SpeedButtonCancelarMouseLeave(Sender: TObject);
    procedure dbg_registrosCellClick(Column: TColumn);
    procedure dbg_registrosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure SpeedButtonSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_usuarios_permissoes: Tform_usuarios_permissoes;

implementation

{$R *.dfm}

uses unit_funcoes;


procedure Tform_usuarios_permissoes.dbg_registrosCellClick(Column: TColumn);
begin
  if (Column.FieldName <> 'ds_modulo') then
  begin
    cds_modulos.Edit;
    cds_modulos.FieldByName( Column.FieldName ).AsBoolean := not cds_modulos.FieldByName( Column.FieldName ).AsBoolean;
    cds_modulos.Post;
  end;
end;

procedure Tform_usuarios_permissoes.dbg_registrosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
var
 Picture: TPicture;
 AlignPicture: Integer;
begin
  if ( Column.FieldName <> 'ds_module' ) then
  begin
    try
      Picture := TPicture.Create;
      dbg_registros.Canvas.FillRect(Rect);

      if dbg_registros.DataSource.DataSet.FieldByName(Column.FieldName).AsBoolean = False then
        ImageList.GetBitmap(0, Picture.Bitmap)
      else
        ImageList.GetBitmap(1, Picture.Bitmap);

      AlignPicture := Trunc ((Column.Width - Picture.Width) / 2);

      dbg_registros.Canvas.Draw(Rect.Left + AlignPicture, Rect.Top + 10, Picture.Graphic);
    finally
      Picture.Free;
    end;
  end;
end;

procedure Tform_usuarios_permissoes.FormShow(Sender: TObject);
begin
  cds_modulos.Close;
  cds_modulos.CreateDataSet;
  DataModule1.Usuarios.prc_carrega_modulos( cds_modulos );
  //prcAjustaTamanhoLinha(dbg_registros, 33);
end;

procedure Tform_usuarios_permissoes.SpeedButtonSalvarClick(Sender: TObject);
var
  SErro: String;
begin
  SErro := '';

  prcValidarCamposObrigatorios( form_usuarios_permissoes );

  DataModule1.Usuarios.ds_grupo_usuario := EditNomeGrupoUsuarios.Text;

  if DataModule1.Usuarios.fnc_inserir_grupo_permissao( cds_modulos, SErro) then
  begin
    fnc_criar_mensagem('INSERINDO DADOS',
                       'Cadastrar/Alterar Grupo de Usuários/Permissões',
                       'Cadastro/Alteração Realizado com Sucesso! ' +
                       '',
                       ExtractFilePath(Application.ExeName) + 'imagens\sucesso.png',
                       'OK');
    Close;
  end else
  begin
    fnc_criar_mensagem('INSERINDO DADOS',
                       'Erro ao Cadastrar/Alterar Grupo de Usuários/Permissões',
                       'Não foi possível Cadastrar/Alterar Grupo de Usuários/Permissões, possível causa: ' +
                       SErro,
                       ExtractFilePath(Application.ExeName) + 'imagens\erro.png',
                       'OK');

    EditNomeGrupoUsuarios.SetFocus;
  end;

end;

procedure Tform_usuarios_permissoes.SpeedButtonSalvarMouseEnter(Sender: TObject);
begin
  SpeedButtonSalvar.Font.Color := $00591A05;
end;

procedure Tform_usuarios_permissoes.SpeedButtonSalvarMouseLeave(Sender: TObject);
begin
  SpeedButtonSalvar.Font.Color := clWhite;
end;

procedure Tform_usuarios_permissoes.SpeedButtonCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure Tform_usuarios_permissoes.SpeedButtonCancelarMouseEnter(Sender: TObject);
begin
  SpeedButtonCancelar.Font.Color := $00591A05;
end;

procedure Tform_usuarios_permissoes.SpeedButtonCancelarMouseLeave(Sender: TObject);
begin
  SpeedButtonCancelar.Font.Color := clWhite;
end;

end.
