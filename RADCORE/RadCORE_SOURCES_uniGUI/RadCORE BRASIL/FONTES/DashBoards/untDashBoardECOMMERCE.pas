unit untDashBoardECOMMERCE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses, uniGUIApplication, // v. 4.1.0.0
  uniGUIClasses, uniGUIFrame, uniLabel, uniPanel, uniGUIBaseClasses, uniScrollBox, uniHTMLFrame, uniButton, uniBitBtn, Vcl.Imaging.pngimage, uniImage;

type
  TfrmDashboardECOMMERCE = class(TUniFrame)
    sboxEcommerce: TUniScrollBox;
    rcBlock10: TUniContainerPanel;
    rcBlock10Label: TUniLabel;
    labDashCustomers: TUniLabel;
    labNewCustomers: TUniLabel;
    UniLabel2: TUniLabel;
    rcBlock150: TUniContainerPanel;
    rcBlock50: TUniContainerPanel;
    htmlSales: TUniHTMLFrame;
    rcBlock5: TUniContainerPanel;
    rcBlock5Label: TUniLabel;
    labSales: TUniLabel;
    labDashGreen: TUniLabel;
    rcBlock15: TUniContainerPanel;
    rcBlock15Label: TUniLabel;
    labDashPurple: TUniLabel;
    labInService: TUniLabel;
    rcBlock20: TUniContainerPanel;
    rcBlock20Label: TUniLabel;
    labDashRed: TUniLabel;
    labGivUp: TUniLabel;
    rcBlock40: TUniContainerPanel;
    htmlSalesLines: TUniHTMLFrame;
    rcBlock30: TUniContainerPanel;
    htmlOthers: TUniHTMLFrame;
    rcBlock35: TUniContainerPanel;
    UniLabel1: TUniLabel;
    labRcCollapse60: TUniLabel;
    rcBlock60: TUniContainerPanel;
    rcBlock70: TUniContainerPanel;
    rcBlock80: TUniContainerPanel;
    imgProd170: TUniImage;
    rcBlock100: TUniContainerPanel;
    labProdPrice190: TUniLabel;
    rcBlock90: TUniContainerPanel;
    labProdName175: TUniLabel;
    rcBlock110: TUniContainerPanel;
    labProdPriceOld190: TUniLabel;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    rcBlock37: TUniContainerPanel;
    rcBlock120: TUniContainerPanel;
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

uses mkm_layout, untDM_RC, MainModule, mkm_graphs, uconsts;

procedure TfrmDashboardECOMMERCE.rc_UpdateCharts;
begin
    // basta passar uma query:
    //    Campos( ou Alias ): SERIE, VALUE1, VALUE2
    //    ValuesLabels      : Produtos;Serviços ( exemplo usado )
    //    Cores
    dm_rc.sqlDS.SQL.Text := 'select * from tb_graphs';

    htmlOthers.HTML.Text := rc_GraphBars(
                              dm_rc.sqlDS,
                              'vendas_ps_db',
                              'Produtos;Serviços');

    htmlSales.HTML.Text :=
    '            <div class="card">' +
    '              <div class="card-header border-0">' +
    '                <h3 class="card-title">Produtos em Destaque</h3>' +
