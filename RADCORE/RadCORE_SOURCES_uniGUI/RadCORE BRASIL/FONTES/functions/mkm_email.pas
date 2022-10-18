unit mkm_email; // v. 3.3.1.0

interface

uses
    System.SysUtils, System.Classes , System.TypInfo, JSON, DBXJSON, DBXJSONReflect,
    System.DateUtils,
    // feedback: Mesut from Turkey
    {$ifdef MSWINDOWS}
    Winapi.Windows,
    {$endif}
    math, System.Rtti, System.StrUtils, Vcl.Graphics, Data.Db,
    UniGuiClasses,
    //Units email
    IdComponent,
    IdTCPConnection,
    IdTCPClient,
    IdHTTP,
    IdBaseComponent,
    IdMessage,
    IdExplicitTLSClientServerBase,
    IdMessageClient,
    IdSMTPBase,
    IdSMTP,
    IdIOHandler,
    IdIOHandlerSocket,
    IdIOHandlerStack,
    IdSSL,
    IdSSLOpenSSL,
    IdAttachmentFile,
    IdText,
    IdPOP3,
    IdGlobal,
    IdUserPassProvider,
    IdSASL_CRAM_MD5,
    IdSASL_CRAM_SHA1,
    IdSASLPlain,
    IdSASLLogin,
    IdSASLSKey,
    IdSASLOTP,
    IdSASLAnonymous,
    IdSASLExternal,
    IdCoderMIME,
    IdAttachment; // SendMAIL indy;

procedure Decode2File(const base64: String; const FileName: string);
function  MyBase64Decode(const EncodedText: string): TBytes;
function  rc_MailSend( Username, Password, Host, Port, FromName, FromEmail, ToEmail, BCCEmail, Subject : string;
                       MessageBody: TStrings;
                       pTLS : boolean = false;
                       pSSL : boolean = false;
                       pHtml : boolean = false;
                       pAttach : string = '' ): boolean;

implementation

uses uconsts, untdm_rc, str_func;

function rc_MailSend( Username, Password, Host, Port, FromName, FromEmail, ToEmail, BCCEmail, Subject : string;
                      MessageBody: TStrings;
                      pTLS : boolean;
                      pSSL : boolean;
                      pHtml : boolean;
                      pAttach : string ): boolean;
var
  sFrom                : String;
  sBccList             : String;
  sHost                : String;
  iPort                : Integer;
  sUserName            : String;
  sPassword            : String;
  idMsg                : TIdMessage;
  idText               : TIdText;
  idSMTP               : TIdSMTP;
  idSSLIOHandlerSocket : TIdSSLIOHandlerSocketOpenSSL;
begin
  Result := False;
  try
    try
      //Criação e leitura do arquivo INI com as configurações
      sFrom                            := FromEmail;
      sBccList                         := BCCEmail;
      sHost                            := Host;
      iPort                            := Port.ToInteger;
      sUserName                        := Username;
      sPassword                        := Password;
      //Configura os parâmetros necessários para SSL
      IdSSLIOHandlerSocket                   := TIdSSLIOHandlerSocketOpenSSL.Create( nil); //TComponent( sender )
      IdSSLIOHandlerSocket.SSLOptions.Method := sslvSSLv23;
      IdSSLIOHandlerSocket.SSLOptions.Mode   := sslmClient;
      //Variável referente a mensagem
      idMsg                            := TIdMessage.Create( nil );  //TComponent( sender )
      idMsg.CharSet                    := 'utf-8';
      idMsg.Encoding                   := meMIME;
      idMsg.From.Name                  := FromName;//SOFTWAREHOUSE_NAME;
      idMsg.From.Address               := sFrom;
      idMsg.Priority                   := mpNormal;
      idMsg.Subject                    := Subject;
      //Add Destinatário(s)
      idMsg.Recipients.Add;
      idMsg.Recipients.EMailAddresses := ToEmail;
      //idMsg.CCList.EMailAddresses     := 'teste@teste.com.br';
      //idMsg.BccList.EMailAddresses    := sBccList;
      //idMsg.BccList.EMailAddresses    := 'teste@teste.com.br'; //Cópia Oculta
      idText := TIdText.Create( idMsg.MessageParts );
      idText.Body.Add( MessageBody.Text );
      if pHtml then
         idText.ContentType := 'text/html; charset=iso-8859-1'
      else
         idText.ContentType := 'text/plain; charset=iso-8859-1';

      //Prepara o Servidor
      idSMTP                           := TIdSMTP.Create( nil );  //TComponent( sender )
      idSMTP.IOHandler                 := IdSSLIOHandlerSocket;
      // 3.3.1.0
      if pTLS then
         idSMTP.UseTLS                    := utUseRequireTLS //  utUseImplicitTLS; //utNoTLSSupport;//
      else
         idSMTP.UseTLS                    := utNoTLSSupport;
      idSMTP.AuthType                  := satDefault;
      idSMTP.Host                      := sHost;
      idSMTP.AuthType                  := satDefault;
      idSMTP.Port                      := iPort;
      idSMTP.Username                  := sUserName;
      idSMTP.Password                  := sPassword;
      //Conecta e Autentica
      try
         idSMTP.Connect;
         idSMTP.Authenticate;
      except on E:Exception do
        begin
          Result := False;
          dm_rc.rc_ShowSweetAlert( 'Email Send', 'Failed to connect: ' + E.Message, 'error' );
        end;
      end;
      if pAttach <> EmptyStr then
        if FileExists( pAttach ) then
          TIdAttachmentFile.Create( idMsg.MessageParts, pAttach );
      //Se a conexão foi bem sucedida, envia a mensagem
      if idSMTP.Connected then
      begin
        try
          IdSMTP.Send(idMsg);
        except on E:Exception do
          begin
            Result := False;
            dm_rc.rc_ShowSweetAlert( 'Email Send', 'Failed to send email: ' + E.Message, 'error' );
          end;
        end;
      end;
      //Depois de tudo pronto, desconecta do servidor SMTP
      if idSMTP.Connected then
      begin
        Result := True;
        idSMTP.Disconnect;
      end;

    finally
      UnLoadOpenSSLLibrary;
      FreeAndNil(idMsg);
      FreeAndNil(idSSLIOHandlerSocket);
      FreeAndNil(idSMTP);
    end;
  except on e:Exception do
    begin
      Result := False;
    end;
  end;
end;

procedure Decode2File(const base64, FileName: string);
var
  stream: TFileStream;
  bytes: TBytes;
begin

  bytes := MyBase64Decode(base64);
  stream := TFileStream.Create(FileName, fmCreate);

  try
    if bytes<>nil then
      stream.Write(bytes[0], Length(Bytes));
  finally
    stream.Free;
  end;

end;

function MyBase64Decode(const EncodedText: string): TBytes;
var
  DecodedStm: TBytesStream;
  Decoder: TIdDecoderMIME;
begin

  Decoder := TIdDecoderMIME.Create(nil);
  try

    DecodedStm := TBytesStream.Create;

    try
      Decoder.DecodeBegin(DecodedStm);
      Decoder.Decode(EncodedText);
      Decoder.DecodeEnd;
      Result := DecodedStm.Bytes;
      SetLength(Result, DecodedStm.Size);
    finally
      DecodedStm.Free;
    end;

  finally
    Decoder.Free;
  end;

end;
end.
