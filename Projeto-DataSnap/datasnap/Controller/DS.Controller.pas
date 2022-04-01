unit DS.Controller;

interface

uses
  DS.Model.Entidade.Factory, System.SysUtils;

type
  TController = class
    private
      FEntidades : TModelEntidadeFactory;
    public
      constructor Create;
      destructor Destroy; override;
      function Entidades : TModelEntidadeFactory;
  end;

implementation

{ TController }

constructor TController.Create;
begin
  FEntidades := TModelEntidadeFactory.Create;
end;

destructor TController.Destroy;
begin
  FreeAndNil(FEntidades);
  inherited;
end;

function TController.Entidades: TModelEntidadeFactory;
begin
  Result := FEntidades;
end;

end.
