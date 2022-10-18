unit mkm_graphs; // v. 4.0.0.0


interface

uses
    System.SysUtils, System.Classes ,       System.TypInfo, JSON, DBXJSON, DBXJSONReflect, // v. 4.0.0.0
    System.DateUtils, math, System.Rtti, System.StrUtils, Vcl.Graphics,
    UniGuiClasses, uconsts ,
    Data.DB;

// Graphics and Gauges
// para servir de modelo
function rc_GraphDefaultStyle( pId:string ):string;
function rc_GraphCircleGauge( pLabel: string ; pId: string;
                              pValue: integer ; pMin: integer; pMax: integer; pWidthScale: double; pTimeAnim: integer ;
                              pLevelColor : TColor = COLOR_GREEN;
                              pGaugeColor : TColor = COLOR_HOVER_SILVER;
                              pDonut: boolean = true; pPointer : boolean = false;
                              pTitle: string = '' ): string;
// v. 4.0.0.0
// ApexChart Lines
// passar um dataset com os campos SERIE, VALUE1 e VALUE2...
function rc_ApexChartGraphLines( pDataSet: TDataset;
                                 pID, pNAME, pTITLE, pSUBTITLE, pValuesLabel: string;
                                 pStacked: boolean = false; pyAxes: boolean = true; pxAxes: boolean = false;
                                 pbackgroundColor1  : TColor = COLOR_BLUE;
                                 pborderColor1      : TColor = COLOR_BLUEDARK;
                                 ppointStrokeColor1 : TColor = COLOR_BLUEDARK;
                                 pbackgroundColor2  : TColor = COLOR_ORANGE;
                                 pborderColor2      : TColor = COLOR_ORANGEDARK;
                                 ppointStrokeColor2 : TColor = COLOR_ORANGEDARK ): string;

// barras
// passar um dataset com os campos SERIE, VALUE1 e VALUE2...
function rc_GraphBars( pDataSet: TDataset; pID, pValuesLabel: string;
                       pStacked: boolean = false; pyAxes: boolean = true; pxAxes: boolean = false;
                       pbackgroundColor1  : TColor = COLOR_BLUE;
                       pborderColor1      : TColor = COLOR_BLUEDARK;
                       ppointStrokeColor1 : TColor = COLOR_BLUEDARK;
                       pbackgroundColor2  : TColor = COLOR_ORANGE;
                       pborderColor2      : TColor = COLOR_ORANGEDARK;
                       ppointStrokeColor2 : TColor = COLOR_ORANGEDARK ): string;
// v. 4.0.0.0
function rc_GraphPieDoughnut( pDataSet: TDataset; pID, pValuesLabel: string;
                              pGraphType : TRCGraphType = gtPIE;
                              pGraphColors : TRCGraphColor = gcInferno;
                              pStacked: boolean = false;
                              pyAxes: boolean = true;
                              pxAxes: boolean = false;
                              pAspectRatio : integer = 1;
                              pLabels: boolean = true;
                              pWidth : integer = 150;
                              pHeight : integer = 150 ): string;

implementation

uses str_func, mkm_func_web;

function rc_GraphDefaultStyle( pId:string ):string;
begin
     Result :=
           '<style>' +
           '    /* clearfix */' +
           '    .rc_clear:before,' +
           '    .rc_clear:after {' +
           '        content: "";' +
           '        display: table;' +
           '    }' +
           '    .rc_clear:after {' +
           '        clear: both;' +
           '    }' +
           '    .rc_clear {' +
           '        *zoom: 1;' +
           '    }' +
           '    .rc_wrapper {' +
           '        position: absolute;' +
           '        top: 0;' +
           '        right: 0;' +
           '        bottom: 0;' +
           '        left: 0;' +
           '        margin: 0px;' +
           '        border: 0px solid #cccccc;' +
           '        padding: 10px;' +
