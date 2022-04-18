unit SimplePed.Controller.Exceptions;

interface

uses
  System.SysUtils, Vcl.Forms;

Type
  iControllerExceptions = interface
    ['{EADEE91F-4567-48DA-93D5-B49E326365CC}']
  end;

  TControllerExceptions = class(TInterfacedObject, iControllerExceptions)
    private
      FForm : TForm;
      procedure Exceptions (Sender : TObject; E : Exception);
    public
      constructor Create(Form : TForm);
      destructor Destroy; override;
      class function New(Form : TForm) : iControllerExceptions;
  end;

implementation

uses
  SimplePed.Model.Exceptions, Vcl.StdCtrls, Vcl.Dialogs;

{ TControllerExceptions }

constructor TControllerExceptions.Create(Form : TForm);
begin
  FForm := Form;
  Application.OnException := Exceptions;
end;

destructor TControllerExceptions.Destroy;
begin

  inherited;
end;

procedure TControllerExceptions.Exceptions(Sender: TObject; E: Exception);
begin
  if E is TValidaCampo then
  begin
    TEdit(FForm.FindComponent('edt' + TValidaCampo(E).FCampo)).SetFocus;
    MessageDlg(TValidaCampo(E).FMensagem, mtError, [mbOK], 0);
  end
  else
    MessageDlg(E.Message, mtError, [mbOK], 0);
end;

class function TControllerExceptions.New(Form : TForm) : iControllerExceptions;
begin
  Result := Self.Create(Form);
end;

end.
