unit untDashBoardSCHOOL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniLabel, uniPanel, uniGUIBaseClasses, uniScrollBox, uniHTMLFrame;

type
  TfrmDashboardSCHOOL = class(TUniFrame)
    sboxSchool: TUniScrollBox;
    rcBlock30: TUniContainerPanel;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    rcBlock25: TUniContainerPanel;
    UniLabel6: TUniLabel;
    UniLabel7: TUniLabel;
    rcBlock35: TUniContainerPanel;
    UniLabel9: TUniLabel;
    UniLabel10: TUniLabel;
    rcBlock40: TUniContainerPanel;
    UniLabel12: TUniLabel;
    UniLabel13: TUniLabel;
    UniContainerPanel1: TUniContainerPanel;
    UniLabel5: TUniLabel;
    UniContainerPanel2: TUniContainerPanel;
    UniLabel21: TUniLabel;
    UniContainerPanel3: TUniContainerPanel;
    UniLabel1: TUniLabel;
    UniContainerPanel4: TUniContainerPanel;
    UniLabel8: TUniLabel;
    UniLabel11: TUniLabel;
    UniLabel22: TUniLabel;
    UniContainerPanel5: TUniContainerPanel;
    UniLabel23: TUniLabel;
    UniLabel24: TUniLabel;
    UniSimplePanel1: TUniSimplePanel;
    UniLabel25: TUniLabel;
    UniLabel26: TUniLabel;
    UniSimplePanel2: TUniSimplePanel;
    UniLabel27: TUniLabel;
    UniLabel28: TUniLabel;
    UniSimplePanel3: TUniSimplePanel;
    UniLabel29: TUniLabel;
    UniLabel30: TUniLabel;
    UniSimplePanel4: TUniSimplePanel;
    UniContainerPanel6: TUniContainerPanel;
    UniLabel31: TUniLabel;
    UniContainerPanel7: TUniContainerPanel;
    UniLabel32: TUniLabel;
    UniContainerPanel8: TUniContainerPanel;
    UniLabel33: TUniLabel;
    rcBlock80: TUniContainerPanel;
    rcBlock85: TUniContainerPanel;
    UniLabel2: TUniLabel;
    labRcCollapse60: TUniLabel;
    rcBlock90: TUniContainerPanel;
    rcBlock50: TUniContainerPanel;
    rcBlock70: TUniContainerPanel;
    htmlDoughnut1: TUniHTMLFrame;
    rcBlock60: TUniContainerPanel;
    UniLabel14: TUniLabel;
    UniLabel15: TUniLabel;
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

uses mkm_layout, untDM_RC, mkm_graphs, MainModule, mkm_createcomponents, uconsts, mkm_func_web, str_func;

procedure TfrmDashboardSCHOOL.rc_UpdateCharts;
var
   w, i, c : integer;
   oPg, oBlock, oBlock2 : TUniContainerPanel;
   oLabel : TUniLabel;
   aTeachers, aCourse, aPercent : Array [1..5] of string;
