unit untDashBoardHOSPITAL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses, uniGUIApplication,
  uniGUIClasses, uniGUIFrame, uniLabel, uniPanel, uniGUIBaseClasses, uniScrollBox, uniHTMLFrame;

type
  TfrmDashboardHOSPITAL = class(TUniFrame)
    sboxHospital: TUniScrollBox;
    rcBlock30: TUniContainerPanel;
    UniLabel1: TUniLabel;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    rcBlock25: TUniContainerPanel;
    UniLabel6: TUniLabel;
    UniLabel7: TUniLabel;
    UniLabel8: TUniLabel;
    rcBlock35: TUniContainerPanel;
    UniLabel9: TUniLabel;
    UniLabel10: TUniLabel;
    UniLabel11: TUniLabel;
    rcBlock40: TUniContainerPanel;
    UniLabel12: TUniLabel;
    UniLabel13: TUniLabel;
    UniLabel14: TUniLabel;
    rcBlock50: TUniContainerPanel;
    rcBlock70: TUniContainerPanel;
    rcBlock80: TUniContainerPanel;
    rcBlock90: TUniContainerPanel;
    rcBlock100: TUniContainerPanel;
    labToday: TUniLabel;
    UniLabel15: TUniLabel;
    UniLabel16: TUniLabel;
    labThisWeek: TUniLabel;
    UniLabel18: TUniLabel;
    labThisMonth: TUniLabel;
    UniLabel20: TUniLabel;
    labThisYear: TUniLabel;
    rcBlock60: TUniContainerPanel;
    UniLabel2: TUniLabel;
    labRcCollapse60: TUniLabel;
    rcBlock110: TUniContainerPanel;
    htmlChartHospital: TUniHTMLFrame;
    rcBlock120: TUniContainerPanel;
    rcBlock130: TUniContainerPanel;
    UniLabel2Clone: TUniLabel;
    labRcCollapse60Clone: TUniLabel;
    rcBlock140: TUniContainerPanel;
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

uses mkm_layout, untDM_RC, mkm_graphs, MainModule, mkm_createcomponents, mkm_func_web;

procedure TfrmDashboardHOSPITAL.rc_UpdateCharts;
var
   w, i, c : integer;
   oPg, oBlock, oBlock2 : TUniContainerPanel;
   oLabel : TUniLabel;
   aSpecialty, aPercent : Array [1..5] of string;
begin
    dm_rc.sqlDS.SQL.Text := 'select * from tb_graphs';

    htmlChartHospital.HTML.Text := rc_GraphBars(
                                   dm_rc.sqlDS,
                                   'hospital_ps',
                                   'Produtos;Serviços');


    aSpecialty [1] := 'Cardiologista';
    aSpecialty [2] := 'Endocrinologista';
    aSpecialty [3] := 'Fonoaudiólogo';
    aSpecialty [4] := 'Pneumologista';
    aSpecialty [5] := 'Pediátra';
    aPercent [1] := '9.2';
    aPercent [2] := '8.7';
    aPercent [3] := '7.9';
    aPercent [4] := '7.3';
    aPercent [5] := '7.0';
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
    i := 140;
    c := 0;
    rc_ClearBlocks( Self, nil, 1, dm_rc.memTemp.RecordCount );// v. 4.1.0.0
    while not dm_rc.memTemp.eof do
    begin
         Inc(i);
         Inc(c);
         //oBlock := rc_CreateBlock( Self, rcBlock70, i, 100, 45, '[[cols:12|cls:card-info-box-white]]' );
           //rc_CreateContainer( Self, oBlock, 'progress' + i.ToString, 100, 30, 5, 5, '[[cls:card-info-box-white]]' );
           //oBlock := rc_CreateBlock( Self, rcBlock50, i , 100, 60, '[[cols:12|cls:card-info-box-white]]' );
           //avatar
           oBlock2 := rc_CreateBlock( Self, rcBlock140, i, 100, 48, '[[cols:6|noborder-top|noborder-bottom]]' );
           //oBlock2.Color := clSkyBlue;
             oLabel := rc_CreateLabel( Self, oBlock2, 'avatar' + i.ToString, 100, 30, 0, 0, '' ); //80 - ( i * 80 )
             oLabel.TextConversion :=  txtHTML;
             oLabel.Caption := '<img id="userimg" class="mini-avatar img-thumbnail" src="uploads/usuarios/' + ExtractFileName( dm_rc.memTemp.FieldByName('avatar').AsString ) + '" alt="User Img">';
           //name
           //Inc(i);
           //oBlock2 := rc_CreateBlock( Self, rcBlock70, i, 100, 45, '[[cols:4]]' );
             oLabel := rc_CreateLabel( Self, oBlock2, 'name' + i.ToString, 100, 30, 50, 12, '' ); //80 - ( i * 80 )
             oLabel.TextConversion :=  txtHTML;
             oLabel.Anchors        := [akLeft, akRight];
             oLabel.Font.Size      := 12;
             oLabel.Font.Style     := [fsBold];
             oLabel.Caption := 'Dr. ' + dm_rc.memTemp.FieldByName('nome').AsString ;
           //name
