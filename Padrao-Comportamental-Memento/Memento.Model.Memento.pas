unit Memento.Model.Memento;

interface

uses Memento.Model.Interfaces, System.Generics.Collections;

Type
  TModelMemento = class(TInterfacedObject, iMementoZelador<iCliente>)
  private
    FList: TDictionary<string, iCliente>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iMementoZelador<iCliente>;
    function SaveState(Key: String; Value: iCliente): iMementoZelador<iCliente>;
    function Restore(Key: String): iCliente;
  end;

implementation

uses
  System.SysUtils;

{ TModelMemento }

constructor TModelMemento.Create;
begin
  FList := TDictionary<string, iCliente>.Create;
end;

destructor TModelMemento.Destroy;
begin
  FList.Free;
  inherited;
end;

class function TModelMemento.New: iMementoZelador<iCliente>;
begin
  Result := Self.Create;
end;

function TModelMemento.Restore(Key: String): iCliente;
begin
  Result := FList.Items[Key];
end;

function TModelMemento.SaveState(Key: String;
  Value: iCliente): iMementoZelador<iCliente>;
begin
  Result := Self;
  FList.Add(Key, Value);
end;

end.
