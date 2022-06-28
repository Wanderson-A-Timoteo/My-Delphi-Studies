unit unit_cliente_consulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Buttons, Vcl.DBCtrls,
  Vcl.Mask, unit_dados, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, classe.cliente;

type
  Tform_cliente_consulta = class(TForm)
    shape_fundo_form_agendamento: TShape;
    PanelAgrupaCamposConsulta: TPanel;
    PanelContainer: TPanel;
    LabelConsultaNomeCliente: TLabel;
    LabelTituloCadastrarProfissional: TLabel;
    PanelBotoesConsultarCancelarCadastrarCliente: TPanel;
    PanelBotaoConsultar: TPanel;
    SpeedButtonConsultarCliente: TSpeedButton;
    EditConsultaNomeCliente: TEdit;
    PanelBordaConsultaNomeCliente: TPanel;
    dbg_registros_consulta_cliente: TDBGrid;
    LabelClientesCadastrados: TLabel;
    ds_cliente_consulta: TDataSource;
    Label1: TLabel;
    PanelBotaoCadastrarNovoCliente: TPanel;
    SpeedButtonCadastrarNovoCliente: TSpeedButton;
    PanelBotoesCadastrarNovoClienteFechar: TPanel;
    PanelBotaoCancelar: TPanel;
    SpeedButtonCancelarConsulta: TSpeedButton;
    labelMsnDELouEdit: TLabel;
    procedure SpeedButtonCancelarConsultaClick(Sender: TObject);
    procedure SpeedButtonCadastrarNovoClienteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButtonConsultarClienteClick(Sender: TObject);
    procedure dbg_registros_consulta_clienteDblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    LClientes : TCliente;
  end;

var
  form_cliente_consulta: Tform_cliente_consulta;

implementation

{$R *.dfm}

uses unit_funcoes, unit_clientes, classe_conexao, unit_mensagens;


procedure Tform_cliente_consulta.dbg_registros_consulta_clienteDblClick(Sender: TObject);
begin
  if (not (dbg_registros_consulta_cliente.DataSource.DataSet.IsEmpty)) then
  begin

  end;
end;

procedure Tform_cliente_consulta.FormCreate(Sender: TObject);
begin
  LClientes := TCliente.Create( DataModule1.FDConnection );
end;

procedure Tform_cliente_consulta.FormDestroy(Sender: TObject);
begin
  LClientes.Free;
end;

procedure Tform_cliente_consulta.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
  begin
    ds_cliente_consulta.DataSet := LClientes.fnc_consulta( EditConsultaNomeCliente.Text );
  end;

end;

procedure Tform_cliente_consulta.SpeedButtonCadastrarNovoClienteClick(Sender: TObject);
begin
  try
    form_clientes := Tform_clientes.Create(nil);
    ds_cliente_consulta.DataSet := nil;
    form_clientes.ShowModal;
  finally
    form_clientes.Free;
  end;
end;

procedure Tform_cliente_consulta.SpeedButtonCancelarConsultaClick(Sender: TObject);
begin
  Close;
end;

procedure Tform_cliente_consulta.SpeedButtonConsultarClienteClick(Sender: TObject);
begin
  ds_cliente_consulta.DataSet := LClientes.fnc_consulta( EditConsultaNomeCliente.Text );
end;

end.