//           '        margin: 10px;' +
           '    }' +
           '    .rc_graph {' +
           '        display: block;' +
           '        float: left;' +
           '    }' +
           '    #rc_' + pId + ' {' +
           '        width: 100%;' +
           '        height: 100%;' +
           '    }' +
           '    </style>' +
           '    <div class="rc_wrapper rc_clear">' +
           '        <div id="rc_' + pId + '" class="rc_graph"></div>' +
           '    </div>' ;
end;

function rc_GraphBars( pDataSet: TDataset; pID, pValuesLabel: string;
                       pStacked, pyAxes , pxAxes: boolean;
                       pbackgroundColor1, pborderColor1, ppointStrokeColor1,
                       pbackgroundColor2, pborderColor2, ppointStrokeColor2: TColor): string;
var
  fValue : Double;

  i : integer;

  cValue1Label,
  cValue2Label,

//  cValue1backgroundColor,
//  cValue1borderColor,
//  cValue1pointStrokeColor,
//  cValue2backgroundColor,
//  cValue2borderColor,
//  cValue2pointStrokeColor,

  cHtml,
  cDataSets,
  cSeriesLabel : string;
  //cValuesLabel : string;
begin
     pDataSet.Open;

     cSeriesLabel := '';
     cDataSets    := '';
     cValue1Label := '';
     cValue2Label := '';

     if Pos( ';', pValuesLabel ) > 0 then
     begin
          cValue1Label := Copy( pValuesLabel, 1, Pos( ';', pValuesLabel ) - 1 );
          cValue2Label := Copy( pValuesLabel, Pos( ';', pValuesLabel ) + 1, 100 );
     end
     else
     begin
         cValue1Label := pValuesLabel;
     end;

     for I := 1 to varIIF( cValue2Label = '', 1, 2 ) do
     begin
         cDataSets := '';
         pDataset.First;

         while not pDataset.Eof do
         begin
              if  I = 1 then
                  cSeriesLabel := cSeriesLabel + '"' + pDataSet.FieldByName( 'serie' ).AsString + '"';

              fValue    := pDataset.FieldByName( 'value' + IntToStr( i ) ).AsCurrency;
              cDataSets := cDataSets + StringReplace( FloatToStr( fValue ), ',', '.', [rfReplaceAll] );

              pDataSet.Next;

              if ( not pDataSet.eof )  then
              begin
                 if ( I = 1 ) then
                    cSeriesLabel := cSeriesLabel + ',';

                 cDataSets := cDataSets + ',' ;
              end;
         end;

         cHtml := cHtml +
             '        {' +
             '          label               : ' + QuotedStr( varIIF( I = 1 , cValue1Label, cValue2Label ) ) + ',' +
             '          backgroundColor     : ' + QuotedStr( ColorToHtml( varIIF( I = 1 , pbackgroundColor1, pbackgroundColor2 ) ) ) + ',' +
             '          borderColor         : ' + QuotedStr( ColorToHtml( varIIF( I = 1 , pborderColor1, pborderColor2 ) ) ) + ',' +
             '          pointRadius          : false,' +
             '          pointColor          : ''#3b8bba'',' +
             '          pointStrokeColor    : ' + QuotedStr( ColorToHtml( varIIF( I = 1 , ppointStrokeColor1, ppointStrokeColor2 ) ) ) + ',' +
             '          pointHighlightFill  : ''#fff'',' +
             '          pointHighlightStroke: ''rgba(60,141,188,1)'',' +
             '          data                : [ [[pDATA]] ]' +
             '        }' ;

         cHtml := StringReplace( cHtml, '[[pDATA]]', cDataSets, [rfReplaceAll] ) ;

         if cValue2Label <> '' then
            cHtml := cHtml + ',' ;
     end;

     cDataSets := StringReplace( cHtml, '[[pDATA]]', cDataSets, [rfReplaceAll] ) ;
     chtml := '<div id="canvas-' + pID + '">'+
              '  <canvas id="chart-' + pID + '"></canvas>' +
              '</div>' +
              '<script>'+
              ' var data = { ' +
              '     labels: [ [[pSERIES]] ], ' +
              '   datasets: [ [[pDATASETS]] ]' +
              ' }; ' +
              ' var options = { ' +
              '     responsive: true, ' +
              '     maintainAspectRatio: false, ' +
              '     aspectRatio: 1, ' +
              '   scales: { ' +
              '     yAxes: [{ ' +
              '       stacked: ' + varIIF( pStacked, 'true', 'false' ) + ', ' +
              '       gridLines: { ' +
              '         display: ' + varIIF( pyAxes, 'true', 'false' ) + ', ' +
              '         color: "rgba(127,191,63,0.2)" ' +
              '       } ' +
              '     }], ' +
              '     xAxes: [{ ' +
              '       gridLines: { ' +
              '         display: ' + varIIF( pxAxes, 'true', 'false' ) + ' ' +
              '       } ' +
              '     }] ' +
              '   } ' +
              ' }; ' +
              ' Chart.Bar(''chart-' + pID + ''', { ' +
              '   options: options, ' +
              '   data: data ' +
              '  });'+
              '</script>';

     Result := StringReplace( cHtml , '[[pSERIES]]'   , cSeriesLabel , [rfReplaceAll] );
     Result := StringReplace( Result, '[[pDATASETS]]' , cDataSets    , [rfReplaceAll] );
end;

function rc_GraphCircleGauge( pLabel: string ; pId: string;
                              pValue: integer ; pMin: integer; pMax: integer; pWidthScale: double; pTimeAnim: integer ;
                              pLevelColor : TColor ;
                              pGaugeColor : TColor ;
                              pDonut: boolean ; pPointer : boolean ;
                              pTitle: string  ): string;
begin
     Result := rc_GraphDefaultStyle( pID ) +
           '    <script>' +
           '        var g1, g2, g3;' +
           '        var g1 = new JustGage({' +
           '            id: "rc_' + pId + '",' +
           '            value: ' + pValue.ToString + ',' +
           '            min: ' + pMin.ToString + ',' +
           '            max: ' + pMax.ToString + ',' + // 100
           '            title: "' + pTitle + '",'+
           '            label: "' + pLabel + '",'+
           '            gaugeWidthScale: ' + StringReplace( FloatToStr( pWidthScale ), ',', '.', [rfReplaceAll] ) + ','+
           '            pointer: ' + varIIF( pPointer, 'true', 'false' ) + ',' +
           '            startAnimationTime: ' + pTimeAnim.ToString + ',' +
           '            startAnimationType: ">",' +
           '            refreshAnimationTime: 400,' +
           '            refreshAnimationType: "bounce",' +
           '            gaugeColor: "' + ColorToHtml( pGaugeColor ) + '",'+
           '            levelColors: ["' + ColorToHtml( pLevelColor ) + '"],'+
           '            relativeGaugeSize: true,' +
           '            donut: ' + varIIF( pDonut, 'true', 'false' ) + '' +
           '        });' +
           '    </script>        ' ;
end;
// v. 4.0.0.0
function rc_GraphPieDoughnut( pDataSet: TDataset; pID, pValuesLabel: string;
                              pGraphType : TRCGraphType; pGraphColors : TRCGraphColor;
                              pStacked, pyAxes , pxAxes: boolean; pAspectRatio : integer; pLabels: boolean;
                              pWidth : integer ;
                              pHeight : integer ): string;
var
  fValue : Double;

  i,f,p,c : integer;

  cValue1Label,
  cValue2Label,

//  cValue1backgroundColor,
//  cValue1borderColor,
//  cValue1pointStrokeColor,
//  cValue2backgroundColor,
//  cValue2borderColor,
//  cValue2pointStrokeColor,

  cHtml,
  cType,
  cDataSets,
  cSeriesLabel, cColors : string;
//  cValuesLabel : string;
begin
     cType := varIIF( pGraphType = gtPIE, 'pie', 'doughnut' ) ;

     pDataSet.Open;

     cSeriesLabel := '';
     cDataSets    := '';
     cValue1Label := '';
     cValue2Label := '';
     cColors      := '';

     if Pos( ';', pValuesLabel ) > 0 then
     begin
          cValue1Label := Copy( pValuesLabel, 1, Pos( ';', pValuesLabel ) - 1 );
          cValue2Label := Copy( pValuesLabel, Pos( ';', pValuesLabel ) + 1, 100 );
     end
     else
     begin
         cValue1Label := pValuesLabel;
     end;

     I := 1;
     f := 0;
     begin
         cDataSets := '';
         pDataset.First;
         while not pDataset.Eof do
         begin
              Inc( f );

              case pGraphColors of
                 gcRainbow: cColors := cColors + QuotedStr(ARRAY_COLORS1[ ( Length( ARRAY_COLORS1 ) -1 ) - f ] ); // v. 4.0.0.0
                 gcInferno: cColors := cColors + QuotedStr(ARRAY_COLORS2[ ( Length( ARRAY_COLORS1 ) -1 ) - f ] ); // v. 4.0.0.0
                 gcMagma  : cColors := cColors + QuotedStr(ARRAY_COLORS3[ ( Length( ARRAY_COLORS1 ) -1 ) - f ] ); // v. 4.0.0.0
                 gcGreens : cColors := cColors + QuotedStr(ARRAY_COLORS4[ ( Length( ARRAY_COLORS1 ) -1 ) - f ] ); // v. 4.0.0.0
                 gcPurples: cColors := cColors + QuotedStr(ARRAY_COLORS5[ ( Length( ARRAY_COLORS1 ) -1 ) - f ] ); // v. 4.0.0.0
                 gcReds   : cColors := cColors + QuotedStr(ARRAY_COLORS6[ ( Length( ARRAY_COLORS1 ) -1 ) - f ] ); // v. 4.0.0.0
//                 gcRainbow: cColors := cColors + QuotedStr(ARRAY_COLORS1[ f ] ); // v. 4.0.0.0
//                 gcInferno: cColors := cColors + QuotedStr(ARRAY_COLORS2[ f ] ); // v. 4.0.0.0
//                 gcMagma  : cColors := cColors + QuotedStr(ARRAY_COLORS3[ f ] ); // v. 4.0.0.0
//                 gcGreens : cColors := cColors + QuotedStr(ARRAY_COLORS4[ f ] ); // v. 4.0.0.0
//                 gcPurples: cColors := cColors + QuotedStr(ARRAY_COLORS5[ f ] ); // v. 4.0.0.0
//                 gcReds   : cColors := cColors + QuotedStr(ARRAY_COLORS6[ f ] ); // v. 4.0.0.0
                 gcRandom : begin
                                 p := Random( 5 ) + 1;
                                 c := Random( 11 ) + 1;

                                 case p of
                                     1: cColors := cColors + QuotedStr(ARRAY_COLORS1[ c ] );
                                     2: cColors := cColors + QuotedStr(ARRAY_COLORS2[ c ] );
                                     3: cColors := cColors + QuotedStr(ARRAY_COLORS3[ c ] );
                                     4: cColors := cColors + QuotedStr(ARRAY_COLORS4[ c ] );
                                     5: cColors := cColors + QuotedStr(ARRAY_COLORS5[ c ] );
                                     6: cColors := cColors + QuotedStr(ARRAY_COLORS6[ c ] );
                                 end;
                            end;
              end;

              cSeriesLabel := cSeriesLabel + '"' + pDataSet.FieldByName( 'serie' ).AsString + '"';

              fValue    := pDataset.FieldByName( 'value' + IntToStr( i ) ).AsCurrency;
              cDataSets := cDataSets + StringReplace( FloatToStr( fValue ), ',', '.', [rfReplaceAll] );

              pDataSet.Next;

              if ( not pDataSet.eof )  then
              begin
                 cSeriesLabel := cSeriesLabel + ',';

                 cDataSets := cDataSets + ',' ;
                 cColors   := cColors + ', ';
              end;
         end;
     end;

     chtml := //rc_GraphDefaultStyle( cType + pID ) + // v. 3.2.0.1 // thanks to VICTOR NATAN
              '<div id="canvas-' + cType + pID + '">'+
              //'  <canvas id="chart-' + cType + pID + '"></canvas>' +
              //varIIF( pMobile,
              //    '  <canvas id="chart-' + cType + pID + '" style="width:148;height:148;"></canvas>',
              //    '  <canvas id="chart-' + cType + pID + '" style="width:auto;height:auto;"></canvas>' ) +//max-width:225px;
              //'  <canvas id="chart-' + cType + pID + '" style="width:auto;height:auto;"></canvas>' +//max-width:225px;
                  '  <canvas id="chart-' + cType + pID + '" style="width:' + pWidth.ToString + 'px;height:' + pHeight.toString + 'px;"></canvas>' +
              '</div>' +

             '<script>'+

               'var xValues = [ [[pSERIES]] ];' +
               'var yValues = [ [[pDATA]] ];' +
               'var barColors = [ [[pCOLORS]] ' +

               '];' +
               '' +
               'new Chart("chart-' + cType + pID + '", {' +
               '  type: "doughnut",' +
               '  data: {' +
               '    labels: xValues,' +
               '    datasets: [{' +
               '      backgroundColor: barColors,' +
               '      data: yValues' +
               '    }]' +
               '  },' +
               '  options: {' +
               '    title: {' +
//               '      display: true,' +
//               '      text: "World Wide Wine Production 2018"' +
               '    },' +
               '    legend: {' +
               '      display: ' + varIIF( pLabels, 'true', 'false' ) +
//               '      text: "World Wide Wine Production 2018"' +
               '    },' +
               '    responsive: true,' +
               '    maintainAspectRatio: true, ' +
               '    aspectRatio: ' + pAspectRatio.ToString + //2
               '  }' +
               '});' +
                 '</script>';

     Result := StringReplace( cHtml , '[[pSERIES]]' , cSeriesLabel , [rfReplaceAll] );
     Result := StringReplace( Result, '[[pDATA]]'   , cDataSets    , [rfReplaceAll] );
     Result := StringReplace( Result, '[[pCOLORS]]' , cColors      , [rfReplaceAll] );
end;
// v. 4.0.0.0 - in development
// ApexCharts
// Lines
function rc_ApexChartGraphLines( pDataSet: TDataset;
                                 pID, pNAME, pTITLE, pSUBTITLE, pValuesLabel: string;
                                 pStacked, pyAxes , pxAxes: boolean;
                                 pbackgroundColor1, pborderColor1, ppointStrokeColor1,
                                 pbackgroundColor2, pborderColor2, ppointStrokeColor2: TColor): string;
var
  fValue : Double;

  i : integer;

  cValue1Label,
  cValue2Label,

//  cValue1backgroundColor,
//  cValue1borderColor,
//  cValue1pointStrokeColor,
//  cValue2backgroundColor,
//  cValue2borderColor,
//  cValue2pointStrokeColor,

  cHtml,
  cDataSets,
  cSeriesLabel : string;
  //cValuesLabel : string;
begin
     pDataSet.Open;

     cSeriesLabel := '';
     cDataSets    := '';
     cValue1Label := '';
     cValue2Label := '';

     if Pos( ';', pValuesLabel ) > 0 then
     begin
          cValue1Label := Copy( pValuesLabel, 1, Pos( ';', pValuesLabel ) - 1 );
          cValue2Label := Copy( pValuesLabel, Pos( ';', pValuesLabel ) + 1, 100 );
     end
     else
     begin
         cValue1Label := pValuesLabel;
     end;

     for I := 1 to 1 do //varIIF( cValue2Label = '', 1, 2 ) do
     begin
         cDataSets := '';
         pDataset.First;

         while not pDataset.Eof do
         begin
              if  I = 1 then
                  //cSeriesLabel := cSeriesLabel + '"' + pDataSet.FieldByName( 'serie' ).AsString + '"';
                  cSeriesLabel := cSeriesLabel + '"' + DateToStr( pDataSet.FieldByName( 'date_ref' ).AsDateTime ) + '"';

              fValue    := pDataset.FieldByName( 'value' + IntToStr( i ) ).AsCurrency;
              cDataSets := cDataSets + StringReplace( FloatToStr( fValue ), ',', '.', [rfReplaceAll] );

              pDataSet.Next;

              if ( not pDataSet.eof )  then
              begin
                 if ( I = 1 ) then
                    cSeriesLabel := cSeriesLabel + ',';

                 cDataSets := cDataSets + ',' ;
              end;
         end;
     end;

     cHtml :=
              '<div id="' + pID + '"></div>' +
              '<script>' +
              '  var options = {' +
              '  series: [{' +
              '    name: "' + pNAME + '",' +
              '    data: [ ' + cDataSets +
                        ']' +
              '  }],' +
              '  chart: {' +
              '    type: ''area'',' +
              '    height: 350,' +
              '    zoom: {' +
              '      enabled: false' +
              '    }' +
              '  },' +
              '  theme: {' +
              '    mode: ''light'',' +
              '    palette: ''palette1'',' +
              '    monochrome: {' +
              '      enabled: false,' +
              '      color: ''#255aee'',' +
              '      shadeTo: ''light'',' +
              '      shadeIntensity: 0.65' +
              '      },' +
              '    },' +
              '    dataLabels: {' +
              '    enabled: false' +
              '  },' +
              '  stroke: {' +
              '    curve: ''straight''' +
              '  },' +
              '  title: {' +
              '    text: ''' + pTITLE + ''',' +
              '    align: ''left''' +
              '  },' +
              '  subtitle: {' +
              '    text: ''' + pSUBTITLE + ''',' +
              '    align: ''left''' +
              '  },' +
              '  labels: [ ' + cSeriesLabel +
                        '],' +
              '  xaxis: {' +
              '    type: ''datetime'',' +
              '  },' +
              '  yaxis: {' +
              '    opposite: true' +
              '  },' +
              '  legend: {' +
              '    horizontalAlign: ''left''' +
              '  }' +
              '  };' +
              '  var chart = new ApexCharts(document.querySelector("#' + pID + '"), options);' +
              '  chart.render();' +
              '</script>' ;

     Result := cHtml;
