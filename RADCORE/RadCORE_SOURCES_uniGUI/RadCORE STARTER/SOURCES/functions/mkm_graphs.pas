unit mkm_graphs; // v. 3.2.0.7


interface

uses
    System.SysUtils, System.Classes ,       System.TypInfo, JSON, DBXJSON, DBXJSONReflect,
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

function rc_GraphPieDoughnut( pDataSet: TDataset; pID, pValuesLabel: string;
                              pGraphType : TRCGraphType = gtPIE; pGraphColors : TRCGraphColor = gcInferno;
                              pStacked: boolean = false; pyAxes: boolean = true; pxAxes: boolean = false ): string;
//                              pbackgroundColor1  : TColor = COLOR_BLUE;
//                              pborderColor1      : TColor = COLOR_BLUEDARK;
//                              ppointStrokeColor1 : TColor = COLOR_BLUEDARK;
//                              pbackgroundColor2  : TColor = COLOR_ORANGE;
//                              pborderColor2      : TColor = COLOR_ORANGEDARK;
//                              ppointStrokeColor2 : TColor = COLOR_ORANGEDARK ): string;


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
              cDataSets := cDataSets + stringReplace( FloatToStr( fValue ), ',', '.', [rfReplaceAll] );

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

function rc_GraphPieDoughnut( pDataSet: TDataset; pID, pValuesLabel: string;
                              pGraphType : TRCGraphType; pGraphColors : TRCGraphColor;
                              pStacked, pyAxes , pxAxes: boolean): string;
//                              pbackgroundColor1, pborderColor1, ppointStrokeColor1,
//                              pbackgroundColor2, pborderColor2, ppointStrokeColor2: TColor): string;
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
                 gcRainbow: cColors := cColors + QuotedStr(ARRAY_COLORS1[ f ] );
                 gcInferno: cColors := cColors + QuotedStr(ARRAY_COLORS2[ f ] );
                 gcMagma  : cColors := cColors + QuotedStr(ARRAY_COLORS3[ f ] );
                 gcPurples: cColors := cColors + QuotedStr(ARRAY_COLORS4[ f ] );
                 gcGreens : cColors := cColors + QuotedStr(ARRAY_COLORS5[ f ] );
                 gcReds   : cColors := cColors + QuotedStr(ARRAY_COLORS6[ f ] );
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
              cDataSets := cDataSets + stringReplace( FloatToStr( fValue ), ',', '.', [rfReplaceAll] );

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
              '  <canvas id="chart-' + cType + pID + '"></canvas>' +
              '</div>' +

             '<script>'+
                 '$(document).ready(function()'+
                 '{'+
                 ' var config = { ' +
                 '     type: ' + QuotedStr( cType ) + ', ' + //   ''doughnut'', ' +
                 '     data: { ' +

                 '     labels: [ ' +
                 '       [[pSERIES]] ' +
                 '     ], ' +

                 '     datasets: [{ ' +
                 '       data: [ ' +
                 '          [[pDATA]], ' + //234, 367,120,224,670, ' +
                 '        ], ' +
                 '        backgroundColor: [ ' +
                 '        [[pCOLORS]], ' +
                 '        ], ' +
                 '        label: ' + QuotedStr(pValuesLabel) + // ''Melhores Marcas'' ' +
                 '     }], ' +
//                 '     labels: [ ' +
//                 '       [[pSERIES]], ' +
//                 '     ] ' +
                 '     }, ' +
                 '     options: { ' +
                 '       responsive: true, ' +
                 '       maintainAspectRatio: false, ' +
                 '       aspectRatio: 1 ' + //2
                 '     } ' +
                 ' }; ' +

                 'var ctx = document.getElementById(''chart-' + cType + pID + ''').getContext(''2d''); ' +
                 'var myChart' + cType + pID + ' = new Chart(ctx, config);'+

                 '  });'+
                 '</script>';

                 (*
  labels: ['Red', 'Orange', 'Yellow', 'Green', 'Blue'],
  datasets: [
    {
                 *)
     Result := StringReplace( cHtml , '[[pSERIES]]' , cSeriesLabel , [rfReplaceAll] );
     Result := StringReplace( Result, '[[pDATA]]'   , cDataSets    , [rfReplaceAll] );
     Result := StringReplace( Result, '[[pCOLORS]]' , cColors      , [rfReplaceAll] );
end;

end.
