object frmDEMOWithForm: TfrmDEMOWithForm
  Left = 0
  Top = 0
  Hint = '[['#13#10'width:max |'#13#10'height:max'#13#10']]'#13#10
  ClientHeight = 348
  ClientWidth = 559
  Caption = 'frmDEMOWithForm'
  BorderStyle = bsNone
  Position = poDesigned
  OldCreateOrder = False
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  PageMode = True
  AlignmentControl = uniAlignmentClient
  OnBeforeShow = UniFormBeforeShow
  PixelsPerInch = 96
  TextHeight = 13
  object paBkg: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 559
    Height = 348
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 0
    LayoutConfig.Anchor = '0 0'
    object UniScrollBox2: TUniScrollBox
      Left = 0
      Top = 0
      Width = 559
      Height = 348
      Hint = ''
      Align = alClient
      Color = clWhite
      TabOrder = 1
      ScrollHeight = 400
      ScrollWidth = 494
      object rcBlock9: TUniContainerPanel
        Tag = 1
        Left = 22
        Top = 25
        Width = 100
        Height = 48
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 0
        DesignSize = (
          100
          48)
        object edCodigo: TUniDBEdit
          Left = 0
          Top = 18
          Width = 100
          Height = 29
          Hint = ''
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clWhite
          Font.Style = [fsBold]
          TabOrder = 1
          Color = clGray
          ReadOnly = True
        end
        object UniLabel3: TUniLabel
          Left = 0
          Top = 0
          Width = 38
          Height = 13
          Hint = ''
          Caption = 'C'#243'digo'
          ParentFont = False
          Font.Style = [fsBold]
          TabOrder = 2
        end
      end
      object rcBlock20: TUniContainerPanel
        Tag = 1
        Left = 159
        Top = 25
        Width = 100
        Height = 48
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 1
        DesignSize = (
          100
          48)
        object UniLabel66: TUniLabel
          Left = 0
          Top = 0
          Width = 81
          Height = 13
          Hint = ''
          Caption = 'Data Cadastro'
          ParentFont = False
          Font.Style = [fsBold]
          TabOrder = 1
        end
        object edDtCad: TUniDBDateTimePicker
          Left = 0
          Top = 18
          Width = 100
          Height = 29
          Hint = ''
          DateTime = 43596.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
        end
      end
      object rcBlock30: TUniContainerPanel
        Tag = 1
        Left = 299
        Top = 25
        Width = 100
        Height = 48
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 2
        DesignSize = (
          100
          48)
        object UniLabel5: TUniLabel
          Left = 0
          Top = 0
          Width = 95
          Height = 13
          Hint = ''
          Caption = 'Data Anivers'#225'rio'
          ParentFont = False
          Font.Style = [fsBold]
          TabOrder = 1
        end
        object UniDBDateTimePicker1: TUniDBDateTimePicker
          Left = 0
          Top = 18
          Width = 100
          Height = 29
          Hint = ''
          DateTime = 43596.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
        end
      end
      object rcBlock50: TUniContainerPanel
        Tag = 1
        Left = 175
        Top = 106
        Width = 100
        Height = 48
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 3
        DesignSize = (
          100
          48)
        object UniLabel10: TUniLabel
          Left = 0
          Top = 0
          Width = 58
          Height = 13
          Hint = ''
          Caption = 'Cpf  / Cnpj'
          ParentFont = False
          Font.Style = [fsBold]
          TabOrder = 1
        end
        object edCnpjCpf: TUniDBEdit
          Left = 0
          Top = 18
          Width = 100
          Height = 29
          Hint = ''
          CharCase = ecUpperCase
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          InputMask.Mask = '99.999.999/9999-99'
        end
      end
      object rcBlock40: TUniContainerPanel
        Tag = 1
        Left = 25
        Top = 106
        Width = 100
        Height = 48
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 4
        DesignSize = (
          100
          48)
        object UniLabel67: TUniLabel
          Left = 0
          Top = 0
          Width = 46
          Height = 13
          Hint = ''
          Caption = 'PF ou PJ'
          ParentFont = False
          Font.Style = [fsBold]
          TabOrder = 1
        end
        object edTipoPessoa: TUniDBComboBox
          Left = 0
          Top = 18
          Width = 100
          Height = 29
          Hint = ''
          Anchors = [akLeft, akTop, akRight]
          Items.Strings = (
            'F'
            'J')
          TabOrder = 2
          ClientEvents.ExtEvents.Strings = (
            
              'afterrender=function afterrender(sender, eOpts) '#13#10'{'#13#10'    var me=' +
              'sender;'#13#10'    me.inputEl.setStyle('#39'background'#39', '#39'none'#39');'#13#10'    me.' +
              'triggerCell.setStyle('#39'background'#39', '#39'none'#39');'#13#10'    me.inputWrap.se' +
              'tStyle('#39'border-right-width'#39', '#39'0'#39');'#13#10'    me.triggerCell.setStyle(' +
              #39'border-right-width'#39', '#39'1px'#39');'#13#10'    me.triggerCell.setStyle('#39'bord' +
              'er-top-width'#39', '#39'1px'#39');'#13#10'    me.triggerEl.elements[0].setHtml('#39'<i' +
              ' class="fa fa-angle-down" style="font-size:1.8em; padding-right:' +
              '5px"></i>'#39');'#13#10'}')
          IconItems = <>
        end
      end
      object rcBlock70: TUniContainerPanel
        Tag = 1
        Left = 302
        Top = 105
        Width = 100
        Height = 48
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 5
        DesignSize = (
          100
          48)
        object UniLabel68: TUniLabel
          Left = 0
          Top = 0
          Width = 88
          Height = 13
          Hint = ''
          Caption = 'Inscr. Municipal'
          ParentFont = False
          Font.Style = [fsBold]
          TabOrder = 1
        end
        object UniDBEdit21: TUniDBEdit
          Left = 0
          Top = 19
          Width = 100
          Height = 29
          Hint = ''
          CharCase = ecUpperCase
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          InputMask.RemoveWhiteSpace = True
        end
      end
      object rcBlock80: TUniContainerPanel
        Tag = 1
        Left = 25
        Top = 167
        Width = 376
        Height = 48
        Hint = '[[cols:12]]'
        ParentColor = False
        TabOrder = 6
        DesignSize = (
          376
          48)
        object UniLabel6: TUniLabel
          Left = 0
          Top = 0
          Width = 92
          Height = 13
          Hint = ''
          Caption = 'Nome / Fantasia'
          ParentFont = False
          Font.Style = [fsBold]
          TabOrder = 1
        end
        object UniDBEdit1: TUniDBEdit
          Left = 0
          Top = 18
          Width = 375
          Height = 29
          Hint = ''
          CharCase = ecUpperCase
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
        end
      end
      object rcBlock90: TUniContainerPanel
        Tag = 1
        Left = 20
        Top = 240
        Width = 150
        Height = 48
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 7
        DesignSize = (
          150
          48)
        object UniLabel56: TUniLabel
          Left = 0
          Top = 0
          Width = 53
          Height = 13
          Hint = ''
          Caption = 'Email NFe'
          ParentFont = False
          Font.Style = [fsBold]
          TabOrder = 1
        end
        object UniDBEdit13: TUniDBEdit
          Left = 0
          Top = 18
          Width = 150
          Height = 29
          Hint = ''
          CharCase = ecUpperCase
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
        end
      end
      object rcBlock100: TUniContainerPanel
        Tag = 1
        Left = 191
        Top = 240
        Width = 150
        Height = 48
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 8
        DesignSize = (
          150
          48)
        object UniLabel57: TUniLabel
          Left = 0
          Top = 0
          Width = 89
          Height = 13
          Hint = ''
          Caption = 'Email Comercial'
          ParentFont = False
          Font.Style = [fsBold]
          TabOrder = 1
        end
        object UniDBEdit19: TUniDBEdit
          Left = 0
          Top = 18
          Width = 150
          Height = 29
          Hint = ''
          CharCase = ecUpperCase
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
        end
      end
      object rcBlock110: TUniContainerPanel
        Tag = 1
        Left = 344
        Top = 240
        Width = 150
        Height = 48
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 9
        DesignSize = (
          150
          48)
        object UniLabel58: TUniLabel
          Left = 0
          Top = 0
          Width = 91
          Height = 13
          Hint = ''
          Caption = 'Email Financeiro'
          ParentFont = False
          Font.Style = [fsBold]
          TabOrder = 1
        end
        object UniDBEdit20: TUniDBEdit
          Left = 0
          Top = 18
          Width = 150
          Height = 29
          Hint = ''
          CharCase = ecUpperCase
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
        end
      end
      object rcBlock120: TUniContainerPanel
        Tag = 1
        Left = 22
        Top = 301
        Width = 376
        Height = 99
        Hint = '[[cols:12]]'
        ParentColor = False
        TabOrder = 10
        object UniLabel1: TUniLabel
          Left = 9
          Top = 10
          Width = 314
          Height = 13
          Hint = ''
          Visible = False
          Caption = 'Este block ajusta o scrroll vertical quando em MOBILE V '
          ParentFont = False
          Font.Style = [fsBold]
          TabOrder = 1
        end
        object UniLabel2: TUniLabel
          Left = 9
          Top = 66
          Width = 308
          Height = 13
          Hint = ''
          Visible = False
          Caption = 'This block adjusts the vertical scrroll when in MOBILE V'
          ParentFont = False
          Font.Style = [fsBold]
          TabOrder = 2
        end
      end
    end
  end
end
