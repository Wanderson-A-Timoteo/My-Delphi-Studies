unit Bridge.Model.SPED.C100;

interface

uses Bridge.Model.Interfaces, System.Classes;

Type
  TModelSPEDC100 = class(TInterfacedObject, iExport<TVenda>)
    private
      FArquivo : TStringList;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iExport<TVenda>;
       function GerarRegistros(Value : TVenda) : iExport<TVenda>;
  end;

implementation

uses
  System.SysUtils;

const
  ARQUIVO = 'SPED.TXT';

{ TModelSPEDC100 }

constructor TModelSPEDC100.Create;
begin
  FArquivo := TStringList.Create;

  if FileExists(ARQUIVO) then
    FArquivo.LoadFromFile(ARQUIVO);

  FArquivo.Add('|C100|0|1|');
end;

destructor TModelSPEDC100.Destroy;
begin
  FArquivo.Free;
  inherited;
end;

function TModelSPEDC100.GerarRegistros(Value: TVenda): iExport<TVenda>;
begin
  Result := Self;
  FArquivo.Add(Format('|C100|%d|%d|%f|', [Value.COO, Value.Itens, Value.Total]));
  FArquivo.SaveToFile(ARQUIVO);
end;

class function TModelSPEDC100.New: iExport<TVenda>;
begin
  Result := Self.Create;
end;

end.
