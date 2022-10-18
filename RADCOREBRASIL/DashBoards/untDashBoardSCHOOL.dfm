object frmDashboardSCHOOL: TfrmDashboardSCHOOL
  Left = 0
  Top = 0
  Width = 854
  Height = 602
  OnCreate = UniFrameCreate
  OnReady = UniFrameReady
  ParentAlignmentControl = False
  AlignmentControl = uniAlignmentClient
  TabOrder = 0
  object sboxSchool: TUniScrollBox
    Left = 0
    Top = 0
    Width = 854
    Height = 602
    Hint = ''
    Align = alClient
    Color = 15395562
    TabOrder = 0
    ScrollHeight = 465
    ScrollWidth = 746
    object rcBlock30: TUniContainerPanel
      Tag = 2
      Left = 196
      Top = 8
      Width = 170
      Height = 123
      Hint = 
        '[['#13#10'cols:xs-12 sm-6 md-6 lg-3 xl-3 |'#13#10'cls:card-info-box-white rc' +
        '-hover-zoom-1-1|'#13#10'round:no |'#13#10']]'#13#10#13#10
      CreateOrder = 1
      ParentColor = False
      Color = clWhite
      TabOrder = 0
      DesignSize = (
        170
        123)
      object UniLabel3: TUniLabel
        Left = 95
        Top = 11
        Width = 65
        Height = 15
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Alunos'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Color = clGray
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniLabel4: TUniLabel
        Left = 70
        Top = 25
        Width = 90
        Height = 36
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = '544'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -29
        Font.Name = 'Calibri'
        TabOrder = 2
      end
      object UniContainerPanel2: TUniContainerPanel
        Left = 2
        Top = 6
        Width = 67
        Height = 59
        Hint = ''
        ParentColor = False
        TabOrder = 3
        object UniLabel21: TUniLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 61
          Height = 53
          Hint = 
            '[['#13#10'ico-stack:fas-user-graduate cls:color-blue-light size:1x typ' +
            'e:square|'#13#10'center:parent x'#13#10']]'#13#10#13#10#13#10
          TextConversion = txtHTML
          AutoSize = False
          Caption = 'Aluno Ico'
          Align = alClient
          ParentFont = False
          Font.Color = 15258267
          Font.Height = -24
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 1
        end
      end
      object UniLabel11: TUniLabel
        Left = 6
        Top = 89
        Width = 65
        Height = 15
        Hint = ''
        AutoSize = False
        Caption = 'Atualizado'
        ParentFont = False
        Font.Color = clGray
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 4
      end
      object UniLabel22: TUniLabel
        Left = 6
        Top = 102
        Width = 65
        Height = 15
        Hint = ''
        AutoSize = False
        Caption = 'Ontem'
        ParentFont = False
        Font.Color = clGray
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 5
      end
      object UniContainerPanel5: TUniContainerPanel
        Left = 94
        Top = 93
        Width = 70
        Height = 24
        Hint = '[['#13#10'round:all|'#13#10'cls:bg-blue'#13#10']]'
        ParentColor = False
        Color = 15183418
        Anchors = [akTop, akRight]
        TabOrder = 6
        object UniLabel23: TUniLabel
          Left = 35
          Top = 4
          Width = 30
          Height = 18
          Hint = '[['#13#10'cls:rc-label-clear | '#13#10']]'
          Alignment = taCenter
          AutoSize = False
          Caption = '13%'
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 1
        end
        object UniLabel24: TUniLabel
          Left = 0
          Top = 4
          Width = 30
          Height = 18
          Hint = '[['#13#10'ico:fas-caret-up |'#13#10']]'
          Alignment = taCenter
          AutoSize = False
          Caption = '^'
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 2
        end
      end
      object UniSimplePanel1: TUniSimplePanel
        Left = 6
        Top = 78
        Width = 158
        Height = 6
        Hint = '[['#13#10'border:t color-silver-light'#13#10']]'
        ParentColor = False
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 7
      end
    end
    object rcBlock25: TUniContainerPanel
      Tag = 2
      Left = 12
      Top = 8
      Width = 170
      Height = 123
      Hint = 
        '[['#13#10'cols:xs-12 sm-6 md-6 lg-3 xl-3 |'#13#10'cls:card-info-box-white rc' +
        '-hover-zoom-1-1|'#13#10'round:no |'#13#10']]'#13#10#13#10
      ParentColor = False
      Color = clWhite
      TabOrder = 1
      DesignSize = (
        170
        123)
      object UniLabel6: TUniLabel
        Left = 70
        Top = 25
        Width = 90
        Height = 36
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = '34'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -29
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniLabel7: TUniLabel
        Left = 95
        Top = 11
        Width = 65
        Height = 15
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Professores'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Color = clGray
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
      object UniContainerPanel1: TUniContainerPanel
        Left = 2
        Top = 6
        Width = 67
        Height = 59
        Hint = ''
        ParentColor = False
        TabOrder = 3
        object UniLabel5: TUniLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 61
          Height = 53
          Hint = 
            '[['#13#10'ico-stack:fas-chalkboard-teacher cls:color-green-light size:' +
            '1x type:square|'#13#10'center:parent x'#13#10']]'#13#10#13#10#13#10
          TextConversion = txtHTML
          AutoSize = False
          Caption = 'Prof Ico'
          Align = alClient
          ParentFont = False
          Font.Color = 12573632
          Font.Height = -24
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 1
        end
      end
      object UniLabel25: TUniLabel
        Left = 6
        Top = 89
        Width = 65
        Height = 15
        Hint = ''
        AutoSize = False
        Caption = 'Escolhido'
        ParentFont = False
        Font.Color = clGray
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 4
      end
      object UniLabel26: TUniLabel
        Left = 6
        Top = 102
        Width = 65
        Height = 15
        Hint = ''
        AutoSize = False
        Caption = 'do M'#234's'
        ParentFont = False
        Font.Color = clGray
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 5
      end
      object UniSimplePanel2: TUniSimplePanel
        Left = 6
        Top = 78
        Width = 158
        Height = 6
        Hint = '[['#13#10'border:t color-silver-light'#13#10']]'
        ParentColor = False
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 6
      end
      object UniContainerPanel6: TUniContainerPanel
        Left = 94
        Top = 93
        Width = 70
        Height = 24
        Hint = '[['#13#10'round:all|'#13#10'cls:bg-green'#13#10']]'
        ParentColor = False
        Color = 7325811
        Anchors = [akTop, akRight]
        TabOrder = 7
        DesignSize = (
          70
          24)
        object UniLabel31: TUniLabel
          Left = 1
          Top = 4
          Width = 68
          Height = 18
          Hint = '[['#13#10'cls:rc-label-clear | '#13#10']]'
          Alignment = taCenter
          AutoSize = False
          Caption = 'Fl'#225'vio'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 1
        end
      end
    end
    object rcBlock35: TUniContainerPanel
      Tag = 2
      Left = 381
      Top = 8
      Width = 170
      Height = 123
      Hint = 
        '[['#13#10'cols:xs-12 sm-6 md-6 lg-3 xl-3 |'#13#10'cls:card-info-box-white rc' +
        '-hover-zoom-1-1|'#13#10'round:no |'#13#10']]'#13#10#13#10
      ParentColor = False
      Color = clWhite
      TabOrder = 2
      DesignSize = (
        170
        123)
      object UniLabel9: TUniLabel
        Left = 64
        Top = 11
        Width = 96
        Height = 15
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Colaboradores'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Color = clGray
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniLabel10: TUniLabel
        Left = 70
        Top = 25
        Width = 90
        Height = 36
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = '132'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -29
        Font.Name = 'Calibri'
        TabOrder = 2
      end
      object UniContainerPanel3: TUniContainerPanel
        Left = 2
        Top = 6
        Width = 67
        Height = 59
        Hint = ''
        ParentColor = False
        TabOrder = 3
        object UniLabel1: TUniLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 61
          Height = 53
          Hint = 
            '[['#13#10'ico-stack:fas-users cls:color-orange-light size:1x type:squa' +
            're|'#13#10'center:parent x'#13#10']]'#13#10#13#10#13#10
          TextConversion = txtHTML
          AutoSize = False
          Caption = 'Colab Ico'
          Align = alClient
          ParentFont = False
          Font.Color = 6727914
          Font.Height = -24
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 1
        end
      end
      object UniLabel27: TUniLabel
        Left = 6
        Top = 89
        Width = 65
        Height = 15
        Hint = ''
        AutoSize = False
        Caption = 'Aniv.'
        ParentFont = False
        Font.Color = clGray
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 4
      end
      object UniLabel28: TUniLabel
        Left = 6
        Top = 102
        Width = 65
        Height = 15
        Hint = ''
        AutoSize = False
        Caption = 'do M'#234's'
        ParentFont = False
        Font.Color = clGray
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 5
      end
      object UniSimplePanel3: TUniSimplePanel
        Left = 6
        Top = 78
        Width = 158
        Height = 6
        Hint = '[['#13#10'border:t color-silver-light'#13#10']]'
        ParentColor = False
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 6
      end
      object UniContainerPanel7: TUniContainerPanel
        Left = 94
        Top = 93
        Width = 70
        Height = 24
        Hint = '[['#13#10'round:all|'#13#10'cls:bg-orange'#13#10']]'
        ParentColor = False
        Color = 2071518
        Anchors = [akTop, akRight]
        TabOrder = 7
        DesignSize = (
          70
          24)
        object UniLabel32: TUniLabel
          Left = 1
          Top = 4
          Width = 68
          Height = 18
          Hint = '[['#13#10'cls:rc-label-clear | '#13#10']]'
          Alignment = taCenter
          AutoSize = False
          Caption = 'L'#250'cio'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 1
        end
      end
    end
    object rcBlock40: TUniContainerPanel
      Tag = 2
      Left = 567
      Top = 8
      Width = 172
      Height = 123
      Hint = 
        '[['#13#10'cols:xs-12 sm-6 md-6 lg-3 xl-3 |'#13#10'cls:card-info-box-white rc' +
        '-hover-zoom-1-1|'#13#10'round:no |'#13#10']]'#13#10#13#10
      ParentColor = False
      Color = clWhite
      TabOrder = 3
      DesignSize = (
        172
        123)
      object UniLabel12: TUniLabel
        Left = 95
        Top = 11
        Width = 65
        Height = 15
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Cursos'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Color = clGray
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniLabel13: TUniLabel
        Left = 70
        Top = 25
        Width = 90
        Height = 36
        Hint = ''
        Alignment = taRightJustify
        AutoSize = False
        Caption = '25'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -29
        Font.Name = 'Calibri'
        TabOrder = 2
      end
      object UniContainerPanel4: TUniContainerPanel
        Left = 2
        Top = 6
        Width = 67
        Height = 59
        Hint = ''
        ParentColor = False
        TabOrder = 3
        object UniLabel8: TUniLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 61
          Height = 53
          Hint = 
            '[['#13#10'ico-stack:fas-chalkboard cls:color-purple-light size:1x type' +
            ':square|'#13#10'center:parent x'#13#10']]'#13#10#13#10#13#10
          TextConversion = txtHTML
          AutoSize = False
          Caption = 'Cursos Ico'
          Align = alClient
          ParentFont = False
          Font.Color = 15632584
          Font.Height = -24
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 1
        end
      end
      object UniLabel29: TUniLabel
        Left = 6
        Top = 89
        Width = 65
        Height = 15
        Hint = ''
        AutoSize = False
        Caption = 'Mais'
        ParentFont = False
        Font.Color = clGray
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 4
      end
      object UniLabel30: TUniLabel
        Left = 6
        Top = 102
        Width = 65
        Height = 15
        Hint = ''
        AutoSize = False
        Caption = 'Popular'
        ParentFont = False
        Font.Color = clGray
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 5
      end
      object UniSimplePanel4: TUniSimplePanel
        Left = 6
        Top = 78
        Width = 158
        Height = 6
        Hint = '[['#13#10'border:t color-silver-light'#13#10']]'
        ParentColor = False
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 6
      end
      object UniContainerPanel8: TUniContainerPanel
        Left = 94
        Top = 93
        Width = 70
        Height = 24
        Hint = '[['#13#10'round:all|'#13#10'cls:bg-purple|'#13#10']]'
        ParentColor = False
        Color = 15632584
        Anchors = [akTop, akRight]
        TabOrder = 7
        DesignSize = (
          70
          24)
        object UniLabel33: TUniLabel
          Left = 1
          Top = 4
          Width = 68
          Height = 18
          Hint = '[['#13#10'cls:rc-label-clear | '#13#10']]'
          Alignment = taCenter
          AutoSize = False
          Caption = 'RadCORE'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentColor = False
          Color = clBtnFace
          TabOrder = 1
        end
      end
    end
    object rcBlock80: TUniContainerPanel
      Tag = 6
      Left = 377
      Top = 150
      Width = 369
      Height = 315
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-12 lg-6 xl-6 4k-6 8k-6 | '#13#10'round:all |'#13#10 +
        ']]'
      ParentColor = False
      Color = clWhite
      TabOrder = 4
      object rcBlock85: TUniContainerPanel
        Left = 13
        Top = 8
        Width = 335
        Height = 46
        Hint = 
          '[['#13#10'cols:xs-12 sm-12 md-12 |'#13#10'noborder-top|'#13#10'border:b color-silv' +
          'er-light'#13#10']]'
        ParentColor = False
        TabOrder = 1
        DesignSize = (
          335
          46)
        object UniLabel2: TUniLabel
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
          Caption = 'Melhores Alunos'
          ParentFont = False
          Font.Color = clGray
          Font.Height = -24
          Font.Name = 'Calibri'
          ParentColor = False
          Color = clBtnFace
          TabOrder = 1
        end
        object labRcCollapse60: TUniLabel
          Left = 318
          Top = 10
          Width = 15
          Height = 25
          Hint = '[['#13#10'collapse:rcBlock50 off-50 icons:fas-plus fas-minus'#13#10']]'#13#10
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
      object rcBlock90: TUniContainerPanel
        Left = 13
        Top = 68
        Width = 335
        Height = 240
        Hint = 
          '[['#13#10'noborder-bottom|'#13#10'noborder-left|'#13#10'noborder-right|'#13#10'scale:par' +
          'ent h:100%-top  |'#13#10']]'#13#10
        ParentColor = False
        AutoScroll = True
        TabOrder = 2
        ScrollHeight = 240
        ScrollWidth = 335
      end
    end
    object rcBlock50: TUniContainerPanel
      Tag = 2
      Left = 14
      Top = 150
      Width = 351
      Height = 315
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-12 lg-6 xl-6 4k-6 8k-6 | '#13#10'round:all |'#13#10 +
        ']]'
      ParentColor = False
      Color = clWhite
      TabOrder = 5
      object rcBlock70: TUniContainerPanel
        Left = 16
        Top = 67
        Width = 218
        Height = 232
        Hint = '[['#13#10'cols:xs-12 sm-12 md-8 |'#13#10']]'
        ParentColor = False
        TabOrder = 1
        object htmlDoughnut1: TUniHTMLFrame
          AlignWithMargins = True
          Left = 2
          Top = 2
          Width = 150
          Height = 150
          Hint = '[['#13#10'center:parent xy'#13#10']]'
        end
      end
      object rcBlock60: TUniContainerPanel
        Left = 5
        Top = 8
        Width = 335
        Height = 46
        Hint = 
          '[['#13#10'cols:xs-12 sm-12 md-12 |'#13#10'noborder-top|'#13#10'border:b color-silv' +
          'er-light'#13#10']]'
        ParentColor = False
        TabOrder = 2
        DesignSize = (
          335
          46)
        object UniLabel14: TUniLabel
          AlignWithMargins = True
          Left = 5
          Top = 8
          Width = 303
          Height = 27
          Hint = '[['#13#10'cls:rc-label-clear left-center'#13#10']]'#13#10#13#10#13#10
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = False
          Caption = 'Melhores Professores'
          ParentFont = False
          Font.Color = clGray
          Font.Height = -24
          Font.Name = 'Calibri'
          ParentColor = False
          Color = clBtnFace
          TabOrder = 1
        end
        object UniLabel15: TUniLabel
          Left = 318
          Top = 10
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
    end
  end
end