end;
(*
    htmlSalesLines.HTML.Text :=
       '<div id="[[ID]]"></div>' +
       '<script>' +
       '  var options = {' +
       '  series: [{' +
       '    name: "[[NAME]]",' +
       '    data: [ [[DATA]]
                 ']' +
       '  }],' +
       '  chart: {' +
       '    type: ''area'',' +
       '    height: 350,' +
       '    zoom: {' +
       '      enabled: false' +
       '    }' +
       '  },' +
       '  theme: {' +
       '    mode: ''light'',' +
       '    palette: ''palette1'',' +
       '    monochrome: {' +
       '      enabled: false,' +
       '      color: ''#255aee'',' +
       '      shadeTo: ''light'',' +
       '      shadeIntensity: 0.65' +
       '      },' +
       '    },' +
       '    dataLabels: {' +
       '    enabled: false' +
       '  },' +
       '  stroke: {' +
       '    curve: ''straight''' +
       '  },' +
       '  title: {' +
       '    text: ''[[TITLE_TEXT]]'',' +
       '    align: ''left''' +
       '  },' +
       '  subtitle: {' +
       '    text: ''[[SUBTITLE_TEXT]]'',' +
       '    align: ''left''' +
       '  },' +
       '  labels: [ [[LABELS]]
                 '],' +
       '  xaxis: {' +
       '    type: ''datetime'',' +
       '  },' +
       '  yaxis: {' +
       '    opposite: true' +
       '  },' +
       '  legend: {' +
       '    horizontalAlign: ''left''' +
       '  }' +
       '  };' +
       '  var chart = new ApexCharts(document.querySelector("#[[ID]]"), options);' +
       '  chart.render();' +
       '</script>' ;

*)
end.
