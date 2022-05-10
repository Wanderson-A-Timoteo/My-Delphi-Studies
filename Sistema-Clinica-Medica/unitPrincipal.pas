unit unitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Menus, Vcl.Imaging.jpeg;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Sistema1: TMenuItem;
    Sair1: TMenuItem;
    Cadastro1: TMenuItem;
    Pacientes1: TMenuItem;
    Agendamentos1: TMenuItem;
    Panel1: TPanel;
    BitBtnAgendamentos: TBitBtn;
    BitBtnPacientes: TBitBtn;
    Image1: TImage;
    procedure Sair1Click(Sender: TObject);
    procedure Pacientes1Click(Sender: TObject);
    procedure Agendamentos1Click(Sender: TObject);
    procedure BitBtnPacientesClick(Sender: TObject);
    procedure BitBtnAgendamentosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  unitCadastroPaciente, unitCadastroAgendamento;

{$R *.dfm}

procedure TfrmPrincipal.Agendamentos1Click(Sender: TObject);
begin
  frmCadastroAgendamento.ShowModal;
end;

procedure TfrmPrincipal.BitBtnAgendamentosClick(Sender: TObject);
begin
  frmCadastroAgendamento.ShowModal;
end;

procedure TfrmPrincipal.BitBtnPacientesClick(Sender: TObject);
begin
  frmCadastroPaciente.ShowModal;
end;

procedure TfrmPrincipal.Pacientes1Click(Sender: TObject);
begin
  frmCadastroPaciente.ShowModal;
end;

procedure TfrmPrincipal.Sair1Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
