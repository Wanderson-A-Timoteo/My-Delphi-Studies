unit Bridge.Model.SPED.C140;

interface

uses Bridge.Model.Interfaces, System.Classes;

Type
  TModelSPEDC140 = class(TInterfacedObject, iExport<TVenda>)
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

{ TModelSPEDC140 }

constructor TModelSPEDC140.Create;
begin
  FArquivo := TStringList.Create;

  if FileExists(ARQUIVO) then
    FArquivo.LoadFromFile(ARQUIVO);

  FArquivo.Add('|C140|0|1|');
end;

destructor TModelSPEDC140.Destroy;
begin
  FArquivo.Free;
  inherited;
end;

function TModelSPEDC140.GerarRegistros(Value: TVenda): iExport<TVenda>;
begin
  Result := Self;
  FArquivo.Add(Format('|C140|0|08|8|8||0|0|%d|%d|%f|0|0|0|7|7|7|7|', [Value.COO, Value.Itens, Value.Total]));
  FArquivo.SaveToFile(ARQUIVO);
end;

class function TModelSPEDC140.New: iExport<TVenda>;
begin
  Result := Self.Create;
end;

end.
