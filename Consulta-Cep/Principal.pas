unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, REST.Types, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, System.JSON;

type
  TForm_Principal = class(TForm)
    Label1: TLabel;
    EdtCEP: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    EdtEndereco: TEdit;
    LabelEndereco: TLabel;
    LabelCidade: TLabel;
    EdtCidade: TEdit;
    Label4: TLabel;
    EdtUF: TEdit;
    Label5: TLabel;
    SpeedButtonPesquisar: TSpeedButton;
    Label6: TLabel;
    EdtComplemento: TEdit;
    Label7: TLabel;
    EdtBairro: TEdit;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTClient1: TRESTClient;
    procedure SpeedButtonPesquisarClick(Sender: TObject);
    procedure EdtCEPKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    procedure ConsultarCEP;
  public
    { Public declarations }

  end;

var
  Form_Principal: TForm_Principal;

implementation

{$R *.dfm}

procedure TForm_Principal.ConsultarCEP;
var
  JSON: TJSONObject;
begin
  if ((EdtCEP.Text = '') or (Length(EdtCEP.Text) > 8)) then
  begin
    ShowMessage('CEP inv�lido!');
    EdtCEP.SetFocus;
    EdtCEP.SelectAll;
    Exit;
  end
  else
  begin
    RESTClient1.BaseURL   := 'viacep.com.br/ws/'+EdtCEP.Text+'/json';
    RESTRequest1.Method   := TRESTRequestMethod.rmGET;
    RESTRequest1.Execute;

    JSON                  := RESTResponse1.JSONValue as TJSONObject;

    if RESTRequest1.Response.StatusCode = 200 then
    begin
      if RESTRequest1.Response.Content.IndexOf('erro') > 0 then
      begin
        ShowMessage('CEP n�o encontrado');
        EdtCEP.SetFocus;
        EdtCEP.SelectAll;
      end
      else begin
        EdtEndereco.Text    := JSON.GetValue('logradouro').Value;
        EdtCidade.Text      := JSON.GetValue('localidade').Value;
        EdtBairro.Text      := JSON.GetValue('bairro').Value;
        EdtUF.Text          := JSON.GetValue('uf').Value;
        EdtComplemento.Text := JSON.GetValue('complemento').Value;
      end;
    end;
  end;
end;

procedure TForm_Principal.EdtCEPKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
  begin
    ConsultarCEP();
  end;
end;

procedure TForm_Principal.SpeedButtonPesquisarClick(Sender: TObject);
begin
  ConsultarCEP();
end;

end.
