unit unit_funcoes;

interface

  function fnc_criar_mensagem(TituloJanela, TituloMSG, MSG, Icone, Tipo : String) :  boolean;


implementation

uses unit_mensagens;


function fnc_criar_mensagem(TituloJanela, TituloMSG, MSG, Icone, Tipo : String) :  boolean;
begin
  Result                        := False;
  form_mensagens                := Tform_mensagens.Create(nil);
  form_mensagens.sTituloJanela  := TituloJanela;
  form_mensagens.sTituloMSG     := TituloMSG;
  form_mensagens.sMSG           := MSG;
  form_mensagens.sTipo          := Tipo;
  form_mensagens.sCaminhoImagem := Icone;

  form_mensagens.ShowModal;
  Result := form_mensagens.bRespostaMSG;
end;

end.