begin
    // melhores professores
    if mm.CONFIG_DATABASE_FIREDAC = 'FIREBIRD' then
       dm_rc.sqlDS.SQL.Text := 'select FIRST 5 * from tb_graphs'
    else
    if mm.CONFIG_DATABASE_FIREDAC = 'SQLSERVER' then
       dm_rc.sqlDS.SQL.Text := 'select TOP 5 * from tb_graphs'
    else
       dm_rc.sqlDS.SQL.Text := 'select * from tb_graphs LIMIT 5 ';

    htmlDoughnut1.HTML.Text := rc_GraphPieDoughnut( dm_rc.sqlDS,
                                                   'bestteachers',
                                                   '2021',
                                                    gtDOUGHNUT, gcGreens, false, true, false, 1, false );


    aTeachers [1] := 'José';
    aTeachers [2] := 'Carlos';
    aTeachers [3] := 'Rodrigo';
    aTeachers [4] := 'Oliveira';
    aTeachers [5] := 'Felipe';
    aCourse [1] := 'Administração';
    aCourse [2] := 'Medicina';
    aCourse [3] := 'Direito';
    aCourse [4] := 'Odontologia';
    aCourse [5] := 'Pedagogia';
    aPercent [1] := '100%';
    aPercent [2] := '89%';
    aPercent [3] := '80%';
    aPercent [4] := '76%';
    aPercent [5] := '62%';
    dm_rc.memTemp.Close;
    dm_rc.memTemp.filtered := false;
    // v. 3.2.0.0
    dm_rc.memTemp.Data := dm_rc.rc_GetRecord( mm.varB_Use_FireDac ,
                                   True,
                                   ' select codigo,nome,avatar ' +
                                   ' from usuarios ' +
                                   ' order by codigo' );

    if mm.varC_LastErrorMsg <> '' then
    begin
        dm_rc.rc_ShowSweetAlert( mm.MSG_ERROR, mm.varC_LastErrorMsg, 'error' );
        Exit;
    end;
    // criar legendas
    //[PT] não encontrei uma forma de manipular facilmente as legendas do Chart.JS para se adaptarem melhor a tela
    //     dessa forma, poderemos criar as legendas e o layout ficará mais agradável e responsivo
    //[EN] I didn't find a way to easily manipulate the Chart.JS captions to better adapt to the screen
    //     this way we can create the subtitles and the layout will be nicer and more responsive
    oBlock2 := rc_CreateBlock( Self, rcBlock50, 65 , 8, htmlDoughnut1.Height, '[[cols:xs-12 sm-12 md-4|max-height:112]]' );
    i := 0;
    dm_rc.sqlDS.First;
    while not dm_rc.sqlDS.Eof do
    begin
         inc( i );
         oBlock := rc_CreateContainer( Self, oBlock2, 'legendsBestTeachers' + i.ToString, 14, 14 , 6, ( ( i-1 ) * 20 ), '[[round:all]]' );
         oBlock.Color :=  rc_HtmlToColor( ARRAY_COLORS4[ ( Length( ARRAY_COLORS4 ) -1 ) - i] );// ARRAY_COLORS4[i] );

         oLabel := rc_CreateLabel( Self, oBlock2, 'teacher' + i.ToString, 70, 14, oBlock.Left + 18, oBlock.Top - 1, '' ); //80 - ( i * 80 )
         oLabel.TextConversion :=  txtHTML;
         oLabel.Caption := '<strong>' + aTeachers[ i ] + '</strong>' + ' [' + dm_rc.sqlDS.FieldByName( 'serie').AsString + ']';//dm_rc.memTemp.FieldByName('nome').AsString; ;

         dm_rc.sqlDS.Next;
    end;
    dm_rc.sqlDS.Close;

    i := 100;
    c := 0;
    rc_ClearBlocks( Self, 1, dm_rc.memTemp.RecordCount );
    dm_rc.memTemp.First;
    while not dm_rc.memTemp.eof do
    begin
         Inc(i);
         Inc(c);
         //oBlock := rc_CreateBlock( Self, rcBlock70, i, 100, 48, '[[cols:12|cls:rc-shadow-hover ]]' );
           //rc_CreateContainer( Self, oBlock, 'progress' + i.ToString, 100, 30, 5, 5, '[[cls:card-info-box-white]]' );
           //oBlock := rc_CreateBlock( Self, rcBlock50, i , 100, 60, '[[cols:12|cls:card-info-box-white]]' );
           //avatar
           oBlock2 := rc_CreateBlock( Self, rcBlock90, i, 100, 48, '[[cols:6|noborder-top|noborder-bottom]]' );
           //oBlock2.Color := clSkyBlue;
             oLabel := rc_CreateLabel( Self, oBlock2, 'avatar' + i.ToString, 100, 30, 0, 0, '' ); //80 - ( i * 80 )
             oLabel.TextConversion :=  txtHTML;
             oLabel.Caption := '<img id="userimg" class="mini-avatar img-thumbnail" src="uploads/usuarios/' + ExtractFileName( dm_rc.memTemp.FieldByName('avatar').AsString ) + '" alt="User Img">';
           //name
           //Inc(i);
           //oBlock2 := rc_CreateBlock( Self, rcBlock90, i, 100, 45, '[[cols:4]]' );
             oLabel := rc_CreateLabel( Self, oBlock2, 'name' + i.ToString, 100, 30, 54, 2, '' ); //80 - ( i * 80 )
             oLabel.TextConversion :=  txtHTML;
             oLabel.Anchors        := [akLeft, akRight];
             oLabel.Font.Size      := 12;
             oLabel.Font.Style     := [fsBold];
             oLabel.Caption := dm_rc.memTemp.FieldByName('nome').AsString ;
           //name
             oLabel := rc_CreateLabel( Self, oBlock2, 'course' + i.ToString, 100, 30, 54, 24, '' ); //80 - ( i * 80 )
             oLabel.TextConversion :=  txtHTML;
             oLabel.Caption := aCourse[ c ] ;
           //progress bg
           Inc(i);
           oBlock2 := rc_CreateBlock( Self, rcBlock90, i, 100, 48, '[[cols:4|noborder-top|noborder-bottom|]]' );
           //oBlock2.Color := clSkyBlue;
             oPg := rc_CreateContainer( Self, oBlock2, 'pgbg_' + i.ToString, 100, 8, 0, 22, '[[round:all]]' );
             oPg.Color := clSilver;
             oPg.Anchors := [ akLeft ];//, akRight ];
             //progress bar
             //Randomize;
             oPg := rc_CreateContainer( Self, oBlock2, 'pgbar_' + i.ToString, StrToInt( ReturnNumbers( aPercent[ c ] ) ) , 8, 0, 22, '[[round:all]]' );
             oPg.Color := clGreen;
             oPg.Anchors := [ akLeft];//, akRight ];
           //badge percentage
           Inc(i);
           oBlock2 := rc_CreateBlock( Self, rcBlock90, i, 40, 48, '[[cols:2|noborder-top|noborder-bottom|]]' );
           //oBlock2.Color := clred;
             oPg := rc_CreateContainer( Self, oBlock2, 'pgbadge_' + i.ToString, 40, 20, 0, 13, '[[center:parent y|round:all]]' );
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
               //oLabel.Alignment := taRightJustify;
               //oLabel.Anchors   := [ akLeft,akRight ];

         dm_rc.memTemp.next;
    end;

    oBlock2 := rc_CreateBlock( Self, sboxSchool, i + 1000, 100, 2, '[[cols:12]]' );

    rc_RenderLayout( Self, false, true );
    dm_rc.rc_ResizeBlocks( Self, true, true );
end;

procedure TfrmDashboardSCHOOL.UniFrameCreate(Sender: TObject);
begin
    rc_RenderLayout( Self, false, false );
end;

procedure TfrmDashboardSCHOOL.UniFrameReady(Sender: TObject);
begin
     dm_rc.rc_ApplyEditMasks( Self );
     dm_rc.rc_ResizeBlocks( Self, true, true );
     rc_UpdateCharts;
end;

Initialization
   RegisterClass( TfrmDashboardSCHOOL );

end.
