unit Login;

interface                         

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db,
  StdCtrls, Buttons, jpeg, ExtCtrls, RxGrdCpt, RXCtrls, ComCtrls, RXShell,
  Provider, DBClient, FireDAC.Comp.Client, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.Imaging.pngimage;

type
  TFormLogin = class(TForm)
    StatusBar: TStatusBar;
    GroupBox: TGroupBox;
    RxLabel2: TRxLabel;
    RxLabel1: TRxLabel;
    RxLabel7: TRxLabel;
    PanelLogin: TPanel;
    RxLabel4: TRxLabel;
    SpbUsuario: TSpeedButton;
    SpbCodigoLoja: TSpeedButton;
    EditNomeUsuario: TEdit;
    EditSenha: TEdit;
    EdtCodigoLoja: TEdit;
    EditNomeLoja: TEdit;
    EdtUsuario: TEdit;
    QueryEntrada: TFDQuery;
    RxLabelVersao: TRxLabel;
    PanelContainer: TPanel;
    PanelLeftLogo: TPanel;
    ImageLogoFontdata: TImage;
    RxLabelTituloLogin: TRxLabel;
    RxLabel9: TRxLabel;
    RxLabel10: TRxLabel;
    PanelBarraUsuario: TPanel;
    PanelBarraNomeUsuario: TPanel;
    PanelBarraNomeLoja: TPanel;
    PanelBarraLoja: TPanel;
    PanelBotaoEntrar: TPanel;
    PanelBotaoSair: TPanel;
    PanelBarraSenha: TPanel;
    SpbEntrar: TSpeedButton;
    SpbSair: TSpeedButton;
    SpbFechar: TSpeedButton;
    Image1: TImage;
    procedure EdtUsuarioExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigoLojaExit(Sender: TObject);

    procedure PanelLoginMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure EdtUsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure EdtUsuarioEnter(Sender: TObject);
    procedure EdtUsuarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpbUsuarioClick(Sender: TObject);
    procedure SpbCodigoLojaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpbEntrarClick(Sender: TObject);
    procedure SpbSairClick(Sender: TObject);
    procedure SpbEntrarMouseEnter(Sender: TObject);
    procedure SpbEntrarMouseLeave(Sender: TObject);
    procedure SpbSairMouseEnter(Sender: TObject);
    procedure SpbSairMouseLeave(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure EditSenhaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpbFecharClick(Sender: TObject);
    procedure SpbFecharMouseLeave(Sender: TObject);
    procedure SpbFecharMouseEnter(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    Fantasia_Loja,
    serie  :string;
  end;

var
  FormLogin: TFormLogin;

implementation

uses  UnitNossoMdi, BibMarco, Principal, BibVariavel, BibPesquisa, Conexao,
  DMDados;

var
   Senha,
   Cod_Tipo_Estoque_Usuario  : String;
   
{$R *.DFM}


procedure TFormLogin.EdtUsuarioExit(Sender: TObject);
begin
   if EdtUsuario.Text <> '' then
   begin
     with QueryEntrada do
     begin
       EdtUsuario.Text := CompletaZeros(EdtUsuario.Text,4);
       SQL.Clear;
       SQL.Add('SELECT   usuarios.nome,                                                          ');
       SQL.Add('         usuarios.senha,                                                         ');
       SQL.Add('         usuarios.relatorio_imprime,                                             ');
       SQL.Add('         usuarios.relatorio_email,                                               ');
       SQL.Add('         usuarios.relatorio_exporta,                                             ');
       SQL.Add('         usuarios.permissao                                                      ');
       SQL.Add('FROM usuarios                                                                    ');
       SQL.Add('WHERE usuarios.codigo = :codigo                                                  ');
       ParamByName('Codigo').AsInteger := StrToInt(EdtUsuario.Text);
       Prepare;
       Open;
       if Eof then
       begin
         Mensagem('Usuário não cadastrado.',mtError,[mbOk],0);
         EdtUsuario.SetFocus;
       end;

       Codigo_Usuario       := EdtUsuario.Text;
       EditNomeUsuario.Text := FieldByName('nome').AsString;
       nome_usuario         := FieldByName('nome').AsString;
       Senha                := Trim(FieldByname('senha').AsString);
       Permissao            := FieldByName('permissao').AsString;
       Relatorio_Imprime    := FieldByName('relatorio_imprime').AsString = 'S';
       Relatorio_Email      := FieldByName('relatorio_email').AsString   = 'S';
       Relatorio_Exporta    := FieldByName('relatorio_exporta').AsString = 'S';
     end;
   end
   else
   begin
     EditNomeUsuario.Clear;
     EditSenha.Clear;
   end;
end;

procedure TFormLogin.FormActivate(Sender: TObject);
begin
  PanelContainer.Left := Round( (FormLogin.Width - PanelContainer.Width) / 2);
  PanelContainer.Top  := Round( (FormLogin.Height - PanelContainer.Height) / 2);
end;

procedure TFormLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // Configuração do Banco de Dados
  if (ssCtrl in Shift) and (chr(Key) in ['C', 'c']) then
  begin
    FormConexao.RxLabelNomeSistema.Caption := RxLabel2.Caption;
    FormConexao.ShowModal;
    Mensagem('Feche o Sistema e abra novamente para que as configurações tenham efeito.',mtInformation,[mbOk],0);
  end;
end;

procedure TFormLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and not (ActiveControl is TMemo) then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL,0,0);
  end;
end;

procedure TFormLogin.FormShow(Sender: TObject);
  begin
  if not Sistema_Conectado then
  begin
    if FormConexao.ClientDataSetConexoes.RecordCount <> 1 then
    begin
       FormConexao.RxLabelNomeSistema.Caption := 'ESPECÍFICO';
       if FormConexao.ShowModal = mrNo then
       begin
         Application.Terminate;
         Exit;
       end;
    end;
    if not DataModuleDados.ConfiguraConexao then
    begin
      Application.Terminate;
      Exit;
    end;
    Sistema_Conectado := True;
  end;
end;

procedure TFormLogin.EditSenhaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
    SpbEntrarClick(Sender);
end;

procedure TFormLogin.EdtCodigoLojaExit(Sender: TObject);
begin
   if EdtCodigoLoja.Text <> '' then
   begin
      with QueryEntrada do begin
         EdtCodigoLoja.Text := CompletaZeros(EdtCodigoLoja.Text,4);
         SQL.Clear;
         SQL.Add('SELECT loja.razao,                                            ');
         SQL.Add('       loja.fantasia,                                         ');
         SQL.Add('       parametros.cod_tipo_estoque,                           ');
         SQL.Add('       parametros.gera_nfe                                    ');
         SQL.Add('FROM loja                                                     ');
         SQL.Add('INNER JOIN parametros on (parametros.cod_loja = loja.codigo)  ');
         SQL.Add('WHERE loja.codigo   = :cod_loja                               ');
         ParamByName('cod_loja').AsInteger := StrToInt(EdtCodigoLoja.Text);
         Prepare;
         Open;
         if Eof then
         begin
           Mensagem('Loja não Cadastrada na Configuração dos Parametros ...',mtError,[mbOk],0);
           EdtCodigoLoja.SetFocus;
         end;
         EditNomeLoja.Text                 := FieldByName('RAZAO').AsString;
         Nome_loja                         := FieldByName('RAZAO').AsString;
         Fantasia_Loja                     := FieldByName('FANTASIA').AsString;
         Codigo_Loja                       := EdtCodigoLoja.Text;
         Codigo_Tipo_Estoque               := FieldByName('COD_TIPO_ESTOQUE').AsString;
         VPDataPadraoInicial               := StrToDateTime('01/01/2000 00:00:00');
         VPDataPadraoFinal                 := StrToDateTime('01/01/2050 23:59:59');
         Nome_Sistema                      := 'Maximus - Sistema Integrado de Gestão Empresarial';
         Gera_NFE                          := FieldByname('GERA_NFE').AsString;
      end;
   end
   else begin
      EditNomeLoja.Clear;
   end;
   codigo_loja                             := EdtCodigoLoja.Text;
end;


procedure TFormLogin.PanelLoginMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
   C: Integer;
begin
   for C := 0 to self.ComponentCount -1 do
   begin
      if self.Components[C] is TBitBtn then
         TBitBtn(self.Components[C]).Font.Style := [];
   end;
end;

procedure TFormLogin.EdtUsuarioKeyPress(Sender: TObject; var Key: Char);
begin
  key := TestaNumero(key);
end;

procedure TFormLogin.EdtUsuarioEnter(Sender: TObject);
begin
  EdtUsuario.SelectAll;
end;

procedure TFormLogin.EdtUsuarioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F8 then
  begin
    if Sender = EdtUsuario then
    begin
      SpbUsuarioClick(Sender);
    end
    else if Sender = EdtCodigoLoja then
    begin
      SpbCodigoLojaClick(Sender);
    end
  end;
end;

procedure TFormLogin.SpbUsuarioClick(Sender: TObject);
begin
  Pesquisa2('Usuario','Usuarios',['CODIGO','NOME'],['Codigo','Nome do Usuario'],'','',['NOME'],['CODIGO'],[EdtUsuario],'');
end;

procedure TFormLogin.SpbEntrarClick(Sender: TObject);
begin

  if ExisteEditSemPreencher(PanelLogin) then Exit;

  if  EncriptMD5(EditSenha.Text) = Senha then
  begin
   VPContratoFontdata := '';
   self.ModalResult := mrOk;
  end
  else
  begin
   Mensagem('Senha Inválida.',mtError,[mbOk]);
   EditSenha.SetFocus;
  end;
end;

procedure TFormLogin.SpbEntrarMouseEnter(Sender: TObject);
begin
  SpbEntrar.Font.Color := clBlack;
end;

procedure TFormLogin.SpbEntrarMouseLeave(Sender: TObject);
begin
  SpbEntrar.Font.Color := clWhite;
end;

procedure TFormLogin.SpbFecharClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFormLogin.SpbFecharMouseEnter(Sender: TObject);
begin
  SpbFechar.Font.Color := clRed;
end;

procedure TFormLogin.SpbFecharMouseLeave(Sender: TObject);
begin
  SpbFechar.Font.Color := $00DFDFDF;
end;

procedure TFormLogin.SpbSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFormLogin.SpbSairMouseEnter(Sender: TObject);
begin
  SpbSair.Font.Color := clBlack;
end;

procedure TFormLogin.SpbSairMouseLeave(Sender: TObject);
begin
  SpbSair.Font.Color := clWhite;
end;

procedure TFormLogin.SpbCodigoLojaClick(Sender: TObject);
begin
  Pesquisa2('Lojas','PARAMETROS',['CODIGO','RAZAO'],['Codigo','Razão Social'],'inner join LOJA on (LOJA.CODIGO  = PARAMETROS.COD_LOJA)','',['RAZAO'],['CODIGO'],[EdtCodigoLoja],'');
end;

end.
