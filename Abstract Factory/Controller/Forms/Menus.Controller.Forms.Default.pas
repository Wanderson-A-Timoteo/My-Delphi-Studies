unit Menus.Controller.Forms.Default;

interface

type
  TControllerFormsDefault = class
    class procedure CreateForm(ClassName : String);
  end;

implementation

uses
  FMX.Types, System.Classes, FMX.Forms, System.SysUtils;

{ TControllerFormsDefault }

class procedure TControllerFormsDefault.CreateForm(ClassName: String);
var
  ObjFMX : TFMXObjectClass;
  newForm : TCustomForm;
begin
  objFMX := TFMXObjectClass(GetClass(ClassName));
  try
    newForm := (objFMX.Create(nil) as TCustomForm);
    try
      newForm.Position := TFormPosition.ScreenCenter;
      newForm.ShowModal;
    finally
      newForm.Free;
    end;
  Except
    on E : Exception do
      raise Exception.Create(E.ClassName + E.Message);
  end;
end;
end.
