unit untDashBoardCRM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniLabel, uniPanel, uniGUIBaseClasses, uniScrollBox, uniHTMLFrame;

type
  TfrmDashboardCRM = class(TUniFrame)
    sboxGridBlock: TUniScrollBox;
    sboxCRM: TUniScrollBox;
    rcBlock300: TUniContainerPanel;
    rcBlock50: TUniContainerPanel;
    htmlCompletedTasks: TUniHTMLFrame;
    rcBlock55: TUniContainerPanel;
    htmlPendingTasks: TUniHTMLFrame;
    rcBlock60: TUniContainerPanel;
    htmlAverageTimeTasks: TUniHTMLFrame;
    rcBlock45: TUniContainerPanel;
    htmlOpenTasks: TUniHTMLFrame;
    rcBlock80: TUniContainerPanel;
    htmlDoughnut1: TUniHTMLFrame;
    rcBlock90: TUniContainerPanel;
    rcBlock100: TUniContainerPanel;
    htmlDoughnut2: TUniHTMLFrame;
    rcBlock85: TUniContainerPanel;
    UniLabel2: TUniLabel;
    labRcCollapse60: TUniLabel;
    rcBlock110: TUniContainerPanel;
    htmlDoughnut3: TUniHTMLFrame;
    rcBlock120: TUniContainerPanel;
    htmlDoughnut4: TUniHTMLFrame;
    rcBlock47: TUniContainerPanel;
    UniLabel15: TUniLabel;
    UniLabel16: TUniLabel;
    rcBlock52: TUniContainerPanel;
    UniLabel15Clone: TUniLabel;
    UniLabel16Clone: TUniLabel;
    rcBlock56: TUniContainerPanel;
    UniLabel17: TUniLabel;
    UniLabel18: TUniLabel;
    rcBlock62: TUniContainerPanel;
    UniLabel19: TUniLabel;
    UniLabel20: TUniLabel;
    rcBlock160: TUniContainerPanel;
    rcBlock170: TUniContainerPanel;
    UniLabel2Clone: TUniLabel;
    labRcCollapse60Clone: TUniLabel;
    rcBlock180: TUniContainerPanel;
    procedure UniFrameCreate(Sender: TObject);
    procedure UniFrameReady(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure rc_UpdateCharts;
  end;

implementation

{$R *.dfm}

uses mkm_layout, untDM_RC, MainModule, mkm_graphs, uconsts, mkm_createcomponents, mkm_func_web;

procedure TfrmDashboardCRM.rc_UpdateCharts;
var
   w, i, c : integer;
   oPg, oBlock, oBlock2 : TUniContainerPanel;
   oLabel : TUniLabel;
   aColors, aTask, aPercent : Array [1..5] of string;
begin
    // tarefas PENDENTES
    htmlOpenTasks.HTML.Text        := rc_GraphCircleGauge( 'Open Task', 'opentsk', 7, 0, 12, 1, 500, COLOR_GREEN, COLOR_HOVER_SILVER, False, True );
    // tarefas CONCLUIDAS
    htmlCompletedTasks.HTML.Text   := rc_GraphCircleGauge( 'Complete Task', 'completetsk', 5, 0, 12, 0.6, 600, COLOR_BLUE, COLOR_HOVER_SILVER );
    // tarefas PENDENTES
    htmlPendingTasks.HTML.Text     := rc_GraphCircleGauge( 'Pending Task', 'pendtsk', 7, 0, 12, 0.6, 300, COLOR_ORANGE, COLOR_HOVER_SILVER );
    // tarefas TEMPO EXPIRADO
    htmlAverageTimeTasks.HTML.Text := rc_GraphCircleGauge( 'Expired Task', 'exptsk', 6, 0, 12, 0.6, 900, COLOR_RED, COLOR_HOVER_SILVER );

    // 1o trimestre
    if mm.CONFIG_DATABASE_FIREDAC = 'FIREBIRD' then
       dm_rc.sqlDS.SQL.Text := 'select FIRST 3 * from tb_graphs'
    else
    if mm.CONFIG_DATABASE_FIREDAC = 'SQLSERVER' then
       dm_rc.sqlDS.SQL.Text := 'select TOP 3 * from tb_graphs'
    else
       dm_rc.sqlDS.SQL.Text := 'select * from tb_graphs LIMIT 3';

    htmlDoughnut1.HTML.Text := rc_GraphPieDoughnut( dm_rc.sqlDS,
                                                   'projects1',
                                                   '1o. Trimestre',
                                                    gtDOUGHNUT, gcGreens ,false, true, false, 2, false );

    //[PT] não encontrei uma forma de manipular facilmente as legendas do Chart.JS para se adaptarem melhor a tela
    //     dessa forma, poderemos criar as legendas e o layout ficará mais agradável e responsivo
    //[EN] I didn't find a way to easily manipulate the Chart.JS captions to better adapt to the screen
    //     this way we can create the subtitles and the layout will be nicer and more responsive
    oBlock2 := rc_CreateContainer( Self, rcBlock90, 'blklegProj' , htmlDoughnut1.Width, 28, htmlDoughnut1.Left, htmlDoughnut1.top + htmlDoughnut1.Height + 4, '[[cols:xs-12 sm-12 md-2|max-height:112|center:parent x]]' );
    i := 0;
    dm_rc.sqlDS.First;
    while not dm_rc.sqlDS.Eof do
    begin
         inc( i );
         oBlock := rc_CreateContainer( Self, oBlock2, 'legendsProj' + i.ToString, 14, 14 , ( ( i-1 ) * 51 ), 2, '[[round:all]]' );
         oBlock.Color :=  rc_HtmlToColor( ARRAY_COLORS4[ ( Length( ARRAY_COLORS4 ) -1 ) - i] );// ARRAY_COLORS4[i] );

         oLabel := rc_CreateLabel( Self, oBlock2, 'proj' + i.ToString, 50, 14, oBlock.Left + 18, oBlock.Top - 1, '' ); //80 - ( i * 80 )
         oLabel.TextConversion :=  txtHTML;
         oLabel.Caption := dm_rc.sqlDS.FieldByName( 'serie').AsString ;

         dm_rc.sqlDS.Next;
    end;
    dm_rc.sqlDS.Close;

    // 2o trimestre
    if mm.CONFIG_DATABASE_FIREDAC = 'FIREBIRD' then
       dm_rc.sqlDS.SQL.Text := 'select FIRST 3 SKIP 3 * from tb_graphs '
    else
    if mm.CONFIG_DATABASE_FIREDAC = 'SQLSERVER' then
       dm_rc.sqlDS.SQL.Text := 'select TOP 3 * from tb_graphs OFFSET 3'
    else
       dm_rc.sqlDS.SQL.Text := 'select * from tb_graphs LIMIT 3 OFFSET 3';

    htmlDoughnut2.HTML.Text := rc_GraphPieDoughnut( dm_rc.sqlDS,
                                                   'projects2',
                                                   '2o. Trimestre',
                                                    gtDOUGHNUT, gcGreens,false, true, false, 2, false );

    //[PT] não encontrei uma forma de manipular facilmente as legendas do Chart.JS para se adaptarem melhor a tela
    //     dessa forma, poderemos criar as legendas e o layout ficará mais agradável e responsivo
    //[EN] I didn't find a way to easily manipulate the Chart.JS captions to better adapt to the screen
    //     this way we can create the subtitles and the layout will be nicer and more responsive
    oBlock2 := rc_CreateContainer( Self, rcBlock100, 'blklegProj2' , htmlDoughnut2.Width, 28, htmlDoughnut2.Left, htmlDoughnut2.top + htmlDoughnut1.Height + 4, '[[cols:xs-12 sm-12 md-2|max-height:112|center:parent x]]' );
    i := 0;
    dm_rc.sqlDS.First;
    while not dm_rc.sqlDS.Eof do
    begin
         inc( i );
         oBlock := rc_CreateContainer( Self, oBlock2, 'legendsProj2' + i.ToString, 14, 14 , ( ( i-1 ) * 51 ), 2, '[[round:all]]' );
         oBlock.Color :=  rc_HtmlToColor( ARRAY_COLORS4[ ( Length( ARRAY_COLORS4 ) -1 ) - i] );// ARRAY_COLORS4[i] );

         oLabel := rc_CreateLabel( Self, oBlock2, 'proj2' + i.ToString, 50, 14, oBlock.Left + 18, oBlock.Top - 1, '' ); //80 - ( i * 80 )
         oLabel.TextConversion :=  txtHTML;
         oLabel.Caption := dm_rc.sqlDS.FieldByName( 'serie').AsString ;

         dm_rc.sqlDS.Next;
    end;
    dm_rc.sqlDS.Close;

    // 3o trimestre
    if mm.CONFIG_DATABASE_FIREDAC = 'FIREBIRD' then
       dm_rc.sqlDS.SQL.Text := 'select FIRST 3 SKIP 6 * from tb_graphs '
    else
    if mm.CONFIG_DATABASE_FIREDAC = 'SQLSERVER' then
       dm_rc.sqlDS.SQL.Text := 'select TOP 3 * from tb_graphs OFFSET 6'
    else
       dm_rc.sqlDS.SQL.Text := 'select * from tb_graphs LIMIT 3 OFFSET 6';

    htmlDoughnut3.HTML.Text := rc_GraphPieDoughnut( dm_rc.sqlDS,
                                                   'projects3',
                                                   '3o. Trimestre',
                                                    gtDOUGHNUT, gcGreens,false, true, false, 2, false );

    //[PT] não encontrei uma forma de manipular facilmente as legendas do Chart.JS para se adaptarem melhor a tela
    //     dessa forma, poderemos criar as legendas e o layout ficará mais agradável e responsivo
    //[EN] I didn't find a way to easily manipulate the Chart.JS captions to better adapt to the screen
    //     this way we can create the subtitles and the layout will be nicer and more responsive
    oBlock2 := rc_CreateContainer( Self, rcBlock110, 'blklegProj3' , htmlDoughnut3.Width, 28, htmlDoughnut3.Left, htmlDoughnut3.top + htmlDoughnut1.Height + 4, '[[cols:xs-12 sm-12 md-2|max-height:112|center:parent x]]' );
    i := 0;
    dm_rc.sqlDS.First;
    while not dm_rc.sqlDS.Eof do
    begin
         inc( i );
         oBlock := rc_CreateContainer( Self, oBlock2, 'legendsProj3' + i.ToString, 14, 14 , ( ( i-1 ) * 51 ), 2, '[[round:all]]' );
         oBlock.Color :=  rc_HtmlToColor( ARRAY_COLORS4[ ( Length( ARRAY_COLORS4 ) -1 ) - i] );// ARRAY_COLORS4[i] );

         oLabel := rc_CreateLabel( Self, oBlock2, 'proj3' + i.ToString, 50, 14, oBlock.Left + 18, oBlock.Top - 1, '' ); //80 - ( i * 80 )
         oLabel.TextConversion :=  txtHTML;
         oLabel.Caption := dm_rc.sqlDS.FieldByName( 'serie').AsString ;

         dm_rc.sqlDS.Next;
    end;
    dm_rc.sqlDS.Close;

    // 4o trimestre
    if mm.CONFIG_DATABASE_FIREDAC = 'FIREBIRD' then
       dm_rc.sqlDS.SQL.Text := 'select FIRST 3 SKIP 9 * from tb_graphs '
    else
    if mm.CONFIG_DATABASE_FIREDAC = 'SQLSERVER' then
       dm_rc.sqlDS.SQL.Text := 'select TOP 3 * from tb_graphs OFFSET 9'
    else
       dm_rc.sqlDS.SQL.Text := 'select * from tb_graphs LIMIT 3 OFFSET 9';

    htmlDoughnut4.HTML.Text := rc_GraphPieDoughnut( dm_rc.sqlDS,
                                                   'projects4',
                                                   '4o. Trimestre',
                                                    gtDOUGHNUT, gcGreens,false, true, false, 2, false );

    //[PT] não encontrei uma forma de manipular facilmente as legendas do Chart.JS para se adaptarem melhor a tela
    //     dessa forma, poderemos criar as legendas e o layout ficará mais agradável e responsivo
    //[EN] I didn't find a way to easily manipulate the Chart.JS captions to better adapt to the screen
    //     this way we can create the subtitles and the layout will be nicer and more responsive
    oBlock2 := rc_CreateContainer( Self, rcBlock120, 'blklegProj4' , htmlDoughnut4.Width, 28, htmlDoughnut4.Left, htmlDoughnut4.top + htmlDoughnut1.Height + 4, '[[cols:xs-12 sm-12 md-2|max-height:112|center:parent x]]' );
    i := 0;
    dm_rc.sqlDS.First;
    while not dm_rc.sqlDS.Eof do
    begin
         inc( i );
         oBlock := rc_CreateContainer( Self, oBlock2, 'legendsProj4' + i.ToString, 14, 14 , ( ( i-1 ) * 51 ), 2, '[[round:all]]' );
         oBlock.Color :=  rc_HtmlToColor( ARRAY_COLORS4[ ( Length( ARRAY_COLORS4 ) -1 ) - i] );// ARRAY_COLORS4[i] );

         oLabel := rc_CreateLabel( Self, oBlock2, 'proj4' + i.ToString, 50, 14, oBlock.Left + 18, oBlock.Top - 1, '' ); //80 - ( i * 80 )
         oLabel.TextConversion :=  txtHTML;
         oLabel.Caption := dm_rc.sqlDS.FieldByName( 'serie').AsString ;

         dm_rc.sqlDS.Next;
    end;
    dm_rc.sqlDS.Close;

    // project RadPOS
    aTask [1]    := 'Prototype';
    aTask [2]    := 'Design';
    aTask [3]    := 'Development';
    aPercent [1] := '100%';
    aPercent [2] := '69%';
    aPercent [3] := '45%';
    aColors[1] := 'clBlue';
    aColors[2] := 'clGreen';
    aColors[3] := 'clRed';
    i := 180;
    c := 0;
    //rc_ClearBlocks( Self, 1, dm_rc.memTemp.RecordCount );
    //dm_rc.memTemp.First;
    //while not dm_rc.memTemp.eof do
    for c := 1 to 3 do
    begin
         Inc(i);
         //Inc(c);
           //avatar
           oBlock2 := rc_CreateBlock( Self, rcBlock180, i, 100, 48, '[[cols:5|noborder-top|noborder-bottom]]' );
//             oLabel := rc_CreateLabel( Self, oBlock2, 'avatar' + i.ToString, 100, 30, 0, 0, '' ); //80 - ( i * 80 )
//             oLabel.TextConversion :=  txtHTML;
//             oLabel.Caption := '<img id="userimg" class="mini-avatar img-thumbnail" src="uploads/usuarios/' + ExtractFileName( dm_rc.memTemp.FieldByName('avatar').AsString ) + '" alt="User Img">';

             oLabel := rc_CreateLabel( Self, oBlock2, 'name' + i.ToString, 100, 30, 0, 2, '' ); //80 - ( i * 80 )
             oLabel.TextConversion :=  txtHTML;
             oLabel.Font.Size      := 12;
             oLabel.Font.Style     := [fsBold];
             oLabel.Caption := aTask[ c ] ;
           //progress bg
           Inc(i);
           oBlock2 := rc_CreateBlock( Self, rcBlock180, i, 100, 48, '[[cols:5|noborder-top|noborder-bottom|]]' );
             oPg := rc_CreateContainer( Self, oBlock2, 'pgbg_' + i.ToString, 100, 8, 0, 8, '[[round:all]]' );
             oPg.Color := clSilver;
             oPg.Anchors := [ akLeft ];//, akRight ];
             //progress bar
             oPg := rc_CreateContainer( Self, oBlock2, 'pgbar_' + i.ToString, StrToInt( ReturnNumbers( aPercent[ c ] ) ) , 8, 0, 8, '[[round:all]]' );
             oPg.Color := StringToColor( aColors[c] );//clGreen;
             oPg.Anchors := [ akLeft];//, akRight ];
           //badge percentage
           Inc(i);
           oBlock2 := rc_CreateBlock( Self, rcBlock180, i, 40, 48, '[[cols:2|noborder-top|noborder-bottom|]]' );
             oPg := rc_CreateContainer( Self, oBlock2, 'pgbadge_' + i.ToString, 40, 20, 0, 2, '[[round:all]]' );
             oPg.Color := clMoneyGreen;// rc_HtmlToColor ( ARRAY_COLORS4[1] );
             oPg.Anchors := [ akRight ];
               // [PT] infelizmente não consegui centralizar o label da porcentagem da maneira "correta". A única forma que funcionou foi analisando o conteudo do percentual
               // [EN] unfortunately I couldn't center the percentage label in the "correct" way. The only way that worked was by analyzing the content of the percentage
               if aPercent[ c ] = '100%' then
                  w := 30
               else
                  w := 24;
               oLabel := rc_CreateLabel( Self, oPg, 'percent' + i.ToString, w, 14, 4, 2, '[[center:parent x]]' ); //|cls:rc-label-clear align-label-right   rc-badge-inverse-success rc-badge-inverse-percent align-label-right-center
               oLabel.TextConversion :=  txtHTML;
               oLabel.Caption   :=  aPercent[ c ] ;
               oLabel.Font.Color := clGreen;
    end;

    rc_RenderLayout( Self, false, true );
    dm_rc.rc_ResizeBlocks( Self, true, true );
end;

procedure TfrmDashboardCRM.UniFrameCreate(Sender: TObject);
begin
    rc_RenderLayout( Self, false, false );
end;

procedure TfrmDashboardCRM.UniFrameReady(Sender: TObject);
begin
     dm_rc.rc_ApplyEditMasks( Self );
     dm_rc.rc_ResizeBlocks( Self, true, true );
     rc_UpdateCharts;
end;

Initialization
   RegisterClass( TfrmDashboardCRM );

end.
