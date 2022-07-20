unit unit_dados;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, Data.DB, FireDAC.Comp.Client, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, classe_conexao, classe.profissionais, classe.usuarios;

type
  TDataModule1 = class(TDataModule)
    FDConnection: TFDConnection;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    PgDriverLink: TFDPhysPgDriverLink;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    Conexao      : TConexao;
    Profissional : TProfissionais;
    Usuarios     : TUsuarios;
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.dfm}

procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
  Conexao      := TConexao.Create( FDConnection );
  Profissional := TProfissionais.Create(DataModule1.FDConnection);
  Usuarios     := TUsuarios.Create(DataModule1.FDConnection);
end;

procedure TDataModule1.DataModuleDestroy(Sender: TObject);
begin
  Conexao.Free;
  Profissional.Free;
  Usuarios.Free;
end;

end.
