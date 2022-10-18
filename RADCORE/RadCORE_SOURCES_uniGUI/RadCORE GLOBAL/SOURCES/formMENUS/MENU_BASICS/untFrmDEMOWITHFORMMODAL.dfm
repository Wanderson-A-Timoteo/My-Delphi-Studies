object frmDEMOWithFormMODAL: TfrmDEMOWithFormMODAL
  Left = 0
  Top = 0
  Hint = '[['#13#10'modal:'#13#10']]'
  HelpType = htKeyword
  ClientHeight = 486
  ClientWidth = 544
  Caption = 'frmDEMOWithFormMODAL'
  OnResize = UniFormResize
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = [biSystemMenu]
  NavigateKeys.Enabled = True
  NavigateKeys.Next.Key = 13
  MonitoredKeys.Keys = <>
  AlignmentControl = uniAlignmentClient
  OnReady = UniFormReady
  OnBeforeShow = UniFormBeforeShow
  OnDestroy = UniFormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object UniScrollBox1: TUniScrollBox
    Left = 0
    Top = 0
    Width = 544
    Height = 433
    Hint = ''
    Align = alClient
    TabOrder = 0
    object UniContainerPanel1: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 542
      Height = 431
      Hint = '[[round:all]]'
      Margins.Left = 0
      Margins.Top = 12
      Margins.Right = 0
      Margins.Bottom = 0
      ParentColor = False
      Color = clWhite
      Align = alClient
      AlignmentControl = uniAlignmentClient
      ParentAlignmentControl = False
      AutoScroll = True
      TabOrder = 0
      ScrollHeight = 772
      ScrollWidth = 542
      ScrollY = 302
      object rcBlock10: TUniContainerPanel
        Tag = 1
        Left = 22
        Top = -289
        Width = 100
        Height = 48
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 1
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
        Top = -289
        Width = 100
        Height = 48
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 2
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
        Top = -289
        Width = 100
        Height = 48
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 3
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
      object rcBlock40: TUniContainerPanel
        Tag = 1
        Left = 25
        Top = -230
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
        Top = -231
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
        Top = -169
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
        Top = -106
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
        Top = -107
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
        Left = 356
        Top = -106
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
      object rcBlock50: TUniContainerPanel
        Tag = 1
        Left = 175
        Top = -230
        Width = 100
        Height = 48
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 10
        DesignSize = (
          100
          48)
        object UniLabel1: TUniLabel
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
      object rcBlock120: TUniContainerPanel
        Tag = 1
        Left = 22
        Top = -11
        Width = 100
        Height = 48
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 11
        DesignSize = (
          100
          48)
        object edCodigoClone: TUniDBEdit
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
        object UniLabel3Clone: TUniLabel
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
      object rcBlock130: TUniContainerPanel
        Tag = 1
        Left = 159
        Top = -11
        Width = 100
        Height = 48
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 12
        DesignSize = (
          100
          48)
        object UniLabel66Clone: TUniLabel
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
        object edDtCadClone: TUniDBDateTimePicker
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
      object rcBlock140: TUniContainerPanel
        Tag = 1
        Left = 299
        Top = -11
        Width = 100
        Height = 48
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 13
        DesignSize = (
          100
          48)
        object UniLabel5Clone: TUniLabel
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
        object UniDBDateTimePicker1Clone: TUniDBDateTimePicker
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
      object rcBlock150: TUniContainerPanel
        Tag = 1
        Left = 25
        Top = 48
        Width = 100
        Height = 48
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 14
        DesignSize = (
          100
          48)
        object UniLabel67Clone: TUniLabel
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
        object edTipoPessoaClone: TUniDBComboBox
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
      object rcBlock160: TUniContainerPanel
        Tag = 1
        Left = 302
        Top = 47
        Width = 100
        Height = 48
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 15
        DesignSize = (
          100
          48)
        object UniLabel68Clone: TUniLabel
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
        object UniDBEdit21Clone: TUniDBEdit
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
      object rcBlock170: TUniContainerPanel
        Tag = 1
        Left = 25
        Top = 109
        Width = 376
        Height = 48
        Hint = '[[cols:12]]'
        ParentColor = False
        TabOrder = 16
        DesignSize = (
          376
          48)
        object UniLabel6Clone: TUniLabel
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
        object UniDBEdit1Clone: TUniDBEdit
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
      object rcBlock180: TUniContainerPanel
        Tag = 1
        Left = 20
        Top = 172
        Width = 150
        Height = 48
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 17
        DesignSize = (
          150
          48)
        object UniLabel56Clone: TUniLabel
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
        object UniDBEdit13Clone: TUniDBEdit
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
      object rcBlock190: TUniContainerPanel
        Tag = 1
        Left = 191
        Top = 171
        Width = 150
        Height = 48
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 18
        DesignSize = (
          150
          48)
        object UniLabel57Clone: TUniLabel
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
        object UniDBEdit19Clone: TUniDBEdit
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
      object rcBlock200: TUniContainerPanel
        Tag = 1
        Left = 356
        Top = 172
        Width = 150
        Height = 48
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 19
        DesignSize = (
          150
          48)
        object UniLabel58Clone: TUniLabel
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
        object UniDBEdit20Clone: TUniDBEdit
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
      object rcBlock210: TUniContainerPanel
        Tag = 1
        Left = 175
        Top = 48
        Width = 100
        Height = 48
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 20
        DesignSize = (
          100
          48)
        object UniLabel1Clone: TUniLabel
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
        object edCnpjCpfClone: TUniDBEdit
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
      object rcBlock220: TUniContainerPanel
        Tag = 1
        Left = 34
        Top = 239
        Width = 100
        Height = 48
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 21
        DesignSize = (
          100
          48)
        object edCodigoCloneClone: TUniDBEdit
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
        object UniLabel3CloneClone: TUniLabel
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
      object rcBlock230: TUniContainerPanel
        Tag = 1
        Left = 171
        Top = 239
        Width = 100
        Height = 48
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 22
        DesignSize = (
          100
          48)
        object UniLabel66CloneClone: TUniLabel
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
        object edDtCadCloneClone: TUniDBDateTimePicker
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
      object rcBlock240: TUniContainerPanel
        Tag = 1
        Left = 311
        Top = 239
        Width = 100
        Height = 48
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 23
        DesignSize = (
          100
          48)
        object UniLabel5CloneClone: TUniLabel
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
        object UniDBDateTimePicker1CloneClone: TUniDBDateTimePicker
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
      object rcBlock250: TUniContainerPanel
        Tag = 1
        Left = 37
        Top = 298
        Width = 100
        Height = 48
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 24
        DesignSize = (
          100
          48)
        object UniLabel67CloneClone: TUniLabel
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
        object edTipoPessoaCloneClone: TUniDBComboBox
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
      object rcBlock260: TUniContainerPanel
        Tag = 1
        Left = 314
        Top = 297
        Width = 100
        Height = 48
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 25
        DesignSize = (
          100
          48)
        object UniLabel68CloneClone: TUniLabel
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
        object UniDBEdit21CloneClone: TUniDBEdit
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
      object rcBlock270: TUniContainerPanel
        Tag = 1
        Left = 37
        Top = 359
        Width = 376
        Height = 48
        Hint = '[[cols:12]]'
        ParentColor = False
        TabOrder = 26
        DesignSize = (
          376
          48)
        object UniLabel6CloneClone: TUniLabel
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
        object UniDBEdit1CloneClone: TUniDBEdit
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
      object rcBlock280: TUniContainerPanel
        Tag = 1
        Left = 32
        Top = 422
        Width = 150
        Height = 48
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 27
        DesignSize = (
          150
          48)
        object UniLabel56CloneClone: TUniLabel
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
        object UniDBEdit13CloneClone: TUniDBEdit
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
      object rcBlock290: TUniContainerPanel
        Tag = 1
        Left = 203
        Top = 421
        Width = 150
        Height = 48
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 28
        DesignSize = (
          150
          48)
        object UniLabel57CloneClone: TUniLabel
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
        object UniDBEdit19CloneClone: TUniDBEdit
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
      object rcBlock300: TUniContainerPanel
        Tag = 1
        Left = 368
        Top = 422
        Width = 150
        Height = 48
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 29
        DesignSize = (
          150
          48)
        object UniLabel58CloneClone: TUniLabel
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
        object UniDBEdit20CloneClone: TUniDBEdit
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
      object rcBlock310: TUniContainerPanel
        Tag = 1
        Left = 187
        Top = 298
        Width = 100
        Height = 48
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 30
        DesignSize = (
          100
          48)
        object UniLabel1CloneClone: TUniLabel
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
        object edCnpjCpfCloneClone: TUniDBEdit
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
    end
  end
  object paFooter: TUniContainerPanel
    Tag = 1
    Left = 0
    Top = 433
    Width = 544
    Height = 53
    Hint = ''
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 12
    ParentColor = False
    Color = 15658734
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      544
      53)
    object btnCancel: TUniBitBtn
      AlignWithMargins = True
      Left = 434
      Top = 11
      Width = 98
      Height = 29
      Hint = '[[cls:ButtonRed ]]'
      Margins.Left = 6
      Margins.Top = 4
      Margins.Right = 6
      Margins.Bottom = 4
      Caption = 'Close Form'
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 1
      OnClick = btnCancelClick
    end
  end
end
