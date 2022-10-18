object frmDashboardCRM: TfrmDashboardCRM
  Left = 0
  Top = 0
  Width = 854
  Height = 602
  OnCreate = UniFrameCreate
  OnReady = UniFrameReady
  ParentAlignmentControl = False
  AlignmentControl = uniAlignmentClient
  TabOrder = 0
  object sboxGridBlock: TUniScrollBox
    Left = 0
    Top = 0
    Width = 854
    Height = 602
    Hint = ''
    Align = alClient
    Color = 15395562
    TabOrder = 0
    object sboxCRM: TUniScrollBox
      Left = 0
      Top = 0
      Width = 852
      Height = 600
      Hint = ''
      Align = alClient
      Color = 15395562
      TabOrder = 0
      ScrollHeight = 854
      ScrollWidth = 744
      ScrollY = 186
      object rcBlock300: TUniContainerPanel
        Tag = 4
        Left = 3
        Top = 653
        Width = 729
        Height = 15
        Hint = '[[cols:sm-8 md-8 lg-8 xl-8 | round:all]]'
        ParentColor = False
        TabOrder = 0
      end
      object rcBlock50: TUniContainerPanel
        Tag = 2
        Left = 194
        Top = -178
        Width = 179
        Height = 220
        Hint = '[[cols:xs-12 sm-12 md-6 lg-3 xl-3 4k-3 8k-3 | round:all]]'#13#10
        ParentColor = False
        Color = clWhite
        TabOrder = 1
        DesignSize = (
          179
          220)
        object htmlCompletedTasks: TUniHTMLFrame
          AlignWithMargins = True
          Left = 2
          Top = 44
          Width = 175
          Height = 172
          Hint = ''
          HTML.Strings = (
            '<div class="progress-container">'
            '    <div class="row">'
            '        <div class="col-md-3 col-sm-6">'
            '            <div class="progress blue">'
            '                <span class="progress-left">'
            '                    <span class="progress-bar"></span>'
            '                </span>'
            '                <span class="progress-right">'
            '                    <span class="progress-bar"></span>'
            '                </span>'
            '                <div class="progress-value">60%</div>'
            '            </div>'
            '        </div>'
            '    </div>'
            '</div>')
          Anchors = [akLeft, akTop, akRight, akBottom]
        end
        object rcBlock52: TUniContainerPanel
          Left = 7
          Top = 6
          Width = 161
          Height = 34
          Hint = 
            '[['#13#10'cols:xs-12 sm-12 md-12 |'#13#10'noborder-top|'#13#10'border:b color-silv' +
            'er-light'#13#10']]'
          ParentColor = False
          TabOrder = 2
          DesignSize = (
            161
            34)
          object UniLabel15Clone: TUniLabel
            AlignWithMargins = True
            Left = 5
            Top = 3
            Width = 136
            Height = 27
            Hint = '[['#13#10'cls:rc-label-clear left-center'#13#10']]'#13#10#13#10#13#10
            Margins.Left = 6
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            AutoSize = False
            Caption = 'Completas'
            ParentFont = False
            Font.Color = clGray
            Font.Height = -21
            Font.Name = 'Calibri'
            ParentColor = False
            Color = clBtnFace
            TabOrder = 1
          end
          object UniLabel16Clone: TUniLabel
            Left = 144
            Top = 5
            Width = 15
            Height = 25
            Hint = 
              '[['#13#10'collapse:rcBlock50 off-36 icons:fas-plus fas-minus|'#13#10'hide:de' +
              'sktop'#13#10']]'#13#10
            TextConversion = txtHTML
            Caption = '^'
            Anchors = [akTop, akRight]
            ParentFont = False
            Font.Height = -21
            ParentColor = False
            Color = clBlack
            TabOrder = 2
          end
        end
      end
      object rcBlock55: TUniContainerPanel
        Tag = 2
        Left = 378
        Top = -178
        Width = 180
        Height = 220
        Hint = '[[cols:xs-12 sm-12 md-6 lg-3 xl-3 4k-3 8k-3 | round:all]]'#13#10
        ParentColor = False
        Color = clWhite
        TabOrder = 2
        DesignSize = (
          180
          220)
        object htmlPendingTasks: TUniHTMLFrame
          AlignWithMargins = True
          Left = 2
          Top = 44
          Width = 175
          Height = 172
          Hint = ''
          HTML.Strings = (
            '<div class="progress-container">'
            '    <div class="row">'
            '        <div class="col-md-3 col-sm-6">'
            '            <div class="progress orange">'
            '                <span class="progress-left">'
            '                    <span class="progress-bar"></span>'
            '                </span>'
            '                <span class="progress-right">'
            '                    <span class="progress-bar"></span>'
            '                </span>'
            '                <div class="progress-value">13%</div>'
            '            </div>'
            '        </div>'
            '    </div>'
            '</div>')
          Anchors = [akLeft, akTop, akRight, akBottom]
        end
        object rcBlock56: TUniContainerPanel
          Left = 3
          Top = 6
          Width = 161
          Height = 34
          Hint = 
            '[['#13#10'cols:xs-12 sm-12 md-12 |'#13#10'noborder-top|'#13#10'border:b color-silv' +
            'er-light'#13#10']]'
          ParentColor = False
          TabOrder = 2
          DesignSize = (
            161
            34)
          object UniLabel17: TUniLabel
            AlignWithMargins = True
            Left = 5
            Top = 3
            Width = 136
            Height = 27
            Hint = '[['#13#10'cls:rc-label-clear left-center'#13#10']]'#13#10#13#10#13#10
            Margins.Left = 6
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            AutoSize = False
            Caption = 'Pendentes'
            ParentFont = False
            Font.Color = clGray
            Font.Height = -21
            Font.Name = 'Calibri'
            ParentColor = False
            Color = clBtnFace
            TabOrder = 1
          end
          object UniLabel18: TUniLabel
            Left = 144
            Top = 5
            Width = 15
            Height = 25
            Hint = 
              '[['#13#10'collapse:rcBlock55 off-36 icons:fas-plus fas-minus|'#13#10'hide:de' +
              'sktop'#13#10']]'#13#10
            TextConversion = txtHTML
            Caption = '^'
            Anchors = [akTop, akRight]
            ParentFont = False
            Font.Height = -21
            ParentColor = False
            Color = clBlack
            TabOrder = 2
          end
        end
      end
      object rcBlock60: TUniContainerPanel
        Tag = 2
        Left = 560
        Top = -178
        Width = 179
        Height = 220
        Hint = '[[cols:xs-12 sm-12 md-6 lg-3 xl-3 4k-3 8k-3 | round:all]]'#13#10
        ParentColor = False
        Color = clWhite
        TabOrder = 3
        DesignSize = (
          179
          220)
        object htmlAverageTimeTasks: TUniHTMLFrame
          AlignWithMargins = True
          Left = 2
          Top = 44
          Width = 175
          Height = 172
          Hint = ''
          HTML.Strings = (
            '<div class="progress-container">'
            '    <div class="row">'
            '        <div class="col-md-3 col-sm-6">'
            '            <div class="progress red">'
            '                <span class="progress-left">'
            '                    <span class="progress-bar"></span>'
            '                </span>'
            '                <span class="progress-right">'
            '                    <span class="progress-bar"></span>'
            '                </span>'
            '                <div class="progress-value">97%</div>'
            '            </div>'
            '        </div>'
            '    </div>'
            '</div>')
          Anchors = [akLeft, akTop, akRight, akBottom]
        end
        object rcBlock62: TUniContainerPanel
          Left = 4
          Top = 6
          Width = 161
          Height = 34
          Hint = 
            '[['#13#10'cols:xs-12 sm-12 md-12 |'#13#10'noborder-top|'#13#10'border:b color-silv' +
            'er-light'#13#10']]'
          ParentColor = False
          TabOrder = 2
          DesignSize = (
            161
            34)
          object UniLabel19: TUniLabel
            AlignWithMargins = True
            Left = 5
            Top = 3
            Width = 136
            Height = 27
            Hint = '[['#13#10'cls:rc-label-clear left-center'#13#10']]'#13#10#13#10#13#10
            Margins.Left = 6
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            AutoSize = False
            Caption = 'Prazo Expirado'
            ParentFont = False
            Font.Color = clGray
            Font.Height = -21
            Font.Name = 'Calibri'
            ParentColor = False
            Color = clBtnFace
            TabOrder = 1
          end
          object UniLabel20: TUniLabel
            Left = 144
            Top = 5
            Width = 15
            Height = 25
            Hint = 
              '[['#13#10'collapse:rcBlock60 off-36 icons:fas-plus fas-minus|'#13#10'hide:de' +
              'sktop'#13#10']]'#13#10
            TextConversion = txtHTML
            Caption = '^'
            Anchors = [akTop, akRight]
            ParentFont = False
            Font.Height = -21
            ParentColor = False
            Color = clBlack
            TabOrder = 2
          end
        end
      end
      object rcBlock45: TUniContainerPanel
        Tag = 2
        Left = 9
        Top = -178
        Width = 180
        Height = 220
        Hint = '[[cols:xs-12 sm-12 md-6 lg-3 xl-3 4k-3 8k-3 | round:all]]'#13#10
        ParentColor = False
        Color = clWhite
        TabOrder = 4
        DesignSize = (
          180
          220)
        object htmlOpenTasks: TUniHTMLFrame
          AlignWithMargins = True
          Left = 2
          Top = 44
          Width = 175
          Height = 172
          Hint = ''
          Anchors = [akLeft, akTop, akRight, akBottom]
        end
        object rcBlock47: TUniContainerPanel
          Left = 5
          Top = 4
          Width = 161
          Height = 34
          Hint = 
            '[['#13#10'cols:xs-12 sm-12 md-12 |'#13#10'noborder-top|'#13#10'border:b color-silv' +
            'er-light'#13#10']]'
          ParentColor = False
          TabOrder = 2
          DesignSize = (
            161
            34)
          object UniLabel15: TUniLabel
            AlignWithMargins = True
            Left = 5
            Top = 3
            Width = 136
            Height = 27
            Hint = '[['#13#10'cls:rc-label-clear left-center'#13#10']]'#13#10#13#10#13#10
            Margins.Left = 6
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            AutoSize = False
            Caption = 'Abertas'
            ParentFont = False
            Font.Color = clGray
            Font.Height = -21
            Font.Name = 'Calibri'
            ParentColor = False
            Color = clBtnFace
            TabOrder = 1
          end
          object UniLabel16: TUniLabel
            Left = 144
            Top = 2
            Width = 15
            Height = 25
            Hint = 
              '[['#13#10'collapse:rcBlock45 off-36 icons:fas-plus fas-minus|'#13#10'hide:de' +
              'sktop'#13#10']]'#13#10
            TextConversion = txtHTML
            Caption = '^'
            Anchors = [akTop, akRight]
            ParentFont = False
            Font.Height = -21
            ParentColor = False
            Color = clBlack
            TabOrder = 2
          end
        end
      end
      object rcBlock80: TUniContainerPanel
        Tag = 2
        Left = 16
        Top = 48
        Width = 728
        Height = 259
        Hint = 
          '[['#13#10'cols:xs-12 sm-12 md-12 lg-12 xl-12 | '#13#10'round:all |'#13#10'hr-child' +
          's:xs-exp sm-exp md-fix | '#13#10']]'
        ParentColor = False
        Color = clWhite
        TabOrder = 5
        object rcBlock90: TUniContainerPanel
          Left = 6
          Top = 49
          Width = 175
          Height = 195
          Hint = '[[cols:xs-12 sm-12 md-3 |'#13#10'noborder-all'#13#10']]'
          ParentColor = False
          TabOrder = 1
          object htmlDoughnut1: TUniHTMLFrame
            AlignWithMargins = True
            Left = 10
            Top = 2
            Width = 150
            Height = 150
            Hint = '[['#13#10'center:parent xy'#13#10']]'
            HTML.Strings = (
              '            <div class="card">'
              '              <div class="card-header border-0">'
              '                <div class="d-flex justify-content-between">'
              '                  <h3 class="card-title">Sales</h3>'
              '                  <a href="javascript:void(0);">View Report</a>'
              '                </div>'
              '              </div>'
              '              <div class="card-body">'
              '                <div class="d-flex">'
              '                  <p class="d-flex flex-column">'
              
                '                    <span class="text-bold text-lg">$18,230.00</' +
                'span>'
              '                    <span>Sales Over Time</span>'
              '                  </p>'
              
                '                  <p class="ml-auto d-flex flex-column text-righ' +
                't">'
              '                    <span class="text-success">'
              '                      <i class="fas fa-arrow-up"></i> 33.1%'
              '                    </span>'
              
                '                    <span class="text-muted">Since last month</s' +
                'pan>'
              '                  </p>'
              '                </div>'
              '                <!-- /.d-flex -->'
              ''
              '                <div class="position-relative mb-4">'
              
                '                  <canvas id="sales-chart" height="200"></canvas' +
                '>'
              '                </div>'
              ''
              
                '                <div class="d-flex flex-row justify-content-end"' +
                '>'
              '                  <span class="mr-2">'
              
                '                    <i class="fas fa-square text-primary"></i> T' +
                'his year'
              '                  </span>'
              ''
              '                  <span>'
              
                '                    <i class="fas fa-square text-gray"></i> Last' +
                ' year'
              '                  </span>'
              '                </div>'
              '              </div>'
              '            </div>'
              '            <!-- /.card -->')
          end
        end
        object rcBlock100: TUniContainerPanel
          Left = 185
          Top = 51
          Width = 175
          Height = 195
          Hint = '[[cols:xs-12 sm-12 md-3 |'#13#10'noborder-all'#13#10']]'
          ParentColor = False
          TabOrder = 2
          object htmlDoughnut2: TUniHTMLFrame
            AlignWithMargins = True
            Left = 10
            Top = 2
            Width = 150
            Height = 150
            Hint = '[['#13#10'center:parent xy'#13#10']]'
            HTML.Strings = (
              '            <div class="card">'
              '              <div class="card-header border-0">'
              '                <div class="d-flex justify-content-between">'
              '                  <h3 class="card-title">Sales</h3>'
              '                  <a href="javascript:void(0);">View Report</a>'
              '                </div>'
              '              </div>'
              '              <div class="card-body">'
              '                <div class="d-flex">'
              '                  <p class="d-flex flex-column">'
              
                '                    <span class="text-bold text-lg">$18,230.00</' +
                'span>'
              '                    <span>Sales Over Time</span>'
              '                  </p>'
              
                '                  <p class="ml-auto d-flex flex-column text-righ' +
                't">'
              '                    <span class="text-success">'
              '                      <i class="fas fa-arrow-up"></i> 33.1%'
              '                    </span>'
              
                '                    <span class="text-muted">Since last month</s' +
                'pan>'
              '                  </p>'
              '                </div>'
              '                <!-- /.d-flex -->'
              ''
              '                <div class="position-relative mb-4">'
              
                '                  <canvas id="sales-chart" height="200"></canvas' +
                '>'
              '                </div>'
              ''
              
                '                <div class="d-flex flex-row justify-content-end"' +
                '>'
              '                  <span class="mr-2">'
              
                '                    <i class="fas fa-square text-primary"></i> T' +
                'his year'
              '                  </span>'
              ''
              '                  <span>'
              
                '                    <i class="fas fa-square text-gray"></i> Last' +
                ' year'
              '                  </span>'
              '                </div>'
              '              </div>'
              '            </div>'
              '            <!-- /.card -->')
          end
        end
        object rcBlock85: TUniContainerPanel
          Left = 5
          Top = 8
          Width = 335
          Height = 38
          Hint = 
            '[['#13#10'cols:xs-12 sm-12 md-12 |'#13#10'noborder-top|'#13#10'border:b color-silv' +
            'er-light'#13#10']]'
          ParentColor = False
          TabOrder = 3
          DesignSize = (
            335
            38)
          object UniLabel2: TUniLabel
            AlignWithMargins = True
            Left = 5
            Top = 6
            Width = 303
            Height = 27
            Hint = '[['#13#10'cls:rc-label-clear left-center'#13#10']]'#13#10#13#10#13#10
            Margins.Left = 6
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            AutoSize = False
            Caption = 'Projetos Por Trimestre'
            ParentFont = False
            Font.Color = clGray
            Font.Height = -21
            Font.Name = 'Calibri'
            ParentColor = False
            Color = clBtnFace
            TabOrder = 1
          end
          object labRcCollapse60: TUniLabel
            Left = 318
            Top = 8
            Width = 15
            Height = 25
            Hint = '[['#13#10'collapse:rcBlock80 off-50 icons:fas-plus fas-minus'#13#10']]'#13#10
            TextConversion = txtHTML
            Caption = '^'
            Anchors = [akTop, akRight]
            ParentFont = False
            Font.Height = -21
            ParentColor = False
            Color = clBlack
            TabOrder = 2
          end
        end
        object rcBlock110: TUniContainerPanel
          Left = 358
          Top = 51
          Width = 175
          Height = 195
          Hint = '[[cols:xs-12 sm-12 md-3 |'#13#10'noborder-all'#13#10']]'
          ParentColor = False
          TabOrder = 4
          object htmlDoughnut3: TUniHTMLFrame
            AlignWithMargins = True
            Left = 10
            Top = 2
            Width = 150
            Height = 150
            Hint = '[['#13#10'center:parent xy'#13#10']]'
            HTML.Strings = (
              '            <div class="card">'
              '              <div class="card-header border-0">'
              '                <div class="d-flex justify-content-between">'
              '                  <h3 class="card-title">Sales</h3>'
              '                  <a href="javascript:void(0);">View Report</a>'
              '                </div>'
              '              </div>'
              '              <div class="card-body">'
              '                <div class="d-flex">'
              '                  <p class="d-flex flex-column">'
              
                '                    <span class="text-bold text-lg">$18,230.00</' +
                'span>'
              '                    <span>Sales Over Time</span>'
              '                  </p>'
              
                '                  <p class="ml-auto d-flex flex-column text-righ' +
                't">'
              '                    <span class="text-success">'
              '                      <i class="fas fa-arrow-up"></i> 33.1%'
              '                    </span>'
              
                '                    <span class="text-muted">Since last month</s' +
                'pan>'
              '                  </p>'
              '                </div>'
              '                <!-- /.d-flex -->'
              ''
              '                <div class="position-relative mb-4">'
              
                '                  <canvas id="sales-chart" height="200"></canvas' +
                '>'
              '                </div>'
              ''
              
                '                <div class="d-flex flex-row justify-content-end"' +
                '>'
              '                  <span class="mr-2">'
              
                '                    <i class="fas fa-square text-primary"></i> T' +
                'his year'
              '                  </span>'
              ''
              '                  <span>'
              
                '                    <i class="fas fa-square text-gray"></i> Last' +
                ' year'
              '                  </span>'
              '                </div>'
              '              </div>'
              '            </div>'
              '            <!-- /.card -->')
          end
        end
        object rcBlock120: TUniContainerPanel
          Left = 537
          Top = 53
          Width = 175
          Height = 195
          Hint = '[[cols:xs-12 sm-12 md-3 |'#13#10'noborder-all'#13#10']]'
          ParentColor = False
          TabOrder = 5
          object htmlDoughnut4: TUniHTMLFrame
            AlignWithMargins = True
            Left = 10
            Top = 2
            Width = 150
            Height = 150
            Hint = '[['#13#10'center:parent xy'#13#10']]'
            HTML.Strings = (
              '            <div class="card">'
              '              <div class="card-header border-0">'
              '                <div class="d-flex justify-content-between">'
              '                  <h3 class="card-title">Sales</h3>'
              '                  <a href="javascript:void(0);">View Report</a>'
              '                </div>'
              '              </div>'
              '              <div class="card-body">'
              '                <div class="d-flex">'
              '                  <p class="d-flex flex-column">'
              
                '                    <span class="text-bold text-lg">$18,230.00</' +
                'span>'
              '                    <span>Sales Over Time</span>'
              '                  </p>'
              
                '                  <p class="ml-auto d-flex flex-column text-righ' +
                't">'
              '                    <span class="text-success">'
              '                      <i class="fas fa-arrow-up"></i> 33.1%'
              '                    </span>'
              
                '                    <span class="text-muted">Since last month</s' +
                'pan>'
              '                  </p>'
              '                </div>'
              '                <!-- /.d-flex -->'
              ''
              '                <div class="position-relative mb-4">'
              
                '                  <canvas id="sales-chart" height="200"></canvas' +
                '>'
              '                </div>'
              ''
              
                '                <div class="d-flex flex-row justify-content-end"' +
                '>'
              '                  <span class="mr-2">'
              
                '                    <i class="fas fa-square text-primary"></i> T' +
                'his year'
              '                  </span>'
              ''
              '                  <span>'
              
                '                    <i class="fas fa-square text-gray"></i> Last' +
                ' year'
              '                  </span>'
              '                </div>'
              '              </div>'
              '            </div>'
              '            <!-- /.card -->')
          end
        end
      end
      object rcBlock160: TUniContainerPanel
        Tag = 6
        Left = 3
        Top = 351
        Width = 369
        Height = 198
        Hint = 
          '[['#13#10'cols:xs-12 sm-12 md-12 lg-6 xl-6 4k-6 8k-6 | '#13#10'round:all |'#13#10 +
          ']]'
        ParentColor = False
        Color = clWhite
        TabOrder = 6
        object rcBlock170: TUniContainerPanel
          Left = 13
          Top = 8
          Width = 335
          Height = 38
          Hint = 
            '[['#13#10'cols:xs-12 sm-12 md-12 |'#13#10'noborder-top|'#13#10'border:b color-silv' +
            'er-light'#13#10']]'
          ParentColor = False
          TabOrder = 1
          DesignSize = (
            335
            38)
          object UniLabel2Clone: TUniLabel
            AlignWithMargins = True
            Left = 6
            Top = 6
            Width = 267
            Height = 27
            Hint = '[['#13#10'cls:rc-label-clear left-center'#13#10']]'#13#10#13#10#13#10
            Margins.Left = 6
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            AutoSize = False
            Caption = 'Projeto RadPOS'
            ParentFont = False
            Font.Color = clGray
            Font.Height = -21
            Font.Name = 'Calibri'
            ParentColor = False
            Color = clBtnFace
            TabOrder = 1
          end
          object labRcCollapse60Clone: TUniLabel
            Left = 318
            Top = 6
            Width = 15
            Height = 25
            Hint = '[['#13#10'collapse:rcBlock160 off-50 icons:fas-plus fas-minus'#13#10']]'#13#10
            TextConversion = txtHTML
            Caption = '^'
            Anchors = [akTop, akRight]
            ParentFont = False
            Font.Height = -21
            ParentColor = False
            Color = clBlack
            TabOrder = 2
          end
        end
        object rcBlock180: TUniContainerPanel
          Left = 13
          Top = 52
          Width = 335
          Height = 135
          Hint = 
            '[['#13#10'noborder-bottom|'#13#10'noborder-left|'#13#10'noborder-right|'#13#10'scale:par' +
            'ent h:100%-top  |'#13#10']]'#13#10
          ParentColor = False
          AutoScroll = True
          TabOrder = 2
          ScrollHeight = 135
          ScrollWidth = 335
        end
      end
    end
  end
end