//             oLabel := rc_CreateLabel( Self, oBlock2, 'course' + i.ToString, 100, 30, 60, 24, '' ); //80 - ( i * 80 )
//             oLabel.TextConversion :=  txtHTML;
//             oLabel.Caption := aSpecialty[ c ] ;
           //progress bg
           Inc(i);
           oBlock2 := rc_CreateBlock( Self, rcBlock140, i, 100, 48, '[[cols:4|noborder-top|noborder-bottom|]]' );
             oLabel := rc_CreateLabel( Self, oBlock2, 'spec' + i.ToString, 100, 30, 6, 12, '' ); //80 - ( i * 80 )
             oLabel.TextConversion :=  txtHTML;
             oLabel.Anchors        := [akLeft, akRight];
             oLabel.Caption := aSpecialty[ c ] ;
           //oBlock2.Color := clSkyBlue;
//             oPg := rc_CreateContainer( Self, oBlock2, 'pgbg_' + i.ToString, 100, 8, 0, 22, '[[round:all]]' );
//             oPg.Color := clSilver;
//             oPg.Anchors := [ akLeft ];//, akRight ];
//             //progress bar
//             //Randomize;
//             oPg := rc_CreateContainer( Self, oBlock2, 'pgbar_' + i.ToString, StrToInt( ReturnNumbers( aPercent[ c ] ) ) , 8, 0, 22, '[[round:all]]' );
//             oPg.Color := clGreen;
//             oPg.Anchors := [ akLeft];//, akRight ];
           //badge percentage
           Inc(i);
           oBlock2 := rc_CreateBlock( Self, rcBlock140, i, 40, 48, '[[cols:2|noborder-top|noborder-bottom|]]' );
           //oBlock2.Color := clred;
             oPg := rc_CreateContainer( Self, oBlock2, 'pgbadge_' + i.ToString, 35, 20, 0, 13, '[[center:parent y|round:all]]' );
             oPg.Color := clSkyBlue;// rc_HtmlToColor ( ARRAY_COLORS4[1] );
             oPg.Anchors := [ akRight ];
               // [PT] infelizmente não consegui centralizar o label da porcentagem da maneira "correta". A única forma que funcionou foi analisando o conteudo do percentual
               // [EN] unfortunately I couldn't center the percentage label in the "correct" way. The only way that worked was by analyzing the content of the percentage
               w := 16;
               oLabel := rc_CreateLabel( Self, oPg, 'percent' + i.ToString, w, 14, 4, 2, '[[center:parent x]]' ); //|cls:rc-label-clear align-label-right   rc-badge-inverse-success rc-badge-inverse-percent align-label-right-center
               oLabel.TextConversion :=  txtHTML;
               oLabel.Caption   :=  aPercent[ c ] ;
               oLabel.Font.Color := clBlue;
               //oLabel.Alignment := taRightJustify;
               //oLabel.Anchors   := [ akLeft,akRight ];

         dm_rc.memTemp.next;
    end;

    oBlock2 := rc_CreateBlock( Self, sboxHospital, i + 1000, 100, 2, '[[cols:12]]' );

    rc_RenderLayout( Self, false, true );
    dm_rc.rc_ResizeBlocks( Self, true, true );
end;

procedure TfrmDashboardHOSPITAL.UniFrameCreate(Sender: TObject);
begin
    labToday.Caption     := PFmtSettings.CurrencyString + ' 43.454,00';
    labThisWeek.Caption  := PFmtSettings.CurrencyString + ' 232.154,00';
    labThisMonth.Caption := PFmtSettings.CurrencyString + ' 1.343.632,00';
    labThisYear.Caption  := PFmtSettings.CurrencyString + ' 19.343.864,00';
    rc_RenderLayout( Self, false, false );
end;

procedure TfrmDashboardHOSPITAL.UniFrameReady(Sender: TObject);
begin
     dm_rc.rc_ApplyEditMasks( Self );
     dm_rc.rc_ResizeBlocks( Self, true, true );
     rc_UpdateCharts;
end;

Initialization
   RegisterClass( TfrmDashboardHOSPITAL );

end.
