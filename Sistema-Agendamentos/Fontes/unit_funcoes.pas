unit unit_funcoes;

interface

uses
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, System.SysUtils, Winapi.Windows,
  Vcl.Buttons, Vcl.Graphics, Vcl.ComCtrls, FireDac.Stan.Param, System.Classes, vcl.DBCtrls;

  function fncRomoveCaracteres(AString: String) : String;
  function Criptografia(Senha, Chave: string) : string;
  function fnc_criar_mensagem(TituloJanela, TituloMSG, MSG, Icone, Tipo : String) :  boolean;
  procedure prcValidarCamposObrigatorios ( Form: TForm );

implementation

uses unit_mensagens;


function Criptografia(Senha, Chave: string) : string;
var
  x, y : Integer;
  NovaSenha : String;
begin
  for x := 1 to Length(Chave) do
  begin
    NovaSenha := '';

    for y := 1 to Length(Senha) do
    begin
      NovaSenha := NovaSenha + chr((ord(Chave[x]) xor Ord (Senha[y])));
    end;
      Senha := NovaSenha;
  end;
    Result := Senha;
end;

function fncRomoveCaracteres(AString: String) : String;
var
  i : Integer;
  Limpos : String;
begin
  Limpos := '';

  for i := 0 to Length(AString) do
    begin
      if Pos (Copy (AString, i, 1), '"!$#@&``*().,;:/<>[]{}=+-_\|') = 0 then
      Limpos := Limpos + Copy(AString, i, 1);
    end;
    Result := Limpos;
end;

function fnc_criar_mensagem(TituloJanela, TituloMSG, MSG, Icone, Tipo : String) :  boolean;
begin
  Result                        := False;
  form_mensagens                := Tform_mensagens.Create(nil);
  form_mensagens.sTituloJanela  := TituloJanela;
  form_mensagens.sTituloMSG     := TituloMSG;
  form_mensagens.sMSG           := MSG;
  form_mensagens.sTipo          := Tipo;
  form_mensagens.sCaminhoImagem := Icone;

  form_mensagens.ShowModal;
  Result := form_mensagens.bRespostaMSG;
end;

procedure prcValidarCamposObrigatorios ( Form: TForm );
var
  i : Integer;
begin
  for i := 0 to Form.ComponentCount - 1 do
  begin
    if Form.Components[i].Tag = 5 then
    begin
      // TEdit
      if Form.Components[i] is TEdit then
      begin
        if ((Form.Components[i] as TEdit).Hint <> '') and
       ((Form.Components[i] as TEdit).Text = '') then
       begin
        ShowMessage('Campo obrigat�rio' + (Form.Components[i] as TEdit).Hint);
        //(Form.Components[i] is TEdit).SetFocus;
        Abort;
       end;
      end;

      // TMaskEdit
      if Form.Components[i] is TMaskEdit then
      begin
        if ((Form.Components[i] as TMaskEdit).Hint <> '') and
       (fncRomoveCaracteres ((Form.Components[i] as TMaskEdit).Text) = '') then
       begin
        ShowMessage('O campo' + (Form.Components[i] as TMaskEdit).Hint + '� obrigat�rio');
        //(Form.Components[i] is TMaskEdit).SetFocus;
        Abort;
       end;
      end;

      // TCombobox
      if Form.Components[i] is TComboBox then
      begin
        if ((Form.Components[i] as TComboBox).Hint <> '') and
       ((Form.Components[i] as TComboBox).Text = '') then
       begin
        ShowMessage('O campo' + (Form.Components[i] as TComboBox).Hint + '� obrigat�rio');
        //(Form.Components[i] is TComboBox).SetFocus;
        Abort;
       end;
      end;
    end;
  end;

end;

end.