//    '                <div class="card-tools">' +
//    '                  <a href="#" class="btn btn-tool btn-sm">' +
//    '                    <i class="fa fa-download"></i>' +
//    '                  </a>' +
//    '                  <a href="#" class="btn btn-tool btn-sm">' +
//    '                    <i class="fa fa-bars"></i>' +
//    '                  </a>' +
//    '                </div>' +
    '              </div>' +
    '              <div class="card-body pr-0">' +
    '                <table class="table table-striped table-valign-middle">' +
    '                  <thead>' +
    '                  <tr>' +
    '                    <th>Produto</th>' +
    '                    <th>Preço</th>' +
    '                    <th>Vendas</th>' +
    '                    <th>Mais</th>' +
    '                  </tr>' +
    '                  </thead>' +
    '                  <tbody>' +
    '                  <tr>' +
    '                    <td>' +
    '                      <img src="files/images/default-150x150.png" alt="Product 1" class="img-circle img-size-32 mr-2">' +
    '                      Produto 1' +
    '                    </td>' +
    '                    <td>' + PFmtSettings.CurrencyString + ' 15,00</td>' + // v. 4.1.0.0
    '                    <td style="text-align:right;">1.000' +
    '                      <small class="text-success mr-1">' +
    '                        <i class="fa fa-arrow-up"></i>' +
    '                        12%' +
    '                      </small>' +
    '                      ' +
    '                    </td>' +
    '                    <td>' +
    '                      <a href="#" onclick="ajaxRequest( MainForm.htmlFrame , ''_dashboard'', [''item=prod1'']);" class="text-muted">' +
    '                        <i class="fa fa-search"></i>' +
    '                      </a>' +
    '                    </td>' +
    '                  </tr>' +
    '                  <tr>' +
    '                    <td>' +
    '                      <img src="files/images/default-150x150.png" alt="Product 2" class="img-circle img-size-32 mr-2">' +
    '                      Produto 2' +
    '                    </td>' +
    '                    <td>' + PFmtSettings.CurrencyString + ' 19,00</td>' + // v. 4.1.0.0
    '                    <td style="text-align:right;">123' +
    '                      <small class="text-warning mr-1">' +
    '                        <i class="fa fa-arrow-down"></i>' +
    '                        0.5%' +
    '                      </small>' +
    '                      ' +
    '                    </td>' +
    '                    <td>' +
    '                      <a href="#" onclick="ajaxRequest( MainForm.htmlFrame , ''_dashboard'', [''item=prod2'']);" class="text-muted">' +
    '                        <i class="fa fa-search"></i>' +
    '                      </a>' +
    '                    </td>' +
    '                  </tr>' +
    '                  <tr>' +
    '                    <td>' +
    '                      <img src="files/images/default-150x150.png" alt="Product 3" class="img-circle img-size-32 mr-2">' +
    '                      Produto 3' +
    '                    </td>' +
    '                    <td>' + PFmtSettings.CurrencyString + ' 35,00</td>' + //v. 4.1.0.0
    '                    <td style="text-align:right;">198' +
    '                      <small class="text-danger mr-1">' +
    '                        <i class="fa fa-arrow-down"></i>' +
    '                        3%' +
    '                      </small>' +
    '                      ' +
    '                    </td>' +
    '                    <td>' +
    '                      <a href="#" onclick="ajaxRequest( MainForm.htmlFrame , ''_dashboard'', [''item=prod3'']);" class="text-muted">' +
    '                        <i class="fa fa-search"></i>' +
    '                      </a>' +
    '                    </td>' +
    '                  </tr>' +
    '                  <tr>' +
    '                    <td>' +
    '                      <img src="files/images/default-150x150.png" alt="Product 4" class="img-circle img-size-32 mr-2">' +
    '                      Produto 4' +
    '                      <span class="badge bg-danger">novo</span>' +
    '                    </td>' +
    '                    <td>' + PFmtSettings.CurrencyString + ' 28,00</td>' + //v. 4.1.0.0
    '                    <td style="text-align:right;">87' +
    '                      <small class="text-success mr-1">' +
    '                        <i class="fa fa-arrow-up"></i>' +
    '                        63%' +
    '                      </small>' +
    '                      ' +
    '                    </td>' +
    '                    <td>' +
    '                      <a href="#" onclick="ajaxRequest( MainForm.htmlFrame , ''_dashboard'', [''item=prod4'']);" class="text-muted">' +
    '                        <i class="fa fa-search"></i>' +
    '                      </a>' +
    '                    </td>' +
    '                  </tr>' +
    '                  </tbody>' +
    '                </table>' +
    '              </div>' +
    '            </div>' ;//+


    dm_rc.sqlDS.SQL.Text := 'select * from tb_graphs';

//    htmlSalesLines.HTML.Text := rc_ApexChartGraphLines(
//                                dm_rc.sqlDS,
//                                'sales_ps',
//                                'SALES',
//                                'Vendas totais no período',
//                                'Evolução Total',
//                                'Date;Total');
//    Exit;
    htmlSalesLines.HTML.Text :=
       '<div id="chart_db"></div>' +
       '<script>' +
       '  var options = {' +
       '  series: [{' +
       '    name: "CURVA ABC",' +
       '    data: [ 8107.85,' +
                   '8128.0,' +
                   '8122.9,' +
                   '8165.5,' +
                   '8340.7,' +
                   '8423.7,' +
                   '8423.5,' +
                   '8514.3,' +
                   '8481.85,' +
                   '8487.7,' +
                   '8506.9,' +
                   '8626.2,' +
                   '8668.95,' +
                   '8602.3,' +
                   '8607.55,' +
                   '8512.9,' +
                   '8496.25,' +
                   '8600.65,' +
                   '8881.1,' +
                   '9340.85' +
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
       '    text: ''Vendas totais no período'',' +
       '    align: ''left''' +
       '  },' +
       '  subtitle: {' +
       '    text: ''Evolução do Preço'',' +
       '    align: ''left''' +
       '  },' +
       '  labels: [ "13 Nov 2020",' +
                   '"14 Nov 2020",' +
                   '"15 Nov 2020",' +
                   '"16 Nov 2020",' +
                   '"17 Nov 2020",' +
                   '"20 Nov 2020",' +
                   '"21 Nov 2020",' +
                   '"22 Nov 2020",' +
                   '"23 Nov 2020",' +
                   '"24 Nov 2020",' +
                   '"27 Nov 2020",' +
                   '"28 Nov 2020",' +
                   '"29 Nov 2020",' +
                   '"30 Nov 2020",' +
                   '"01 Dec 2020",' +
                   '"04 Dec 2020",' +
                   '"05 Dec 2020",' +
                   '"06 Dec 2020",' +
                   '"07 Dec 2020",' +
                   '"08 Dec 2020"' +
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
       '  var chart = new ApexCharts(document.querySelector("#chart_db"), options);' +
       '  chart.render();' +
       '</script>' ;
end;

procedure TfrmDashboardECOMMERCE.UniFrameCreate(Sender: TObject);
begin
    rc_RenderLayout( Self, false, false );
end;

procedure TfrmDashboardECOMMERCE.UniFrameReady(Sender: TObject);
begin
     dm_rc.rc_ApplyEditMasks( Self );
     dm_rc.rc_ResizeBlocks( Self, true, true );
     rc_UpdateCharts;
end;

Initialization
   RegisterClass( TfrmDashboardECOMMERCE );

end.
