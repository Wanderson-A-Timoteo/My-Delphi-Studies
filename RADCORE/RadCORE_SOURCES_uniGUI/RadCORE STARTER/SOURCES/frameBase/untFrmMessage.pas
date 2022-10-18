unit untFrmMessage; // v. 3.3.0.4

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, untFormBase, uniGUIBaseClasses, uniTimer, uniLabel, uniPanel, uniButton, uniBitBtn, uniImage, uniHTMLFrame;

type
  TfrmMessage = class(TformBase)
    paComandos: TUniContainerPanel;
    btnTicket: TUniBitBtn;
    btnNo: TUniBitBtn;
    btnOk: TUniBitBtn;
    memoMensagem: TUniHTMLFrame;
    imgTipo: TUniImage;
    procedure btnEncerraClick(Sender: TObject);
    procedure btnNoClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure UniFormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    cMSG_APP_TERMINATED : string;
    procedure rc_Exit;
  end;

function frmMessage: TfrmMessage;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untdm_rc, mkm_layout, uconsts;

function frmMessage: TfrmMessage;
begin
  Result := TfrmMessage(mm.GetFormInstance(TfrmMessage));
end;

procedure TfrmMessage.btnEncerraClick(Sender: TObject);
begin
  inherited;
  dm_rc.rc_OpenLink( 'https://app.radticket.com.br' );
end;
// v. 3.3.0.4
procedure TfrmMessage.btnNoClick(Sender: TObject);
var
   cStr : string;
begin
  inherited;
     mm.varB_Yes := False;
     mm.varB_No  := True;
     cStr        := lowercase( btnNo.Caption );

     Self.ModalResult       := mrCancel;
     // quando for mensagem de erro, opcao CANCELAR
     if Pos( lowercase( mm.MSG_RESTART ) , cStr ) > 0 then
        UniApplication.UniSession.Terminate( cMSG_APP_TERMINATED );

     rc_Exit;//Close;
end;

procedure TfrmMessage.btnOkClick(Sender: TObject);
begin
  inherited;
     mm.varB_Yes := True;
     mm.varB_No  := False;
     //Self.ModalResult       := mrOk;
     Self.ModalResult  := mrNone;

     rc_Exit;//Close;
end;

procedure TfrmMessage.rc_Exit;
begin
      timerClose.Enabled := true;
      rc_AddCssClass( self, 'drop_out' );
end;

procedure TfrmMessage.UniFormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Self.Destroy; // v. 3.3.0.4 // thanks VALDIR
  //rc_Exit;
end;

procedure TfrmMessage.UniFormCreate(Sender: TObject);
begin
  inherited;
  // translate messages
  case mm.varLT_Lang of

       ltpt_BR : begin
                   cMSG_APP_TERMINATED    := 'Aplicação foi Encerrada!';
                 end;
       lten_US, lten_GB   : begin
                   cMSG_APP_TERMINATED    := 'Application has been Terminated!'
                 end;
       ltes_ES   : begin
                   cMSG_APP_TERMINATED    := '¡La aplicación ha sido cerrada!'
                 end;
       ltfr_FR   : begin
                   cMSG_APP_TERMINATED := 'L''application a été terminée !';
                 end;
       ltde_DE   : begin
                   cMSG_APP_TERMINATED := 'Anwendung wurde beendet!';
                 end;
       ltit_IT   : begin
                   cMSG_APP_TERMINATED := 'L\''applicazione è stata terminata!';
                 end;
       lttr_TR    : begin
                   cMSG_APP_TERMINATED := 'Uygulama sonlandırıldı!';
                 end;
       ltru_RU    : begin
                   cMSG_APP_TERMINATED := 'Приложение было закрыто!';
                 end;
       ltzn_CH : begin
                   cMSG_APP_TERMINATED    := 'Application has been Terminated!'
                 end;
       ltin_ID : begin
                   cMSG_APP_TERMINATED    := 'Application has been Terminated!'
                 end;
       ltth_TH : begin
                   cMSG_APP_TERMINATED    := 'Application has been Terminated!'
                 end;
       lthi_IN : begin
                   cMSG_APP_TERMINATED    := 'Application has been Terminated!'
                 end;
       ltar_SA : begin // v. 3.3.0.0
                   cMSG_APP_TERMINATED    := 'تم إنهاء التطبيق!'
                 end;
  end;
end;

procedure TfrmMessage.UniFormShow(Sender: TObject);
begin
  inherited;
    dm_rc.rc_SetFocus( btnOk );
end;

end.
