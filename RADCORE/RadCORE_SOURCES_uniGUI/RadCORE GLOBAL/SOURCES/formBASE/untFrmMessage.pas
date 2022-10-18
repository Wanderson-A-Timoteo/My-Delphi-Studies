unit untFrmMessage; // v. 3.3.2.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, untGenericModalForm, uniGUIBaseClasses, uniTimer, uniScrollBox, uniButton, uniBitBtn, uniPanel, uniImage, uniLabel, uniHTMLFrame, uniSweetAlert;

type
  TfrmMessage = class(TfrmGenericModalForm)
    UniScrollBox1: TUniScrollBox;
    rcBlock2: TUniContainerPanel;
    imgTipo: TUniImage;
    rcBlock4: TUniContainerPanel;
    labTitleForm: TUniLabel;
    rcBlock8: TUniContainerPanel;
    memoMensagem: TUniHTMLFrame;
    btnTicket: TUniBitBtn;
    btnNo: TUniBitBtn;
    btnOk: TUniBitBtn;
    procedure btnOkClick(Sender: TObject);
    procedure btnNoClick(Sender: TObject);
    procedure btnTicketClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
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
  MainModule, uniGUIApplication, mkm_layout, mkm_translate, uconsts, untDM_RC;

function frmMessage: TfrmMessage;
begin
  Result := TfrmMessage(mm.GetFormInstance(TfrmMessage));
end;
// v. 3.3.2.0
procedure TfrmMessage.rc_Exit;
begin
      //timerClose.Enabled := true;
     // rc_AddCssClass( self, 'drop_out' );
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
  rc_AddCssClass( imgTipo , 'rc-rotator' );
end;

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
end;
// v. 3.3.2.0
procedure TfrmMessage.btnOkClick(Sender: TObject);
begin
  inherited;
     mm.varB_Yes := True;
     mm.varB_No  := False;
     Self.ModalResult  := mrOk;
     //rc_Exit;
end;

procedure TfrmMessage.btnTicketClick(Sender: TObject);
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
end;

end.
