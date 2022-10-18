inherited frmBaseReportMenu: TfrmBaseReportMenu
  OnDestroy = UniFrameDestroy
  AlignmentControl = uniAlignmentServer
  inherited paBaseBackGround: TUniContainerPanel
    AlignWithMargins = True
    Left = 15
    Top = 15
    Width = 990
    Height = 620
    Hint = '[['#13#10'round:all'#13#10']]'
    Margins.Left = 15
    Margins.Top = 15
    Margins.Right = 15
    Margins.Bottom = 15
    Color = clWhite
    AlignmentControl = uniAlignmentServer
    ParentAlignmentControl = False
    ExplicitLeft = 15
    ExplicitTop = 15
    ExplicitWidth = 990
    ExplicitHeight = 620
    inherited paBaseTop: TUniContainerPanel
      Width = 990
      Height = 46
      Hint = '[['#13#10'round:t | '#13#10'cls:card-light'#13#10']]'
      Color = clBtnFace
      ExplicitWidth = 990
      ExplicitHeight = 46
      DesignSize = (
        990
        46)
      object labDownloadReport: TUniLabel
        Left = 946
        Top = 12
        Width = 33
        Height = 26
        Cursor = crHandPoint
        Hint = '[['#13#10'ico:fas-download |'#13#10']]'
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 0
        Margins.Bottom = 4
        Visible = False
        Alignment = taCenter
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'D'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Calibri Light'
        ParentColor = False
        Color = clSilver
        TabOrder = 9
        OnClick = labDownloadReportClick
      end
      object labOptionsReport: TUniLabel
        Left = 946
        Top = 10
        Width = 33
        Height = 26
        Cursor = crHandPoint
        Hint = '[['#13#10'ico:fas-bars |'#13#10']]'
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 0
        Margins.Bottom = 4
        Visible = False
        Alignment = taCenter
        TextConversion = txtHTML
        AutoSize = False
        Caption = '='
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Calibri Light'
        ParentColor = False
        Color = clSilver
        TabOrder = 10
        OnClick = labOptionsReportClick
      end
      object labState: TUniLabel
        AlignWithMargins = True
        Left = 804
        Top = 16
        Width = 176
        Height = 22
        Hint = ''
        Margins.Left = 8
        Margins.Top = 12
        Margins.Right = 8
        Margins.Bottom = 6
        Visible = False
        Alignment = taRightJustify
        TextConversion = txtHTML
        AutoSize = False
        Caption = '[ consultando ]'
        Anchors = [akRight, akBottom]
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentColor = False
        Color = clWhite
        TabOrder = 1
      end
      object btnOptions: TUniBitBtn
        AlignWithMargins = True
        Left = 643
        Top = 5
        Width = 33
        Height = 32
        Hint = '[['#13#10'ico:fas-bars |'#13#10']]'
        Margins.Left = 7
        Margins.Top = 5
        Margins.Right = 6
        Margins.Bottom = 5
        Visible = False
        Caption = '='
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Height = -21
        Font.Name = 'Calibri Light'
        TabOrder = 2
        ScaleButton = False
        OnClick = btnOptionsClick
      end
      object btnExit: TUniBitBtn
        AlignWithMargins = True
        Left = 524
        Top = 5
        Width = 33
        Height = 32
        Hint = '[['#13#10'ico:fas-sign-out-alt rc-mirror-h'#13#10']]'
        Margins.Left = 7
        Margins.Top = 5
        Margins.Right = 10
        Margins.Bottom = 5
        Visible = False
        Caption = '<'
        ParentFont = False
        Font.Height = -21
        Font.Name = 'Calibri Light'
        TabOrder = 3
        ScaleButton = False
        OnClick = btnExitClick
      end
      object btnSaveReport: TUniBitBtn
        AlignWithMargins = True
        Left = 605
        Top = 5
        Width = 33
        Height = 32
        Hint = '[['#13#10'ico:fas-download |'#13#10']]'
        Margins.Left = 7
        Margins.Top = 5
        Margins.Right = 0
        Margins.Bottom = 5
        Enabled = False
        Visible = False
        Caption = 'D'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Height = -21
        Font.Name = 'Calibri Light'
        TabOrder = 4
        ScaleButton = False
        OnClick = btnSaveReportClick
      end
      object btnProcessReport: TUniBitBtn
        AlignWithMargins = True
        Left = 567
        Top = 5
        Width = 33
        Height = 32
        Hint = '[['#13#10'ico:fas-bolt |'#13#10']]'
        Margins.Left = 7
        Margins.Top = 5
        Margins.Right = 0
        Margins.Bottom = 5
        Visible = False
        Caption = '!'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Height = -21
        Font.Name = 'Calibri Light'
        TabOrder = 5
        ScaleButton = False
        ScreenMask.WaitData = True
        ScreenMask.Target = Owner
        OnClick = btnProcessReportClick
      end
      object labTitleForm: TUniLabel
        AlignWithMargins = True
        Left = 53
        Top = 10
        Width = 37
        Height = 26
        Hint = '[['#13#10'caption-dots:mobile-v-16'#13#10']]'
        Margins.Left = 2
        Margins.Top = 6
        Margins.Bottom = 8
        TextConversion = txtHTML
        Caption = 'Title'
        ParentFont = False
        Font.Color = clGray
        Font.Height = -21
        Font.Name = 'Calibri Light'
        ParentColor = False
        Color = clSilver
        TabOrder = 6
      end
      object labExit: TUniLabel
        Left = 8
        Top = 10
        Width = 33
        Height = 26
        Cursor = crHandPoint
        Hint = '[['#13#10'ico:fas-sign-out-alt rc-mirror-h'#13#10']]'
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 0
        Margins.Bottom = 4
        Alignment = taCenter
        TextConversion = txtHTML
        AutoSize = False
        Caption = '<'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Calibri Light'
        ParentColor = False
        Color = clSilver
        TabOrder = 7
        OnClick = labExitClick
      end
      object labShowReport: TUniLabel
        Left = 946
        Top = 12
        Width = 33
        Height = 26
        Cursor = crHandPoint
        Hint = '[['#13#10'ico:fas-bolt |'#13#10']]'
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 0
        Margins.Bottom = 4
        Alignment = taCenter
        TextConversion = txtHTML
        AutoSize = False
        Caption = '!'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Calibri Light'
        ParentColor = False
        Color = clSilver
        TabOrder = 8
        OnClick = labShowReportClick
      end
    end
    object pgBaseCadControl: TUniPageControl
      AlignWithMargins = True
      Left = 4
      Top = 50
      Width = 982
      Height = 566
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ActivePage = tabSearch
      Align = alClient
      TabOrder = 2
      OnChange = pgBaseCadControlChange
      object tabSearch: TUniTabSheet
        Hint = ''
        Caption = 'Op'#231#245'es'
        Font.Height = -13
        Font.Name = 'Calibri'
        ParentFont = False
        object paBaseRegSearch: TUniContainerPanel
          Left = 0
          Top = 0
          Width = 974
          Height = 536
          Hint = ''
          ParentColor = False
          Align = alClient
          TabOrder = 0
          object sbox: TUniScrollBox
            Left = 0
            Top = 0
            Width = 974
            Height = 536
            Hint = ''
            Margins.Left = 0
            Margins.Right = 0
            Align = alClient
            Color = clWhite
            TabOrder = 1
            ScrollHeight = 540
            ScrollWidth = 951
            ScrollY = 4
            object paRelatorioOpcoes: TUniContainerPanel
              AlignWithMargins = True
              Left = 6
              Top = 2
              Width = 0
              Height = 15
              Hint = ''
              Margins.Right = 0
              Visible = False
              ParentColor = False
              Color = 15395562
              TabOrder = 0
            end
            object paReportFilters: TUniContainerPanel
              AlignWithMargins = True
              Left = 12
              Top = 5
              Width = 0
              Height = 8
              Hint = ''
              Margins.Left = 0
              ParentColor = False
              Color = 15395562
              TabOrder = 1
            end
            object rcBlock80: TUniContainerPanel
              Tag = 1
              Left = 8
              Top = 136
              Width = 395
              Height = 400
              Hint = 
                '[['#13#10'cols:xs-12 sm-12 md-5 |'#13#10'round:no | '#13#10'cls:card-info-box-whit' +
                'e |'#13#10']]'#13#10
              ParentColor = False
              TabOrder = 2
              object UniContainerPanel3: TUniContainerPanel
                Left = 0
                Top = 0
                Width = 395
                Height = 38
                Hint = '[[round:t | cls:card-light]]'
                ParentColor = False
                Color = clSilver
                Align = alTop
                TabOrder = 1
                object UniLabel3: TUniLabel
                  AlignWithMargins = True
                  Left = 6
                  Top = 0
                  Width = 389
                  Height = 38
                  Hint = '[[bsh5:|cls:left-center]]'
                  Margins.Left = 6
                  Margins.Top = 0
                  Margins.Right = 0
                  Margins.Bottom = 0
                  AutoSize = False
                  Caption = 'Op'#231#245'es de Relat'#243'rio'
                  Align = alClient
                  ParentFont = False
                  Font.Color = clGray
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  TabOrder = 1
                end
              end
              object paOpcoes: TUniPanel
                AlignWithMargins = True
                Left = 1
                Top = 39
                Width = 393
                Height = 360
                Hint = '[[round:no | cls:card-info-box-white]]'
                Margins.Left = 1
                Margins.Top = 1
                Margins.Right = 1
                Margins.Bottom = 1
                Align = alClient
                TabOrder = 2
                BorderStyle = ubsNone
                Caption = ''
                Color = clWhite
                DesignSize = (
                  393
                  360)
                object lbxReportOptions: TUniListBox
                  AlignWithMargins = True
                  Left = 5
                  Top = 6
                  Width = 382
                  Height = 329
                  Hint = ''
                  Margins.Left = 5
                  Margins.Top = 6
                  Margins.Right = 6
                  Margins.Bottom = 25
                  Align = alClient
                  TabOrder = 1
                  BorderStyle = ubsNone
                  OnChange = lbxReportOptionsChange
                end
                object chkReportGreenBar: TUniCheckBox
                  Left = 11
                  Top = 333
                  Width = 90
                  Height = 22
                  Hint = ''
                  Checked = True
                  Caption = 'Zebrado'
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  Anchors = [akLeft, akBottom]
                  TabOrder = 2
                  Color = clWhite
                end
                object chkReportHeader: TUniCheckBox
                  Left = 115
                  Top = 333
                  Width = 108
                  Height = 22
                  Hint = ''
                  Caption = 'Sem Cabe'#231'alho'
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  Anchors = [akLeft, akBottom]
                  TabOrder = 3
                  Color = clWhite
                end
              end
            end
            object rcBlock10: TUniContainerPanel
              Tag = 1
              Left = 8
              Top = 11
              Width = 708
              Height = 118
              Hint = 
                '[['#13#10'cols:xs-12 sm-12 md-12 |'#13#10'hr-childs:xs-exp sm-exp md-fix | '#13 +
                #10'round:no | '#13#10'cls:card-info-box-white'#13#10']]'#13#10#13#10
              Enabled = False
              Visible = False
              ParentColor = False
              Color = clWhite
              TabOrder = 3
              object rcBlock3: TUniContainerPanel
                Left = 0
                Top = 0
                Width = 708
                Height = 38
                Hint = '[['#13#10'cols:12 |'#13#10'round:t | '#13#10'cls:card-light'#13#10']]'
                ParentColor = False
                Color = clSilver
                Align = alTop
                TabOrder = 1
                object UniLabel1: TUniLabel
                  AlignWithMargins = True
                  Left = 6
                  Top = 0
                  Width = 702
                  Height = 38
                  Hint = '[[bsh5:|cls:left-center]]'
                  Margins.Left = 6
                  Margins.Top = 0
                  Margins.Right = 0
                  Margins.Bottom = 0
                  AutoSize = False
                  Caption = 'Filtrar por Per'#237'odo'
                  Align = alClient
                  ParentFont = False
                  Font.Color = clGray
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  TabOrder = 1
                end
              end
              object rcBlock15: TUniContainerPanel
                Tag = 1
                Left = 13
                Top = 51
                Width = 161
                Height = 53
                Hint = '[['#13#10'cols:xs-12 sm-12 md-4 |'#13#10'noborder-top'#13#10']]'
                ParentColor = False
                Color = clWhite
                TabOrder = 2
                DesignSize = (
                  161
                  53)
                object labReportPeriod: TUniLabel
                  AlignWithMargins = True
                  Left = 0
                  Top = 1
                  Width = 148
                  Height = 15
                  Hint = ''
                  AutoSize = False
                  Caption = 'Per'#237'odo Pr'#233'-Definido'
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  TabOrder = 1
                end
                object cbxSearchCRUDPeriod: TUniComboBox
                  AlignWithMargins = True
                  Left = 1
                  Top = 22
                  Width = 159
                  Height = 29
                  Hint = ''
                  Margins.Right = 5
                  Text = ''
                  Items.Strings = (
                    ''
                    'Hoje'
                    'Ontem'
                    'Antes de Ontem'
                    'Amanh'#227
                    'Depois de Amanh'#227
                    'Essa Semana'
                    'Semana Passada'
                    'Pr'#243'xima Semana'
                    'Essa Quinzena'
                    'Quinzena Passada'
                    'Pr'#243'xima Quinzena'
                    'Esse M'#234's'
                    'M'#234's Passado'
                    'Pr'#243'ximo M'#234's'
                    'Nesse Bimestre'
                    'Nesse Trimestre'
                    'Nesse Semestre'
                    'Nesse Ano'
                    'Ano Passado'
                    'Processar Tudo'
                    'Processar Tudo: At'#233' Hoje')
                  ItemIndex = 1
                  Anchors = [akLeft, akTop, akRight]
                  ParentFont = False
                  Font.Name = 'Calibri'
                  TabOrder = 2
                  IconItems = <>
                  OnChange = cbxSearchCRUDPeriodChange
                end
              end
              object rcBlock20: TUniContainerPanel
                Tag = 1
                Left = 181
                Top = 51
                Width = 161
                Height = 53
                Hint = '[['#13#10'cols:xs-12 sm-12 md-4 '#13#10']]'#13#10
                ParentColor = False
                Color = clWhite
                TabOrder = 3
                DesignSize = (
                  161
                  53)
                object labReportFieldFilter: TUniLabel
                  AlignWithMargins = True
                  Left = 0
                  Top = 1
                  Width = 137
                  Height = 15
                  Hint = ''
                  AutoSize = False
                  Caption = 'Filtrar Campo Data...'
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  TabOrder = 1
                end
                object cbxSearchCRUDFieldDate: TUniComboBox
                  AlignWithMargins = True
                  Left = 1
                  Top = 22
                  Width = 159
                  Height = 29
                  Hint = ''
                  Margins.Right = 5
                  Text = ''
                  Anchors = [akLeft, akTop, akRight]
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  TabOrder = 2
                  IconItems = <>
                  OnChange = cbxSearchCRUDFieldDateChange
                end
                object cbxSearchCRUDFieldDate_Fields: TUniComboBox
                  AlignWithMargins = True
                  Left = 116
                  Top = 1
                  Width = 34
                  Height = 23
                  Hint = ''
                  Visible = False
                  Text = ''
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  TabOrder = 3
                  IconItems = <>
                end
              end
              object rcBlock25: TUniContainerPanel
                Tag = 1
                Left = 355
                Top = 51
                Width = 161
                Height = 53
                Hint = '[['#13#10'cols:xs-12 sm-12 md-2 '#13#10']]'
                ParentColor = False
                Color = clWhite
                TabOrder = 4
                DesignSize = (
                  161
                  53)
                object labDtIni: TUniLabel
                  AlignWithMargins = True
                  Left = 0
                  Top = 1
                  Width = 106
                  Height = 15
                  Hint = ''
                  AutoSize = False
                  Caption = 'Data Inicial'
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  TabOrder = 1
                end
                object edSearchCRUDDtIni: TUniEdit
                  Left = 1
                  Top = 22
                  Width = 159
                  Height = 29
                  Hint = ''
                  Text = ''
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 2
                  InputMask.Mask = '99/99/9999'
                  InputType = 'text'
                end
              end
              object rcBlock30: TUniContainerPanel
                Tag = 1
                Left = 531
                Top = 51
                Width = 161
                Height = 53
                Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
                ParentColor = False
                Color = clWhite
                TabOrder = 5
                DesignSize = (
                  161
                  53)
                object labDtFim: TUniLabel
                  AlignWithMargins = True
                  Left = 0
                  Top = 1
                  Width = 109
                  Height = 15
                  Hint = ''
                  AutoSize = False
                  Caption = 'Data Final'
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  TabOrder = 1
                end
                object edSearchCRUDDtEnd: TUniEdit
                  Left = 1
                  Top = 22
                  Width = 159
                  Height = 29
                  Hint = ''
                  Text = ''
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 2
                  InputMask.Mask = '99/99/9999'
                  InputType = 'text'
                end
              end
              object cbxModelReport_form: TUniComboBox
                AlignWithMargins = True
                Left = 580
                Top = 29
                Width = 76
                Height = 23
                Hint = ''
                Visible = False
                Text = ''
                ParentFont = False
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 6
                IconItems = <>
              end
            end
            object rcBlock100: TUniContainerPanel
              Tag = 1
              Left = 414
              Top = 136
              Width = 537
              Height = 400
              Hint = 
                '[['#13#10'cols:xs-12 sm-12 md-7 |'#13#10'hr-childs:xs-exp sm-exp md-fix | '#13#10 +
                'round:no | '#13#10'cls:card-info-box-white |'#13#10']]'#13#10
              ParentColor = False
              TabOrder = 4
              object paRepFilters: TUniPanel
                AlignWithMargins = True
                Left = 1
                Top = 3
                Width = 8
                Height = 12
                Hint = '[[round:no | cls:card-info-box-white]]'
                Margins.Left = 1
                Margins.Top = 1
                Margins.Right = 1
                Margins.Bottom = 1
                Visible = False
                TabOrder = 1
                BorderStyle = ubsNone
                Caption = ''
                Color = clWhite
              end
              object rcBlock110: TUniContainerPanel
                Left = 0
                Top = 0
                Width = 537
                Height = 38
                Hint = '[['#13#10'cols:12 |'#13#10'round:t | '#13#10'cls:card-light'#13#10']]'#13#10
                ParentColor = False
                Color = clSilver
                Align = alTop
                TabOrder = 2
                object UniLabel2: TUniLabel
                  AlignWithMargins = True
                  Left = 6
                  Top = 0
                  Width = 531
                  Height = 38
                  Hint = '[[bsh5:|cls:left-center]]'
                  Margins.Left = 6
                  Margins.Top = 0
                  Margins.Right = 0
                  Margins.Bottom = 0
                  AutoSize = False
                  Caption = 'Outras Op'#231#245'es'
                  Align = alClient
                  ParentFont = False
                  Font.Color = clGray
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  TabOrder = 1
                end
              end
            end
            object paReportPeriod: TUniPanel
              Left = 3
              Top = -3
              Width = 0
              Height = 18
              Hint = '[[round:no | cls:card-info-box-white]]'
              Margins.Left = 5
              Margins.Top = 0
              Margins.Right = 5
              Margins.Bottom = 5
              Visible = False
              TabOrder = 5
              BorderStyle = ubsNone
              Caption = ''
              Color = clWhite
            end
            object paOutrasOpcoes: TUniPanel
              AlignWithMargins = True
              Left = 5
              Top = 2
              Width = 1
              Height = 14
              Hint = '[[round:no | cls:card-info-box-white]]'
              Margins.Left = 5
              Margins.Top = 0
              Margins.Right = 5
              Margins.Bottom = 5
              Visible = False
              TabOrder = 6
              BorderStyle = ubsNone
              Caption = ''
              Color = clWhite
              object UniListBox1: TUniListBox
                AlignWithMargins = True
                Left = -2
                Top = 0
                Width = 0
                Height = 52
                Hint = ''
                Margins.Left = 5
                Margins.Top = 0
                Margins.Right = 6
                Margins.Bottom = 5
                TabOrder = 1
                BorderStyle = ubsNone
                OnChange = lbxReportOptionsChange
              end
            end
          end
        end
      end
      object tabReport: TUniTabSheet
        Hint = ''
        Caption = 'Relat'#243'rio'
        Font.Height = -13
        Font.Name = 'Calibri'
        ParentFont = False
        object paBaseRegData1: TUniContainerPanel
          Left = 0
          Top = 0
          Width = 974
          Height = 536
          Hint = ''
          ParentColor = False
          Align = alClient
          TabOrder = 0
          object UniURLFrameReport: TUniURLFrame
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 968
            Height = 530
            Hint = ''
            Align = alClient
            TabOrder = 1
            ParentColor = False
            Color = clBtnFace
          end
        end
      end
    end
  end
  object UniHTMLFrame1: TUniHTMLFrame [2]
    Left = 692
    Top = 0
    Width = 15
    Height = 39
    Hint = ''
    Visible = False
  end
  object ed_Table_ItemSel: TUniEdit [3]
    Left = 573
    Top = -10
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 3
  end
  object ed_FormOrigin: TUniEdit [4]
    Left = 593
    Top = -10
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 4
  end
  object ed_FormOrigin_Tab: TUniEdit [5]
    Left = 613
    Top = -10
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 5
  end
  object ed_Table_Status: TUniEdit [6]
    Left = 634
    Top = -10
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 6
  end
  object ed_Order_Search: TUniEdit [7]
    Left = 655
    Top = -10
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 7
  end
  object ed_Where_Search: TUniEdit [8]
    Left = 675
    Top = -10
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 8
  end
  object ed_CodMaster: TUniEdit [9]
    Left = 693
    Top = -10
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 9
  end
  object ed_PK: TUniEdit [10]
    Left = 711
    Top = -10
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 10
  end
  object ed_FieldMasks: TUniEdit [11]
    Left = 728
    Top = -10
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 11
  end
  object ed_OldPKValue: TUniEdit [12]
    Left = 747
    Top = -10
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 12
  end
  object ed_Table_Status_OLD: TUniEdit [13]
    Left = 764
    Top = -10
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 13
  end
  object ed_GenNextID_OnNew: TUniEdit [14]
    Left = 782
    Top = -10
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 14
  end
  object ed_AskNewRec_AfterPost: TUniEdit [15]
    Left = 799
    Top = -10
    Width = 15
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 15
  end
  object dsMaster: TDataSource
    AutoEdit = False
    DataSet = sqlMaster
    OnStateChange = dsMasterStateChange
    Left = 922
    Top = 399
  end
  object dsSearchMaster: TDataSource
    AutoEdit = False
    DataSet = sqlSearchMaster
    Left = 924
    Top = 495
  end
  object sqlSearchMaster: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    FormatOptions.AssignedValues = [fvFmtDisplayDateTime, fvFmtDisplayDate, fvFmtDisplayNumeric, fvStrsTrim2Len]
    SQL.Strings = (
      '')
    Left = 925
    Top = 449
  end
  object sqlMaster: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    SQL.Strings = (
      'select * '
      'from tb_reports'
      'where codigo = :table_pk')
    Left = 925
    Top = 349
    ParamData = <
      item
        Name = 'TABLE_PK'
        ParamType = ptInput
      end>
  end
  object popMenuOptions: TUniPopupMenu
    Left = 464
    Top = 598
  end
  object mem_Master: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 924
    Top = 286
  end
end
