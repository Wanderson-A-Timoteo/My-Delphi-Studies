unit unit_cliente_consulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Buttons, Vcl.DBCtrls,
  Vcl.Mask, unit_dados, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  Tform_cliente_consulta = class(TForm)
    shape_fundo_form_agendamento: TShape;
    PanelAgrupaCamposConsulta: TPanel;
    PanelContainer: TPanel;
    LabelConsultaNomeCliente: TLabel;
    LabelTituloCadastrarProfissional: TLabel;
    PanelBotoesConsultarCancelarCadastrarCliente: TPanel;
    PanelBotaoConsultar: TPanel;
    PanelBotaoCadastrarNovoCliente: TPanel;
    SpeedButtonConsultarCliente: TSpeedButton;
    SpeedButtonCadastrarNovoCliente: TSpeedButton;
    EditConsultaNomeCliente: TEdit;
    PanelBordaConsultaNomeCliente: TPanel;
    dbg_registros_consulta_cliente: TDBGrid;
    LabelClientesCadastrados: TLabel;
    ds_cliente_consulta: TDataSource;
    LabelAsteriscoNomeCliente: TLabel;
    PanelBotaoCancelar: TPanel;
    SpeedButtonCancelarConsulta: TSpeedButton;
    procedure SpeedButtonCancelarConsultaClick(Sender: TObject);
    procedure SpeedButtonCadastrarNovoClienteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_cliente_consulta: Tform_cliente_consulta;

implementation

{$R *.dfm}

uses unit_funcoes, unit_clientes, classe_conexao, unit_mensagens;


procedure Tform_cliente_consulta.SpeedButtonCadastrarNovoClienteClick(Sender: TObject);
begin
  form_clientes := Tform_clientes.Create(Self);
  try
    form_clientes.ShowModal;
  finally
    form_clientes.Free;
  end;
end;

procedure Tform_cliente_consulta.SpeedButtonCancelarConsultaClick(Sender: TObject);
begin
  Close;
end;

end.
