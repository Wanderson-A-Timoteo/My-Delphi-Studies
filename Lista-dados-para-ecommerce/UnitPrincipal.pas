unit UnitPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts, FMX.ListBox;

type
  TFrmPrincipal = class(TForm)
    Layout1: TLayout;
    Image1: TImage;
    Label1: TLabel;
    Image2: TImage;
    Circle1: TCircle;
    lbProdutos: TListBox;
    imgFotoExemplo: TImage;
    imgFavorito: TImage;
    imgNaoFavorito: TImage;
    procedure FormShow(Sender: TObject);
    procedure lbProdutosViewportPositionChange(Sender: TObject;
      const OldViewportPosition, NewViewportPosition: TPointF;
      const ContentSizeChanged: Boolean);
  private
    procedure ListarProdutos(pagina: integer; ind_clear: boolean);
    procedure ThreadProdutosTerminate(Sender: TObject);
    procedure RequestProdutos(pagina: integer);
    procedure AddProdutoListBox(id_produto: integer; descricao,
      fabricante: string; valor: double; foto: TBitmap; ind_favorito: boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

Const
  TAM_PAGINA = 14;

implementation

{$R *.fmx}

uses Frame.Produto;

procedure TFrmPrincipal.RequestProdutos(pagina: integer);
begin
    // Fazer o request ao servidor...
    sleep(2000);

    {
    // RestRequest4D
    TabProdutos.FieldDefs.Clear;

    resp := TRequest.New.BaseURL(BASE_URL)
            .Resource('produtos')
            .AddParam('busca', busca)
            .AddParam('pagina', pagina.ToString)
            .DataSetAdapter(TabProdutos)
            .Accept('application/json')
            .Get;

    if (resp.StatusCode <> 200) then
        raise Exception.Create(resp.Content);
    }
end;

procedure TFrmPrincipal.AddProdutoListBox(id_produto: integer;
                                          descricao, fabricante: string;
                                          valor: double;
                                          foto: TBitmap;
                                          ind_favorito: boolean);
var
    item: TListBoxItem;
    frame: TFrameProduto;
begin
    item := TListBoxItem.Create(lbProdutos);
    item.Selectable := false;
    item.Text := '';
    item.Height := 250;
    item.Tag := id_produto;

    frame := TFrameProduto.Create(item);
    frame.hittest := false;
    frame.Align := TAlignLayout.Client;

    frame.imgFoto.Bitmap := foto;
    frame.lblDescricao.Text := descricao;
    frame.lblFabricante.Text := fabricante;
    frame.lblValor.Text := FormatFloat('R$#,##0.00', valor);

    if ind_favorito then
        frame.imgFavorito.Bitmap := imgFavorito.Bitmap;
    //else
    //    frame.imgFavorito.Bitmap := imgNaoFavorito.Bitmap;

    item.AddObject(frame);

    lbProdutos.AddObject(item);
end;

procedure TFrmPrincipal.ThreadProdutosTerminate(Sender: TObject);
var
    i : integer;
begin
    // Nao carregar mais dados...
    {
    if TabProdutos.RecordCount < TAM_PAGINA then
        lbProdutos.Tag := -1;
    }

    // Remover em producao
    if lbProdutos.Tag > 4 then
        lbProdutos.Tag := -1;
    //---------------------

    for i := 1 to 14 do
    begin
        if Odd(i) then
            AddProdutoListBox(512165, 'Computador Dell Intel i7 18GB GD 2TB', 'DELL', 2680,
                              imgFotoExemplo.Bitmap, true)
        else
            AddProdutoListBox(512165, 'Computador Dell Intel i7 18GB GD 2TB', 'DELL', 2680,
                          imgFotoExemplo.Bitmap, false);
    end;

    lbProdutos.EndUpdate;

    // Processamento terminou...
    lbProdutos.TagString := '';

    // Deu erro na Thread?
    if Sender is TThread then
    begin
        if Assigned(TThread(Sender).FatalException) then
        begin
            showmessage(Exception(TThread(sender).FatalException).Message);
            exit;
        end;
    end;

end;

procedure TFrmPrincipal.ListarProdutos(pagina: integer; ind_clear: boolean);
var
    t: TThread;
begin
    // Evitar processamento concorrente...
    if lbProdutos.TagString = 'S' then
        exit;

    // Marcar em processamento...
    lbProdutos.TagString := 'S';

    lbProdutos.BeginUpdate;

    // Limpar a lista...
    if ind_clear then
    begin
        pagina := 1;
        lbProdutos.ScrollToItem(lbProdutos.ItemByIndex(0));
        lbProdutos.Items.Clear;
    end;

    {
    Tag: contem a pagina atual solicitada ao servidor...
    >= 1 : faz o request para buscar mais dados
    -1 : indica que não tem mais dados
    }
    // Salva pagina atual que sera exibida...
    lbProdutos.Tag := pagina;

    t := TThread.CreateAnonymousThread(procedure
    begin
        // Busca produtos no servidor...
        RequestProdutos(pagina);
    end);

    t.OnTerminate := ThreadProdutosTerminate;
    t.Start;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
    ListarProdutos(1, true);
end;

procedure TFrmPrincipal.lbProdutosViewportPositionChange(Sender: TObject;
  const OldViewportPosition, NewViewportPosition: TPointF;
  const ContentSizeChanged: Boolean);
var
    item: TListBoxItem;
begin
    if (lbProdutos.Items.Count >= TAM_PAGINA) and (lbProdutos.Tag >= 0) then
    begin
        // Captura o item que está "entrando" na tela...
        item := lbProdutos.ItemByPoint(30, lbProdutos.Height - 40);

        if (item <> nil) then
            if item.Index >= lbProdutos.Items.Count - 5 then // Se chegou nos ultimos x itens da lista...
                ListarProdutos(lbProdutos.Tag + 1, false);
    end;
end;

end.
