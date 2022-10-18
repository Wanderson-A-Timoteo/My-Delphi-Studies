object MainForm: TMainForm
  Left = 0
  Top = 0
  Width = 1111
  Height = 718
  Caption = 'MainForm'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnKeyDown = UniFormKeyDown
  Script.Strings = (
    ''
    '')
  KeyPreview = True
  AutoScroll = True
  NavigateKeys.Enabled = True
  NavigateKeys.Prior.Key = 13
  NavigateKeys.Prior.ShiftState = [ussShift]
  NavigateKeys.Next.Key = 13
  NavigateKeys.SelectText = True
  MonitoredKeys.Keys = <>
  AlignmentControl = uniAlignmentClient
  ScreenMask.WaitData = True
  ScreenMask.Target = Owner
  OnReady = UniFormReady
  OnBeforeShow = UniFormBeforeShow
  OnAfterShow = UniFormAfterShow
  OnCreate = UniFormCreate
  OnScreenResize = UniFormScreenResize
  PixelsPerInch = 96
  TextHeight = 13
  object sboxMain: TUniScrollBox
    Left = 0
    Top = 0
    Width = 1095
    Height = 679
    Hint = ''
    Align = alClient
    TabOrder = 0
    ScrollHeight = 677
    ScrollWidth = 1093
    object paBackGround: TUniContainerPanel
      Left = 260
      Top = 0
      Width = 833
      Height = 677
      Hint = ''
      ParentColor = False
      Color = 15395562
      TabOrder = 0
      object pgGeneral: TUniPageControl
        Left = 0
        Top = 98
        Width = 833
        Height = 579
        Hint = ''
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        ActivePage = tabDashBoard
        Align = alClient
        TabOrder = 1
        ScreenMask.WaitData = True
        ScreenMask.Target = sboxMain
        OnChangeValue = pgGeneralChangeValue
        object tabDashBoard: TUniTabSheet
          Hint = ''
          Caption = '<i class="fa fa-home fa-1x"></i>'
          object paGeral: TUniContainerPanel
            Left = 0
            Top = 0
            Width = 825
            Height = 551
            Hint = ''
            ParentColor = False
            Color = clWhite
            Align = alClient
            TabOrder = 0
            object sboxGridBlock: TUniScrollBox
              Left = 0
              Top = 0
              Width = 825
              Height = 551
              Hint = ''
              Align = alClient
              TabOrder = 1
            end
          end
        end
      end
      object paLayoutTopo: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 833
        Height = 44
        Hint = ''
        ParentColor = False
        Color = 1447446
        Align = alTop
        TabOrder = 2
        DesignSize = (
          833
          44)
        object labbtnExit: TUniLabel
          AlignWithMargins = True
          Left = 793
          Top = 13
          Width = 30
          Height = 28
          Cursor = crHandPoint
          Hint = '[['#13#10'ico:fas-power-off |'#13#10'cls:rc-hover-zoom-1-2'#13#10']]'
          Margins.Left = 0
          Margins.Top = 13
          Margins.Right = 10
          CreateOrder = 1
          Alignment = taCenter
          TextConversion = txtHTML
          AutoSize = False
          Caption = 'Off'
          Anchors = [akTop, akRight]
          ParentFont = False
          Font.Color = 15724527
          Font.Height = -16
          TabOrder = 1
          OnClick = labbtnExitClick
        end
        object btnCfg: TUniLabel
          AlignWithMargins = True
          Left = 750
          Top = 13
          Width = 30
          Height = 28
          Cursor = crHandPoint
          Hint = '[['#13#10'hide:mobile-v | '#13#10'ico:fas-cogs |'#13#10'cls:rc-hover-zoom-1-2'#13#10']]'
          Margins.Left = 0
          Margins.Top = 13
          Margins.Right = 10
          CreateOrder = 1
          Alignment = taCenter
          TextConversion = txtHTML
          AutoSize = False
          Caption = 'Cfg'
          Anchors = [akTop, akRight]
          ParentFont = False
          Font.Color = 15724527
          Font.Height = -16
          TabOrder = 2
          OnClick = btnCfgClick
        end
        object btnNotifications: TUniLabel
          AlignWithMargins = True
          Left = 706
          Top = 13
          Width = 34
          Height = 28
          Cursor = crHandPoint
          Hint = 
            '[['#13#10'hide:mobile-v | '#13#10'ico:fas-envelope | '#13#10'cls:align-label-left-' +
            'center rc-hover-zoom-1-2 | '#13#10'cls-caption:badge bg-warning | '#13#10'ap' +
            'pend '#13#10']]'#13#10
          Margins.Top = 13
          Margins.Right = 10
          CreateOrder = 1
          TextConversion = txtHTML
          AutoSize = False
          Caption = '3'
          Anchors = [akTop, akRight]
          ParentFont = False
          Font.Color = 15724527
          Font.Height = -16
          TabOrder = 3
          OnClick = btnNotificationsClick
        end
        object btnMenu: TUniLabel
          AlignWithMargins = True
          Left = 7
          Top = 10
          Width = 30
          Height = 31
          Cursor = crHandPoint
          Hint = 
            '[['#13#10'ico:fas-bars 1x |'#13#10'cls:rc-hover-zoom-1-2|'#13#10'align:paLayoutMai' +
            'nMenu r:w-26 |'#13#10']]'
          Margins.Left = 0
          Margins.Top = 10
          CreateOrder = 1
          Alignment = taCenter
          TextConversion = txtHTML
          AutoSize = False
          Caption = '='
          ParentFont = False
          Font.Color = 15724527
          Font.Height = -20
          TabOrder = 5
          OnClick = btnMenuClick
        end
        object labCompanyName: TUniLabel
          Left = 43
          Top = 0
          Width = 190
          Height = 44
          Hint = '[[hide:mobile-v ]]'
          Margins.Top = 14
          AutoSize = False
          Caption = 'company name'
          ParentFont = False
          Font.Color = 15724527
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 4
          OnClick = labCompanyNameClick
        end
      end
      object paBS_Tabs: TUniContainerPanel
        Left = 0
        Top = 44
        Width = 833
        Height = 54
        Hint = ''
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        ParentColor = False
        Align = alTop
        TabOrder = 3
        object bsTabs_Main: TUniLabel
          AlignWithMargins = True
          Left = 8
          Top = 10
          Width = 817
          Height = 34
          Hint = '[[bspills:light cls:btn-sm pgc:pgGeneral]]'
          Margins.Left = 8
          Margins.Top = 10
          Margins.Right = 8
          Margins.Bottom = 10
          Alignment = taCenter
          TextConversion = txtHTML
          AutoSize = False
          Caption = 'bsPill'
          Align = alClient
          ParentFont = False
          Font.Height = -16
          ParentColor = False
          Color = clBtnFace
          TabOrder = 1
        end
      end
      object paNotifications: TUniPanel
        Left = 578
        Top = 33
        Width = 295
        Height = 245
        Hint = '[['#13#10'round:all'#13#10']]'
        Visible = False
        TabOrder = 4
        BorderStyle = ubsNone
        ShowCaption = False
        Caption = ''
        Color = 4210752
        object rcBlock300: TUniContainerPanel
          Tag = 1
          Left = 12
          Top = 17
          Width = 75
          Height = 95
          Hint = '[[cols:xs-12 sm-12 md-4]]'
          ParentColor = False
          TabOrder = 1
          object paCalendar: TUniContainerPanel
            Left = 9
            Top = 9
            Width = 50
            Height = 50
            Cursor = crHandPoint
            Hint = 
              '[['#13#10'cls:rc-circle-avatar rc-bg-gradient-orange rc-hover-zoom-1-1' +
              #13#10']]'#13#10
            ParentColor = False
            TabOrder = 1
            OnClick = paCalendarClick
            DesignSize = (
              50
              50)
            object UniLabel21: TUniLabel
              Left = 10
              Top = 11
              Width = 22
              Height = 22
              Cursor = crHandPoint
              Hint = '[['#13#10'ico:fas-calendar-alt 1x |'#13#10'center:parent xy'#13#10']]'#13#10
              Alignment = taCenter
              TextConversion = txtHTML
              AutoSize = False
              Caption = '#'
              Anchors = [akLeft, akTop, akRight, akBottom]
              ParentFont = False
              Font.Color = clWhite
              Font.Height = -16
              Font.Name = 'Calibri'
              Font.Style = [fsBold]
              TabOrder = 1
              OnClick = paCalendarClick
            end
          end
          object UniLabel15: TUniLabel
            Left = 7
            Top = 75
            Width = 60
            Height = 15
            Hint = '[[translate:]]'
            Alignment = taCenter
            AutoSize = False
            Caption = 'Calendar'
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object rcBlock310: TUniContainerPanel
          Tag = 1
          Left = 94
          Top = 19
          Width = 75
          Height = 95
          Hint = '[[cols:xs-12 sm-12 md-4]]'
          ParentColor = False
          TabOrder = 2
          object paEmail: TUniContainerPanel
            Left = 11
            Top = 9
            Width = 50
            Height = 50
            Cursor = crHandPoint
            Hint = 
              '[['#13#10'cls:rc-circle-avatar rc-bg-gradient-red rc-hover-zoom-1-1'#13#10']' +
              ']'#13#10
            ParentColor = False
            TabOrder = 1
            OnClick = paEmailClick
            DesignSize = (
              50
              50)
            object UniLabel22: TUniLabel
              Left = 12
              Top = 13
              Width = 22
              Height = 22
              Cursor = crHandPoint
              Hint = '[['#13#10'ico:fas-envelope 1x |'#13#10'center:parent xy'#13#10']]'#13#10
              Alignment = taCenter
              TextConversion = txtHTML
              AutoSize = False
              Caption = '#'
              Anchors = [akLeft, akTop, akRight, akBottom]
              ParentFont = False
              Font.Color = clWhite
              Font.Height = -16
              Font.Name = 'Calibri'
              Font.Style = [fsBold]
              TabOrder = 1
              OnClick = paEmailClick
            end
          end
          object UniLabel16: TUniLabel
            Left = 7
            Top = 75
            Width = 60
            Height = 15
            Hint = '[[translate:]]'
            Alignment = taCenter
            AutoSize = False
            Caption = 'Email'
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object rcBlock320: TUniContainerPanel
          Tag = 1
          Left = 184
          Top = 19
          Width = 75
          Height = 95
          Hint = '[[cols:xs-12 sm-12 md-4]]'
          ParentColor = False
          TabOrder = 3
          object paPayments: TUniContainerPanel
            Left = 11
            Top = 9
            Width = 50
            Height = 50
            Cursor = crHandPoint
            Hint = 
              '[['#13#10'cls:rc-circle-avatar rc-bg-gradient-info rc-hover-zoom-1-1'#13#10 +
              ']]'#13#10
            ParentColor = False
            TabOrder = 1
            OnClick = paPaymentsClick
            DesignSize = (
              50
              50)
            object UniLabel23: TUniLabel
              Left = 14
              Top = 15
              Width = 22
              Height = 22
              Cursor = crHandPoint
              Hint = '[['#13#10'ico:fas-credit-card 1x |'#13#10'center:parent xy'#13#10']]'#13#10
              Alignment = taCenter
              TextConversion = txtHTML
              AutoSize = False
              Caption = '#'
              Anchors = [akLeft, akTop, akRight, akBottom]
              ParentFont = False
              Font.Color = clWhite
              Font.Height = -16
              Font.Name = 'Calibri'
              Font.Style = [fsBold]
              TabOrder = 1
              OnClick = paPaymentsClick
            end
          end
          object UniLabel17: TUniLabel
            Left = 7
            Top = 75
            Width = 60
            Height = 15
            Hint = '[[translate:]]'
            Alignment = taCenter
            AutoSize = False
            Caption = 'Payments'
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object rcBlock350: TUniContainerPanel
          Tag = 1
          Left = 182
          Top = 127
          Width = 75
          Height = 95
          Hint = '[[cols:xs-12 sm-12 md-4]]'
          ParentColor = False
          TabOrder = 4
          object paTodo: TUniContainerPanel
            Left = 11
            Top = 9
            Width = 50
            Height = 50
            Cursor = crHandPoint
            Hint = 
              '[['#13#10'cls:rc-circle-avatar rc-bg-gradient-yellow rc-hover-zoom-1-1' +
              #13#10']]'#13#10
            ParentColor = False
            TabOrder = 1
            OnClick = paTodoClick
            DesignSize = (
              50
              50)
            object UniLabel26: TUniLabel
              Left = 20
              Top = 21
              Width = 22
              Height = 22
              Cursor = crHandPoint
              Hint = '[['#13#10'ico:fas-list-alt 1x |'#13#10'center:parent xy'#13#10']]'#13#10
              Alignment = taCenter
              TextConversion = txtHTML
              AutoSize = False
              Caption = '#'
              Anchors = [akLeft, akTop, akRight, akBottom]
              ParentFont = False
              Font.Color = clWhite
              Font.Height = -16
              Font.Name = 'Calibri'
              Font.Style = [fsBold]
              TabOrder = 1
              OnClick = paTodoClick
            end
          end
          object UniLabel20: TUniLabel
            Left = 7
            Top = 75
            Width = 60
            Height = 15
            Hint = '[[translate:]]'
            Alignment = taCenter
            AutoSize = False
            Caption = 'To do'
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object rcBlock330: TUniContainerPanel
          Tag = 1
          Left = 11
          Top = 125
          Width = 75
          Height = 95
          Hint = '[[cols:xs-12 sm-12 md-4]]'
          ParentColor = False
          TabOrder = 5
          object paMessages: TUniContainerPanel
            Left = 11
            Top = 9
            Width = 50
            Height = 50
            Cursor = crHandPoint
            Hint = 
              '[['#13#10'cls:rc-circle-avatar rc-bg-gradient-green rc-hover-zoom-1-1'#13 +
              #10']]'#13#10
            ParentColor = False
            TabOrder = 1
            OnClick = paMessagesClick
            DesignSize = (
              50
              50)
            object UniLabel24: TUniLabel
              Left = 16
              Top = 17
              Width = 22
              Height = 22
              Cursor = crHandPoint
              Hint = '[['#13#10'ico:fas-comments 1x |'#13#10'center:parent xy'#13#10']]'#13#10
              Alignment = taCenter
              TextConversion = txtHTML
              AutoSize = False
              Caption = '#'
              Anchors = [akLeft, akTop, akRight, akBottom]
              ParentFont = False
              Font.Color = clWhite
              Font.Height = -16
              Font.Name = 'Calibri'
              Font.Style = [fsBold]
              TabOrder = 1
              OnClick = paMessagesClick
            end
          end
          object UniLabel18: TUniLabel
            Left = 7
            Top = 75
            Width = 60
            Height = 15
            Hint = '[[translate:]]'
            Alignment = taCenter
            AutoSize = False
            Caption = 'Messages'
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object rcBlock340: TUniContainerPanel
          Tag = 1
          Left = 92
          Top = 127
          Width = 75
          Height = 95
          Hint = '[[cols:xs-12 sm-12 md-4]]'
          ParentColor = False
          TabOrder = 6
          object paTickets: TUniContainerPanel
            Left = 11
            Top = 9
            Width = 50
            Height = 50
            Cursor = crHandPoint
            Hint = 
              '[['#13#10'cls:rc-circle-avatar rc-bg-gradient-purple rc-hover-zoom-1-1' +
              #13#10']]'#13#10
            ParentColor = False
            TabOrder = 1
            OnClick = paTicketsClick
            DesignSize = (
              50
              50)
            object UniLabel25: TUniLabel
              Left = 18
              Top = 19
              Width = 22
              Height = 22
              Cursor = crHandPoint
              Hint = '[['#13#10'ico:fas-life-ring 1x |'#13#10'center:parent xy'#13#10']]'#13#10
              Alignment = taCenter
              TextConversion = txtHTML
              AutoSize = False
              Caption = '#'
              Anchors = [akLeft, akTop, akRight, akBottom]
              ParentFont = False
              Font.Color = clWhite
              Font.Height = -16
              Font.Name = 'Calibri'
              Font.Style = [fsBold]
              TabOrder = 1
              OnClick = paTicketsClick
            end
          end
          object UniLabel19: TUniLabel
            Left = 7
            Top = 75
            Width = 60
            Height = 15
            Hint = '[[translate:]]'
            Alignment = taCenter
            AutoSize = False
            Caption = 'Tickets'
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
      end
    end
    object paLayoutMainMenu: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 260
      Height = 677
      Hint = ''
      Margins.Top = 10
      ParentColor = False
      Color = 1447446
      TabOrder = 1
      object paLayoutMenuCfgVersion: TUniContainerPanel
        AlignWithMargins = True
        Left = 0
        Top = 254
        Width = 260
        Height = 388
        Hint = ''
        Margins.Left = 0
        Margins.Top = 10
        Margins.Right = 0
        Margins.Bottom = 0
        ParentColor = False
        Color = 1447446
        Align = alClient
        TabOrder = 1
        LayoutConfig.DockWhenAligned = False
      end
      object paLayoutLogo: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 260
        Height = 44
        Hint = ''
        ParentColor = False
        Color = 1447446
        Align = alTop
        TabOrder = 2
        object imgAppIcon: TUniImage
          AlignWithMargins = True
          Left = 8
          Top = 6
          Width = 32
          Height = 32
          Hint = ''
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Center = True
          AutoSize = True
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
            00200806000000737A7AF4000001376943435041646F62652052474220283139
            39382900002891958FBF4AC3501487BF1B45C5A15608E2E0702751506CD5C18C
            495B8A2058AB4392AD49439562126EAE7FFA108E6E1D5CDC7D022747C141F109
            7C03C5A98343840C058BDFF49DDF391CCE01A362D79D865186F358AB76D391AE
            E7CBD917669802804E98A576AB7500102771C418DFEF0880D74DBBEE34C6FB7F
            321FA64A032360BB1B6521880AD0BFD2A9063104CCA09F6A100F80A94EDA3510
            4F40A997FB1B500A72FF004ACAF57C105F80D9733D1F8C39C00C725F014C1D5D
            6B805A920ED459EF54CBAA6559D2EE2641248F07998ECE33B91F87894A13D5D1
            5117C8EF0360311F6C371DB956B5ACBDF57FFE3D11D7F3656E9F4708402C3D17
            594178A12E7F55183B93EB62C770190EEF617A5464BB3770B7010BB745B65A85
            F2163C0E7F00C0C64FFDF3533FC8000000097048597300001EC200001EC2016E
            D0753E0000244469545874584D4C3A636F6D2E61646F62652E786D7000000000
            003C3F787061636B657420626567696E3D22EFBBBF222069643D2257354D304D
            7043656869487A7265537A4E54637A6B633964223F3E203C783A786D706D6574
            6120786D6C6E733A783D2261646F62653A6E733A6D6574612F2220783A786D70
            746B3D2241646F626520584D5020436F726520362E302D633030332037392E31
            36343532372C20323032302F31302F31352D31373A34383A3332202020202020
            2020223E203C7264663A52444620786D6C6E733A7264663D22687474703A2F2F
            7777772E77332E6F72672F313939392F30322F32322D7264662D73796E746178
            2D6E7323223E203C7264663A4465736372697074696F6E207264663A61626F75
            743D222220786D6C6E733A786D703D22687474703A2F2F6E732E61646F62652E
            636F6D2F7861702F312E302F2220786D6C6E733A64633D22687474703A2F2F70
            75726C2E6F72672F64632F656C656D656E74732F312E312F2220786D6C6E733A
            70686F746F73686F703D22687474703A2F2F6E732E61646F62652E636F6D2F70
            686F746F73686F702F312E302F2220786D6C6E733A786D704D4D3D2268747470
            3A2F2F6E732E61646F62652E636F6D2F7861702F312E302F6D6D2F2220786D6C
            6E733A73744576743D22687474703A2F2F6E732E61646F62652E636F6D2F7861
            702F312E302F73547970652F5265736F757263654576656E74232220786D703A
            43726561746F72546F6F6C3D2241646F62652050686F746F73686F702032322E
            31202857696E646F7773292220786D703A437265617465446174653D22323032
            302D30362D32355431383A32333A34372D30333A30302220786D703A4D6F6469
            6679446174653D22323032312D30312D31305432323A34383A34392D30333A30
            302220786D703A4D65746164617461446174653D22323032312D30312D313054
            32323A34383A34392D30333A3030222064633A666F726D61743D22696D616765
            2F706E67222070686F746F73686F703A436F6C6F724D6F64653D22332220786D
            704D4D3A496E7374616E636549443D22786D702E6969643A6561613934336535
            2D306261622D653134302D613135392D6536666265376531653964392220786D
            704D4D3A446F63756D656E7449443D22786D702E6469643A6561613934336535
            2D306261622D653134302D613135392D6536666265376531653964392220786D
            704D4D3A4F726967696E616C446F63756D656E7449443D22786D702E6469643A
            65616139343365352D306261622D653134302D613135392D6536666265376531
            65396439223E203C70686F746F73686F703A446F63756D656E74416E63657374
            6F72733E203C7264663A4261673E203C7264663A6C693E314144414334384435
            38373132373835303731413635364645424436383543393C2F7264663A6C693E
            203C7264663A6C693E3432423731434435373739334139313834443030453446
            3832383538323335453C2F7264663A6C693E203C7264663A6C693E3530324538
            3433354231444634393838323546393144323745304530433938303C2F726466
            3A6C693E203C7264663A6C693E38434633303735434244343034303831424139
            353634463738413831414337373C2F7264663A6C693E203C7264663A6C693E61
            646F62653A646F6369643A70686F746F73686F703A30346232633834662D3264
            62362D333534612D393365622D6164356139373339653435383C2F7264663A6C
            693E203C7264663A6C693E61646F62653A646F6369643A70686F746F73686F70
            3A30353734613136302D343230352D313137382D626161322D66343665323331
            39376564393C2F7264663A6C693E203C7264663A6C693E61646F62653A646F63
            69643A70686F746F73686F703A30633538663865352D646464662D326434662D
            623866332D6563323135313132613237313C2F7264663A6C693E203C7264663A
            6C693E61646F62653A646F6369643A70686F746F73686F703A30633634636536
            662D323536622D376634642D616533322D3632316362666331333662373C2F72
            64663A6C693E203C7264663A6C693E61646F62653A646F6369643A70686F746F
            73686F703A31306363623838322D663034632D343834662D613565612D373663
            6166343830363466363C2F7264663A6C693E203C7264663A6C693E61646F6265
            3A646F6369643A70686F746F73686F703A31333663386233642D633638662D31
            6634342D396339332D3836376531353864653734653C2F7264663A6C693E203C
            7264663A6C693E61646F62653A646F6369643A70686F746F73686F703A323761
            39366234302D353234362D303834662D386161392D6362333663343135393565
            323C2F7264663A6C693E203C7264663A6C693E61646F62653A646F6369643A70
            686F746F73686F703A33363336396134632D376638342D393634312D62666266
            2D3131323238336661646538613C2F7264663A6C693E203C7264663A6C693E61
            646F62653A646F6369643A70686F746F73686F703A33363438323265642D3333
            32322D336334382D626337622D3231623963656530663136623C2F7264663A6C
            693E203C7264663A6C693E61646F62653A646F6369643A70686F746F73686F70
            3A33393531353135302D613233392D626634342D383235612D36303339346532
            65323136333C2F7264663A6C693E203C7264663A6C693E61646F62653A646F63
            69643A70686F746F73686F703A33613135643563382D653162642D343534662D
            616435352D6465316437376662366336363C2F7264663A6C693E203C7264663A
            6C693E61646F62653A646F6369643A70686F746F73686F703A33613462313763
            362D363830662D636234332D386534362D3732333337613564366663643C2F72
            64663A6C693E203C7264663A6C693E61646F62653A646F6369643A70686F746F
            73686F703A33633362623939352D373764612D323234332D626634322D616439
            6230366639643666333C2F7264663A6C693E203C7264663A6C693E61646F6265
            3A646F6369643A70686F746F73686F703A34326432616562352D336263352D31
            3165372D626162312D6634346336333930393935633C2F7264663A6C693E203C
            7264663A6C693E61646F62653A646F6369643A70686F746F73686F703A343733
            32636262372D643666352D613434382D383263642D3334626334653762333866
            393C2F7264663A6C693E203C7264663A6C693E61646F62653A646F6369643A70
            686F746F73686F703A34376464643539372D666465612D393334362D62616266
            2D3761663930363232643934353C2F7264663A6C693E203C7264663A6C693E61
            646F62653A646F6369643A70686F746F73686F703A34643733356264362D6565
            34352D333134392D616537372D3465616437623336343736313C2F7264663A6C
            693E203C7264663A6C693E61646F62653A646F6369643A70686F746F73686F70
            3A34663831643038372D363633342D633434332D383966362D65396335313230
            30323731613C2F7264663A6C693E203C7264663A6C693E61646F62653A646F63
            69643A70686F746F73686F703A35313063633263372D316332372D633534352D
            393732372D6637643534383538393465353C2F7264663A6C693E203C7264663A
            6C693E61646F62653A646F6369643A70686F746F73686F703A35316230353231
            642D313734362D343134312D623731342D3439636630336338306163353C2F72
            64663A6C693E203C7264663A6C693E61646F62653A646F6369643A70686F746F
            73686F703A35343731356133622D303236342D313137382D626461632D633838
            3365366262303638343C2F7264663A6C693E203C7264663A6C693E61646F6265
            3A646F6369643A70686F746F73686F703A35363933363238642D623161632D34
            3934352D626465392D6263316637306634363731363C2F7264663A6C693E203C
            7264663A6C693E61646F62653A646F6369643A70686F746F73686F703A353865
            30396630342D373065632D623534352D623262662D3239396164643834626333
            313C2F7264663A6C693E203C7264663A6C693E61646F62653A646F6369643A70
            686F746F73686F703A35626137353366322D653832322D663034392D62613832
            2D3838323439323966373135303C2F7264663A6C693E203C7264663A6C693E61
            646F62653A646F6369643A70686F746F73686F703A35643537666566342D3834
            39332D343834622D616431382D3565356264383834373662323C2F7264663A6C
            693E203C7264663A6C693E61646F62653A646F6369643A70686F746F73686F70
            3A35646638336665622D613532372D316334372D623838302D39383639396333
            30646430643C2F7264663A6C693E203C7264663A6C693E61646F62653A646F63
            69643A70686F746F73686F703A36333765373165392D336535312D653134392D
            383564352D3236643964353562353633393C2F7264663A6C693E203C7264663A
            6C693E61646F62653A646F6369643A70686F746F73686F703A36373066626132
            352D613362642D373434652D396331662D6565366662656436373461343C2F72
            64663A6C693E203C7264663A6C693E61646F62653A646F6369643A70686F746F
            73686F703A36373231383933332D613335302D666134352D396564612D396266
            6265663438633639303C2F7264663A6C693E203C7264663A6C693E61646F6265
            3A646F6369643A70686F746F73686F703A36623535336563362D626534662D36
            6234332D626533342D3536626531393963393261613C2F7264663A6C693E203C
            7264663A6C693E61646F62653A646F6369643A70686F746F73686F703A366339
            39626564662D333362642D353134362D623834662D3032393333356236373537
            343C2F7264663A6C693E203C7264663A6C693E61646F62653A646F6369643A70
            686F746F73686F703A38313961336133632D626163372D633234372D62363935
            2D3933613034353831326564333C2F7264663A6C693E203C7264663A6C693E61
            646F62653A646F6369643A70686F746F73686F703A38616261353866662D6462
            65372D636134632D396362382D3534366334613563643566303C2F7264663A6C
            693E203C7264663A6C693E61646F62653A646F6369643A70686F746F73686F70
            3A38623535306238312D356633632D393434632D396439622D38656533366134
            63626365623C2F7264663A6C693E203C7264663A6C693E61646F62653A646F63
            69643A70686F746F73686F703A39303739326663312D626136362D636434382D
            623432332D3534383039326539376666633C2F7264663A6C693E203C7264663A
            6C693E61646F62653A646F6369643A70686F746F73686F703A39306534326234
            632D663734632D613634642D623535352D6565376361396238623932633C2F72
            64663A6C693E203C7264663A6C693E61646F62653A646F6369643A70686F746F
            73686F703A39343035646331372D343230332D313165372D613837642D643634
            3434346363383131353C2F7264663A6C693E203C7264663A6C693E61646F6265
            3A646F6369643A70686F746F73686F703A39346531376661382D313830362D66
            3134352D386466642D3565376435373263366662323C2F7264663A6C693E203C
            7264663A6C693E61646F62653A646F6369643A70686F746F73686F703A393636
            39313834362D303838392D376134372D626637352D3131316337313266396332
            663C2F7264663A6C693E203C7264663A6C693E61646F62653A646F6369643A70
            686F746F73686F703A39373131653561382D343166372D336534652D39316133
            2D6564636332336361613530633C2F7264663A6C693E203C7264663A6C693E61
            646F62653A646F6369643A70686F746F73686F703A61346630303932372D3666
            39312D333634322D616233312D3333313836643834303237333C2F7264663A6C
            693E203C7264663A6C693E61646F62653A646F6369643A70686F746F73686F70
            3A61636136386338632D383966392D303734352D386464662D32653435303037
            38613265313C2F7264663A6C693E203C7264663A6C693E61646F62653A646F63
            69643A70686F746F73686F703A61643732663038662D383636622D333634622D
            623432382D3436346439623531353363383C2F7264663A6C693E203C7264663A
            6C693E61646F62653A646F6369643A70686F746F73686F703A61646166396432
            382D313539332D313137382D626362652D6234376263356666306437633C2F72
            64663A6C693E203C7264663A6C693E61646F62653A646F6369643A70686F746F
            73686F703A61666236356531382D633939312D346334362D393762322D613938
            6366633838353935313C2F7264663A6C693E203C7264663A6C693E61646F6265
            3A646F6369643A70686F746F73686F703A62333537323630362D363831642D66
            3934362D613833642D3162323461393332333039343C2F7264663A6C693E203C
            7264663A6C693E61646F62653A646F6369643A70686F746F73686F703A623434
            33666533302D343037382D313834332D383962662D3263313633343566626266
            323C2F7264663A6C693E203C7264663A6C693E61646F62653A646F6369643A70
            686F746F73686F703A62383839343134382D653132632D663734382D61306331
            2D3263623762623639343938383C2F7264663A6C693E203C7264663A6C693E61
            646F62653A646F6369643A70686F746F73686F703A62393432663336612D6332
            38312D633934622D386639622D6130646165633439313936623C2F7264663A6C
            693E203C7264663A6C693E61646F62653A646F6369643A70686F746F73686F70
            3A62643039633838332D636632342D666434302D626535362D63316662366438
            32646433663C2F7264663A6C693E203C7264663A6C693E61646F62653A646F63
            69643A70686F746F73686F703A63303532306636322D333861662D313165372D
            383932342D6661616235613137353732313C2F7264663A6C693E203C7264663A
            6C693E61646F62653A646F6369643A70686F746F73686F703A63306137336563
            642D333238622D313165372D623064642D6332643065386431363232633C2F72
            64663A6C693E203C7264663A6C693E61646F62653A646F6369643A70686F746F
            73686F703A63313166363466332D326635312D643334302D396230382D623331
            6539343039316332613C2F7264663A6C693E203C7264663A6C693E61646F6265
            3A646F6369643A70686F746F73686F703A63343361653637642D353366382D31
            3434642D386537322D6265353336643234313863653C2F7264663A6C693E203C
            7264663A6C693E61646F62653A646F6369643A70686F746F73686F703A633634
            35393839362D393863662D393834332D396132332D3132343462623164323336
            303C2F7264663A6C693E203C7264663A6C693E61646F62653A646F6369643A70
            686F746F73686F703A63363666343834652D353833372D393234332D61623938
            2D6431663166613061356262303C2F7264663A6C693E203C7264663A6C693E61
            646F62653A646F6369643A70686F746F73686F703A63386663353535352D3331
            62352D326134632D393463612D3066363537653739306139633C2F7264663A6C
            693E203C7264663A6C693E61646F62653A646F6369643A70686F746F73686F70
            3A64353963623062632D303137342D633134382D626465382D36356131343733
            65663961663C2F7264663A6C693E203C7264663A6C693E61646F62653A646F63
            69643A70686F746F73686F703A64393836666334332D613539342D323434302D
            623061622D6336323561383566366338653C2F7264663A6C693E203C7264663A
            6C693E61646F62653A646F6369643A70686F746F73686F703A64666630326235
            362D336263332D313165372D626162312D6634346336333930393935633C2F72
            64663A6C693E203C7264663A6C693E61646F62653A646F6369643A70686F746F
            73686F703A65613135356531392D643966362D393334342D386365612D323235
            6630346639633130393C2F7264663A6C693E203C7264663A6C693E61646F6265
            3A646F6369643A70686F746F73686F703A65626265616439322D646535642D36
            3534312D386334382D6663313138626334333834333C2F7264663A6C693E203C
            7264663A6C693E61646F62653A646F6369643A70686F746F73686F703A656635
            36343364622D346636352D643234342D623061612D3361323261363066303364
            613C2F7264663A6C693E203C7264663A6C693E61646F62653A646F6369643A70
            686F746F73686F703A65663962666434342D643831622D333034332D61613832
            2D3034393762623632613466663C2F7264663A6C693E203C7264663A6C693E61
            646F62653A646F6369643A70686F746F73686F703A66303235326566312D3864
            32362D633234622D613664642D6361643138346361323761303C2F7264663A6C
            693E203C7264663A6C693E61646F62653A646F6369643A70686F746F73686F70
            3A66393439393732342D313663312D636434322D386162612D36346162643139
            39663338633C2F7264663A6C693E203C7264663A6C693E61646F62653A646F63
            69643A70686F746F73686F703A66626637643130652D323566622D363834382D
            613966662D3137356438313762376632353C2F7264663A6C693E203C7264663A
            6C693E757569643A424234304341443335343336444531314144424142303134
            43444337343645453C2F7264663A6C693E203C7264663A6C693E786D702E6469
            643A303138303131373430373230363831313931303946434142443436414431
            36303C2F7264663A6C693E203C7264663A6C693E786D702E6469643A30333830
            313137343037323036383131384331344542433131363931384333453C2F7264
            663A6C693E203C7264663A6C693E786D702E6469643A30413830313137343037
            323036383131393130394130413145314343434438303C2F7264663A6C693E20
            3C7264663A6C693E786D702E6469643A30444437333935433845334545303131
            423344393946343735423635363242433C2F7264663A6C693E203C7264663A6C
            693E786D702E6469643A31326638663864322D653030632D313034662D383235
            382D3264616562656366316539633C2F7264663A6C693E203C7264663A6C693E
            786D702E6469643A31353564633731352D613163322D343134642D623831352D
            3639646234336136626336343C2F7264663A6C693E203C7264663A6C693E786D
            702E6469643A31383938353665322D636432622D346636312D613165382D3530
            656465646138613366373C2F7264663A6C693E203C7264663A6C693E786D702E
            6469643A32393634333539333838313245303131394537414336363441433735
            394537453C2F7264663A6C693E203C7264663A6C693E786D702E6469643A3331
            6430383364642D623537302D396234662D396261362D39366666353534313337
            66613C2F7264663A6C693E203C7264663A6C693E786D702E6469643A33323646
            453033433037344431314532424135314343333437373046333235393C2F7264
            663A6C693E203C7264663A6C693E786D702E6469643A34304445464239393238
            433531314535384546424130323931383138413734423C2F7264663A6C693E20
            3C7264663A6C693E786D702E6469643A34316337663037622D356534392D6165
            34352D613736642D3264623963363838363632333C2F7264663A6C693E203C72
            64663A6C693E786D702E6469643A343839353941394233393042453731313833
            32454646373934304433354230443C2F7264663A6C693E203C7264663A6C693E
            786D702E6469643A34663639366635612D663564302D343931362D613232302D
            6638333162353337373063313C2F7264663A6C693E203C7264663A6C693E786D
            702E6469643A35316139653234642D623434642D323634302D626661652D6437
            613536313432613063313C2F7264663A6C693E203C7264663A6C693E786D702E
            6469643A35323532313432662D363138612D323734322D613135342D36646538
            34306566346462353C2F7264663A6C693E203C7264663A6C693E786D702E6469
            643A363939334432354137453041453731314146374445314533354432313445
            35303C2F7264663A6C693E203C7264663A6C693E786D702E6469643A36454435
            453943443646433444463131423735433942453144354231364541333C2F7264
            663A6C693E203C7264663A6C693E786D702E6469643A36656232666462392D31
            6533662D346666322D626135622D3861663832643265333837313C2F7264663A
            6C693E203C7264663A6C693E786D702E6469643A37336434643730642D386634
            382D386534382D386361632D6466386230623863333538373C2F7264663A6C69
            3E203C7264663A6C693E786D702E6469643A3845453044433530304543343131
            4531424530423830314331423232383839433C2F7264663A6C693E203C726466
            3A6C693E786D702E6469643A38643734383537662D623136662D353034332D38
            6465352D3139373030393230363632623C2F7264663A6C693E203C7264663A6C
            693E786D702E6469643A38656465373938652D316663632D313334342D616461
            322D6334633934623835393135653C2F7264663A6C693E203C7264663A6C693E
            786D702E6469643A39643435323163302D343765342D343965352D613737342D
            3539373537303639363131363C2F7264663A6C693E203C7264663A6C693E786D
            702E6469643A4133354536424434323132303638313138303833384146314139
            4543304334453C2F7264663A6C693E203C7264663A6C693E786D702E6469643A
            4235364442423744304543323131453142453042383031433142323238383943
            3C2F7264663A6C693E203C7264663A6C693E786D702E6469643A423536444242
            38313045433231314531424530423830314331423232383839433C2F7264663A
            6C693E203C7264663A6C693E786D702E6469643A423841413833454335313134
            31314533393631364234343335323532374338383C2F7264663A6C693E203C72
            64663A6C693E786D702E6469643A433138434634423539383544453731313935
            35304538313932354642304345323C2F7264663A6C693E203C7264663A6C693E
            786D702E6469643A463737463131373430373230363831313830383344423630
            36343938384134373C2F7264663A6C693E203C7264663A6C693E786D702E6469
            643A464244313546324330363743313145323939464441364638383844373538
            37423C2F7264663A6C693E203C7264663A6C693E786D702E6469643A61303961
            643234632D343534372D333634362D613933662D383566613438363266336566
            3C2F7264663A6C693E203C7264663A6C693E786D702E6469643A613439393634
            32372D313461322D653234362D623631362D3466356439306239376261323C2F
            7264663A6C693E203C7264663A6C693E786D702E6469643A6232613330306665
            2D316261662D306334302D393037642D3139316339306234393333333C2F7264
            663A6C693E203C7264663A6C693E786D702E6469643A62363463663132342D38
            3939382D346262622D616130312D3865333533306130643633323C2F7264663A
            6C693E203C7264663A6C693E786D702E6469643A65633065396232622D336638
            652D376134332D626432612D3136386136323936306163363C2F7264663A6C69
            3E203C7264663A6C693E786D702E6469643A65646661636534332D336164612D
            663634642D383734612D3537633830323163333663623C2F7264663A6C693E20
            3C7264663A6C693E786D702E6469643A66316566616532382D366338652D6333
            34392D393530372D3136613866393064393762613C2F7264663A6C693E203C72
            64663A6C693E786D702E6469643A66323936343763302D376462302D38313438
            2D386235642D3461613734636163623237643C2F7264663A6C693E203C726466
            3A6C693E786D702E6469643A66366666323739342D663334322D356634312D38
            6661352D3839306162313035386632633C2F7264663A6C693E203C7264663A6C
            693E786D702E6469643A66376134393662382D656666382D336634382D613531
            382D6564366137383066363631363C2F7264663A6C693E203C7264663A6C693E
            786D702E6469643A66383038626233322D663836642D396334342D383866382D
            3534353336343637323466343C2F7264663A6C693E203C7264663A6C693E786D
            702E6469643A66663532356163382D626464612D373134662D616334382D3065
            633831663666326165663C2F7264663A6C693E203C2F7264663A4261673E203C
            2F70686F746F73686F703A446F63756D656E74416E636573746F72733E203C78
            6D704D4D3A486973746F72793E203C7264663A5365713E203C7264663A6C6920
            73744576743A616374696F6E3D2263726561746564222073744576743A696E73
            74616E636549443D22786D702E6969643A65616139343365352D306261622D65
            3134302D613135392D653666626537653165396439222073744576743A776865
            6E3D22323032302D30362D32355431383A32333A34372D30333A303022207374
            4576743A736F6674776172654167656E743D2241646F62652050686F746F7368
            6F702032322E31202857696E646F777329222F3E203C2F7264663A5365713E20
            3C2F786D704D4D3A486973746F72793E203C2F7264663A446573637269707469
            6F6E3E203C2F7264663A5244463E203C2F783A786D706D6574613E203C3F7870
            61636B657420656E643D2272223F3EF197C97E000005104944415478DAA5976B
            4C145714C7EFCCECECF21076591661C1B05450B08FC4B6D236A169D436A64F2C
            544C0D541A45A495B6A426D0A050C4102A4D0D442A465AFD40AA290A916A6DFB
            A18D56DA1225B1896902C8B331B0E8425890857DCDF4CC7477B8337B87059CE4
            64EE10B2E777FFF7BC2EC522AD1E21A401637CA6C1BF2F5427653DFE58C83E8E
            E33DF08D781E51C8F7C09A8797D7CBF16E8E474E8E430EB7879F7138399B75D2
            DD7BF19ABDABE386FDBEF03F98797C267E53001045702E41FCDE98521E6F6273
            D10A9E3927D7F753D74C4D69D36837C1B9B816008C2ACE45BBD5BCBE3E2A82D9
            BA1200E171BAF97B8D6DB6A2A64BB6410C40021100A231C959DC3938D68102E7
            427574EA4A01846770D4756ADBA7038D040051019362D71244CE1643424DA1B9
            9DA650E8A300D867BD5DCFEEED2B543877FB0162080022C42B9B22628AB647BF
            4ED348070186BC1CA2799EA78440148CA210AD65A910B3894D8DD16B9E11BED5
            62E1A9FCDE9D986337AEC06AC2EE5905943F4668DF9AF2ADC58C484BD485B754
            588EC0913DA1023000003BF09DE30AC492768FBD19244F531A73EE37BEF3644A
            659C917D810430E3E0EE3CBDA7379FA0801B0720396717019014D86009096F39
            9C78C410C1A4910026A63D379E2FBC5BA2009014880BA200EE1C879014D8961E
            11F355717C2D644B2C0960C4EA6A7DB964E0D8720082C5801F400CBABD6F1A93
            CB7263EB205BB424805B3D8EBA5D5523AD4AE7FE23588902781052178F26E56E
            5C17FA2EC939648EE3CC8F13078E7D77FF8E02401684AC1260FB8BFAB882B78C
            D9B0D6FE9F823CEDEB03620A42ED177A01324632E6C4586D0643A31012C0D48C
            F7F68E8AE19261ABEBA1DA11E04128BD4F1E5CB305CEB6013DC2E3F5F2B3973A
            A70F95358D762179FAB9F023F0D7011900C8BA0B642D5FAE5350C63537CF8D41
            F5EBBF76FBE10F95DF5ABB91BCFA052880172209E0D7FAE4124B9CB660B9001E
            2F3FDD33E2BC5C75D6FAFDDF77E7A6D042F70B70EE5740598A4588EEE6F5270C
            8FD005A1F8F47CDD6EABF9E6CAC440300594CD48B47395964C0048801D893D00
            061230788B01C8D35E2FE222C3E9E8E404DD561D4B19491036BBE78FCD1FF597
            CEBB78375A4401A11DABCE03283015FDF540348895F72056F254E261BEB6653C
            FFECD549FF2C4054200A73A0CC7D52319295E4F355969DE96961056A00700C05
            0D171EF41000A46E684081B3A09A02CAA2445DA95BBB1FBA618E4A40DACB9AC6
            F23A3AED63489E863205F4BEDD2CB66BD251882A5C6F4CA94830B19B4900D086
            87333F1BDA3D34E69A5551408C8108C58F2E5985B5F1DAB0D6EAA42F0DAB9827
            490050056F6EDAD757AC9205D2118407015055213323D20C23DB71E8826B4800
            F71EB82F431654070308C3824A8396AE04F3494E4CEA876F47D7330C154902E8
            FDD779FA8DD2C1D30400D944148A16DAACD29410B2010566808CCC0C7D9DDA2C
            D8F58FA33AEFE848070A1CC5FC6B712C0F410B791D0C40A6C0F9CF2DEFA46F08
            2B43E4876BBF6EFF002E2537150A7894003A241FB3481044805F8E277F9C1CAF
            DD4DF20E9D70AAB1DDB6E7449B0D2FC5B8730940986228249F7696A202FDE7A9
            75B5AB0D9A5749009082FD879BAD455003C615000137231603580C4296153088
            687F6B4839B32A94DE48028076FC57F6A1E1629807E7D59CFB01340A002504F1
            E69CF592DEF4C57E73076400B1114D4E7B7F7EAEB0EF200ABC157BB0BF8900CA
            21732910CCFBAF19CD07B24D65706B12EA0887F986A440ECC8B8FB6A56F9501B
            0ABC9AE36BEE3F75BF5F702824C5400000000049454E44AE426082}
          LayoutConfig.Region = 'east'
          LayoutConfig.DockWhenAligned = False
        end
        object labAppName: TUniLabel
          Left = 49
          Top = 9
          Width = 111
          Height = 23
          Hint = ''
          TextConversion = txtHTML
          Caption = 'RadCORE WEB'
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Calibri'
          TabOrder = 2
        end
      end
      object paLayoutBottom: TUniContainerPanel
        Left = 0
        Top = 642
        Width = 260
        Height = 35
        Hint = ''
        ParentColor = False
        Color = 1447446
        Align = alBottom
        TabOrder = 3
        DesignSize = (
          260
          35)
        object labAdm: TUniLabel
          AlignWithMargins = True
          Left = 38
          Top = 9
          Width = 20
          Height = 28
          Hint = 
            '[['#13#10'ico:fas-key| '#13#10'cls:align-label-left-center | '#13#10'cls-ico:color' +
            '-orange'#13#10']]'#13#10
          Margins.Top = 13
          Margins.Right = 10
          CreateOrder = 1
          TextConversion = txtHTML
          AutoSize = False
          Caption = 'Adm'
          Anchors = [akTop, akRight]
          ParentFont = False
          Font.Color = 15724527
          Font.Height = -13
          TabOrder = 4
          OnClick = btnNotificationsClick
        end
        object labAppVersion: TUniLabel
          Left = 98
          Top = 10
          Width = 152
          Height = 16
          Hint = '[['#13#10'label-link:https://radcore.pro.br/web/atualizacoes/'#13#10']]'
          Alignment = taCenter
          TextConversion = txtHTML
          AutoSize = False
          Caption = '1.0.0.343'
          ParentFont = False
          Font.Color = 33023
          Font.Height = -12
          Font.Name = 'Calibri'
          TabOrder = 1
          OnClick = labAppVersionClick
        end
        object labFullScr: TUniLabel
          Left = 10
          Top = 10
          Width = 27
          Height = 22
          Hint = '[['#13#10'ico:fas-expand |'#13#10'cls:rc-hover-zoom-1-2'#13#10']]'
          Alignment = taCenter
          TextConversion = txtHTML
          AutoSize = False
          Caption = ' ] ['
          ParentFont = False
          Font.Color = clInfoBk
          Font.Height = -12
          Font.Name = 'Calibri'
          ClientEvents.ExtEvents.Strings = (
            
              'click=function click(sender, eOpts)'#13#10'{'#13#10'  launchIntoFullscreen(d' +
              'ocument.documentElement);'#13#10'}')
          TabOrder = 2
          OnClick = labFullScrClick
        end
        object labFullScrExit: TUniLabel
          Left = 54
          Top = 10
          Width = 27
          Height = 22
          Hint = '[['#13#10'ico:fas-compress |'#13#10'cls:rc-hover-zoom-1-2'#13#10']]'
          Visible = False
          Alignment = taCenter
          TextConversion = txtHTML
          AutoSize = False
          Caption = '[ ]'
          ParentFont = False
          Font.Color = clInfoBk
          Font.Height = -12
          Font.Name = 'Calibri'
          ClientEvents.ExtEvents.Strings = (
            'click=function click(sender, eOpts)'#13#10'{'#13#10'   exitFullscreen();'#13#10'}')
          TabOrder = 3
          OnClick = labFullScrClick
        end
      end
      object paSearchTop: TUniContainerPanel
        AlignWithMargins = True
        Left = 10
        Top = 200
        Width = 240
        Height = 38
        Hint = ''
        Margins.Left = 10
        Margins.Top = 6
        Margins.Right = 10
        Margins.Bottom = 6
        ParentColor = False
        Color = 3618615
        Align = alTop
        TabOrder = 4
        object btnSearch: TUniLabel
          AlignWithMargins = True
          Left = 105
          Top = 8
          Width = 44
          Height = 27
          Cursor = crHandPoint
          Hint = '[['#13#10'ico:fas-search 1x |'#13#10'cls:rc-hover-zoom-1-2'#13#10']]'
          Margins.Top = 8
          Margins.Right = 12
          CreateOrder = 1
          Alignment = taCenter
          TextConversion = txtHTML
          AutoSize = False
          Caption = 'Search'
          ParentFont = False
          Font.Color = 15724527
          Font.Height = -13
          TabOrder = 2
          OnClick = btnSearchClick
        end
        object paSearchEdit: TUniContainerPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 0
          Height = 32
          Hint = ''
          ParentColor = False
          Color = clWhite
          TabOrder = 1
          object SearchEdit: TUniEdit
            Left = 0
            Top = 0
            Width = 228
            Height = 32
            Hint = 
              '[['#13#10'inputico:fas-search | '#13#10'focus-color:off |'#13#10'translate:except-' +
              'text'#13#10']]'
            CharCase = ecLowerCase
            BorderStyle = ubsNone
            Text = ''
            ParentFont = False
            Font.Height = -16
            Font.Name = 'Calibri'
            TabOrder = 1
            EmptyText = 'pesquisa'
            FieldLabelWidth = 20
            FieldLabelAlign = laRight
            FieldLabelSeparator = ' '
            InputType = 'text'
            OnChange = SearchEditChange
            OnExit = SearchEditExit
            OnKeyDown = SearchEditKeyDown
          end
        end
      end
      object paLayoutBgUser: TUniPanel
        AlignWithMargins = True
        Left = 0
        Top = 64
        Width = 260
        Height = 130
        Hint = ''
        Margins.Left = 0
        Margins.Top = 20
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alTop
        TabOrder = 5
        BorderStyle = ubsNone
        Background.Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000001400000
          009B080300000024C0B2C000000300504C54450100011D132A0505060201081F
          162F281B312D1E322218323324362F213637283A291F3824172D190F2608040A
          3A2A3E090B0B34243A0D081071669D241A370F0F1141314504040F776AA23023
          313E2E412F233C4535496D61987D70A72B1D2C181A1B65588E18101C3528401D
          1D213B2C4646535F291F3E685C931410150E0F1A271B287476983E4F62222524
          8275AC897CB63F314F2216251217162E24445E548B6F6E931E1320584D844639
          5B4536543328497892A1505271534163656886434F5B68688E151624382C4F7B
          73AD7689AA415567748D9C837AB23D4A5A494A686061854B59634F3E5C3C4058
          46486149394F526066413565465B6B56466A3D325A100A225D4D7A4E40705547
          7D3438360806192E2F375B5E7E64547C8385B236495D8B7EBC584872827CA34D
          4F6A070E134D3E5431384E6C6E8B42435C28272C66799C7088961D1D2A3B4954
          69829958728B565878140916476274797D9D7B8DB068669C6F6CA249637E6B7C
          A25168865771816052855F4E714F4279364353393A507471A74A3D652022336E
          5E8C77749037494C283A3C7D96A73E577133434446396F62609569828C393D40
          776D9A2031352B322F9185C17088A17C7DAC7082A77D759E5D59926A5983506B
          7B4251527C85A3988BC58488A85A697352606F5D729364709B5A6992444A4B83
          74B367777D352A58222B2C637C928C8ABB7E758A5F7275354F6A3432448393B8
          839BAF756AA97F7B941523257465924045428980934D595A607A8A545E8D7770
          858A7EAB2C3B448D8FB18391AF6960A2635B9B4F56875D68692E245215113027
          1F4821263E2F41594E524F292F422C414D0C191F847B8E8B9ABD727E7F747AA7
          435C791729309184B71E183E9494C5584F8D786FB34A4C828F85985A4C617F79
          BC6F65A74D6B6A9794BA778989382D645A5E583D43628CA2B595B1B843457A68
          5E702B2F4E7F9093829D9E6F6A80A195CE3B5A595F807EAAA1D495A4C1867FCA
          978B9D6C726BA1B0CB9CA1C993A6A9A396A7393B71B9B9E4928CD98E9A94A7C6
          C8B8B0BDAFB0D8D1D1ECBEC9D2A39DEFECECFD0586C6130000A3F04944415478
          DA4CBB075C5367FB067C9F9CEC0161050801C20A5BC316AB226A7123028A56C5
          3AAAC5D63A5BB5D5AAB556EDEB9EADB5CE3A5070A0A2F03A8A0BD9283BAC0061
          AFEC7D92EF89EFFFFB7E1F2481C4184EAE735FEB3927D8C2273A604072555780
          DF3D3785CBA04B3B80CF15FB9441351BD46CF48D33D04F5D6A11F9BFFB21F587
          CBD8D479457223D8FE31AC53A9062AC150E3E20F156C3F2A075440309A9728A4
          003A4178F7EFDBE9324ED35BA7E166C789EFED6A05C7D305E7223DF2A22AA22A
          DFC484412DED427FEEED449F8B43E3A09DC0974F1CE0C156F9D575519E5D2E03
          83D0E5B9FD56F118A88C8AAC80CCA7AC769FE97FB0563A3651589DBC22294436
          267484DF09C2AC186F80177A52C822A964418D1EFCE2A90356AC216100BC0A45
          633F947929AC60CDC8CEC87698D8D39AD40AAD0DC149BA9E72740FA0F5393FB8
          21D8EFD192371D59ABA3D6C079A7D41F81C607808AA7B2738B8EEEBBE8D6E7DB
          EC6B68F1AF8EA80430ED1C1A08BF6058F5B24A19D8BD292B9488B8C967B48A30
          8C8D00D4118965941D71891830D4C04697E43CF8FF7DA961C1131A2FE27E4A9F
          DFB2D5D1052A2A7FEC5D718321F50ED5482588A826B66F89ABDC20963A0DCBFD
          2E04248C7D104E2B7FF60398EC8F29D31A3E381D1FEEBE7DF9C85FF7E60B645E
          D09913C6893B07FBB7865D2A6AC97C710BCEB87097C39C547CFB9EA34F81F53A
          72A6F57A84E074948BFF83791F82BAB29DA6CDB836B37CB0E822C7F15CB49E1E
          F31A80CE3BE4BB72B016C04B0FAD6CB52CA1DFBBA3746E1FC90AAE453B0E0441
          6370892414E61E5C422AB1D746365A8064C9281CF51C5F087E7E77E6F4F8B542
          7934F06D10FAF9152A235EBEBAF0600EAC8D8235E7A1C2DDE75D14ECD953F1A7
          B709E6FE79459CD07D5467175115518A9EBDECE558C8785AA560C4DEBCB5F7B3
          7C077D4058ED478CE516F5E4AB94CD6D26DD777FE908347004C0820F02ABBC19
          C00A18020FD0B81967938B46CC546A72AFB45FBB2003B2EFFAB512C0D6F9498D
          54100E4F59BF7DA815E70038A90D38E1343CF6EFCD1B4FB7F9EC52C246F21DDF
          49C7B2C67EBD600CB151F03E27DE43705674ED396464E79E8DF865B03CF782BD
          E90F9FDE778A2BFD909E14345169DF3830116B94C2CA832E5B8E16CD0C6A0416
          649CB6AE6F7DC25C764DC372EAFA79A4D5EF542878777AC594E9FB5DFB30D757
          818079E9D1D07596C08202E58282E0123B6B50997D6093454571578005BD858C
          56F5D8D64AED043F686D053F04DF79346A68FC7AD29C5A271E59B0DF362751E8
          BAE47AEB213E1C5D72AE62FCF2B5517B8EFA560B675EEE86882ACC488928A52C
          2E954497521BF86BAF51E491DA9720C2316C01DCA17A44A72C5970077C0667DE
          B10198F8D2C980A8CCD61140A5DA469265BA74FFA01FDB28AE486DA378DE711A
          C6F179EB130137528D6C9A5DFF5F993855EDA4E280A1718ADA5D2A4F501C3B19
          9EB2F2D826DA10E7F8B9A0954539E9F7C227737FC3AA42F614DCDED40DC5614F
          8696D5F6F0E32BDB9BBFF932C665E1792171A965FB2A76BB8F267992E9A6AF25
          4F73AF2B2212FB0073BA965DC5BE7DD4FEE540D156E8E8F41A40FC8CE9003DBD
          93DE19DD5994E0FA8ED318C4A377B80EF0781F13FF284FE100AF4F5828D27401
          29A81EC1A8655A48161B82ADA30EAED50B1908413FDBF0B5269D9803ADFFFC79
          7ECD3ED8FD15200EA329CCD2ED9AB2A2E7D612B8BE79CF9A820EEF99998B57CC
          4D2B8985525D421544F48D3BE2190B37F963B483DE0ED52EAFFC700946C60986
          9E3EF3432BA4C29D4F9A0793CA60E61324813A02E74ECF33CE7B6234B2290C50
          EAC63483154B6E6A620EE08CCBDF7D76D755A9C611E03895C2E9237082C6F8F3
          ADAC0D1A18C263F39DA4D1436887726807CF1BBF3D199E683DCBFC12647925D1
          444888E0D4A1AD10666901ECAD35A66CC5798A0791FDC5F6FDE0DF2E5F8DE66D
          EAF3E5DA8F9BDDAA6786B2283B33079F79107358B38865279D8B60A2BDEA4A46
          6019522EC70E04208FAEE7D58CB910EBDA1F53F6CF326B6DB8E57ACAFD65B661
          B25ACB2451416571E11F9AAC19850AFB5E7A9024B2DC016C32E8D7EA87C48BFF
          1ADDF12F48CA8C522D7E5411A5E2F4F4BAF7FE796B965AF2C59EAC73C135CACF
          26AFF68958015932487480D1E6D86AE08365DC8133D936D866C0C7311FD944EB
          8CA718C70854F5ABAD4D6A9A8146029A2E2587F83F1D040B4365648A6ACDB62D
          C2E98C215134D1147097A6C569DA5789AEFD7878054EE000DC61E69EB2479EAD
          34869C78FEA6A9C049AD0C649E864D8E2FE1FEAA311B7E735E7DEAD5A4F95E96
          33A674C1592C8B745AD4B0FE386D3F7C91D41CD06CE8E976033CE989EAE0FEBB
          9F6B569C89502F97969E81547958246C596E9EA191E69D0D257DA758D9EE131A
          D541A7A8F207BEECF4EABCB9AD0C499D95533CB5AF7F28DEB1B36141B17B6FA8
          FE559938BC24AE861C486A5C704744AA14630D90F10626646700DCD14E40DC2D
          F4B321080D735AD105BDCD8970BE62F3CD3D6B05AEC1A5AA4F06920A77DD219E
          99F41FE7CD97EE0A7615241E9AF8DE4489E8EB53F80F5AD110D23E0637D810E9
          E1035B02809119331F80F1D5144FCD288584761D36F32EE37F060C4E5ECDC9EF
          1F8F5722222377351A71205E25A6DE8DF23EF57C197D76AE838A409E831064BC
          2DD849D17341459E7D6433F6962D61FEF5F79B67ABEFAC5401A72976CF26EA1F
          617FE4EEB593FF5B9D0EE3B66DD82A5CB7704BE5FB089A017A20E9CB9FDEBBA6
          E512FE0197B42E86710D110DC414B0CEDC9FA2D7C03D98CE7470B5A797CFE228
          AE7E5D30E5216B8E2322AFD2AF357F514D4CE7CD0DD2078B41DB1B617C1C06A5
          0BF445814D10541A737D29D6100CD088A690048A986A71B5B8DF752C142A2CD1
          7ED9D1E0D78A1C049198FF7AB46F4DC4E347FC877FEE017E45540F3FEBDC1AFE
          DC448715FDF9CA6717CEAD793F0E51184ABD68CDB1A5C8FBF068EB4D3F2174CC
          A3DC81808F6CC98C8F08C29ED0AF900BA31104DAE8A2D98F4D77A854E6AB9D05
          2A1B93C974976E6344530A6CFB0C4DA38EA1C309C26748F0E7CA1EAFEC5F3BEA
          66BD6589910ADA269010A9CD04E8184E2025D3664AABCDE1BE1FEE6CD20DB726
          53BF8182A68F7F4DA91CA2CE7B356A9175C7C972D205C7A9C9BF18D6151F9EBA
          EEAC73D71A3485EF5DA1DF796590CB6A39B7E7B3963E0804F2D8C84AA6937EE0
          633AA7B2CF6D26EF8A4B6AFE942BCB48C430AF28B38C97AF59F082133360D76C
          FF3C1C31A5143CD956680225D805379843352C684A38024B244125316541BDB0
          A0B5D242D22E873B60EF57093DC1492782FDD010AAFB279E0F1E7578DE2BDA02
          4724511548056B0A396BAEBC03B8B067CF757C01C20F21F8C2CF1BFA06C680F0
          362009D3D96DFBD5A3051878EA41644422B78CFD180739054EF0AC735582BF74
          40B075951BCBD0FCCD7CACC5BD06D5540FCAEAB27BF60635D95E457829AB7C49
          D125017F72533ACD4F2731C9366A1380468FC0C9C04026224FD01F5C2D634C2B
          BB7C52461A0267BA2CA26B68B76070D7790B1CC7E70B9E4192E5F8E1CBB29DC8
          8E2B2112E546B80CFFFEF4D253C5257EAA7CE7F9CCC470959A8AD2179F5CFD61
          6C45544515C48CA99C9193509106EDD8CF00577D424F3357B6EA81E97C0D16D4
          46770EF0061A4D6198B5348EF77CF1B665D0E8B16C9F364662C54C800769EAE3
          A09E6431513C7A918F44979316142AA06743BFFAD1E4B1BA3C48BE45927327F0
          F7F0117615516B8EC096B5303EB233792BF86529FF6312C18EB951DE506E8A2F
          8DED2E710A742B4A187DBA627CD4178D537BE2D066DB187C068BC6C828BAB021
          B9FEA1802590F73B23CFDFF433F8B4E376A62729C36CB06A70C0395E55AF6621
          4F7985A566DC1E868C1B40759E7C8B4CFC0F40A4820841B41BC88C6127A76161
          037BBA7AD3B4B218A173D38B4D7BC03E8BBE4A701CEF390067C1B8B958110279
          C939909E53B5AC39B2B2652614DE89812D3013F6BFE41A74AFE2FF2E5E96AB2D
          EAF9CF81B2B9E6B4D4EC7CF3CE729B826958AC843BB0B503BCF7B25642EBA529
          31FA1AEFCEE753BC0B825CFB9A94B1A5764A880BAF09B9146BB54D6050034904
          6514BACA5E0131D57E1CF61BA676B9A2C0B8F0DFD168287740368C06A8D5EFD1
          1A58FB29BFACD9C341214CA5F2695F5CD49F18B11912A73D5B71E9656A296C7E
          035511E17EBBC1160575292E5F2406BAF9673B8C123A9B08A6521085C1E616F3
          6ED3C8EC4061812E0C5A871930B3A277CE038B190518CDA66328DEC194C75CA5
          8EF0897EA1D3E20C9D17E5C9EC165F094E20ABC641D069E5E2096FE586B82118
          968B5502B76C3F8E8AE97FEFE59EBD767DEF53B20E75C2BDF9F7F075852161BF
          89A036BDFE591A4A32CDEDDD13DA2FA4AF3AF80DE7145343766D2ECBBDADCA99
          79E5B72861EE44CDAB4737BC8ABF87E1833C70C9B9989FC3F6DC7275969EFE6B
          5AE65E6C39DDB9A3BB765627408B5D435A6EF0B5A5580D84A329D3D443080BAB
          D5DA2BEC3005D88B24A0886D14A040A3A5932C7AF781B9853DC1033CD4457A5D
          C8B628F3A867EA3FFFEB0AC881D7FEA9B8C1342017E9F020977A91A52EFD7BAE
          3B40A92BB2959B5F87FCABE8F007D0E26AA788DC29CFAFFDE17C5844D09315F7
          D10402CA778329270936D3AF254730CD51DB855E504F65E7EE1E7B0C58981A22
          E4EE4D76DD04C132212BF192D2D19E608065ED7DE5309540C3077E5248CFDCDE
          A2033151C3453476CC23E2865A1314AA257970FC44E2CBF5A7DA2FEE436A899A
          487DD3AEDB39AB2A921F42A14B7E862A1F0A52C726EECFCDE5567BCEBC5DB3EF
          FCB363E71B2892332B760B8EBD698FCA3F36682CF867F8DDA376D66BF25F8A5C
          6251FE006FF05B8015971C73B42C5444E06108071A9492AC5E56531040E9EA0B
          1053279429E3908978B01A831A4963025BDFD0F54C103566DC41E3A875875164
          26A4C84F1368B3E2860A91AA17DCF94E855159E77A7A41E035CEFAAA22F5266D
          5501531B7B57201300C456E983F0F20868065C6DD7C887310EDD7D6AFFCFAA26
          4E588C6188850BAAAC4541C6F09A7945C33875E65D1B1FA9DCA2EFF3D39A9503
          88C304933DADC080509DFC74FE1D263FF6BE91AEC645F6EB1FE770869D5404B6
          B040479A3CD20440531A394E328613A7DACFE620D8A87D6AA0474AF79EE2DF44
          41391BE1F846591E9625B83C4DD67D76DCFE5C507DF953D5AA34F3BA9F5EC279
          542785ABFF1C72EE333D5BEA6656D80F257D3447552C5A9817BB6046D172E98C
          8A599641FFAFD2A72B5EE7A60C27209B4521B05315AA1FF07202FC9A40166C6D
          0CE6697BBB832C65311056C2819290FB220A53531FA3F8E14F0527FAA5BD2523
          9BA4F0726D342DCDDCDAD433C7AF70E26B285DBCD79D9FF5AFDF5EF75E40E3EA
          0E3E9DB2D4BEDF63CE6C8E5AF246636C8C2F8573CBC0C1146B9BCBA29E194F51
          10C2091D5BC21FE62EE3FFA1669F5F83620CB20CDEAC45538C281313DFFE31FF
          2E721254E0700CCC385D8FE6D3A53355A60BB981A398A8C627F57521D25275F0
          5DCAB31C4E35013457472FF20BDDEC3BD470A92E58E55C22A6D4F2395227E726
          2770C6291F6012BEAB7649FA06B09C25D6CBEEAD978DEB29BCB65F20809F5A3C
          CB9EEC87C8DB43E6272B169E55067C2BB9CD6D2E82AD6594671BC9F1D25ED77E
          381450D29D7162C6602320B7D0EC2EA9BDC1AECACD67B56DBBCCDA9A1B463F63
          9780FA47D0BE60F6B92D0F6334EC46658CA6DEAE5C1447FDE8019C5EB9D21EB4
          CCB2E45E2D2C7D3EAA63D88C24231B1C5094511878B620F7BC3729BE385CB456
          A4DA63CB3222C9E69BB80CC61BBC4B81E04804AEDE774160E31B810734CB04B6
          45033B253BCA9B26A9508F89609F597EE5A713180DA141388CA2F97A35CD88E0
          A5A2B8674BD256CD827C3DFA0558BC4166ECB9A801DCCFD4095E9749338DE869
          C83D3CA2DB543D1603573169D50A30321972A091F8C3422908A5C263D3E6F696
          D0CC8418A470DFB2E360ED7F379DC4D7C92027FDC1BC9CC3979BE7D6DBA33F98
          96C1FEFB7233047054D78EAD72C959015D54D7BE275B7BE775459CA5ADCA87B1
          4CED8C81C147D2C198BEB5099717D1FB9451D90398D5670E38C3D0E08915FAD0
          BA7ECCEADD811A4813C26A1BB47D44E99AED55AF0A7A1664F58C3E040A8098B1
          D94192319FFF6C0F964F1C5E908D30DC7C29A9D0AF3CFA919B7605FC1828EF81
          5E77E0A0542CB058E3EF42543FC1D102E163A810B4FA05340764FCDAEAAF921B
          FC626F22EB45203202A04DB2CBDC500ACBAD776D1406E4A4A8D4EA707105C1D6
          9BD9C9B7EDF51AF6A75504358B9AC7D9FF188DA4960DFEF5E4C04E390A7E4C33
          421917570B5BB92A239563718156710DC7BECD096563701A46F95934DCEA2715
          C2B01307D561C545F37F7674DDDB70345D40FAB732FDE1DCB03D65E4FD3934EB
          8F01C57F157E03B5EF2813DAE1C2EA66178D36E9E589C3975E5C5C0953B6A64B
          C61707E4D42D1E045EC5A26D9E2B8DCC4B975EFF9EABA86069D62EFABEA86D05
          AF13FA51089CDB5A1F5B9B71D7838D352821A60C6234B2A046082C5B711719B1
          9D9635A618A3675C66D91AB1DE3DE90A1EDFAAB07FBE27CFE1794C197FCECDA0
          C62D7BF61C91200EBBF76ECE256400CBAEA50A8F263A7488A6EE0A722882C097
          658B023E460081122BB4F2879D7A664458AB9F42A8E7470793640702903C9F52
          6050E319BE8DCF9588BE2EDD82363289B0A1FAE9EB957DA44D1421A26AFC3BA6
          99037E15F0293F639E8EB47754E0A88C1F3E338657B0693AE0CACDC071FA045B
          39C7C9190C2ACEA883CF868DC449FB5AAF13EB41D6EDE175623E08CEEDDF5A74
          AABB8208FCC27B5589AB4FBB4F7B1A9C34B951F07ED749A29DCB6F7834475479
          4608EF4DFF608E14E47D6BA82CE2A64F64666B589A477358D97378F0EEE2CCF3
          94563DAAC250CBEB2F8D2141891DEA210041C05122D4CAA3B1A04AA6C24E4919
          F7718CBE5ADC282E66002023A6C3F74716E4E8291997F97E376D3B58CA51A130
          BA672DB87354BD512A8948BB67F47B6FC9F80A48C4DD26EF41FE0137B73F6813
          CC1F7A8DABA1C70FA5687654D873EA53BEC3C6DD0E5007188667BC5FD67C0398
          241DDA00E4B4F31ED8EBD47CF749B27B9F4A304AFA312F6D003AC933CA671FBD
          91437E60C316D98C51F477A6524122F0B248E00A37AF005BB066C09427639A9C
          10863591231C90DE3DDB423BB752C1A3AFBA37DFAB13513830E9286DFFD6C35B
          C324287E558838B7616621E1596517D2EE1370E6C4892917021E440756314F7D
          70C823BB47C0E1C59197E09FA5D39E356DB14CB9E632634506B02001FA633BF2
          075DA2F5DAE7712571D0004156347976BDF5538B43EDA0AC3CA5DE4E67F56F04
          84203045122D530463EF68710A9016C0157A5C913B88DE501CFE59FA3C9CF78F
          7B6FD2EF178A2BDCA117E56903EDEA85B9B7FA634B9973AABE6F7D775310F074
          95B6AA3DB5747EED47F4DE743D3B6EB782C8D741985707DB0FC25FC75117A6CF
          2B7DB80F0168B03512DCEBBEDF0AC1553D5D1E4534C5BCFCBF21249B51E2D311
          545670A1AF96763F933628B7CDE7B7972D0C39CA2D2848CFFBEE440E95C0390A
          EA6C33FC97CFA911AADD8FCDFFE0FBCD1668B7DBD74E3B40DAE8155F4C5D27BB
          07C185DDD7CF8101A8516919FE01E7B74065BB94ABD57CDEAAE236FBE249B7D7
          DD20DA3CA75790CD64F7CD9BC86399DF4478BC19AE4F8F19432F5C7E31919743
          AC9C730AFBD6769902F482E030CA2B36342AED821ACD104AAA11B2CA24900C8D
          A983FAEA80FA982A7F177D15AB4C14538501D041CFB420B9EFDBD0DA3A710F27
          F6F9D47FFE3CBF21DB345C91540336195C7C1B5A85D1EC9B88CF82D8E2C9319B
          0501D0BC3078BB7F37AE66200B891D6D53335AF93D7E08C803221B3294B92807
          E2A9F000699AED8B602F2EE7BE42DEEB34BDE9EAF0EE979F8410709B972000F1
          CA3DBFEEBF817F17FD9FC433607312C2496726680C95316A665B713F525750D8
          4380A9265C2563E8828F9D1EBAFAFC2BAF4BAB1C051BB6C1A1E28A64101C47BD
          A8187A7CB28E433C54F85F5F7689B5F076CE935C22FB8BD5BF3035CB0B542037
          3159C2AF77BB8FAD189CF1215EF3D175736378D1C5BEC5AFD20FACCA245D5E0F
          2FBCED4A82CB077FEED04B1F2CEE2F8D2BB10B869AEA94FBCB1A04D230348900
          9294FBDBF3E2F58D15B00AE0BDB83108AA995A605AF408C38C428522B15C3FA1
          1506A492E4F03B49F2E7083C10A9381CD5D2073DF1F1058BCE65AD069156E6E8
          BC655FEB62539D5D3FDECA67C3CE8104D23C51C3E40A89DF022C17929FD441A8
          89624231C668F3610413302C5AB6558FC4C268645BD65ED6183FC5685B5DB315
          35C4DAA21479402BB189FB84211DE45D9AADC38D6C238726D73AD1E46681DE80
          00D47B408F3A4AD1291C0E7C474D7EF7BAE3F3386990E2E85E47D9A11D878EE2
          F3A10526CB04CF9AADC6C353E3B0FD3F56AFCA25F0A4429F80D26AA1AEDFB30F
          03264795BDA5563CCB6B68E7F29BC6B089770D6F604ED2354203ACEF5817E7AC
          3C2DCCFCD529EC052FEBB0D394814EE0F537260C9440884C291193CDD529ACB0
          6C2D0A3221969E403BAFBB65C9AD20863A8AD68AD151EA1E572D7EBF1CB2C1A3
          75F9157CD889D2E7344D83CA880DC1CD8F548B8FA6D64A50A84E15B690EF02A4
          96CA503414C81E36F4F5227978AE9285BBE44695D2EBFC60017600167B5F9D5E
          C04600D2C062FE3FA67E9A37AA11DD209B65D97C18FDFCFF0E8CE040E7B55351
          F02369C79DDBD432F2E7122A413019C3BED0869EE6DF493623FF903EDB0E4D88
          D64E02190C8F75FCEE5E6A712569DBBE1EBAFED089F9391B8FE31B2C6730E334
          4D311CFEC9CFBEF2FD929597AFB9FA045C732586D6E5FAB48394CA4C2F180A6C
          224E7ED03253E6849A6B0BDCFE78D28DE13AF1B4EC951ADBDAFC4EDF958F06DA
          C2B32E95FDDA0AFA237C7608A7C11C5E12674BCE76E5CBD8E7449268A59D3284
          A559F1ABC6BF71A21EEA4C62FA7B60C298C16E4019061C7AE9D16FDC61007803
          C3BD19777EFBA7A637AA87C3418D84E3113162B8F99D327E0FEEDA135FCA54C5
          970634C68F6E5EB7C428C8EDFAAC107A44EA1EE4BFC842F4ADA20DDF6C7F3817
          63EB6D966AF3051C3702FBAB53661B5DD1AFE82E8E6493F8DF7A816D495563BB
          70F1798D6F99FCB6F93BE3BD1BC85EB2794F026BC85C396378C10B9D019FFF4C
          153DC491EA0432F34FF74E5A079F7F3DF761D8ABC981CE74FBCD967F6BE67B21
          ED3A0DC64F2F195F19590986B042F00940B59815117F0D97C29ACB9A6FAE05D6
          E3C74E376977FFED42360F2D0F5D0D9513D22F6C3DF105D369D61FBBF746B936
          247486D6D1A1030BAB09AFC14A4264A08C0BD9B1C4EE9C18C29A14B062473408
          584DCA18A8626AE3F5A8107340FC9E09DE0D5696EDF808E2EFA889AE2F140545
          7886BCB13F12E85D9894DB2B52D9DEA57179AE5A0881D17F48DC51920619242A
          FB27C597BF353987982B3C9A75C88871B5C3DCBB69D28ABDF8C51D4FADC88551
          2841E68BF80A1A16FDEEECFF1D45FA1F75C940FF1FBB0916CA0C0CA305B90935
          8421C83798A9469FCBDCC9C659CD31F20764862DFA49F47A5CA01FE238717A11
          9B856DD33E38C3B9DA2DEAE28F0F2377BCB83CCDEB28A4C3336D72DEB747A9C9
          DD7F73BF6BE4A03F521C5F81BD77856EB7BE4773DC86CC5A979D1B7CFB9CBA98
          B0FB74DF87E97D3F5EA476CEAC340C1EDA0B26CFFFE4F7FFFA608AF73956FB14
          3ADA1E7A47A4A9965D2C847A14FD62CE41CAFDA58DE6F8E710721F96D4C5BF32
          31C981736FD816597AED84EFAD6CD0405D282AF23E0D740744DAFA488F87BD73
          2365F9E1C32DAE4992E11EE0D4000D04CEA3E0FC797DF2AEC515CB56235F4EEC
          961C3D21B99A19FEF5FEE5074444ECC7E4C17CB6640754757D11B0D1C1A4462E
          8CEA9A935EC332580976C0653F472488B65552E41C149A916020F375A6413741
          E0DE1D0C358E5303AB33728C510D06EEB0A8BB5F9E3A446A012AA0381855662F
          079C8CFCD56F18D5E2CF6657777F7762571640DC9F7B2EC88A9547D301BC8E6E
          847FAB6986F41CF47FB0FDB9B9498549CD5629C8390B6F9BE849E7B95CFD8886
          7243B9BF0D62AE64E741ADEBF73CAD0FEBBF3B93676C30B9E43CCDDE47CF47DE
          9BCF5A59F7620AEA21AEF4CE9AF873223BA5248553531D0D66AD24E79F7AC9D2
          46E52FED9724D131DDD0A90D91C417577C6BFF988C7C6442A596A59980E25FB9
          29BE5539E123246D8B09389294763E6B1707CD80C420040E47743971FAF394A3
          3270E77B17FF82ED5A9C3BBEEF234094D4E369A8C96300E25F51EA4494E42B0E
          09CF805287E1740C99AE9C613501598B287C5E6FE3338A2D4652AAE90E0B111C
          F3BC3AD181A15493A9B6050554366C54B798094F5EF3DD80B91F6D358670951B
          186A31B3840B20ACA6D3551C7B59CB1755FACA9D31279C042FE2F89D478F9336
          5A64F788F41C3154437C45545A6E4594AA30ADB20AD2AFDBCD6B7EC35A5808DD
          8E06839249569EB85C45991991F7ED83AEDAACD7471A1BEFFE3872F1E23285F3
          CAF6590DC10D09CB1367012F1FC25E6628D9B42A2B340A6CEB51E796AA65BF3C
          2C5730E37B65509E754E144402893F4912417FEFE75283281562AF6898FE66C2
          33737C47AFBB520F69E79D80D74D8A08D80391193F86841555886A84BD229877
          73FB3B70BD83F02660DF4B57C11F73AABE78EBF6D82151770D6F5D2CBCE25077
          E64D2973F6C115D1FB7B440436EA8CD9E28B4DF590EC51F49FC28C8E0E98DED3
          30D5F90C8287EBE77FE1E1421A41D8FA09D0AD069B2A22DAB3C740CB806858B5
          E3F4BDD552A313EA70083DA90A26C07BAE3C1890B9A8A413445959963F0B8A15
          8EF3FF5ED532E504A7E9D051B1FF3D38F4BE1B3CBA2B8C21CFD20E7E03966772
          F9965C0254069AC1553E08E0BB567B9626FB7BCFB739D3EA7AC7FC7D28E6BF9E
          5059B43CA12817694FA44FB0DFCE0D2EAD4F5CA2F77EF902D5D305DB40843CF8
          970F97E22C1A588A1D40F0855AFD5B98635FA36C1FAF87AAF88F5A9697578195
          1154ED3E40D74C57A0B0C3EB45D254135EF8E711D5A16C523947955608127754
          DE774EDAD31A3BDC83836C734BB747BD296AF423B025B4C4882BECD48367BED9
          1E99FFC387C6BD5B9FECDEEBE96BE789AD91E79B505436E004DD44D8FAC5A663
          80C0472F9E5A11E1751EF4C8381C9E6779D816698C148315700B4345B5092315
          687286C590EA6419FDD06DB0320954BDD56CE7726739438806058241D5DAD1BC
          C45DF5D7DAE6175F0914B4E935EB4FC966D6CC87BC92E75B51AC3676F9B72749
          FCA11EC280737242C0251607FAC044B59A28DA985EF732CF88AE45A7C119BE3A
          EC5F78B682C7BAF2E0DA2CCE69665CED272F0D83DAB0FEFAD0B0810155FC4DA1
          4C703FEB5CB47997A4246E878809D50776AC7ACDAC4661376669F79F1A985160
          AD88467B5F37A308B71B5380534C34EF7AC6A27D42E90F5DC5D2D806D5CE5F25
          09BD1C37087C24597D7724B15B0578C0CB28EFE27DCBC255C61E91EF4B8368F1
          ABCEA57BCF3CFCF870E0DBF4995F643E8CC53D3A5DFBB0250F4043B54496B234
          40A669F0A8EAE4A7401B66D31474EB2CCA7D0CB5478F1E2377DA7D2D8E5BCC54
          82ABD3B2673F24D97A2F4E302CE2129C6ABCF1FDE09FDF0D2FAA940A875564E0
          B20189CCB06A767F5320BC9B32E2B8E7F099A9C0A1D115472FAC8113632B213D
          87125D919C87B527D51E86F10C5742A5995085C47E0868E9CF7432A6D3CABD4C
          C060EBDE9C9A8B6EEEBC0A8908D2061E252E2B809C49D8F281FEBFB6A24E412F
          1202667DC10F0A7DCF51D74F4D3808E4F294A5CD25F576E5105D9E0C9D5E2DFE
          2DFE02590B5617125F8C4D2FF06B6585030C4A81086E088E2D958407EBE3EBB6
          ADE176DA9D07E0AB54E1859B8DA7053277A026D31FD45CCB37BD66CB00D05080
          CE76FC0DBEEC73EBFB98E999D3BD18FEA61996554825DB39CD310F510E048AC6
          69AC02AF33F90E89CA0948284199D56A9ED7D63B44D1B0F4B8912E88A8D22A8D
          463295649D75CFDE2E3A6BA7C70BB9CD9A7170EE47864379EA13A62AFA183629
          0AAAB92A0ED0D8C3206C6038816DD94980CA89238CECDEBBFB2BE743A73B0E71
          5141A77E7B34FE6C04F4085B17161725059C5F7DCE8EB02E2F970331FD8A96A9
          FD7BBD5317FCFDE089ABCBA07BD9777F6B20A677D4D53F4AC3BB884F5A766D77
          1BF89E1BE0453F0969048FF1B5909E9538E6667CEFFD2CE8956A91036795958B
          E3CF25E785807F4BFDD4DEC947BE1D74B157D8EBFF65AB3194C5CAA3BD241493
          C8BE8C98A05CD4F43420F92577A433372D179948B854229244A90622A23E7A12
          43738FA870DDB0D3A70837E6299FBDEB7A445F69DDD51BF0D46F629FA344670A
          483A3F3AEB02C632705554B58BC5E0456318F052AAF8B3633657A5D2F456C630
          6E23AA1D2FA04ADB432651347C03AD7FE55F2C35865E568E23D91B5EF0D84D21
          67FC3025819EB2D6772C52419D404A66C8FD5AE30C39E90DC1F6DAE6FB96CD94
          3F57DAEF856DFC91DD7036F95EB8FF3D1CD6C98EF95BA38AEB41B3E2DAB26BE3
          029A0B5D16DE1E04178DD617A02F74D6A8DF65D9608C7BF1E2BF51339977E1EC
          3A3BB31B7A23731E65A0DB59F93030AB3CBA7C4A76C69DF22CB5B511CA53E0BE
          787B5131EA87BDE05E5C9D85008468E5C4414DAF7FF212882266BF716B995180
          7447D4E9650F6574C204D2C0C8E655C7B085FC43402F5B59DD67336269B86453
          5DDA5AA71EFEF2E6A62DE7FB41C7685D5C91769B5E07B0C394B7E1446A497068
          6E82FE7287F01B71F3ACF93B5F6B3196111C8B60DF6DE40E63F939280C02A623
          C813CB02AA5ECD04D0B0797DB3CB9506351549A491AF58B8F2BBC9D9C772EE50
          294830A9082AB01D8CB36BFF1099FAC273A01F170E3BC918865866EFA8ECE50A
          9940167C3C43088736FAEC3ADC5CB9CB729D43616ADD379E5A7FD6B811CE1AE3
          D3E0F225F238883CE936F3B64199553064F6487A32A413F72A0947AB2CB9AACF
          6D6431BC58F65BE27BFB118D2F64E4C805691A8DE6CBCB3E3E2D61901F0A2FA6
          849F98F2627D1D078A915B7895B87B6583300E1407C5D500C92DBF5C6DA95F65
          FF14B5C716FF5E4D4582559B50C4D29BFDB55C09CDC07B6617C5B76B74924825
          513D0069BC07EF8488CA738A3E3774DC0C0FBB193744486DC72ED563C477D53D
          A1C955E2FEE813CB5FBBBF25126BAA484BE334A383F663B66CC6C85C156AB41E
          BD661AF05CEA34C0C4345448EF0DBA166242098569A061A22AA6196C1683D175
          A9F90838E46F66826EE0190C3A1FAD523DC5F1A5CA798823CF689A735A85D41C
          A464C1B04E306044E9A25BA419D30EF6A8C88D38B6ABC6C8987AFE88230EC979
          56ECB7CB5FCEE2DEF8F1ED0A98B0EABBCAF66E1397D3C6B2C284F744489D2336
          6C725D7FDAAD57467175510CD951DBEC6C72E03CDD38E8E20352EB97F9B336FF
          A6D4BFB486AAC6FFAD8EE170E0014FE85EAC95A0F93CB0233A06CE89AB93B319
          B76EB4F8E74132B4C4C7E7B58E2BF67701B02F8060B912BCA0BD594809A9B4EC
          FCCDFD1F9110A41CD5F89E42916A31043283876FBFAED9C1E67E4373A7A61DB8
          BDB14704442BBF67F52BC93F3F64F6F5C50DDA29B56E67D63E99DBFF7671D06B
          2C6EB01343FDD78C66CF8434CF1A5867A1613382B9EAD44C7937C56A21EB69A0
          07BA4188F232C5E46FE822085B08A49B8063E33147C55151667DE048EFED511C
          3BF969FD4B08D5AEEE35D1D0044E20D03683D05EEA66508D19D1EAAFFC62D7E1
          38FF2E06F35BEA0099E249B2AB5004D75C61DA3394B986965CA70D523CA19F49
          837EAEF0D0F482B25FA6764998E26A39C50D4F3A0301D0FD63C2F23EA7241F0D
          AB7DD9352F3D4C79E7A20715742BD5B01ED94689341EF512B89F22AD167BA12D
          71196CB125C44083FDFE0CFFFEE668997F919E69F1E944E19636A6AC304958C1
          5FFEA32A12FF403083CAF6ECE1A018D32B5AEDF8E2ADC46F2154455CB199076F
          80CFF89FDEFB3E5D31A53E2FC6AD839EF45ACBD425B5DD88F5A2B6638132D72E
          B21E58069A0D4060A256B5A6947CF00F430DB78ED74543C582A6474AA8B7E264
          2D0BF438721C396E217D429036442605526BF2B79703E745017207038D613BE4
          19088686609514BD178176043D8D3F020A9F1EBAA3EC3F2FA0C871FD591423B9
          C29A431947A0B0F58D767B6E0FEEDAED31ED8A5B1737FD991428E064552A99DF
          1F7658757118851ACC912E3728594CCDA33B054E7DC174216B2073E8E058A106
          061681FF55289B522A89E677EEBAA7BE2F8EEF9556DF6ADF91556CAC8FD6D627
          B7C40F420BC4DBF8FDDE0AEC70FB4E14A5D1F8812406022FF34B85044C2816E5
          8604CB4B510444C300926488279D95C099B3638A5DBB20E972C5DC849B005BE5
          AF0026453C74F72A01B1D2EEEA74A71F26EC55977808BEC2A6CE38C09093789D
          662A02484FE73D5B36D2E6AC0CE8D7998C16AF7E8399653BE148CF0897E8AD06
          02B7AD3B50D0D504143D576740173C5C2A4F78E12494DE9B2FA40DB5EEBC2643
          754885A41085055A93933A48A1727695A63C21699974878DBBB5CC841A8EC644
          C2E6E76150050B39B942CCEFBA8E41E3F6C338BF2B5ADF3E2D721241BF584A5B
          75B8B57E64B1EBE8CF734304482D3C557213D36D0EEF8F192F1251A16D5FF42E
          A15E8F44106A5318B3442132E4D5EEE7400CE45DA67B619DE792056743CCBFA8
          5FDACBB233C0E57406A27004BD7846A7171404A34ED9292F5D322889B908E122
          C9C27BFA1FEF49861197565F10D67C2F6A7955E4E0399C90977685D10AB737B2
          D53D5B9F24F7BE93A008ED3CE47CE3AB92B9F2E6B299C34E4F62BD408071BE3A
          050E1ACC40579351A2018C47229477D7B690C49524CB8A1B98154C0405473D1C
          6567822FC74C1413458F9128A840FBEA6D1986CAE7D450F952CBD76F6B7C7B74
          7E9C0606A8387A1359A0667390340E0B55CEE5213E9D34833D1202453214AD6A
          FB30BF05AAD39F8D9FB2A378BD4A22BA1DF1DEFC59D449F8ACB5CDD7FF2557FB
          3005B591435F0485547F580EF50E60D02079F46F9FD4658DCE9E22BC98C86369
          0623034ADE6F85BB42D578B813C499762DAEB378673A9ABF7AA670D1CF10228D
          C7DE79751A2324DB7E8E8FBFC90297627F70798F54D05F61FF1AB38D201AC261
          0F2F39B71DB508A23E88829C98B3FA4DA3ADD4CF6ACD1145D96D3C159F5F0B35
          7CB624D4444CF4987DFE3284EA37CB5FAFDCB1805682A855FC4561AF2474260B
          637B4B104F51C365CB519216D5844F3E16517365AD153D066B4E01DD28EEEF45
          43879C85C084EDB8ED542E14A8C9663482B6A39B60E48FCCBD33FEF303E0DC83
          C7F68F1A3D38D57143B260150C0B1BC4432063D4A61E3AD963A0908698FE238E
          FD1494091DC36B08AE79C6C376A1315E85D23648A24E4E780F4AA6876ED4B54F
          EBDB05AE234E23C65F73A09A1A827289CCCEB98DB2E652DBF8C49790F832F1E3
          76E7D713E01A4B6BC53220F36B00FF01F63971066493959268D4E74220AEC469
          1809A13161EA3FFC22EBA724E7EF3208FE0A786F8DAFC6352C405950CFD406CB
          07E876A01055D7732422A1340924ECDA3937F7ED62254B4B6F1D9DBF10F86CDF
          661D9B5207336C47E0F89921BFA61EBC9D5F963EC81CC2C67FB56E72A16C2216
          29017B05A6A719C864BDA3D6409D65EC48FC737AB70919DAA7B503FD18A8B22D
          7499806AB7F20083476AA7EB7D080D1B14A02001D948A2D0491A76F911D23127
          1D97E7F8C6D9209FBF61BAC18FD32BE7BAAB401A025ACEB1BF74BB96D3497454
          6B126AD04E06CD3C648EF7A61E5AA76A8E2D3574F539CA5E702E5FCE84477D0C
          5AFA05D77EB76124CAF7DDA231E3AFA7461DF57286DD287FDA05D30E0DEB4CE0
          8A4BC3194F218A997A8DA7012DF46DAD9C0F07CA0FEC586267CB7FE2F832733C
          FAA53B2FABC85FB3E96695BB10A5C36274EBCE72798FD40835AEE96FBC24F409
          CF442021587ADE00D4A4416EB814924097F3EF7F1C29C7361F00BFE9E3975EFD
          95B2FD605D288CF64068DD8C368A49B2E3C0992E3878BBD9D80D3EDE7583696D
          9F9F8FC2E8648413CD96F82CA48DB7A4643259231858731E286A92053D6EF288
          3A74FA24DD80488B9917BC56EBB108B994F8F9E30B928E3DC03493CD14ABB923
          4ABE161E3B19A572387048CE55E0B831F69DAFF08313E283B9CF1007431C7B00
          AD09DD280847472B99409E4654B9FA18C22C3911DB570F81993C6E7BFF4F43E6
          092D7D64208C5CAD86B91B7E715C99F0F0F4AFAAD04C712F436EA02D7C2013CC
          28EA59B4FEA2B62FA6AB62A253999BF738FFF5E0F6D3FA0DC571B023DA2C9499
          C9A813170B511EAC4641A68555B6EE2CF2E36CD60A5AD35845713C6DD2BEE98A
          F778899846584324A24EF0922BBD245FBF90D0C32FDA16275591AB5237B95F30
          48607BC7040E1A37FE1871C7681BA03229E1A38A2A39BC75C795CDB519950175
          DDE4D770B6AB601246453667B02168A4681B660F588D82AE49451E4E12836DE1
          8A66A051A7865F8EEE4B388F2233599BDE5E81C7E99A0C310BAF7D4C3D9AD867
          01602848E9B74956BBFB27F29CDD2B7C30B24C7C6822086236CDE2C3B08E2B17
          D3152AA69609FE237ABA9E3FF6A59E4F28B40220C4467BA830865D8B2833BDCB
          85B3CBCE5326BCC509EBDF08C603BF6A1CFBB9F1CF8DAEFD052C4DFFF7208BE9
          A3A8348E483D56C2C5C4A82EFAF887C5D36A4EB54073C009DF36D820ED8D876D
          5980220CF2E162B085E8CE6A3178E5854C3E12E50F2D8D1AB10084EF61D35144
          654503C0B8E21009AAB722C9FF7BBC4294CB815865A3077443CD8E5CF5B684EC
          2A5F381B3EFC93DDB6A47768F6D0536734D34D6957523C9ADF7DF67679CBDBBD
          5147C6C8BBF364181BC16435DA8E3A93B38EC6F50D1B3CF168F7533483996A41
          08922C541BBA66AA1191D5D63DC4EFC67F3091B2AE178DA596CD6E631A30B299
          27D7FA6B87C8B3EFF9A2260710A8A97463DF719CEB80920CC7B64CEEEC3EAA6F
          12DA3C04F4D39F30B582F0227465A4FD14A9E25446025442A120D8BF15AC25B4
          AD7FF655C1F1AB1A17C8CE94BDC894EDFE02A6ADCC4892C18BE95CB41D5CA26D
          074B5A307656259377F1F9FAA94A8EAACBB30C62C6B55E98D7815A5C5C89ADC7
          DD2A42D74522CF61A33FE42523FF7B19EC16F8AF7F8B3FB4FA21191CA47682C6
          3AA35332ED8D5E644346949BD680D4BCD09D231CF7DA4164BCE260A2E9F70FCA
          AE4D2CEE4D74985F958BE66FFCE5ED07AFD55FC984EAB9762D1A4EAF27778097
          57B07F94C3470022F93303D5480B0D2D507A7580217210A7B2EBED066848F90C
          18EE68406287468D146A00715E59246E318736D94DBCCB9DF2C482F2B7F300D5
          AD8D2F379A9714CB3E2DEDAB981622CEB1E0D2910F0C1A534B776B1A0B32E41C
          02D0E9980843C46560BAF8A35C3C2F4F24B19202AEB9F243AEBBF6D3B872032C
          B98236C5D145065ACDA19CDEAB73B766F4F577C24E93C0BDC9B98DB9E2B6B0DA
          B4EAD5A48FC317EF0685DC2DBD0F4969E012E0FF64DFBB8ECA173D90E20EE752
          64502E1E2FEB846AB1935B159ABECD9547E600EB11248E0DC14E08A16F82DE50
          AD8B7FCFF292C4D8774A44123AD243BD1482BC72D38A3DF6542A65F008897FDA
          D1BFDE6FDE25241DAE39FECC37422ACC9D5604F1AFD43DB022E958C8F42D03E7
          8CED730E2C1B9A38F6DDA709D450AC3403DFCDB7B3122319681A325B4EF368A3
          D8928BF99343A33083519F4E8A0F6A103C3602CD4436DA0EDED9D3E4C0851E1C
          B3D2CC6413EDFBFF561B393A411B99FFFB2DB8EF0BE63E069A3A34D01452F904
          ED088706743D5898E0285B9F43356E7E0AAD561071544D58B5E6BB629ADFF525
          D7CDF059B57CCB29C7E4DB28B99EB682ACFEE1610351367DC401EBF2EC020A57
          83313973B4CCAF97AF78BAF9E5BDA5B1DFA5CDA8D047D60F4219C0BC69926CDB
          714D29626E727C67714676754E7A329AC016C076BDA2B7648BF119F0B482B542
          518F315125804F799A0E8D28EED3F5FF2373CDBEE798EBC3E4A39B1FCDA63908
          EC6EBA61CFA37D1870B68E0F63BAD23BB0D2994F76F7041E4CBAB1D0F9C4248F
          9C754B2FCD0DB401F8BF857A9A934AD84B52881ACC8009EC19E34E61E03200BC
          115C8FAA1E86EB7149CF5AC5A08566A49A2CC8CD6898BFB28D0906EF1E96CE4C
          068BA312F8C33A46A074C057EA4C5738D88FEA916C466951167436D470E28787
          05E038027ABE4C30B5F4CBCBDA6FF93B30A398817CA5B565E6252CB3BE2A36A0
          D52F27A24ACED52CCF8147E97D70F84707CCAD77FD2F3FBFAD823EE046B4B4B9
          A0BDF9C3C50C0D0455BA7846A5C4257DFFD8FBC9A04BFE2CC88779D07B3FE53E
          4AD2198A7A0F2F459E7F88FF922D48026DCB828F507259817667797831524154
          8ADFDB564DBC3ABD0A933E45429144AA4ACBEDFDD9EB2A471B61C5AE2C471D7A
          2EE3F19231E74583F1CBBE2417AF93B75FE06F368CCA65BE11B280A1B3EE43F1
          F95F09065A7600867A05F6292A99599F669146B6E8007727748364345A7A376B
          0F5F21AAB562A4B11E25B4413D7ACC663A40E5C63CB190C86EFDF6304005230F
          862C5460A8C88C1751E02BB3BD9C0090C744D2D17D152A748E1482DF8DD147E8
          021849F8989A43C1ACA1E66BEB2AE17D5C54AE3CE28D63882192350C05D3E199
          94CB95C2B3F441D6D6BFEFBC9ABB6408AE647E0F9727125E3B85DD8170B2A6E2
          6522EFE9F53F9C8659D3E19FAF78EB6D1B7F6AFD866DDB9FCE50F4DE3F905D0D
          07BACEC2AD45EB9A58D9198F82002AC420903507CC464A0CEF83D35F19501C78
          E3D539A1B3138188BCD8AB13CD21817F3D525DF8C3F588BCB9805DE9D931C895
          272D5BF6CF54E269E8BA2A972B074F47DFFFE9ECCCA132D3CF1DBE44C78331F3
          1F1B892FB5950B10803607B6D260DA639AD18A513F1D25463B9A86B2EF27F652
          8581BDF2369269CEB6D3FF0E20E6F214B6D84D7604B919F5621D5F0A361C11AD
          A900E29238D742034F4E650E09F443CE74870673466B9390E63E2A13684906AA
          433F05717864C14B99A73FB5DE1A5D115511F608F5B2B77C9FF7EB02825F3F6F
          5FBDED013F4660180CD0ADCAAB3AF17C6399F6E2B736E13C3C3CA190C270C69B
          3D97B24E6C6807606958DA0B9E6367C120721117C8DF207D105B3ACF2B17CCD5
          E20C979BC3DBDBB39D1E45C1E426A47FE84BF353FDBD9FEA4DBDF1975680FD9B
          09084100C71E51A7E34859CCEC5C91B8DABEA3344AE211E7767E7CDFE0D13147
          07388CAEB07F36E5D909CEC632ECEEA616CF55198688F1253231D66765AAD662
          9B161A023A8768E36C1348FB9498B9432112035B8D63E64F2B0860A4A22E6240
          EC24F3F5AE4D18AABF162A06062A5761B2D060EC87D05A2E532B378B6B6DC801
          576EE419684145629F7C304743298FAE9773E55CF67080B3A21F8603C140689D
          A7A3460C4C8BA03D592AAC377285501F5267A204909ADBA7C5DD783F0EE9602B
          B4179FB31B3C09CB6E0BBE3C7C7B92EBAA59E9050FE94031E90F73E5832E724F
          7B351C78C283010C60E9D1E73FC7C1618098CCF51B9AEDA7623B3276DC2AEA05
          2954674D4DBFF5EAEC5496463655F6482386E6A405D6A3E00E42FB909B7D6698
          FD09C0096FC031E4C2F70FA13BAB5A7DF9F7AAB0AD6B8924FD8DAE64B07A7E2C
          1CFA2634EEF0DCBB7521CC3681A6C2D7EAFECF46B9B9AF2D79CE9A47FFBDC2F0
          59DAF775593A7CD580790F7B237309AFB5467E402444EE4020CC70031A45C029
          6032E27439DB1FFFC0EF61AB8186934C6826910C1A3DFBC4A59052E92C7BEF8F
          703579593ABDFAC0AD83662141706D70E0A3B143663DD3D227EE73265B3FF081
          873076D4EAE94C4978F00B0BB8536D95D028AE8F3A1B8B899ADFA3F205B1A624
          99E0D0B26BCDE7AFF62FB9BEEC9A52F0FDE731463728D8FEC46DEB86D5B75D9B
          03E042EEA395B933063017D068BCF009F597A05EF455C8E118C8EC3049A79535
          BA230AC38E759E3B92E3A138F968A3660B184ECF09FC2351E6B3C05AFF187C46
          14B31F03EE95791CBCBE4C0E43412606BC726314EE85BD9C4907D78DAF7ABAE3
          80E74718233E38C3F86ED59DE0BC48DDACA775F6BB390CC791BAA2D8A9CF937E
          8DCF67AF03D7FE5945B22515EEB717BEB54D20CA91B41A0CC74535FC5E2ACA34
          0826248BE10D660C27589A30856AC47500C3B3CE5B317B40FCB5A7F7DBCB5DED
          1D5F304DD6B11F7C3BE94630862907EC40CE1DA07207C04BAF240777181C7852
          3AC2504F77B0D70F20C753CC2CEA670A863C6034A168D5835054FB496DDA2555
          F5FE3D7C80B87F20DC6DFFB643CA9BAFEAAB969CA350B4768463D70BB73EB724
          583FB758FDCF627B7F666A57C0728007E634CDF44D3306169D70AD1CFA16F587
          2ECD37CF616687F7D5F1DBF2678924B7508E06A51D885F4D99CDD2CC9155B320
          71F19A444ABBE0D1B76FF62FDCA878E30321F5216F26D48FC004C76BDF6F4ECA
          4DCBDDF7BB2AC65F11AF94D32ABC23378EF99859BD32EADFA74EE5E1936E7DFE
          6C65F36B77B7D06BE306435D0A8BD7E54598E5616727FD703D917FD1EC70058B
          AC017EAFBB11F55ADCB9DF80E28AAD7FB0C1075A09238E721E02B26AB9090D28
          7E3B580D36634100128E0615C5CA1DC68389BC089D11C87A2A993B82223522BE
          C967D659EB98513B89408D3410B842298F89DE127D442BD0E970A6BD56CBF456
          FEFC9B91124AD2B7FCBA1326BF2459B049073FB3FCD859421F0BEBB00BA5FF0C
          6ECAD1D3239E98929F144026F6ECFECECCCCBAC69BF4AED7B32FBA908A60E2D5
          CA9F9EF0E830FCF7CF714BB12ADDDEA57078D66059E65354433260C776A9E3A4
          761F72B93F7B5E4653B3EDBCD58A1BBF43F51C19F8A42F616D84C73EE8B19109
          C8486AEC5DF2F7E58F7BE6CC989D9AEC3861DB375E1875E70A09233EE4CBC0DF
          E0C95081FC5763D6F6804179C0E059567491A77B418AEFFCAEC9B7F34F5CFACB
          79F25F037B9B3FC3DC870003F75EC4283BB919C5413261C5804A7D07B36454B3
          ED1C202C8CF291D7EB8E4F187DE40B5D5684A0813780DC052719ED55A1354593
          2DAE280FCA3FE92077D04AE5CB70DCB9936753FE3E6AC88155F60D6E423D5D41
          D3A204E8642569FD4146714F2C0431D2410248D8E4972CDF9A44B707BA900B6B
          F40F6164EDDFB4C14D7FB2D29FF5003814C6C0C3B25B55276AC223BAA2A78614
          FE9AF9A87FFE291E0BDA912AD4BC7CB8C563D6F78D940BB91EB0D5FB2ADF2BB7
          5C0C42296CAF3E78A0CB4E69A035BD44FA07CD10F0C3EFA8DAA19FF60A688E76
          2CDCD8A92E8CD697CCBF6CEF5A93F0CD1DAFDC5F5B758F83EA771B3C073A4365
          FFF8CEACDBBB5535B116C2BAF401B3BFA7BAAA9E3817ADC03DBA3FEE6D6B77AB
          2BDD71E08B2B7B1BFFFDFAB52EFA0AC6328A3A9C7AC1BD87A7F5518CE891F221
          2A93D1C49808446194096D272C0001D630DF87886B7D46F01A70312808BE7EC8
          48756672287D8E6A294FEE2633A23AE2A5575861C9F5C05A17B9051CE90E784E
          FB6C379E56ED25633AA22AE7DD80A1E097F0CC1532EFA1B88741586D483D2CB9
          A34EAF171CFA7BF9D96E0FF870CC0E943B43334DF5F37A7EDE6BFAF0F0F4B773
          9340F9A8685242C085699E3FD9EF9F38A911DA7D829E445D321FE3C10F107727
          668DAE3E7FC389F5A7E69DCB311FACCE312FCA1A1D8C790AE38F401451BDE50F
          B42B930A35AC4FA5F753EE6BAF16DB3B3A5A477D1F788741F7F8CDCB80B2FAA8
          C1E56E9AD3B95689E866E1D47F7C43BB0E5E7A9B64CCE74C88CB3BCA67155D2B
          8667A907634BCF38AAFFFAC25C67CD3D577B3525E366D046CCBB17C8E0623B1A
          D88BE34692C51DCC3CACDDA2A511C0756C46791379873B48C9600A57B645D45A
          E91B6F81732D6F448DE155D1AE8F83E984159569AE325C578D3411D923956448
          6B6E55213BE1D2DDE23683A77820A893C4C493EF31DD7B18DA994523F39F7827
          3F0845165C1F578222E8AA8B618BAE528D7B757D75DFADAA09B85A16E330EA30
          B77CD659ADE3B7A7AE660236F2F32F5796E3AE7A67C5DD4753216F10B1007D7B
          DE9FD87604B6C43C2A8BF0D85A3F5816B376F5BC07994F91016365F601E5658F
          E60436C9BEBF296BB67D023FA9100290368A67D7DF13FBB4DB471F11FFB49CA3
          4EA586F61D9D6B2C3FF7FEF7C8A53BF7D58F74F832C5EFB40B02F23F24BA6CD8
          357EB1F785C8A54765C71F3362A6729D962ED970C0A80A3C1EEB7F233E081EFE
          F5FB0FBF7BECDF8B51DD07CCFC7E57940547FDD4BD68F784F5CEFD0055604551
          8FCCD42A5121D6780FA9014B39FA4515D944D0793DE1D6FE69F747D9B6A3EE40
          D01D3B81EDD8698EE73DE0C388A39C2FF55D5C38D831BDD2764AA87BF5F884DF
          A307484E6054B0C111F45632453BF3C94CA8C677A2625A9379DD7682469BE6E4
          5F8F7CAE5F7CF676ED582881057371DAC957E7044A30638EDFC236DB675D4635
          14EED65B8AB6552F2FC140C10C8F0B994F352C7A42897E18E0754A99EDD30DE7
          DE0DA330F86E26DC5DD1690FFE2D4A687A14B5F926A5D39D02E9F09F660DC2CF
          E7DEFC7694A81F43FCD5DBB9C7204AB5CDDA923860A89EDF5EF7DB84AF33CFC8
          0403FFFE37D9774B45E9ADCF4B3D4E0BE7AC1E1CF889BCEEFB04D9E33FBC36DC
          51578E2E87FDABDCCE1EDEBAA2CE49EE7EE0B3BF504D7367B7D1354EA396FF9D
          4B1E564FB2F71A827E234EB8F750C734AEB8CF6DE00E0734E398C367F9D38AD4
          3CAD9D924FEB1FA0D9CEE0423AA7B75935786B61C8E80B7A8581C7948E25A895
          BCD92FB53042E20ACB8D510AE78F63AD247A279BC10087016D32D4C840100E20
          153A976BADA111D7ADE17F7F57F2F6BBCA2F4A1E2E309EA7AC65F97FC51D6492
          D12BD3B48ECFA6C2AA8439D39EC1B462EE85AB3343EE9A2E1EDB9F36F1451E1C
          ABFF6D241F8A3A7FE8BDEB54366B7006AFE5040FAA5396C26D9277074CBB19F8
          47C054780E82C5D81DD317BFA3F96305545F5F226E0EF059BC50ECE3C0317E9E
          1544AF4CBDCF58187F75597B5C09AD73EBDA80ADA1EF4E6FFBCA5AB683BA712E
          B6F9A7790599DEEB56FD41797AE97866674994D427DC65D0746F8A8E42B697C9
          D364212EE7316FA37B2D434B06C2DD49A626195974AD8E161E565E1B363C246C
          F6907EB539CEAFF6D3A750C02AD4F4FAF680994C38630A02E8721793C94C9091
          3C02CE30A21DE03810A6B425964EDE08C92C40419AA93578AA4982469E52CF73
          1C414DD82FF88555E72F13E0C89785F5C9FD8CE78171D727830C2E5C7D63713A
          B9E4994FA140A9DC74DEE81A99571F8352E99BB817C7AB465054D7D87D799383
          1FA89801EFDF2E2BF8609EF8F5BFF95BEF16F7D9724CC861D80AF5F93199573B
          84F7C5F1098B6EBD8ABC19A304F843C34AEA6C0CF8A1E2F9ECFD5B9A1EB1345B
          DADA3FB93172141F43DF44F177598CCF0F8CA7D3EE7C76E3FF61E93B009A3CBB
          EF6F36194076088130049922C850D18A14AB4091E257AD8238EAAEB50EEA6EAD
          3F5B571551D48F3AAAA22268B1D52A55B452C42A2888201BD91008992421830C
          92FFF3F2FD2B84381AC279EFBDE79CE7B9F7793FA55F9AD3F1E3B5799C32E383
          C408D0B495B1A8F4AF335AAE4E9B7B63987E24BFE306DE23B6CE9B69BB18DCAF
          1767B7D3DB6B8218A6F0389C17A3C73E156BF20B6D73F019120FA99EE800BECA
          C255024FFECD2FB80461E1F838B69C85340DCE4A170CB9AB51568FB90FD9F8B4
          9046D9381689748395A721319DFAA365436C70EAC764B3DA7D4CE36E1F038D3B
          B86AF9C8803869C79D6863761C2A838D30A51731B7CD4233E01CF49872BCBFFD
          AE91B6F8964D34FF4FF3E21BEE3213F58B7F38C2E736ABDBB3009ED3B0951EDC
          62B1FAFE7CB3352E11041573489B899FF534089277FD70DE317252115701B153
          FA7E4A7E04DF503A6A6CF55FA10C2E2A3974F0DBE7B5B736F8A3372E0454102F
          806102BA0EB874D7AD0A76DC896E10EB3D322B73DDFCFF7279309BFAE0611377
          C6ECDF9E9B42947D438BC2339E5F7ADC8862FAEEAAD4A2989D70F0F964F770C1
          76F02B7378CFEDB525D4BFAFFEFE704C02418D0B01B5D6318E228CEEDEBDE059
          8890FF4CEA6465DA75F39EF0A574578144E72021BE70809D6407DBA7CD7D3CE3
          1842926A61CB697C18741DD3E3F01486DA49CFA06905E0DAC4C3C646107A30CC
          8C6E96B8637BF26E000E8E514B411462728C39F347D812918B77A3B377AF21A4
          171BA536F87BFC0C35B3D7E699A836D1E7BF0D50B18E6D4B7CC2DD76978D0748
          A14D56206537C4062F271CD5B9E85C3C6010BDA0086EFFBB1E76C59F202C5BDF
          F69F496D5019A852CC007CEED0B1C93703FD1E788052559202501E086D978A24
          F510DE115F42077F9F7BE8E2862794ED26BDBC0E1FA6D863E6D71AD72EFC4DB8
          F1A3499767C234E8E8C09D79F88C16929714F33462AF96B6DA3677C6FD9CE45F
          0F66ED8BEDE236D3A87F782A9324DE5F2DD9A487C97594DED588858520C38D0B
          656C4DA0669C233E9ED1E80E52BA695237F0DD7A5E4C110FE2D0CF43C71A2FE1
          AB052139D7CC0E1B8E0E06A05AF16021382846026E9C27C779A2D01C638382E4
          36ECCE68C33341EBEFF10EA92181C2E86D3476C5C59526568C192721C61A0CF2
          865E0D99E6DD6B0432117C7B8CFEF92CDD74DCA4AE4977BFE8A833BAFBBCD679
          AE390AE49D57556FA792380E3365D761054D74A35A34C87045D00D8168EBA932
          B1BFFD0FCEAF6EC2BA7D08C7E8FE651D8FA28324213E7F7C98EC8B9C084C7BD7
          5E0229286DB7F4069C027A7CB90161E80F1E28085360E5511FB7E1F2CB9BE35C
          171C3FB0D475F1FC5FF75D3AFFFB7A794BC75FF7D72F87C8913F443BFCDC8DC7
          A8B359CDEB9D1B7010F567EF0F5AD77613AB4738BBF57DEC22F5A2A47079A3C7
          C9C3F33100A5783C0F2C2A3221FE2F42F0DC3CDC44F7A491C8977F367429D6E4
          4453A30C76B29BED04A7C9D0887487838AB501132906BA09E76446CC43C57351
          1D5B918F7E0F6C9A512986212668708231A721276F3DDFE9F55251257BA22F06
          8C58C3A1DC4F8375800537D34D24BFE629DD260869B657AFBD1251C3D62DFF95
          A9001797119AC61A2D7CBCFFEA303560F1C56138775EBF4A28FD488E6B0BE4CB
          70BC4E7F99C720B7222E472A4C54F0DA38CBBE751B866D755329F2EE883781AE
          BFEFD4BF5372DBB15D50245FC23D40E211800AE2E5E29EDDC54FE7F7F840CFCC
          78DC31B7D572F34BFF0EF774798FD8E39FB577BFDF7C8FFAF7ECDDE732F78627
          4D7D1D55D2A42ECA7FF1EA848782DC4595B9547DDCB3FFCCC2E69E555D65E3FB
          72B6540D4D5A773C435381234F8CD04CCC1D3858BA71A293099B042010BC907E
          A27BFBF5F7D3B8D61E048C8D08C8A2388D8DD3C16447290D084F244EF538BA81
          004EDC410AE8C5A0B69AF9EAD8DC9962B2DE8EB70F93B94627C08B7B87B35A7B
          81B2A0416E33B14D0EF018978AADE1D042333A70162045BDC553C1174AE675EC
          5F10FF74FE53179B91E4A97451B391B8228F3A0DD0E88AAA41E0F19A6BA3B4AE
          0E8F96F379121CBFCEFDE86D69C11337C189DD101D87C940A84145707664513D
          7C1101771275A0BC7E6B0318C23D4A9007F1EF40500232C4289777AF8FDA7077
          4545BFFAC8B1D5C2F53F163EF43FF25DB4F26ACE9DD59AB9D1B79D2C6BB32AC2
          B79F204FAE5FD0BBABFB1B9F9F6529A73BE8F12E5736FFA439DA124C3A629AFD
          745FD8B933EB47EC1C9542882311994A776C50CCA242C6008FC3914CD8E95704
          26A8386437ABD6289EF67EACC7009E430EAA016BB22163C724D81863084EF481
          E18E737050112422193846A690B482EEEF9707D12653EBDC5DE44E2E7A3C4D3E
          C9D818ACE751695A6B522982DE43E2E16CB30437F70719AC1F6D5C15F0CC2B1E
          2ABD2546A8B4ACC3DF9CE1FFD8B5CED7B5DD48B70884352E363742AFF5AE03D7
          16A0D38B90AC76B7825B61281FD724A34D6A14C804A5D299DDA734A550131DEB
          D2CBAE9CD1FF4BF8D27ED54416437BB97F8721BC035559ACB710024E2D02DF53
          DF8514C3BDC2753F098B57BCEEF0FEBCBF8C33A330EBFE21D5FE0DF567B45F1A
          69A39B463BEA779CE46ECB5C5DF5FC9CA03DBCF756CCBD88C6B3776DB192B7D7
          BE4C2BD97C0496F3162C3005B4EB77669FC5B9B318DEFFB2BAF06045EC8BF701
          8909F05884D9F1B871C238813DE23403546D783D4F81A3636F646C9CE034C619
          4595CFC9F4BF013E70D8B1D176BA9DABB6B64D23390D5BBC8D7CE72EDA901B1E
          3B00892AC383D8A470253B685A57B5F3288D300F9A95DC29737E251A70C1D776
          C89F05BB775062958DFE00D7894059DCF5CAC0F3D802E79B402023834570E8C2
          26170F89400E8D0FAE75E0A06DA9547EE4A3CF6FC2827F37116455E05CBBC2AB
          B3B206496938D0CB2EAAFF2AAE47DBF260EFF1BD3AB810886818E2A1848E1148
          7C09C07747C23F1DEB0E0E2FEC59D731FAC7AC84A0A7DAA43B21CD373FC75DFC
          C4BFCB7BB19A9DB441DBF745C77FBB2FBD08AEA12FE8926B0ABDBF497DE99179
          CCD97386F439D85684FDD96A5892B9BE36EF9B1BF587BB17E1C8040281AEE48C
          8040CA518586FFCBFE30C61F3718F030492F47F8E8A75D5F056D56070EA5B0CD
          538D48936A758C135823E3F4B1713C50C71CA2219C1DE5365BCDED23B8E72DD3
          7B4BDC87F06ED02F76D1E10194B469924157719B9709A80EE484632B1C6EB279
          8F490267D03051980437CDAFB0033D468254A053E37BC3AAAED7AE6A0BF3F856
          F63073E603929BDA2218B9AEFDBF9D05BB716D70A1EC2506E5B6EFB4FEE573C9
          8EAFF324473F0A6CEBDF571AD7D2D69D1C6CA664A3144E7C36AFDB37EA6DE9CC
          0ABF924D5086C81752CAE34B524AB055EC45D692158D3E4F0D092B1774E6F408
          E73D5BBDFB745550EE679F54C87B761FE1299F9F188F7C239CCB5A7A387375BD
          EA6271AE8BEE81C7C30AE7CE6EEADEFAE4E201A1FB37FA6BFE0B6B790F3AC517
          DB7F92687C70D3E4EA40A90A843260A938A3428645AD74572088F85FDEB4C9C1
          7724A6D26CC4D616C60816BA1E4B5CB2156F2602478903F701BADD32EEA9C493
          9C8750248E7BD9D55FFEE2045C255B3DE601F65157F4840B436E30E6C5912019
          0DD8B013CD79CC4AF2EA0477C7785803816E033F8B1334E2431AC1BFC3FF99CF
          6B1BF1F4857AB850059EBCCDA450CFCF2EECF9EAC1CC2BC14567FDB7440F7571
          5D70477E53428B5FA61B24275CA7075E3B59C1E3A84051F2E5C4CE12CCF63D1E
          65F39EEEF3C37F901986F4E55BCED3FD096D580A17D69E4AC938E1313A36BBAC
          E3F20FCBAF2505AC5E97C9BF94C65FB43886D9137374CF27FF9C38B51D16FB7F
          FCE9B7EC8B07D7D9769F997EA25C9303BB24754DBB6B9F268D2FCD39F4F5A4F8
          5B77030367FB64CE49FF706AAEA62A1A5B1EB19180070A3BB68E404A7E2F91E1
          7C3B088EA99C11732BF015C903C33A0379DC61A7DB8DA4F94FDCA58E71265189
          98D74498F78C8CEDA28089EA2C630057E2AE367801188D6C24A3B9A01C739FD2
          88C78AA4719A446F9CA6C219B18D4DAAC9C93FA07E0A34809C4FC06A02856824
          9BFD9DC66EED29AF9ED1396CE4398F3A777B72CF342F8CE5365949E18B7FC426
          73BFE329C02170904B43710E4187FF0DEF3F7F76BA6DAC9DF64498B2ECDB9D15
          5612EF11AC4011EDDA468EE8AF799B1A8CAD5594F8CF7E8994F3A50D86454F0D
          581C6664D09CD71D59940A94676BAA44E2F5BF4CAFEFF978B4EEEBC537EA658F
          C2232EAFCF91656DB931E75AA8EC5848D4C2DA472C379FF5A48BC76C3E0336CF
          1537AFCD3B9D43BC35B5A7F011BD1E9A3685389D1019DC71D886067084E61E1B
          70C852F4812DC010C709381FBDCE80E730196D34B28C3DE210584149606A1D88
          4AB8A0E08D604E78CC0925A67DED7922B6920F246764889D80064E783B5E09C8
          BBA13FB4039E215F53A2670035F11E154CCE5610F793FC44CF927A75F3AAC1BB
          790AB73CF31EC454FB4E7DE374916EA698B98441E0A805DBB25574C5CF7787D5
          933F240CAC1E33264ADA7F57E61C5DF6116EF048AE5C5BB5004A71D31497F707
          537F8AAE218A3935D13C98F49EA160347FFF5B04DCF4EBDF9253BBA2A536DCA3
          3C3EFD64072A80D8C5A25F969C127E485EBA3E768FD5E95102A50B260D393B9F
          A125B868C0FF444354F39CE05D7742CFA48CF1984F8FAD4FCE79F7BAB3245393
          B16C78659E9973B1EE78FDED88AC7F6FEBC4E5F1BD27AA1A3BBB44D2461C156B
          F471CCE9B549B149A389032884F2FF358CF01548C6E3AC788C239CC61C02B746
          3B461B3E5159510413D58273200276F291DFDBD8C8A729C7308DEA217162C318
          CD246360E081D1496DE783D14B3154BB8134C656A15875243D26A1EFE72E9FD7
          40237AF7DA8836B3FFF4C1F2786C4AE40A6CBDA361AECA058587396F067C6CC2
          71B71C541B3DB95B66DFE76E7A2617C84556B9E3E63E09E0F8A4C1C78947A7C1
          D345F7AE7F9BD67F3B3EBAEEEB8E47735EECCCFA4A7CED43B831DCF7C10F7F5C
          AF888BAC85454F51E14E2907C3ADE529A47B85E6FCF038AD6FF75F3C459629A8
          CF58B6E57D560847ECF11B997044716CEABDDD7F596C0B92EB37DFCBA89EF169
          36D446963181F092ACEF5F71C287023D3796BFCD2864E6E5FC9FEE5190CFA300
          CDE1189CABD546003E51E931B1968514CCC27CA49B89366CBED57D24A5D066C7
          16F64956B163B6D89887ADAF8E33C1483234CC1CC3399CA84AC07FF2CC4674B2
          E3C7B063499DC6DCF14A9AC346720235C9D5A8C69660DBBFE84314821D170226
          279C48C61FE46A917574E5750A716473BCA8AE652E88BE8E6D3DFCE6D9207DF1
          936B5F7603CFECFA7F7EF59F547D13902AFE3F8848288B6067FF9F8B8755282D
          0B159485EA5CD0DB70C75DA9FDA8F70178F0E0A36E590A75C90D1EE7E6CE8AD8
          BA172B1F43220E4AC1F203FCD806F1927A442028FEB6F496C077218F177D75E1
          61D2CB0EAF3799CF33DDA16A66D1A8327EE6A527EEBB6E796FDDB5FB8CCB9AC9
          8FEFD02C271597F4C2F4C89D5F915C3B7336DFD0CF3E33C5E135E8990D39E42D
          569D5AA4FCE45181B02C94CEC065158DB05442861A5BCF42F28F2F279BE8E0A4
          023CD540E445F0DF226908E35C8D8DEE6E61A865D89E09DE46269871847124AE
          F16C1318FC19C36425CAE1310FFB90D324A913C010E2136486F5B0A40285218D
          A7C0CE2344103A80ABB5A118E42AB93CC5A783CFC4E32E86F1706E39B68F3A65
          ECD6F2EB4481E68BFF7A0E9388E3065AD661129935ADCE211C8E40F0C12D871C
          3CAC24C720CE7DB03D0106F9449C24443EF779E6C85A8ED3DD54CEA3DA4A624C
          64F48A8E7ED76EF8EDEEDBD2C9BE51273E3EB8B4E472ED05D884C81858E23168
          5FA3559FD017384A9CAFCFD99D74BF29E6D8DC18F329A7C3B14DBDC5BE4BD59F
          FB70497B63B377CEF4FC5AADB87C201C82D6C7DB99E782BB07B28EC59E89F180
          15BC23CECB5DFE1C4DC9285C9F49FDEAA7000DEEC93E2999D13DEEAF56714025
          94A2D823DAF058E942F58BC8741BD6A0007508A44C0DDD89DD85636227F4009E
          4235A178C266979D4CF8C0F5073DB4EA311CC34A533BB1955CB5FECBAC304F7C
          48451CACD866A0D1ECE0325111A82808DD698D4E5CD0BA52409E3138083AB99F
          08281FCC94C98883E0D67278326A867183878C6405EBC1ABC3E4C97511EDC7CA
          A06C275BE4F090E090C146C65D2441D5C363B02DE0848DD722AC17C89ACA5430
          F92644F392FAA8E5B9DBBED8FAD988BDDBD737BCBE26A0AC9E6E48F1BE061038
          F7E325B84DD06D49721F235DABC9658D9C9C445BDBDDAA5D7186638A2FBEADEB
          BDA4D97D6BBE26E956D96AD3F168E7F40EF02F3AD0799395E2C2BF72E68BF413
          2F56D1DF2304C32ECEDA34F3F19D71DEC03D5716FF00E0247E93C68682E46A1E
          E68961E2BC56147C0407D5EC40AE0ECF06251EE7602BF178EC34613CC5847350
          9176C6B195386CDB084C28243D4DA00296893A42E6F71DB9D7CCEF157C795C3C
          9A568697E3B92115B3557D7C3D63026EC7189568E52A497CB9B711401E57E1BD
          E464C6B37995403464C2FB669D4A4671EEE681C10D692A0944B71848170EF23C
          1F67E7DF7AC80DAE8E9180CE9FD402FAE82107F05F7F84A23069CFC0AE5024B6
          17ECACC0BF21BE8984398CA7E9D0E3EBE889803ADFC7B3002EC443797CB93F24
          9CA25F2A8AFFC150B8BE5EB6E5D4A99A99BFD6D21EA7D4B34BEBF3CE1861C909
          FE77478EDC5ABEF9D03DE29A33345577C8B317BA8E43506B9DF1F54663E723D5
          81ADBB0E738894E527F27A358FD37308DB788A9B0BBB5A20B816C7A6B0C9B7D3
          A5232CD00449479007B187B68263823EF176AAD9554574D592E81A076E024000
          A6C96904019D588E479E980A5692C5C9DD12F9C4894C54734D543983260F356E
          DC29C0AE457C8DDE3E9A56A3475EA086CA9120FE110D8E51135A8764B3BCCA88
          71ADF3AA451FFDDB3AAF3256F9211691D0F4AD36E28C97400493DB9AA529C321
          BD0A1279B262840D2A63EAF12ABF4E7F391FD5E20E7FE46C89B617734892A391
          207FC0DB797781AEEA4B059E0271BD7D2BFBBCFA587FC4577801AED70BFA14E9
          5045F9F89F0BF188DF4A166D39FFC4B8684BFD74F9D8E658DCE27B840DAB5F36
          667D767083CB9AA310DDE0F655C102CAD5E12F3F4A0D7DF8251882C2E1CC9963
          FF5C11BB9CFAE4516141982E826ACA6E4FE659F71FFDC5FD9B06664AEB4F01EF
          B65C93E068AEA0A4D858D87113E3A3468609D12641EEF8FF39871D726EA2626A
          056BFEA08D60A7D4524D029D9D3EE28EE2CB2402934638EA2AF9EA7C886EC013
          6F1F72269A68B44111420F42FAB03339153C8C3D107A48F450394A2E8036AE62
          7EBDDC9527AA980F4FBD632B235E638DB0938B4762E18DC9EA02367ADE0E3584
          249F1E670F874253F63EF65AF1DE99B37CF9FFCE21E25A82702DC1837C90790C
          A2F758CABF3390340B460F3FCF869DD9FD7FCA81FF63909777B90F94FEE0F86D
          FE53F0BD97B0F0D3C05AFAA60B865B2713E44924FDDED8AC63C965610F8FD04E
          C09691CDCB7F3A70ABE4E8FEA399E20E667FE4D0F52B539212C561D7E0C2D563
          9E99E34590EED719B6654358DC39B8296E078894A6647C33F3C45627083B7AB0
          CED8FC252900252212D07207B2212A22434335074B1068B2FF356C4DD43B3BD5
          F4BF27C03458117E66CA926220E910442E60B6109D354CBA65DBF78E7975722F
          F4032088EC52BB68A28ADACDBCEE907E1ECA5FA487241EAC4EA21547E49BB571
          5F7F01FC20680DEA8B9573FD2ED1624154BCE4FDD4F7F4EAD72B56767F27A319
          7082EF0E9A8DC12D2C5E139059BBF2956BD8871FB4E82350F055CD241D4B1089
          241E129DBFFCC559DECCA661F6EABFD62B6ACE55F779795F18D907BD7D5EB85E
          6C492982079D9658CD72084F98B6FCDBF6554B56ACBE1B52B6E1D247373ECCFB
          EA41EAB9796EAC7FDF77FBEFFEC6B3E3FC93A62FD9A65D997115A3D343651D7F
          DD8C4D625DBDEC77851A13DC121954E07D6C1FF10CBE7E5670A942685B751FBF
          BFC1BB3777DBCD93AB3FDB8943359E3532F10B46046001AD8F1ED09711603B10
          A23ABC0D1374083513C5CCD2C244DF9119EC76BA1983C8C67F368561B6739F4D
          B371F14A6CCE844E97E3B1A67E8B33FAFFB4D35BF0A6088917BF095D0F1C0724
          93CC5A572DB23EEE417DBD7C7401100743B72D169B6E2AAF3EFB137EDE138246
          01341C4DF369B36964C7CF00E1F5E4E0164B36E3C88ABA955DAF767628619236
          085927898024793273EBE4657B4824AB60247867D19BBA1B95E9DEBD7D711508
          3FEC08B95EAF1E5F807F36303F4D29F9F679F0CDC7E454E18FB7A85FC9A2E183
          BC3E1CAA15BC43B5E7F67B6DFDF6C46E5EC34B66B8B3D3B1EECB52E2CCEE88AE
          1B2B0B0A0B2F6D0879EEAF03DCC92C2872BE3D2DF083882FEFC0354E4762B0DA
          B556E3E49473CB6AC4094704520EC20B21A875455F41A0F0E9C0AA1D1EFD8E82
          77477F8218D74CC23B194D74AA1A8FCA10D6CFC5B4E9287873A0A8E88702339E
          AEB6B34D66A6818EC27494E20A0C3D4F117F5F13A2B09079544C9F4FD48250A9
          165C017D2208E310450F22E715CEFD8B658E0711E5B67B4735D888CBAFE308DC
          01D21541DA77D11FD30D74B663C442660F67AB1F6CB970B6C57FDB7F9F88FD51
          BEA0DA3094BFFFE896E0964D02610D0D6738C40B3E13D93D12EBD5677F1DDB1A
          80DEFFE96D80F7EE6E7FFFEB03DE355402130A0237222318CCBDB3AEC273CD77
          6CA1D9D7F6C1DDCDF5B8677A31D228FB4E6C6B9DBB5FA8BED250E1FF6E949E5A
          B5A5DFB573517B4B4747F24D45165317BA4B91F5A889A95C5DB602D62F6ADBC9
          0185DF9DC88C6FD92C5C8824BE4EFABFB162C0A2D0CED4FBF4F874105D47F076
          816544A0E10FBA8E99277AE048563B85AE0C6D43CF4960661BAC76B61BE97A98
          9776944CC79661E9068A1EFD0B03200C616057C1E0EA2694FD83446F8EC4433B
          1A2D953CDE6256222918570F2CAF0AF006E49C41A484C678A83467AEFEEA990C
          7D132E7493AC57F66E25EFA18365A25D8C253BEC94BD26118E25C4B4FC099FFD
          B94F22407A547BFE73617F606C948214DA4E5CED5274F8CE3E66F2947D4F27F7
          9DDEE1551A84A5304468E178023D95F91DA21008EF987F8FBE6EBA20675FCAAA
          8E20911BD5F1F77369EAEEC7DBDF14EF795593DA4F24E64F27CFF4EB3CBA64A4
          2B9D67BD31EC9C0EEBD72B93510697FC7939EC78F2D1F0BDCFF257082117DE6C
          BC93B7F9516F4661C934136E7ABFD63E09301588C0F3EFE09015F6A98D0CAA05
          8B49AC33C621008D19A52302946445B8715F2FE821E1C7F81ABA1AD81A1B3FAA
          D485A841514942844C41CFB0BE1970B6D3B57EA1777CBD9AB569772869E50C67
          5715476B25D9B02B4591BB6AF9F39EC9F941AD412244C0A2E258A814BB9F5CFE
          6414BDBC726BCEAABB67CD928BC3802DFBB340967D721A0CAC2E7B901B810DEA
          B5B8600BB212DDF9BABB8B23B41987E90E7AF193DCEC21A0E41FED6B1D89B5E3
          2B63A7DE0EC268F834ECF0EE86A6B91790939BBFF82E2329637AD3FC7BBF1946
          66429B2B72FB2EAADF78860D0F52F1BE3342F67D7546B7214EB4CC19A0E04B45
          494AE4D2F1EE624D2675E16F0502F3B9439DCCC7D5A7B7BECDFC201AD950F227
          9C0BEDCC5D95B09D9532FA2F6EC38D6010113AD458000A542E6EA0924DB5CA09
          6051ADBE639E2AA4FCEDF145F79B213385A4B7E3492857A94B0B508A326D4413
          A0380433C5B75D348067821A12DFAA4940C71B20AE928C32760012FBBCA092BC
          C9DEF0B72FD5142D4510BAA22A115EC107B96B782B047DA040EC20B0EB6245EF
          B9A2027C9DF3C7859888D973D150225B67F8E980270C78AA0DF4A3D90EDE6A28
          4B804FFECE3E2D720CB60B83AD73AE6C4A1AE8D215C31274E10E5D56AFEB6F3C
          7CA7F16851772462E1B4E9198F5116B727758F39F9D694FBD7A7941B50D5D0EE
          BA7B8F9E7FBE829E94A7542B6EFD7B5A24DB709AE9C89F1E07706285F091010A
          617B5C58E6D13FE3320BBC77EC0890F974DDE8CC129897CCA9CA839C998AAD3F
          397556E7099987B64506B57689436FAB99459371AE6601474226C858133F1F4C
          19B6B0414243F1873C1859E13AE6640433C621780611EBC0B253503852A87EC2
          D71A330545A495E1AAB4C7BF55529C11FF1ACC8C51E71739779C47AD6C04A136
          ED91055CA7D6E1E39B00C5DF14A9C48914F78C4B41648D543440DF446BE207A2
          211E9453DF3CF3CA7C03B7284C990DC7BA25B7ED9241F8CF2956C18D9523474F
          EECADE096AE4E7FE0FA5309CCF830423D0AC489D86B7388CF4F43F0D604C2146
          22E79F379D15049533D0CBFA94263922EAB72D74874EBFCFD6C3A5A292B8D497
          4FB7C3C7F9A6FF984F1C0AD47DB7FDDAA27F3FFA37A522BCFEBFCFE1D2AA35B7
          DBF09276CDEA9033CE4D07C623C1AAEB8533D5ED1B37446A3BC3C20A6EBEF0F1
          3910131E0AE1EE90F3B610AAC8A70ABD3955E40C5C885E0181A47E324839DA40
          90A6FF6E11EBB504851D041CB31AE7206B107BE0CD76A03A19AD13FC61423C02
          661659C6565326640E86A39942B69851F5A36BE61F9F67C09A3663A119780A30
          F174229B09091C2C79118148A64095101082287FA195465C34881985FE25175C
          7AE6DDB2197DFDF62EB458696CD005B4004BCD89A8DB724E969D5F17B1BA2C21
          1F85E1C95277419DFBE6EFF74FBE1D001E2316F486485F19AF5B5DBC538B8C9B
          295009B0AFE2A2F10C2A84E0555A9AFFBE81147077A231EBB22325B233656A94
          69C77138018B92B77EDF0B992F2B665F5BD753313FBCDABB20AB8BF6A112BCBF
          56774D0276E90C7B2E7577B279CFAA5666C6C5F0E97927C8BEDFC3D1468E6651
          6B6AC6A7CB21E308EB6A16645C74C609D9128A8EAB9CA4464A46E006D04FE6B4
          08186AB67E1CBEF8DD82F21A6FB753F1262A72BF14B0DAA9766C581848E6C4D2
          CEAFBA7B603EFF86A7C16466809EA92121FDE23C8AB7D3E9A6A84A221EC5E0C3
          793C2A72D7A6681482AA04A8700596B1EBF30FBD717D5EF5942018B4C556438C
          925B192BE9845ECDE2EBD675CF862C569E81A366095BC022D8958DDD154698FB
          E451A6BA0EE0F8DE849D6E3B45A239A144A8A119E9C1358089827D37D7AB66ED
          9FC22A9D1E8B8A602B2422BCFABCBB2FCF81A4EEF600681A4FB880CC50467301
          6BF7E38F1FF8CEFE0984D4EDD045FBE1C8E8A8C87627A33706D61FC1F16A5DEE
          65E67BCE137A6F3C99FC44B86F79C987ED61FB7A0E8CFBD148FD6A78D876ABFF
          C8A2D23339F225905147DAB281F7605689EA9B4338A10A0584C275846534078B
          6A3D671589F55DC12AB0501F31C2C67832C4CB78570D0EEC4804629137012052
          83BC27B0AA914118A3DA88063AFAB43288780B2A60F4A8728473D5DEC6515793
          98AFB676A535290255E0E0AA421BC79CF9C8FFEE727B5081BE523E1045301853
          09E6C96CBF5B34F0B03F51220D354E18A46373031887FD70DE6D3822E1A4B065
          726A5D5970320DD2420F2F8CB2920D57BE39B79560421732BA9E64041289AED8
          DABD7CA060492D44E64F614D608895073BE4264200B4BF865B2D2D3DF52957D3
          5D56DCEC39782675CF994792BCCDB3581F32069E925FEEFB71CEEEF53FB2C51E
          A5D73EDFF965FC8898ADAE9AC4CF85AC71EFDEB049DCCBEBAFFA28355034C327
          2C7D71BD6D5FC417D9B55094BD922F879A652939382F0BB0F5527F8A4A269046
          D411A70C8FF899F50CC429EC05E731FB21B008553264462874C413D8F4DCC458
          0E89AE03A6BCC1634E17AA82643B686C7BAEF906968D62A9EC0A728AAB969C7C
          C799475598926B3C844D0E01B6EF8C6A2C7FC8FD8B33EE10340836AF41847CEC
          B3A00F800307DD036E2E7F7631850ECEA3061C4B4D77BAFE319D85734CAB1B26
          1F4DCC3CDB7210B7734ACDB9919A87DFBB0D142F397C6CE721209181A6000FDC
          06339CFD3AB7FC58E346B83867E4CDF4F4ED48C7A0D88320EFF063A854341AC2
          134E697F6C9F1A5CD8FDE3F90D1BD651E0BD68F8B82E72F9BFF7A48C5FC84B09
          A3D5E94306D7C9E7129F7E9E133AEA9C0A847B8BC68FFDAC294A8792ED9D9B2F
          8E0B1476BF2B8B15390CB7CEC0BDC6F8CBE0DD1F7A71CBCA839AB006AC3321E2
          91D04DDF631312C62DE27E6A7756118ED5150C2D761002A7CD8752F831498627
          9991A7B5E3297830DB11E71AAC248B3359CE3520F240A50F291802594182A550
          6CA7B8F6967845AC28D7C6424D1923EDA07F3A9503C2A66473993B98311B42E4
          BBE882EA95413A1AC290827D9A215E3906B796DF75260CE2DC33AE3A7590C828
          F47F3066B3D52CDCCE932396A459C6ABD7570A87874921F587D31A5739386A82
          8E849D3E6005B2E1EB4BDF5B73FC96E44D8774D83F2771FB19D8BE636A70D5B6
          C4802F6C7FBF8546F0F728FF4FD2C5B63BF33F5D223D71E1D0A03675BB9C1FB9
          D8B11F462F25081E2F74F0E1C457EFE28EADC5D51CA8EDB8B77BD1BD9B4F0A8E
          ED43E8555FBEEA332AC38736442E9F39939D6C07D3DCA635A956957AB01FD62A
          FCFEF6C109C99691A9C38C2E01B69ECA58F0FB286584E6DD122CD1C124E8B1F9
          ABC916825D89671BB05912A404992CB5D1CA40860E4FB72BB9C87E2044AC5403
          5D9399358D61768E2A47053BE6FC96B7945172549F424C0C7C142129DAA5E228
          49C884F083EAB57CEC5072E0D37AE362EE89067541D8901AA2110FE515587BC5
          B6F1CAC5AD8AE81A8F11301C84AB5BCE016E4D5D4259C4D1C30B977BC283F6F1
          38EF6115E77AA168F09F8F69BF0264E50018F76537DD84079D59450192C89137
          3BBC4EF7ED6845899B187D372DEE95EDBBC8F6C64DA7C2139C863FBE14053E41
          1991D1277F7DAC8E976B579C222C6C4F9EFBF0DC52BE5E086704AEC99734E48A
          2493D967498EF09F45C98B1AD54DEE00912AD068C29A5C52A6BD2DBCC9E9F031
          0C309FDF5ED6BE3C4E961C39FD42288A40228FA167F4D8F02C36C5CC9895DBC7
          607A59C4019D335EBDC7F364C152A3C750DC1BB20C4F419E170C50F5B103A7B1
          231BC246AACFCA9C181223824DB37AFD7CAA0D1965247E118A31FC4754EDF497
          5541C1BE6DC2B8C6E3BB9463D819505A88ABA720055D11D7D79900AD040A100D
          1422360B3079EA3D5F1873BFA80313190C9E5B7EDC7975CDD16C245DDC32A10C
          12B22322AE462017326B0FEDE01E171355470782EEFB9F49461A5D43A5143F53
          B99B1F2822FBC160A4C194D8820CDFC741703A31A0BD749B6FAF424210C2D433
          4B85D2D00343391FA71CB364155A933E2806C3E1E8B74D1716B62DA2936E6D5F
          BF3BA9333766C1959EAA7B1D4CDE83D48C8D056B661649B3806D67F63374800C
          88CF5643757317503DB4E9509C38FCBA6AC58A4E2662E12E3B848254E591F60A
          FAD96D5EBD4C2163D84A934CD25BC81C15C184B4C7081B469CEC560A76DC3B49
          8FC8846EC0240D0A440A06802DF31AE25F930BB6980D884B8018F3D6428EAA7C
          D175FD626752B0D49E81E817C297AF21224383FC08523108445203CDEB03C50B
          449566BA0D9614C49B544E559B6447CEAEA6D3EE88666FBE3AECB6B3C0A6DC99
          CD4D6567EF54AFFB03CAA436CF93111C24D1B13379AF9415E268CEC346F8BED0
          F3A39C6D04D2EF912FE8A756F20C1B5B5FCC294D0C981083E8D177DBDC0EAC41
          9ACEF8B4EBC1D3FCA8EC24DF20B1E53CB539BA695EEADCE25BB07DFD21CE7FB3
          04D1CBA3FCF1EFFEB3DEB1BFE83F14284A2F49096E8130682078A997BCEBD240
          D8EA63F4DE8C8C4CE6C67D610DF56CD2433DF056440222112D8FC06C734B7BA2
          4611B8E0F95C281292DEE3EDC0620363D6134A0B7A2A503008B87F6662F37356
          9F1EA69A42D163E507B12FB2C0885CFEFCA58204181B932DE4E4125B6CA579CE
          2FF181209CB7E9C4F2407239C4F3900A3C995393528FC520B4CA413075EF51E8
          05C3640AB7DA66A68B4450EDCBC6231A9EFAB585E9747DA9619EB465671D445C
          751B5E5357B706AE460C2861CBC29CC2BA798E1102C568A041480B81CB81669C
          C1E5BB85DBEB5271C1F91E12A4F86841B59091BBCD67FF9C8076F40B72B7C1FB
          4507E1DB76288F0F28DB467FBB7EB7B8839849842BDDB0EE55D6998849643E54
          79FF70B9FAD9970F773F4F3BFB5079D0FD6DF2B1EFEC400869F083CEB07E1DD3
          C6EF04C4BCB591DB1F67A4AEFD1B7AD7CF1FE3A8A405FD651538273CD8373FEF
          9A441AE6A0E05A0039EE0EB61A651B9990F6BBDBAC578D4C64A834241333130A
          88F441A6C63EB11E43B24ED85F4A2C3C0592E9D58FCF58E02060E70113632ACD
          CEC9F7638FCF8BE2D7C8CB32E0D392948DF10FD3F5812A775A2F56075715F7DA
          125A210C6F6E9D37D81A4E6F344CE1569A2753C63C44EFE985C3593F9377FCBC
          FFEA7078A67AE95E04611D6C31B2CBEAD4C1C97005706A0167581B0061576846
          17F8E2B7D5BF1CBEABE9A0FFFA5DF7DF07E08B93343ACD48332A605B7B6D26B6
          35713A114A6176CF62E7AAB6786FD76038591F1E377DF3BCA50F555463CDA55F
          9B0B8ED2B68F0EEB84BF6D5F7F5F21FFEB419E30F7F976EA33FFA12F84486473
          6A6F6681B8D68F36FD3230353C45D896F30D4571EC1B1B2A162BA0B870BD6AD5
          B2A650C0390918120F8AB9C735FDC982076A9B2E6404C596C5C824A43D310193
          34E0797DCDF09801D6CE707DF20B0E303DC89CC85F92958DDEA3819256A2C9BC
          ED39EB91FDDA972804816C090CC49A2CA8A628EC9048E147FFAA8720A1EC8F17
          671C30AF1E3BDE62C8B451789CE46D4A80674131034AABA87C1C09111854364E
          F910017E5BC78176765AE8E1736BD965C7FF86EC0848806C881800CF320B2920
          35DB42DE11D2FF230D36E61849561A104D565F258292F7753E1878885250102A
          788A6DB54BBA5118DE7DB92DF74C1F1D46DF7FFA3EFD6EF05F1DF9852BC6B61D
          7C4C9DF9EBE5E2B8AC82FAA1E46A56390BC2FFDA0E0AC713D2B2B02D54A72597
          A89C80499B8BCF2EE79C4DC73AAD3C51AEE0ED41AD616BB79D4890D1E31E1DA8
          2D72B66BD5DB7AFAE332301983B8571ADAE24E19E473DEF88E3984A8B47579B4
          86B71183F4EA91A9D70589EFF130E53A23E73E536275D74754EAB1F8B327F6AB
          C651B9B39141DE80ECAF3DE5913DE53E9021F93EA4C1A3A8CA5854E90069C751
          671B479232FB90BB59C5410128E79B599FDFA419832AFC6C5EA26AD1A028E6BD
          BD73090C0232D3954B3AC1708925BBFC75CD7B775F6A07F70F147D50B7860DEA
          47D2B5D96C87C4435843221BE806FA8E90AD1B7FBEBCFA2738F0551D84567B48
          68C8567F31FA3B28763506E426967AF5EDB86844B1587A06EE32A25E2EEA24D7
          EE2E662539A09462683A5BCF7E23A68447D6767CDE70735E7E77E6E48496C89C
          37E3FB3687BB8534A7767C52C3036440EA5C34D8BA22F875DBF17617BD78C7B6
          227BECDF1B983AFB09CFECDAB08BB3B2B3F008407C3009FAC57AB50182549DD3
          1B7904ECE80861BD27109820D532976DD85B671971C9CC77FE3C8F2BAAC35368
          462BB33A46C316353823DA50BBC4D6BD025F3AD540214FEC3B59108D9031FD12
          F536592A842670906CC4519A105BCB96634BA97CE89A84D93840121015814A98
          E15930D199802AE0FBA994E68BC888DC5820D8A5A6BD82089A53D92C235C7593
          0A87DD20F9EAB060E4D75DB0FAA2F187D1C31E2334D87AC097D1404312D0CB88
          0D0583918387D58D504ADBB864F7BB8DF65C9A31B1D59301A53BBCBBCF7ACCBB
          B728A3308D6AA2C13FCB0535C5E2E3B563A7D74ED62834F7A0EA120F1E35D52F
          4B3DE688AEA1FDDF1E3F7AF2666B3189DEEB023AB6DACFD68B5E3DB3F68774B8
          F445D7CB6D78581613B1AAF7E6E3239F742316568B673DE90021434F6B053FAB
          45DC4A2733C0C40305D3CCA8A352C0A75F8BCD30688C48690B9BA84C194BC3B1
          6B183A8AB38144C46E469079039FF908D966845CDA2340FC8B7130167E18DB36
          71B0651EC0002259B19598B856A079C1A00E3DF6C556C68A8ACD9419EA0F933F
          90D20A32E13DF484FE4C7EB852865CF9CE88EC08147FB07D55C4F63DD2938080
          0BE93C0E9F4028C5DC04A117CFEE52B30F6F45694B4FBDB2F6014D61041E7A48
          2CE54596426269C51FB5D1701AB6412D2C8EDEC35145AA268DE2C8C31B1EC047
          AC51C1F89D5587D79BBCDB6315E81A8F368DBC5F95BFDFEFF1826DDB08F78677
          3F7D7662FF32313E3B0B324B341064EDE4D13100BD8F6577E91E3883F8B30666
          EFE69F249F696EAA53877142F1307CFEBC2DD04C21E95A5D3C4DA6F47C0A5BCF
          18E032E7BE9AF544421B99A457D8816A9EFF029C153E14A9D67564A5FC11159B
          BFE6DA01551CA463624AD929F2B7D8FA3139AA3A455E498C24BC852804DFDBA8
          3E6443945C25704145E40F8AB010046C1DC6451453DCEB8D9D2FB5E4FD074061
          B864702204A1139CC56BAD875F9525445C5D0375113430C6C19E2C6493657722
          A13614161AD6C39450033D243DFFEB1D881BD195E6B1D5464CDA28380C05DDB0
          BE3D2077B6271F0FADA589A5DBF03503695060C7AB32D34FCE2C82F4BBD674B2
          EFE16CFEBFC9D51DCBABEB3714CD121302CBB5ADCDFB80B99BBB01BE514DDF76
          F466EB89E971371F1766BEEC45A92C51033EA216F0A18753BD23BE90A77C510B
          25107070F2E0E5C8DA0CDC34292657F282490A5EABCEC56F46451B658ABE87C7
          5890BFFA7EDA6D0D0F46BD91DF2581794C88D34C419605E73B4BFE946988AF36
          6063F7239CE4FB441B2263A68D3CEA0C9658780B8075EA452108C7EBB0A331DC
          E53607D28EAE4A2EB22215F31A8250F4C9F9C8C7D9BCFA264434C2900B50196B
          F2EB849FF71CA6B1CB0AEB20616CE1DE08DAAB590B1744D43970D765EB7EC520
          C48EEF85A5BEAD086738EC42C9A4E7ACAA43C98BA8778281273824129381A5E9
          2301B9301B801174430589E3EF5682DDB7FE69FE3FA8924CAD75133F9E7AF9CB
          D45B0AFBD9DE478625503DDC96D7BBFE72753B642998290DB38B9704D4BCECCD
          C99AE816F29B9F87B410B29FA47E9DF82735DF7D281D6E4AA6C8BFB4924B0E5A
          71BEC3AE6C1398108A083F76AF90A9612F78A597529832E39830A17268F3931E
          3B72C294C00E67AB86E7663577E0839B98663A5E45462ADACA4E2E60C694261E
          9F87C9672CE4DE42327A44304608EFC7CA4D585BAA09A6D623FC44431C60793D
          F337BA747A7B55F87937CCAB06ACF371B208B09DF50FB1A24EC345DC7FD79359
          DFC09EDC3240B5AF2E820D65DB5722FC50FE7E2C130082D0F7A91F98EF871AA6
          FE74B8B94897492FC2CEB04F478F062A43AF4218A2974CE7B7231467336A5400
          DB6A3D9FAA586C5B5AC183BBDDB3D5C3E9504E4E249DB57DA35F70F853C283AD
          BD08A38C1B4B0F84971416462E879DF64C96FB5ABFDA13A6C2B5500C1A264911
          598B300460D645689893ACA17973FA358FB4336E270545EBEA99383605B481A4
          61024F878C290CAE1B8302966213C0194FC23023F30985F49EA5C253CDAED4B4
          0B811AEC6E555D9B7F37E999601B7546E1638E4790D991858B2F7F93836823AA
          12D3D228FE2AC9C952025FDA16A81CFBEC9D020520DFAC056B5203B2C1463D9F
          46B4F935B8A032185B3E2102FB264F1D4424AC9CDAF9339059238617756AA8FB
          1F83BC82ED8D05D29302380B4BA78E1E5B7A679FE19F2648EB44D94801CF5D5B
          01B05280459F822A9600A4DE8FD6B7AEB4D7BE4C7CF1BCE8797F34AA87A08FBC
          C1D26616C40FF7CC4FD3B4910BB30144BF1B58B31F6EB8F5384CA846E1355C5F
          B18F77370E8A96DFB4AF080B656A0A33977D364EF0A135E039748302726ED532
          3561A43A3BCFFACBE448E4EB5226C1898F226274E7712126D3C8E6DF39A40E1B
          E88206896C89C57B9C4199FBAA95DBEDCE32F1665DA12BF1C0D2B28DAB6F3BA8
          481B0E0792DA30FB6A35B16D6475E61DF34AB883527762578F8C4864F40D8453
          E6B4FC75EB6C3C8C2B953C4738089E605D488023A2C2290290336861CFFC7472
          6F2F8829F6A2984595E0251215232523EA84C31EB2F0E19D909F0AB4577B8F27
          A869E7AFD79C77C049810C3AFD046751FEE28B96DE09353C48A7E42BB6FA6DFD
          B680F36931CD382101D1172A5EC18168809A2BB076655C738E18042C80B6BA6F
          1F8B08E3EF8288307306D668F71A6688D2D75F2EFA7D65FAB49FAF09A42910F9
          794BC151FF25DE9C9D71C5DB72AF48157E6F136AF162A252130975D959CCE4C2
          892345F1A7F9D9A042BAF0445EFFB2C2DA490939381A0284A0E52794E8707491
          8C69327B676609D90BEEF350D8F0108B4C6A011692DB439B9F0FB316FCCE809E
          29C88BAA132B35D4A58F46AD58E5A3E3EDD8720219DB8F472EEE4D0E642D0C81
          3E05AA877DD135F0D99F7E83C05578788CD5B368BCFA10F1333EA0526845014F
          6A70B161D625BEF2C49506C8EC4455F567F2D132692664DF398E3C08409D9AED
          D6F270E5C8274B51D5C38EBF32537C9FCE7FAA669B1FA416D1F50CDFC0474B8A
          117A0A54277846083F5171E4F23116BCF86C69C5F3B9359E9B2E944EFFE15C29
          FEFADF0F77ED5F33F474D5C8DCB661700B84B619D452B70F93173C4906F8F8E0
          9D0024F678AAEB12EA76EF1DECC785E0FD539642A39A04610D7EB486CD7948C6
          F829418752E6F48D9DB0DCEE1753581457B2BBC03E7C3E14B7B95631ECA6F498
          5BA0B7031B04D6CE1013AF27F3F7CF1FB70761E77480CA6D40C3B39208CC96A9
          003D99F9FE306C25495797A8F1993FA40E83864186513A62DE894D488BD939AA
          5AB177F9A753E06D141FA029B4C9E4499160F7E500B26B546F6B52AF77032016
          09EAA53803834D2DA798E9C83B2FB9670B082BC8A434C3CFE0B69311747CEF71
          84DEA947653040FC19F60C9FE8F4BC9F5E143AA5289452BBD4F721503C733AFD
          0C5DB430B78BD76BDA91AEC62064E8AE1D6395CEB6A61F3150A3371DA2B70294
          3D3FEDB9F82FE5DC1A864C0BAE1FE7AF82251FDA86D34B9DA769BAF9724AB731
          ECC3DB42085EF7E3B96F90572B9AA789D694748D4F4EC16F2A5630FF1C4D4176
          705961664343649706CFF97E1BD3CED600495174CCD8C93BF35753F5E9C68C14
          5C0803093ED307579BDECE2698B969AFF4035C656A4BAF40E64DEAD74E816186
          84C9E82139D63D31F1DE0BFA8438A77186DEAAB1B3701A24930C74FC2865023B
          3B168251D5316FED31E5D6F9D8B611A2624F01D6D581E3A2688605922198F1F7
          2780DD5C1B82F40328F87A3CCDC84D5FDF3F589E891DC4F4FE920504922BFAB2
          BD00C74F7D7BAA407C016C4D4F44D37E05987673ADFC29D446D62286F830EB6C
          6431A43E802546DDF75D1BCC74C39C1ABC1D49D75C3804ED46DAB4D6E891F43E
          AF3E6ECE1FFF891EFFB4EFB9A025EB273A0984498FA33569AF67D05EF23D5012
          53CB0D2FA897333EFF1CF05DAD7B1BBCA137E39B0827A8B2883F71ADC5972417
          3917A2BCF543A543AEC3839D07EA359721B2FFFB6D614DC8A1DC4F0D231D3AB8
          72232E8402241DE2B756A60EE7CA9E5F6E9513994A16C3A45CF75C2A56A4FDCE
          D06B26998C6ED0EA098C7ED9F6E71A8DB3856C222A85E3C93757403ED21F36EC
          2E422893911146F4F13F2113F5D637F07E1AD478C9C1010B9EF01449D221179D
          9C6F1D61056887615460740E79ED8CCD2CD27D7B1CBEDDB6082A987EC61698DD
          B6DC260AE1141277F0A860D3794FA914EBDB89FAF95D332CECFD50BB14A09902
          6603DBFCAC851E594BF3F57B954AE9F8800AA0C2B8A3F5053DB2747A23DD9795
          18B72FA8D2F7E9B38A9F821889D703FBDB606ED2C969429C67703904A61F244F
          D330DFF9A2A27B6AE1C385073AD75FB9E5BDB62552F2795E6EAA4F4F73EA75BF
          9990B3D3F760B02C192B7C4C94823A00DCB837A79639A95F110965CC2A72644F
          F3341A842312492B1277B88046832EA2903ABAE4917ADDFD31521FF80E4FE958
          FD04F4A3CE16B917556AA35399A4B751B37EF5548BF5FE8FFC2574000D5B89A7
          9080AC76ACB8B3144A62AA95AB4BF01807CBFB919C117384084007CEC18F403C
          9C54EBB0CD900E59610451711C7404779A2726B028B1BEB76D019CCAC9631D53
          CE932D17664627442CC0C62E80F7EDDE9AFD47F3BD96E62C0881EA983B6962FA
          D3DA4873D3BEEE4EF07C5F06BEE0F20A29510335AD884E634BBEBC9386FF0376
          14751BA82B17D3AC3FD4A81265578DA9E2BA33D7E92BEE7EBF7DD307C79F6ED3
          E161EA833B5DFFD267BC8E2F79B06BED665B70E1C203B6F37F666A3B6FD5866D
          D950B455A16143F9C542E44AC32EFAF1B0AD59F411D6ABC3EEA21CD6C064F6E2
          975516CD642637ED5AA882494C94C2B3EE6B04F801A21A85ABBD2F506DE30E72
          2DAECDD34093769F0A12F7565F6ADB36F923ED5413C834DE00C3BCCFCF53E3CB
          6938A4ACECDC67617C8B99329DC0BF4FC62AA07DC4195CE3EF93A3E47C1817DE
          F7E3A81C5CE347EF70EE83A2411C76DF69F0E23E779E2175505F8B59ADD3B406
          7795F9E71FCCF225EAAA4FF3A501ED01A9D9FF884C0ACC5D286CC49AECE1A274
          F2AF77DE6E845932D8B5BA6835E41FC8B98C71885F0E221140614743E4A1E019
          A6351F2C7DB1F13466E3801670DE46BCFB873EC870D07D8943BCF3502F8C545C
          68A17A241ECAEC883FF9A5D39CF1CA80D781F0845E0376FA1CF58DDAB0E997C1
          4FA981C8EDABECD085F729117EDE9B93D719B6CB35F5110AC28C426F97061E5D
          AD4356A8289DF94B7A4653432E5BBD0A9830869B36A31C3B835B8E38C445042E
          AAF9794149AFFA0DFA68DD60E63D2AB385861DDDCEB70F7235C83310857A3785
          8A63228F83928204AC86F162BA3302F0C5C7138BD1316F65C415F2E678A4A4F9
          4DA1D044B4E28003DA10849E68CF6692230A559ED70103A0B088E3E1FD5455A9
          BB3BBCF5E64E1C516AA4C554CD937B3CC8152A6C011A19769744F8F7C767DE5D
          F3E7C3D2CE5ACC822CBD93763FB428DD2FC8F08FA16AC77E9EC2F8C9A770C48E
          07C39C564FC3AABE3F1473022EAFA65CA4AA76FCB103BC2FE85F261EDBF4C119
          FA4BB6167CCADA7F0DBE3C2AA4CC167728FEF9CA61B2F8926B373CC84A1ABBBC
          B930FE1E5276DBC2FA35801D1CE75DEE837F658903EF5E665D734A2EB2D3C8D4
          3199D456A6E6C14A4D465D6B4E1693DB893F7DE5DE24E861E1BC48D65175D6E3
          763BE0999AD0714607A8833420CDBAAF14B9CCFA952EAEB1B399DDC2F45CBE9C
          4ED4BA3A4B3DD2CE470C8E72C61794609B2106E6B825B61CACEC51C4066F2D3A
          8106CF056C29104520C8C6C06375BE92649B2F135493DCAD2096F68D7EF23AA0
          D69BD8EADF83CC11B80345355909744FD3ADB565D1498F270FFEFB1B7C7B0A40
          812EC7F101A5036E9C5D9A353D1279BC5AEC56DE9E03E039905FD87D6CDF3114
          687A3C66C58DD3BB3DFAB15D60973EDA9C80C22555ABB6D30ABDFA0E1DCC7E47
          55354E89507DBFFDB763ABF6B8788C041F4ED6C78F7706B42F0BFF0D222F4F13
          4AB3BC8F6DDFDF74B924C40721981ADFCB136B630A0161963B3BC409329AA448
          5BA34ACF2C407C8CDE0320A24145F0FB6DD0E31379775875B0EC250791489B93
          1ACF308C035BCDC4DB3CA536DD74FF47E03240A70BDFD3B9547B2B13AFF6B3A9
          896A3C8EAE0B42B9EEAF9730A544121E957C82D6EE0269C571E36FC8D85D2A64
          62D9B813DB84BE9B7CBC8E475594C3AF53E0193C5DF10FD36065F186804492D9
          66CCBD825347B58F62760F591750A9D8014DB41E30CCC5891296FF2315629DC5
          0AB065275EB34D7B9757D41F4A41E82DBD13899D06DD990FAB6BA31F42EE314B
          3B2A94C8FAD21440C5232C697AD56C60BC98F382975BFE6255ECD031566269D0
          8D676B54016FE1F80DA96B7F986C4A79BC7C2E50764724720AC1B0EFACCBCC6F
          7E383B7072667A2FCA4B0DE41E56D9F1A791F743D205DFC5F257E03B26A1FA97
          CB4F07979442602292C08736E07DBBC59CAE732B8A526635681E9E39840BD133
          5A39664432C8F4F1C059036ADE27E5D2CD4F7B5CBDA5D43EAFF151D070B88340
          B4611D2678FBBA7C9BCECBC2EEE0AA7164A09BCC48062AC1856C8FE1DF8F7DAB
          31E3BC40EB3C8AADA88225ADFC21345F1F8019F34E81BB31A6DA0BFAE8667E3B
          DB81E36137620567C334F8A003173650F21E672B92482B2A3CE628C4140D15BA
          81C87B712145D50DB53BCCE6C11124FF226B23F3E1703325FFE8119A5BB7473B
          60D50F210801009280761A80E74B2F763FF8BD61AD6E7D31C546B4CCBDA1826D
          FF195D71DB3A0827223E21E4041FC21FE86495B56CF633BCF318F9FB73DD1345
          F0BE1582EC934DBE5AD5DACB804754BAD96FF2F6CE30387A7065CC4CBCEFD9E4
          C80EDD89DDE87B9F9F09DE1A0D1326D53249E280C2CD79BC6A9F2A64AB59B8AC
          BCE0776C8D1D6FE7999117C69B346A361B3A5DB8DDD3DBAC5E835C25F2776C7C
          1F1D8FD78EB381602682E043543F594A3551AD240B8E61A55B4639166C5DDA92
          76C7145AE7C23DB18AF6CB577E201BE2BC8EE771FED90570320E45DEEDC52C18
          99A1235B9D47494D0143A3CEEED01EF5D65B12AE04359BDC18A08E2FB8033C29
          518CB5B3A2149665ED7BE7D80D737798A1BB9436E54DBA4318778CF49F4EBFEA
          19451632AB151401A7C9075F19BD8C86F50580C52018A87662A48CFBEEC076D6
          649B5211D01BA59CBBB8C9DB3AF84FD57770C3E060FF36EF3FCFCF2DBFE59B48
          1869AD0D6EF79CFD1A61D5107CE02B2EAD61623006336BAFAAB2C28C67F736DC
          243AA794EC07A902C9D69B59E22E8D773F2A73BE5A055E6C5054CD04087B7535
          266804C74EAE6DC53A7AED48EDD0A966BB5AE7824CB14616ADD75BA8A35CA40F
          B9DD1CB5ABA01DEC78170DDB46F4D7F5B0844D542B6384451ED79296E6131654
          DBC8E815A2FE82450F7DBB831A59B17DFAF8EBDCE8F14858A681EB99F3D387E4
          142EAA8AEE568B926475EB708651AC9CA00CBE79A0D705D8F4666F7AEB92FB79
          5C050F9B0A3049518DF4DC212E9E6EAB85E99179B4D550CBF2ED2E05A42C6953
          863F9D7F480032B50202FEFBA34C423346B61A0306900D0E1A307AD4D1842EFD
          0CA32108D8EF4CB33E00BBEE1283D3FB9FC947E164E7AC328392BDE44D3DAC09
          EACCDB9C0745E9DE4471337560BC647B67E4A548C06FBA60F7FB665B6E4C6F3A
          84ADDD61C72F6BAFBD791201285514B9C7A104DD7CC1EECDA9B3A3B7CE99FEB4
          13AA3A1F375D74C3B1D99DF0BF9E7A82AB9DAD5C7786211A348CD30E9FA75220
          B85666D36D863C1E7750F4611C82A035EB9695B0E4AA80D382A7C43D259929FF
          EBEF70563B386021EAC689AE23469F011E9E0AC16FCF3E697A7FE34ACCB1C47D
          838F49F30E13C2493014299DE8ED1A726F770E50F646BDC5CF7FC5E12AD56CFA
          C064FF3F7289C09B98C7317DF15160DBF2EE2A5E6DE3C43A294C0F2D9A02B135
          00ED0110563B8C2AE4B456939183477F67078667BB477B80DA18AE94D84DDCBC
          AF1D7907B84977BAC13EAD5D09BF91A08FC111D72DB38843C6AE864B64024E9B
          5D901A7ABAD7AF934737E0390963507C0E0EF49670508E525BA1644B6FD5C6D9
          79DE79191AA626A3306CED36C0DC4F15CCCC28449698A929C9D430C5BB5654A5
          2A6EFA6D84A3FB7141AD985044FFB9B0D548BBB44290490D446F13E007FC66D4
          AA3A5D28BE1D9846D1013E6050CF802054B4D5E20F4E1A679D8B86684B2E3727
          56DBDEFD584C059BD1BCE85FEDA6FAD74C0D0BCA6E9FDCFBF6EDD9FA57F143AB
          8EE2DC1BCCB94748C023F54D74B3B803BC16A32884A87762E8F5460A54171276
          AC94C843170D348AAFFF6BC88DEEA71723F0769CDE9C0F735E4C6BFF7FBD5D09
          585367BAFE9290B227310B212C212012431015ACD6A5A2B854ADC56A5B17045B
          EB50DB286375C671A90B146BB5B674501BDBAAD58AE2D2EAD4A56A5D40BCA215
          0514841845F625210BC981003124DCEF0F50719EDE19A7ED9D6308249EE49CFF
          3DDFF2BEDFBF1CDD08E635E0A1738F3D0F1E02A8164000B141A8737885E98DAD
          E22A499D6E92BECE5D7AB15F3F8DEB304A2352D3A31EE8A4EFB0BF48808D397C
          5D484D581D9DF38AD2CEF0A49BE2394A6CB500F3DF1BDF7853211B79F1A6CCD4
          72B2721EFED0238059606A1E9ABA8C9E37F2F0E9AC330B7510AF9CF00829B403
          A1CC5F4677C467652C075EFE29881B8E00B25C8C5C30A27DA91D02BB89C6D58D
          50C9A8764F689430475F29B7B0B946A33305B1FC55E4C9EAD62CAAEA57236EA1
          E84CD7368E9E4B87C7CF4D3BC81D3664EBAC811FBF0B3FB81B154D4761575953
          E7C42B35AEE1838E8617296146B4C6AFC159F3327A839FB79A16D81842AAAF2C
          6A18E86BA2F2C6DE7A6181A81BBF8B1070B72D106A7F44EF1D71131415533E8A
          AB0FD93FA3DF7E52721638DA976C9B720BAD4FC78BD2F3EF0004F0EF78B47A51
          CDCB2665148AAB32DFFCF800AC5E983021436FE015794452EBE0FDFCF6B77733
          DD5AE8C0F12DC34C480B0CA9F02843B7630CB9130CE5A86FD353CB252EE56436
          DBE79B74102D3DE28082D698C38430E7C60890B640E58C62B44492ABF145B48D
          692BCE5CCF4B7DD47F2D8D452408261064D1500F1487AF67DA8D8CB0A13FBBBA
          97CB286DA70BB6B113CF0FE3240F2D9505AE21C522418983EFDAD8C531A0BCF1
          6901D73686EBA8EBED8EC5155E074346F934FDFC68E46446CE92120684FB8FD9
          B865A2DF7752EBF3D54CBF555BEB69806CA60593086016F186DBC3F4C6B042B1
          67E48F507D5C8C221719CC6608692384EFCB29214A047C4C61DB887EFDFA29F1
          8F7331630A05AD3275F4554F5D50350CE587EFE6B73B0C6732DA2DC630D01B94
          A8238EACF668ACE079869729132555C3E0D12A2524CF9878A37AD97E2330D846
          065F0B8CA00A4EEA8E72422A42279F251A36819565420E7D781E64DCCC92104B
          93D43C7A9D704288641610D0E88F5EC7E887009E998EAE3D62F9BBCAC8958910
          0F593499AD1C58AE3AE05011352642F5203EDFB5DD61B1BA1C38FB55508B2ED4
          D8896C97642816DD8400FE690F5FF3EE4F0FDDADFEFAC7F688BAE67EADC0E96C
          F11E95BFE3ADC4F3DBAEEC50308E31DBDA570D3A51641E2F8DDD7AF9E5410DD5
          C3374DEB04A61F34805FB55F835F430B376319E28804E436488C944BC241F4C7
          CC01889609F3EFC3BA51B04000273F6C2D1C741388DFB62960FF07FF73DEC35D
          A692154AD5EE9874D142AB79005185E090F0DB3CDEF8AED021A9D97442BFC5B6
          52FFE196B67DCCB947E6B23E084A5202537CE353C8B501925D0A3301D744F376
          50923159524087525C2BE6983822D5DF1F6F43F188E8206F4E8F8EA13BA2172C
          8BBF078D628C7F91C5029B29B462EE112780F1D7ABCE4CCF403B851B89E595A5
          0B69215394C06A7530EC0C390A66DC14392A373FF7D215E9AA9A9764DACE84AF
          BC4DCEA1D0749A9DEEE070F52E031E823DE051BFE6D74FB48B988F1916E6734D
          3E8F5B423ABADC63C7AD2A4FE877394DA1FC5BE231886A183BC8FF106FD3D16F
          A3AE7A01D008808206F28C16E8476CB065186612D221CC7FD03A22B50BDCACED
          3BDA1630F79C9D7275D00B57D5513628014F1D86C229E7C7789D9F0787793295
          61F90100596DEBF32A6E8D17978F972073FDE20085F44E27C857D76F5E73D1E5
          C2918A934BEB567CDEB559B93E8D3287147073D627411E68CC761018BC5A415C
          0509512B047C157A71B40DCDC6817EB723D56C3361C28CCF9FBC680AC293B1B7
          18054AF4658929FD6D0E5ED96BD333963BE7B2A6AF882C266609370CD3CFF096
          D2421D1574B2D8136B408D8174FF0AC72BB9D3AE096F4A3C6B650FDFCA60732A
          1076E7EA6D649029CB05CC03BB2AC8ECFF7EAFE7957804E8AC56BED126CCF8E2
          5697FC6EF807490191079379C766A7CE884E099EDA39B1ACA9FAF9584D99BD30
          AA08A59CAECBBF9A69F3D3756DDF8469F8B6D4BBC56AA486E9510CC3EB41E31C
          60AB010B1C9DB34060690B5A0E9F8F1AB11666406D600553250BEC9E0A1471CE
          06AC7695CC0235E4BE3E358EAD7E9051F82D331E85DCD77E891330CBFBAA3ED1
          A4514736A656D15649DEF3327F39F0BE627DFF6FF8EEB5A417D159338172C99F
          370538ED85FEEE57CE7651197BDB866785A2D39E799FFDF53B057447FA0AE2BA
          95108C8E7A5127381F8D2C0EFDD42159BE0C2223D0B9E3F3D9D22C090D2F8413
          1AC2CB3018DA282FFFA1D7417873446B13BBC91F1E708D76277ECE7578300C72
          44F4D8737187576EDB393759E920B3945CE7FCE3B1C0D504DB56BACD4B09E2D4
          4F0ABD3ABE2978CF841DB13739B38E294B8A16945583CE0F300393213580C627
          A9225490643D1697FC60E0FD94C5E8F884AC7F51DB25872F3C3DAA91A9C13C38
          E969790BAC3F84AE5934D9793BD25371E9C8A6D006F1278A710BD8AB3EB280AC
          CBE3B6B461FBA7099FACCC02C7C2C0B4AE0DEF6DAF0358F371E69B4195BB6817
          BF9FA59B7F08185C347A2B45E7890B046B5624BC9448D6CD950DCD0267C314DF
          79D688738221FDE3754B3356908C011B6085C254A482A4DD6891C347131410C4
          50BDB886A9635167361AEEBB4968742FAA7B2EA617999D4AB124C58A7F70ACAE
          2AB9D52872D493B513282780641742A505DEAF9E8A53F6830997AD036C250B7F
          F430EBBECFBC9E9067EB18C7F8DE6AE40A273637C89B1B9628F4ECE55F42A771
          C39605BB93EAD79ECF7701FFFA117A758B14D464E4377AB195CC0944B2117647
          2C480A832ED581D6E1BAFDCB0F5ADA9C5DBC001EE02E43D7AD0D8CD0FBDE41FC
          703B1502111FB9134AEAA5F3ECAF1E76714FE70762CF1A17BFD594FF8970C97B
          22BBF7EB92249755FE8ADD15218E96BF6E81B4BFD71EDA910CE7CA134E512BAE
          9423A1A5738C70F6CD35B7B34854A4DE65EC006259F1F9E50A65FCB0152C4984
          72480D3215046DF1F0624CBF82871310CEA26D5926E88622D4032571B9E25A8D
          A671388D443742A3093E688A093F19D99D814D3A9037190329939705B8BA9E9B
          D4DB31547228493577AEBDC050CFF356F97869BC76BDD7BCE1AB7170DDADC36D
          C28F5372F45697214B143CDF3B533D76278FFB42AE9DF3C5783BE3C6A22F6CDC
          357BD0FC747E36426698C661DD95043281180A9F3FADCE1EDFBE3FE463820BB4
          CA90258F01B50E6D704CE0889BB58188E088BD11F7604827849D88B87741861F
          0ABCE015D8D0CC0A536F59EDA7EEE7FAD8666177FA055553AD96CD92AA4FBA44
          8D9BB636EC03C5DA9C923FBFE35B65F9FE45EEB49F745CE103BB50876C8271AD
          3C55B102ED217A84128318E936B70D477208784C853263B8617AC6DE7B5E94E9
          74A24935DA11FF4D443944B6658EEE35A4F8B3A6C862096BF318D5485A8F7981
          4C4F488A246607282E34F9AB428D5CA3506B748A94DE89C3C4C341A4A2733853
          BE67C664C944F271005FC89B97BE46BDD57C71F6B8F58F1D1532AB6B65C8E86B
          F5149D96A2EE77E4B43D839770B1F0F986FA5D9BA0DA8F10699B1FC9226AEF16
          56181241A43130F5EA3180ECD383F26B5B0D3CB12740CA1C030F264373333330
          E21C46BF887B8BF622E211610F5CEE44581F0290AA962A4AEF69D902F19E1FAC
          F6860FB68ADAAAFA6DAF47B670101298F0F13088F5DEDEB40B2ADF81AF76D40E
          D905F30F91F58042E8E5E4A61CA080C4B85389E520B4B660641290E89F0E4A64
          361C30D1C5CBFB2FAD821B234D138AF2A64E1B763B8BE8133AB0A6290738CBD3
          F1590276792485BB18E4AFD39C0190443F670A41613F4405AE46247E726B399A
          1C71FA6EFCBCC88A760C3267C4EEF7F51B5C964A1E3BCEFF628EBCBAD56FE695
          52F9A1F907286F77DB001584D65AB935C82E1ABDFD1A9730C2D7244EBA08B756
          1DB0EBBA3A113B942246A94E8071D0D0E28CBC122425BB0062BF3BFFB54C2556
          63F4E3C9022F90059F23EEA1D591C08787BF47EEC8EC5C8DC5AD03CE214D84A9
          688996C5DB1B336167CB42DB363635277BA1F2E835DB0E1E75F4E5BF023D7B92
          7DEBEA2E6F38B93386A91E7929EA9CD91E5AAE18794389E2DE217B20A776AE54
          49BA87BE70193A84219E7E465C9CAE2CE7DE7FFFBC11B5C6810213A7C14F70CA
          F71F2B6467879A20FAD1B48F829D95D7B672491532A248607E5F4A83271B4652
          06848D67E4B6B6D88D323DBB89EA71EE5E23744E9116186873EEBAB650FA637F
          7179139AC695358D2B39A6561C322FA60EA2F90BF8E38F1859F8C9C8CEA187C2
          A32E2EAD7BB8F9E2ED35B087408744B0C10641368C824863A4DE6408123CE0C7
          BD8656F7DA52C24ED015F03853CF01A1D21521E0AB211056C4DD8B20E0595DC1
          EDF6AC135011529BB2B7D65213D5F19E99BE9536B40C96AD96AC5C47FB5B06AF
          FE79B86FE3ADFB5B72FAA03ACDAAA00AFAB22285164AE23F33C5E6DAB98C37AE
          51443B5212CB1B17CA15D3D6164BA69D9DA6EC3121DE247541B4AD188D0F1E4D
          571544A7EF87AB9C1B3E4D23217D3BA6D8C8C649C805D17D4906C3978B0EA4AE
          855F002428B1A815997C7AEC317D70255E2D90D482FD09784E2BA4D05085DC68
          D6B70766AFCF7C14BE3B761D11F8B093879961B168A7CD012D0ABB92C334A06E
          F1AC9A3DE7B5F95E01B1178AD6D61FE8A239F3305E4105D3E684903C86A11651
          ED451104C74F5521742A688F82C0457B7D5F86BBB7BB8DCFADE31E59F67454FE
          ED21210F104554776890274FA5CCDC0C8E8837D39765E4167ED8FAEEEBAF309A
          59010F6795C5EE0BDAF92A048CDBB1E27CA3D1E2956B9AC1BCD46E9176A9C20D
          42DB033B11065C7795CCD614581ACFC92D05E751097E622820656759A3093DEF
          46A6F2866F7065706E7271FC47D35498522416114460984427EF8143905FBA74
          545F009150027D2EC54266EDF2563A8A436E27057D3716150215DCE6F72828D4
          6020F11C32C56EF009C79C01A5F25CEFE985065B409D11A50D47A446D1DC684A
          9BF442788C0316644F3A9FEFD7E44F6EB4EDE79CA3C91400A8BD9D351980E7AC
          07C9FAAC69AF116E220BAC4D8114088401ECC1773BE0DEB0DB983988FFBA894B
          C65E257778224B7675E0FBF8AF23FAE63FBA2EB51E98931B9B9D7D7F604EC8D4
          135E0FC75F1AFFF0E8357B46321C144D649DACD9CD784D78E941CC1DB39D9592
          C275B73AAAB89D741377DD8A849F2B516961728C2E22795460E55A74E8980441
          90A49DCB22F3BD339685762EC79412FF51B0A44A718D5ABE49871AA5074349CE
          A9033B697DCD0B5B909C0D2FA5B390BBC83C2AC1F8147C882FD3E7BE3DD25DB7
          745B2312EF82F0170372B6AC0690773C2A8DDB9DC43CE2EB6E6E71E858AD5EAD
          529500F963DEFAFEE2A6F9874AD30E888AC82A1634825FD03DAE5390003499D7
          1F77D3D72852CB9C2BDC2A16213D49494981BDB53307DF25004107668C08D23D
          15E17461F217117C6CE88CBE6B660FDEFBE602D0180C731400311B0FABC6439A
          3239FDF35A7B067C9E08E327C19E37E931BCA5DB7542CCF6A8E5307B30C25409
          2C25C3CEED74E1365109D7DCDBAB04BAC8CDD3BB5948BA12267F49AAAA40CF5B
          DAA6AAECC711EC9BCE39B874DA77BA4A0C82C01101821B5ACE0126BB9C613FB3
          B67152721F000101B2FA34B91819DE74B31D09F753E18FECC111A27E7CF7BC60
          C0294A162D6DF2C981F1CEB9BF877C2728ED49CCE3E06EB107D498189EAE6CBD
          A89E927DFD62DEB2F2BFEC9CC8124221D0BA68197F7656F4C146B41CA9EE5901
          AADE3A75B2FBEBABCAD300262F4A411BDC8B1CA73B85DC1BD66165E3C3CC8DB8
          39361FCC644736597B01C03C16EEE697DC8379E3C6E782D266F5EE82815092FC
          E52755CAA234C5C459653BDF4B1D0FA5816D6502718D8E1BA0D57B1287429D35
          6B0F255371B9E5926B01285C053AD25F440C8464070C88A46A12495974D0BA77
          D98DC5C599DB22D405A19DCE62968455DCEDBDE9EBAB205E5D7043F60440869D
          23D27602F20F3B8BE2722BC9D8F4A70184108B16C275EC17AE5541F8B8832B1B
          5C9A67066EEFD7FF764376F8E8DDC997CBB843FAE7D5E105B0CB3C1EBA1893CB
          2ED3BFF319F7F65B0B0FEC13699161F8ACDB5A1D8481904C9030726D7E56BEDA
          221E5BB88BA844B26CDC5FCF5FBAFA70510ACC84DB03D81D2E2E66725B3557B4
          3C2B5BDCDA006EE6E04AE8BE81119B1B7ADD32B6B3D54BDA211D5A342F272DBB
          64508EDC08C976146DC74A26CD6ADBFF8508D421C29D6FAC7841C88309DF52C2
          D9990E7F1570A615413DC5354ADC558849DDB4C6F444524AE949A2E202C0344C
          6449E24838333D7D6630675AD6993163172D8BB4A93237D75318099D3B47BE85
          5925FE5E71BCB26F16E6D031E6B1A095545EFC9975C246535FF30307D761A273
          CCD26A3106DDD0172E2E75B9E8E79EF4B74F32E11868432C3C8396E307062D70
          83EF201AC93B90071CDF5C90EC03F6C6C9255A21E407D5FBD7833FD874C805E1
          21FAA24BA9D44A3F68274C8A001897EE563A186EBA75583D4915B2A3E7EE94C1
          95837CF39160998351996208247FB2CD636B45000BE44A7EDCA9186623FFDEBC
          F5C2895C9F0DF1008D699AA3B972289DCDD3FA3519A1C83091F693D532F7C8DB
          DF84318B51D826BF7F13B96088A30A239642C94A5092C0074E6850F613394C10
          BAE7B8B123EBCC7434C5AACA5298CE495D76666D8D4962B152A4EC7A06D61683
          E2665148671F1716D7900587C0D93F42895DCC76475F00C139DC028F9072359B
          235229AEF88E6540D3B1D99DD4C09CECA453717B1D0C802E31192222ADC7106A
          43AE142BDD05C7AFF8C41E10154641A1BFB051035D344113FA3053A096922C32
          8C7FFDC72747503D180177B9956C40ACA0A9338CDCE0D30F8384179478FA5402
          C26A86E04A36B7129D575E3A78C34B271AFBEF66C0DC77F1B38BCB84137F787B
          D71C044C3EFEB06FAE3D194AA5D4AC2B97E71D9E17FE9AD001BAD85B2DF2269D
          C294151F3F3DE15A95AC9E0FD5F288AC5EA61B5A31D45CC1B3129E21ABA78892
          8BCF8ACC77434334A91653E8C0F1454C8A5740D4840914A67BC52058B72CD4E3
          09802C57D2B9C9722A5FBA17D702A07B0A3F322A8D106D5615524AD74985BE4B
          E08BFE8FE4A520BF6CD03208DF61F0B542F9159AA78BD91BE8C6A4EFA825C7B4
          C7FDD70E08A8C3E02B2A1A5A18A56DE8B914D0C034A222F68EE476BEF6E40892
          7B67111A6EE055821F99D3D964717521BF2B07410519F20F50E9694147C60C2D
          77E97C2F67467915E687987B5F7D5954CD74E545E4CDBA1CA1E7E7C674FC08FC
          D946DACC133FAC6E52C6144E6729E903A30E869781E24B078AB5C83698ACC4AC
          3B2D479570D6F80B894B481C13C82B90B593B90DD18F4C984C24C7279832136F
          F87E905F4E8AD27032B89B2E83222B1EC92352C28C3E16E8E8CEC4DD7F869A8D
          61EADE00487C0CB911D0A52A86BC51C7FA2AADCDC5837A057CB6C392BFFFE5DB
          E71A4C4E41CDB0872F5E36FF50D2510AC38A10C3A5DAFB0DB7D20193CBC24B40
          DB30544B1247436F551090454B80CFF8B4CF254A48F1BA3B18AE06577A626A32
          7243E1BA4F131227D2238D305A809C3E09836C39C057719BF28795BEAABDA4E7
          CB45456DED72C89DD720A23580C657A35E785227E4F9CA2FA8C37DB341A84572
          2CB0BA6BD1B6B84255C241819D5585549F651A6140618706C122510B9CB77066
          9BC56DAADE906682DC45E5D1359E39331AD19822F73D2FAEEAF9AFF8EB35D8E2
          68734504ED29237B4212E934B6B9ABAF0CE69A1CC406859ED59E2ECB0FB7BD62
          07EAE2A4B3BE034EC6628635F5601F5BC366DF76477B14E89213576B269C2BFF
          793344A1FF3636FA3B445AA8F7EFAE4A5F9519A5E446CDB7E5B57D3C18EEBB78
          DD2579B232188D8DB82E4A11F2701A61377AC1641E9FFC3AFB9AF6C3ABF3825E
          56B2997AE0C7B5C111E0EBE736964E8A5AC997FBF5F3F9ECE5225FCD50DBF1B9
          8DD9128B81462AA9C0219983D5FA7EC6BCE262621392DAE0170E323C13CE2293
          1160FA40E28BDE19D968E01161A7902E93E9D1E1394AF4E16BCD2B1041498DA3
          37A94A4691E15BC0618AFB10698C71A4B4DABD5020CBF404CC9EFFEFAD2BB05A
          07EAAC2B0F4F683E1C53BA6ABD25B6948BD9C9C98238558CCFBEEE5AFCBEC0D8
          054B666FCC4D591F3B00165E8CD594A00B238C8820D0FC6C0D4CA713FB8DCE83
          62DF537D8E11569847C21FE2474C2EA4D5CB57531182620EFDB79B05B4F69A60
          10ACDC06D3AAA5061B0218531AD756D4D0C20779A97CC96C7B3842F7E3CB9766
          9792FB89DF3FC2D78DCB66A0DF7A33ADAD2C534815F161C5F90A20D38F587411
          684D8E50A6D3E8F097A4169D2D7AC441CA49580844A9CB3826C59C96F7CB9F8E
          6768CDD123941C53F42F002279B39BA11B3FA0D9391438E057360E8048257169
          9167275CD70F2B5D752677480197146D685D0E8E5F1923E5A5C90BF65BA465C8
          B2E803D31431CB0E383F266A84462089A4A10BFC0997F1D3C1AB79A06E9EB3BE
          CF97D7B5F4BBCA360F2A014F20B8F96ABAC11BA571021802AD24305AD8C0F51E
          1458BBF0B6C9822CA71DA8B49CDC309A6F6E98D6171E4F4574002EB78D3EC490
          7664BD3DFA11E4DAC33B24E30F97717D3BAA1C80E7451208E90F21BDB964CE0A
          9D638C44F26A2700464301CB55FC48A4827FBFC9925620BEBD0032B8EC4A3BB1
          31AEB1074FAAB74ED377C3B7D1B043F134F9236F000FC631325BBC2904CF4945
          DE76EB70BB0C2FB642515938DC0F79F39670011D0E9082003446111BC41F7F12
          0549CF129EBF51EAF2D60B7DBEFD4788AE6DB2901BAFA2DFC6D4E20703A1D617
          4043FC188DD2ABB51293B0992DBF9E39E090395C76244CAF135A4D425E5D405D
          4004F3925E0A6B3CD64F307283F7608A9F60BF2F02F615032085D20F2908D774
          BA26A6333C65B7C435DD0A810E5EA4C28FA2D31177D6481064A331D0A56A073C
          DD76FAAFDA12613882FC5E0043275F2BB5FF8B9D7B36562B0DC8CAB12C9F4A69
          9D0B30D8E2521D4DAAEE22BD2A749E51FA58AC51FFE987A539D90C88F19B7974
          6630ACDABA8FE460848EF4A12111442756358C6DA219A557C736D0C4BB9E7C79
          ECF91C7C461FF622910F37C4CEB9581C42882FAE2380989C1143F01C3CB69A61
          8BBF4466E06114E4F33446469005F4ECF9CD4B775C9A08EBA7B7CC0663237E6C
          8212BD4AE86932CA44B976520D6451649029E9A625FEC4A971F462446A779FA7
          0634EA22A1D40ECFB2093CABB8EB7A0064255C28FF37D8391DD8048C2ED23F87
          A20769B70BAB9D17F1BD4352EB4C37A87E334EF6DF2D9C7AEE44525992F88761
          0B46B3CE1D74F4BA305A2181CF1FE91E9BA462D2410221FACCA70D3010792090
          18388A60C7ACF565D606DA34F04B20F4698A462F1FF5E19A50C5B813450600ED
          7C384417403BC5F27FC0E78141AE294B49954DB88CFBAA63346A3E4F8D08B212
          BE7AFB284A7D522176F469269D453D7981DE052CAE3BF1DEF987FE150A4F1599
          7B2D906B7E06D4495E710A1F0657C7F20795ACBD3625271B6308493E5C864E01
          F731E27C333A6F8636F9B22F4873CB7EDEB780716EEA3E344044108D306A5049
          5117E9E1AC0EAAEF2C17BEFD5D4DDD2FA92A25D97677F055368C268BAB3F26BE
          4B968B230F0D314567200CA94196E83958CE3BB4EFEBE4CB432F81CD2C8D3A0C
          7C02A00BF81A78F35262B2530CC11BE3B8C7265D84894714F6E3D616C0A84091
          E59CFF4DFB9C8E4BF0A58DCFFE976ED80D2083DC0E8406BF6563D8B943B2099F
          96A7BDE8E032F55D4E0E394C03EBD3CAC2DF79BF7E52D97C8F2965B7828EFCC0
          DC2806D1A49E4C826C866492A8428ABDC0FCEDF8ACB10072734AEF97D6795A5C
          3AEF4EB1376DDEDDAF90F31CDDF1B87B513DF2A8AD18A541BFF6BD6E41125DD0
          7F64984E635D6C3EC2EE7401F3E0F6076C9343D81E00431B35B30D970D7238B0
          67D7C423D2091D79709FE537FA07811AE5228BDC97E3DFFA58AF3D199F71C7DF
          0820D08716D1EC74D61B8FAE7A99C20D5AA757CC3F1C92B53B4F2DDD729AFE3F
          658CCF1C745573C2E96F26336DEB32C289FD356ED88D71706811464221E61274
          E5502483D4196D2F802D1008AAB6D4EE8BCF1056D169ED089E9B032CD763DC30
          513DAEADB0101D7737085E1A73C3C4726921ABBB5A4869D64EF7B2C4680C4B9B
          7CD485658B0372122F1D4A404E6D88DB0DF33D7633C89D519E21C2FFD2BA67C5
          F97700484C8E63629D761D4ED45F779353F65996AACF982089FE83365654E49B
          FABA76FEAD039B57CD7A5534651FEEB0013E249E4C278944C0ACEFAFE7B7546C
          D6A6DDEEF9CEE3475B172D4005C9203D7504D5D08C295D0CCBF3B7884B57940F
          79DEDCF4DCE3BA6AAEE83A436C3C79047C275CD698F9E8C47C143D1AA3CC3A12
          2ECDD69E5C93925274F2E7B5D9CEC4CD987B28B644E7BC43404FCFE3B3B48E61
          E7989E65BFDF0BE0C0FB8EE449713DB76442AF9E7658BAE5586119E3C6A37990
          F4683C1C2E83BC4D7BAA669D3C47B2E806446F61FD05BA4FE4A57A7F14761ACF
          868FC6D8C3D366DB9FE20C4294E0343E19EF41DE1555D7A302A9039F916490F9
          2B975EFA71F6679D2DDE61FB2F5D0237CD546106480D7ADC531675497EC78C09
          D92E18544AE67D029F5C02740E5472F09F585F3780B2BDA3FE7F01244701CF56
          C7A9D3BB9DDD79640B85166D68D6EE53DA6832A43ED66F66D97A881305E4A46D
          4D86EF61E1B9228C819D7E0185F0E6FA35F93B9EA0D617BFFFCB44B8EB56408F
          A987EBAC094A0118A45A63771D91C472BB30EE1BBB90CC79B70B2F46E2FB423D
          F956F21C0E65FF2980B825FCA47BB61D7F3B8024ED735CB5DDC53420F56E9570
          E2ACF565C079A3B080CE6A097ECEA0BDB3A11536DBE807D07B3725D27D158101
          870D4B1BA84382673CBB5FD99EC0D0076C06B95131A01CB60B7568BECE052C9C
          45467C4E6B54FEE74DB33BC7A5FE3F03E81CB1055D7D9B91A7798D28A3A46FEC
          1C4E3BFAD09F960EF97987625F6A9564E39F5E48A22F24B2E39F34F66F382C8F
          AF02C6D3FD85E80EA8C968C89048402173C8ECDD6FDB21C455C5781662CCEADB
          81F64C9FF8DD003A85899D05542F9EC9B0037F47DFE972441BAAF0E4A3B78F0D
          3C32FAE5559ED6DA9254E7109D9EE8F99F38D3AF41D83BC4E2497BF12C88193A
          9CE001F4890F5C78664AF25BB6DF07A0533CF75070A44EA1154E4582FE193A7E
          2FD0BAC455F38F7E3ACAE66070EA27F5B6E70F39EB6EEC9E5C07BC58023B5119
          68983D4DEAB6404C50E19A5F07F00F3A95DF05609F73C03FC930C49EB6B15C8D
          612A22FCF2247151A74EAFBE69F9434EB6E7DB39265286FFA77CC3A1939C9294
          5746225F2F8204514C227FD0C1FF7800FBFA228763EAAE80918609C4755694CD
          DEFD0DAFECF8434F970ED246534FB1F2E92ED7EE17429B119CA283014E7D8EA6
          2904ED6F3AD47F05C0A79AD6A73D3D5D03CF4E479FF5200E58714EAF93E9754F
          D504C8FB84CF74F7EE09B5C276AA27C9B02CC8729E31E2B29E1E8641FFA57EFF
          DF01F0BFB2A1F671D5611AB69938D453B0D01D3D578BC16FB77493E81E5018F6
          67CD59FFBCDBB3E9E1FF054F6B838F8DC804B90000000049454E44AE426082}
        Caption = ''
        object labUser: TUniLabel
          Left = 0
          Top = 105
          Width = 260
          Height = 25
          Hint = ''
          Margins.Left = 0
          Margins.Top = 2
          Margins.Right = 0
          Margins.Bottom = 0
          Alignment = taCenter
          AutoSize = False
          Caption = 'usu'#225'rio'
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentColor = False
          Color = 8454143
          TabOrder = 1
          LayoutConfig.Flex = 1
        end
        object paImgLoadMask: TUniContainerPanel
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 252
          Height = 95
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ParentColor = False
          TabOrder = 2
          object imgUser: TUniLabel
            AlignWithMargins = True
            Left = 3
            Top = 2
            Width = 246
            Height = 91
            Cursor = crHandPoint
            Hint = ''
            Margins.Top = 2
            Margins.Bottom = 2
            CreateOrder = 1
            Alignment = taCenter
            TextConversion = txtHTML
            AutoSize = False
            Caption = 'img-usuario'
            Align = alClient
            ParentFont = False
            Font.Color = 15724527
            Font.Height = -16
            TabOrder = 1
          end
        end
      end
      object UniTreeMainMenu: TUniTreeMenu
        Left = 0
        Top = 244
        Width = 260
        Height = 398
        Hint = ''
        Margins.Top = 8
        Align = alClient
        Items.FontData = {0100000000}
        ScreenMask.WaitData = True
        ScreenMask.Target = Owner
        Color = 1447446
        SingleExpand = True
        ExpanderOnly = False
        OnClick = UniTreeMainMenuClick
      end
    end
  end
  object btnFloatingFAB: TUniHTMLFrame
    Left = 736
    Top = 8
    Width = 25
    Height = 31
    Hint = ''
    Visible = False
  end
  object htmlFrame: TUniHTMLFrame
    Left = 772
    Top = 8
    Width = 25
    Height = 31
    Hint = ''
    Visible = False
    OnAjaxEvent = htmlFrameAjaxEvent
  end
  object paTourTransp: TUniContainerPanel
    Left = 1038
    Top = 462
    Width = 900
    Height = 261
    Hint = '[[round:all]]'
    Visible = False
    ParentColor = False
    TabOrder = 1
    object labImgRight: TUniLabel
      Left = 600
      Top = 33
      Width = 34
      Height = 33
      Cursor = crHandPoint
      Hint = ''
      CreateOrder = 1
      Visible = False
      TextConversion = txtHTML
      AutoSize = False
      Caption = '<i class="fa  fa-arrow-right fa-2x "></i>'
      ParentFont = False
      Font.Color = clRed
      Font.Height = -12
      TabOrder = 7
      OnClick = btnMenuClick
    end
    object labImgUp: TUniLabel
      Left = 208
      Top = 0
      Width = 34
      Height = 33
      Cursor = crHandPoint
      Hint = ''
      CreateOrder = 1
      Visible = False
      TextConversion = txtHTML
      AutoSize = False
      Caption = '<i class="fa  fa-arrow-up fa-2x "></i>'
      ParentFont = False
      Font.Color = clRed
      Font.Height = -12
      TabOrder = 5
      OnClick = btnMenuClick
    end
    object labImgDown: TUniLabel
      Left = 129
      Top = 183
      Width = 34
      Height = 14
      Cursor = crHandPoint
      Hint = ''
      CreateOrder = 1
      Visible = False
      TextConversion = txtHTML
      AutoSize = False
      Caption = '<i class="fa  fa-arrow-down fa-2x "></i>'
      ParentFont = False
      Font.Color = clRed
      Font.Height = -12
      TabOrder = 4
      OnClick = btnMenuClick
    end
    object labImgLeft: TUniLabel
      Left = 168
      Top = 33
      Width = 34
      Height = 33
      Cursor = crHandPoint
      Hint = ''
      CreateOrder = 1
      Visible = False
      TextConversion = txtHTML
      AutoSize = False
      Caption = '<i class="fa  fa-arrow-left fa-2x "></i>'
      ParentFont = False
      Font.Color = clRed
      Font.Height = -12
      TabOrder = 3
      OnClick = btnMenuClick
    end
    object UniImage1: TUniImage
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 894
      Height = 255
      Hint = ''
      Visible = False
      Stretch = True
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D494844520000000A0000
        000A08060000008D32CFBD000001376943435041646F62652052474220283139
        39382900002891958FBF4AC3501487BF1B45C5A15608E2E0702751506CD5C18C
        495B8A2058AB4392AD49439562126EAE7FFA108E6E1D5CDC7D022747C141F109
        7C03C5A98343840C058BDFF49DDF391CCE01A362D79D865186F358AB76D391AE
        E7CBD917669802804E98A576AB7500102771C418DFEF0880D74DBBEE34C6FB7F
        321FA64A032360BB1B6521880AD0BFD2A9063104CCA09F6A100F80A94EDA3510
        4F40A997FB1B500A72FF004ACAF57C105F80D9733D1F8C39C00C725F014C1D5D
        6B805A920ED459EF54CBAA6559D2EE2641248F07998ECE33B91F87894A13D5D1
        5117C8EF0360311F6C371DB956B5ACBDF57FFE3D11D7F3656E9F4708402C3D17
        594178A12E7F55183B93EB62C770190EEF617A5464BB3770B7010BB745B65A85
        F2163C0E7F00C0C64FFDF3533FC8000000097048597300000B1300000B130100
        9A9C18000005D169545874584D4C3A636F6D2E61646F62652E786D7000000000
        003C3F787061636B657420626567696E3D22EFBBBF222069643D2257354D304D
        7043656869487A7265537A4E54637A6B633964223F3E203C783A786D706D6574
        6120786D6C6E733A783D2261646F62653A6E733A6D6574612F2220783A786D70
        746B3D2241646F626520584D5020436F726520352E362D633134352037392E31
        36333439392C20323031382F30382F31332D31363A34303A3232202020202020
        2020223E203C7264663A52444620786D6C6E733A7264663D22687474703A2F2F
        7777772E77332E6F72672F313939392F30322F32322D7264662D73796E746178
        2D6E7323223E203C7264663A4465736372697074696F6E207264663A61626F75
        743D222220786D6C6E733A786D703D22687474703A2F2F6E732E61646F62652E
        636F6D2F7861702F312E302F2220786D6C6E733A786D704D4D3D22687474703A
        2F2F6E732E61646F62652E636F6D2F7861702F312E302F6D6D2F2220786D6C6E
        733A73744576743D22687474703A2F2F6E732E61646F62652E636F6D2F786170
        2F312E302F73547970652F5265736F757263654576656E74232220786D6C6E73
        3A64633D22687474703A2F2F7075726C2E6F72672F64632F656C656D656E7473
        2F312E312F2220786D6C6E733A70686F746F73686F703D22687474703A2F2F6E
        732E61646F62652E636F6D2F70686F746F73686F702F312E302F2220786D703A
        43726561746F72546F6F6C3D2241646F62652050686F746F73686F7020434320
        32303139202857696E646F7773292220786D703A437265617465446174653D22
        323031392D30382D32385432333A32303A35362D30333A30302220786D703A4D
        65746164617461446174653D22323031392D30382D32385432333A32303A3536
        2D30333A30302220786D703A4D6F64696679446174653D22323031392D30382D
        32385432333A32303A35362D30333A30302220786D704D4D3A496E7374616E63
        6549443D22786D702E6969643A39663061616236612D356435632D646434642D
        613938352D3564376638666530656436632220786D704D4D3A446F63756D656E
        7449443D2261646F62653A646F6369643A70686F746F73686F703A3935323763
        6162652D663166642D643934352D393734352D37653163356365633336393722
        20786D704D4D3A4F726967696E616C446F63756D656E7449443D22786D702E64
        69643A38363738313061632D613231662D376234622D613631362D3533636666
        32663862633531222064633A666F726D61743D22696D6167652F706E67222070
        686F746F73686F703A436F6C6F724D6F64653D2233223E203C786D704D4D3A48
        6973746F72793E203C7264663A5365713E203C7264663A6C692073744576743A
        616374696F6E3D2263726561746564222073744576743A696E7374616E636549
        443D22786D702E6969643A38363738313061632D613231662D376234622D6136
        31362D353363666632663862633531222073744576743A7768656E3D22323031
        392D30382D32385432333A32303A35362D30333A3030222073744576743A736F
        6674776172654167656E743D2241646F62652050686F746F73686F7020434320
        32303139202857696E646F777329222F3E203C7264663A6C692073744576743A
        616374696F6E3D227361766564222073744576743A696E7374616E636549443D
        22786D702E6969643A39663061616236612D356435632D646434642D61393835
        2D356437663866653065643663222073744576743A7768656E3D22323031392D
        30382D32385432333A32303A35362D30333A3030222073744576743A736F6674
        776172654167656E743D2241646F62652050686F746F73686F70204343203230
        3139202857696E646F777329222073744576743A6368616E6765643D222F222F
        3E203C2F7264663A5365713E203C2F786D704D4D3A486973746F72793E203C2F
        7264663A4465736372697074696F6E3E203C2F7264663A5244463E203C2F783A
        786D706D6574613E203C3F787061636B657420656E643D2272223F3EB1EE0948
        000000154944415478DA63D4D7D7BFC84004601C55485F8500EA640DB72A8366
        BE0000000049454E44AE426082}
      Align = alClient
      Transparent = True
    end
    object paObjFeatured: TUniContainerPanel
      Left = 149
      Top = 198
      Width = 91
      Height = 45
      Hint = ''
      ParentColor = False
      ClientEvents.UniEvents.Strings = (
        
          'beforeInit=function beforeInit(sender, config)'#13#10'{'#13#10'   config.Bod' +
          'yCls='#39'trans-panel'#39';'#13#10'}')
      TabOrder = 2
    end
    object paMessage: TUniContainerPanel
      Left = 12
      Top = 29
      Width = 397
      Height = 154
      Hint = '[[round:all]]'
      ParentColor = False
      Color = clWhite
      TabOrder = 1
      object UniContainerPanel1: TUniContainerPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 391
        Height = 148
        Hint = '[[round:all]]'
        ParentColor = False
        Color = 2763306
        Align = alClient
        TabOrder = 1
        object btnNext: TUniBitBtn
          AlignWithMargins = True
          Left = 340
          Top = 51
          Width = 42
          Height = 37
          Hint = '[[cls:ButtonDark]]'
          Margins.Left = 7
          Margins.Top = 0
          Margins.Right = 0
          Caption = '<i class="fa  fa-arrow-right fa-2x "></i>'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 1
          ScaleButton = False
          OnClick = btnNextClick
        end
        object btnPrior: TUniBitBtn
          AlignWithMargins = True
          Left = 341
          Top = 102
          Width = 42
          Height = 37
          Hint = '[[cls:ButtonDark]]'
          Margins.Left = 7
          Margins.Top = 0
          Margins.Right = 0
          Caption = '<i class="fa  fa-arrow-left fa-2x "></i>'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 2
          ScaleButton = False
          OnClick = btnPriorClick
        end
        object labTourTit1: TUniLabel
          Left = 14
          Top = 7
          Width = 138
          Height = 23
          Hint = ''
          Caption = 'MENU PRINCIPAL'
          ParentFont = False
          Font.Color = 33023
          Font.Height = -19
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 3
        end
        object memoTour: TUniMemo
          Left = 14
          Top = 38
          Width = 312
          Height = 101
          Hint = ''
          BorderStyle = ubsNone
          ParentFont = False
          Font.Color = clSilver
          Font.Height = -13
          Font.Name = 'Calibri'
          ReadOnly = True
          Color = 2763306
          TabOrder = 4
          TabStop = False
        end
        object labTour1: TUniLabel
          Left = 218
          Top = 25
          Width = 187
          Height = 15
          Hint = ''
          Visible = False
          Caption = 'Selecione um grupo e suas op'#231#245'es'
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 5
        end
      end
    end
  end
  object paCompanies: TUniPanel
    Left = 276
    Top = 322
    Width = 334
    Height = 291
    Hint = ''
    Visible = False
    TabOrder = 4
    BorderStyle = ubsNone
    Caption = ''
    Color = clWhite
    object dbgCompanies: TUniDBGrid
      AlignWithMargins = True
      Left = 2
      Top = 32
      Width = 326
      Height = 200
      Hint = '[['#13#10'fieldmasks:'#13#10'grid-resize|'#13#10']]'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = dm_rc.dsSqlCompanies
      Options = [dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
      ReadOnly = True
      WebOptions.Paged = False
      LoadMask.Message = 'Loading data...'
      ForceFit = True
      BorderStyle = ubsNone
      Font.Height = -13
      Font.Name = 'Calibri'
      ParentFont = False
      TabOrder = 0
      Columns = <
        item
          FieldName = 'DESCRICAO'
          Title.Alignment = taCenter
          Title.Caption = 'Selecione a Empresa'
          Width = 64
          Font.Name = 'Calibri'
        end
        item
          FieldName = 'CODIGO'
          Title.Caption = 'CODIGO'
          Width = 64
          Visible = False
          Font.Name = 'Calibri'
        end>
    end
    object paBtns: TUniContainerPanel
      AlignWithMargins = True
      Left = 3
      Top = 239
      Width = 328
      Height = 49
      Hint = ''
      ParentColor = False
      Color = clWhite
      Align = alBottom
      TabOrder = 2
      object btnEnter: TUniBitBtn
        AlignWithMargins = True
        Left = 213
        Top = 9
        Width = 100
        Height = 31
        Hint = '[['#13#10'cls:ButtonThemeCrud |'#13#10'translate:'#13#10']]'
        Margins.Left = 15
        Margins.Top = 9
        Margins.Right = 15
        Margins.Bottom = 9
        Caption = 'Entrar'
        Align = alRight
        ParentFont = False
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Calibri'
        TabOrder = 1
        IconPosition = ipButtonEdge
        ScreenMask.Enabled = True
        ScreenMask.WaitData = True
        ScreenMask.Target = Owner
      end
      object btnLogin: TUniBitBtn
        AlignWithMargins = True
        Left = 15
        Top = 9
        Width = 100
        Height = 31
        Hint = '[['#13#10'cls:ButtonThemeCrud |'#13#10'ico:fas-reply 1x rtl:rc-mirror-h'#13#10']]'
        Margins.Left = 15
        Margins.Top = 9
        Margins.Right = 15
        Margins.Bottom = 9
        Caption = '<'
        Align = alLeft
        ParentFont = False
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Calibri'
        TabOrder = 2
        IconPosition = ipButtonEdge
      end
    end
    object paTitleSelectCompanyTitle: TUniContainerPanel
      AlignWithMargins = True
      Left = 3
      Top = 0
      Width = 324
      Height = 29
      Hint = '[[round:t]]'
      ParentColor = False
      Color = clGray
      TabOrder = 3
      object labSelectCompanyTitle: TUniLabel
        Left = 5
        Top = 7
        Width = 287
        Height = 19
        Hint = '[[translate:]]'
        Caption = 'Selecione uma Empresa( in development )'
        ParentFont = False
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        TabOrder = 1
      end
    end
  end
  object OpenImageDialog: TOpenDialog
    Left = 1067
    Top = 526
  end
end
