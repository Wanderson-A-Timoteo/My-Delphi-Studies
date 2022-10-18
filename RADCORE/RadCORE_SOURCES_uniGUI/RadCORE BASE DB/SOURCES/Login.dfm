object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  ClientHeight = 370
  ClientWidth = 650
  Caption = 'frmLogin'
  BorderStyle = bsNone
  OldCreateOrder = False
  KeyPreview = True
  NavigateKeys.Enabled = True
  NavigateKeys.Next.Key = 13
  MonitoredKeys.Keys = <>
  PageMode = True
  AlignmentControl = uniAlignmentClient
  Font.Height = -16
  Font.Name = 'Calibri'
  ScreenMask.Enabled = True
  ScreenMask.WaitData = True
  Layout = 'fit'
  OnReady = UniLoginFormReady
  OnCreate = UniLoginFormCreate
  OnScreenResize = UniLoginFormScreenResize
  PixelsPerInch = 96
  TextHeight = 19
  object paLogo: TUniContainerPanel
    Left = 336
    Top = 0
    Width = 314
    Height = 370
    Hint = ''
    ParentColor = False
    Color = clGray
    Align = alClient
    AlignmentControl = uniAlignmentClient
    ParentAlignmentControl = False
    TabOrder = 1
    object labWelcome: TUniLabel
      Left = 16
      Top = 54
      Width = 285
      Height = 52
      Cursor = crHandPoint
      Hint = '[['#13'translate:'#13']]'
      Alignment = taCenter
      AutoSize = False
      Caption = 'Bem vindo'
      ParentFont = False
      Font.Color = clWhite
      Font.Height = -32
      Font.Name = 'Segoe UI'
      ParentColor = False
      Color = 2763306
      TabOrder = 1
    end
    object imgLogo: TUniImage
      AlignWithMargins = True
      Left = 30
      Top = 159
      Width = 259
      Height = 78
      Cursor = crHandPoint
      Hint = ''
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 12
      Center = True
      Url = 'files/images/logo_login.png'
      Transparent = True
      LayoutConfig.Region = 'center'
      OnClick = imgLogoClick
    end
    object labAppVersion: TUniLabel
      Left = 203
      Top = 337
      Width = 100
      Height = 16
      Hint = ''
      Margins.Bottom = 0
      Alignment = taRightJustify
      AutoSize = False
      Caption = '3.2.0.0'
      ParentFont = False
      Font.Color = 15658734
      Font.Height = -9
      Font.Name = 'Calibri'
      ParentColor = False
      Color = clGray
      TabOrder = 3
    end
    object labCopyright: TUniLabel
      Left = 10
      Top = 337
      Width = 189
      Height = 16
      Hint = ''
      Margins.Bottom = 0
      AutoSize = False
      Caption = 'Copyright (C) 2019-2020 by Fl'#225'vio Motta'
      ParentFont = False
      Font.Color = 15658734
      Font.Height = -9
      Font.Name = 'Calibri'
      ParentColor = False
      Color = clGray
      TabOrder = 4
    end
    object htmlFrame: TUniHTMLFrame
      Left = 266
      Top = 20
      Width = 34
      Height = 28
      Hint = ''
      Visible = False
      OnAjaxEvent = htmlFrameAjaxEvent
    end
  end
  object paBackground: TUniContainerPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 330
    Height = 364
    Hint = ''
    ParentColor = False
    Align = alLeft
    TabOrder = 0
    object paBackgroundLogin: TUniPanel
      Left = 0
      Top = 0
      Width = 330
      Height = 364
      Hint = ''
      Align = alClient
      TabOrder = 3
      BorderStyle = ubsNone
      Caption = ''
      object btnLog_In: TUniBitBtn
        Left = 40
        Top = 226
        Width = 250
        Height = 40
        Hint = '[['#13#10'cls:ButtonThemeCrud |'#13#10'translate: '#13#10']]'#13#10
        Caption = 'Login'
        ModalResult = 1
        ParentFont = False
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Calibri'
        TabOrder = 2
        IconPosition = ipButtonEdge
        ScreenMask.Enabled = True
        ScreenMask.WaitData = True
        OnClick = btnLog_InClick
      end
      object cbRemember: TUniCheckBox
        Left = 283
        Top = 279
        Width = 135
        Height = 17
        Hint = ''
        Visible = False
        Checked = True
        Caption = 'Lembrar de mim'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Calibri'
        TabOrder = 4
      end
      object edPassword: TUniEdit
        Left = 42
        Top = 176
        Width = 250
        Height = 40
        Hint = 
          '[['#13#10'inputico:fas-unlock | '#13#10'focus-color:off |'#13#10'translate:except-' +
          'text |'#13#10'valid-required:bottom-in'#13#10']]'
        PasswordChar = '*'
        Text = ''
        ParentFont = False
        Font.Height = -17
        Font.Name = 'Calibri'
        TabOrder = 1
        EmptyText = 'Senha de Acesso'
        FieldLabelWidth = 20
        FieldLabelSeparator = ' '
        FieldLabelFont.Name = 'Calibri'
        OnExit = edPasswordExit
        OnEnter = edPasswordEnter
      end
      object labReset: TUniLabel
        Left = 40
        Top = 281
        Width = 77
        Height = 15
        Cursor = crHandPoint
        Hint = '[['#13'translate:'#13']]'
        ParentRTL = False
        Caption = 'Resetar Senha'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        ParentColor = False
        Color = 2763306
        TabOrder = 5
        OnClick = labResetClick
      end
      object btnCancelReg: TUniBitBtn
        Left = -65
        Top = 211
        Width = 101
        Height = 30
        Hint = '[[cls:ButtonThemeCrud]]'
        Visible = False
        Caption = 'Encerrar'
        ModalResult = 2
        ParentFont = False
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Calibri'
        TabOrder = 6
        IconPosition = ipButtonEdge
      end
      object labRegister: TUniLabel
        Left = 230
        Top = 281
        Width = 55
        Height = 15
        Cursor = crHandPoint
        Hint = '[['#13'translate:'#13']]'
        ParentRTL = False
        Alignment = taRightJustify
        Caption = 'Cadastrar'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        ParentColor = False
        Color = 2763306
        TabOrder = 7
        OnClick = labRegisterClick
      end
      object labLogin: TUniLabel
        Left = 40
        Top = 31
        Width = 250
        Height = 81
        Cursor = crHandPoint
        Hint = '[['#13#10'ico:fas-user-circle 3x| '#13#10'cls:rc-obj-float'#13#10']]'
        Alignment = taCenter
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Login'
        ParentFont = False
        Font.Color = 14802398
        Font.Height = -29
        Font.Name = 'Segoe UI'
        ParentColor = False
        Color = 2763306
        TabOrder = 8
      end
      object edUserName: TUniEdit
        Left = 42
        Top = 124
        Width = 250
        Height = 40
        Hint = 
          '[['#13#10'inputico:fas-envelope | '#13#10'focus-color:off |'#13#10'translate:excep' +
          't-text |'#13#10'valid-required:top-in'#13#10']]'
        ParentRTL = False
        BodyRTL = False
        InputRTL = False
        CharCase = ecLowerCase
        Text = ''
        ParentFont = False
        Font.Height = -17
        Font.Name = 'Calibri'
        TabOrder = 0
        EmptyText = 'Email de Usu'#225'rio'
        FieldLabelWidth = 20
        FieldLabelSeparator = ' '
        FieldLabelFont.Name = 'Calibri'
        OnEnter = edUserNameEnter
      end
      object cbLanguage: TUniComboBox
        Left = 143
        Top = 309
        Width = 67
        Height = 30
        Hint = ''
        Text = ''
        ParentFont = False
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 9
        IconItems = <>
        OnChange = cbLanguageChange
      end
      object paFlag: TUniContainerPanel
        Left = 144
        Top = 310
        Width = 39
        Height = 28
        Hint = '[[round:l]]'
        ParentColor = False
        Color = clWhite
        TabOrder = 10
        object labFlag: TUniLabel
          Left = -4
          Top = 0
          Width = 46
          Height = 31
          Hint = '[[translate:]]'
          Margins.Bottom = 0
          TextConversion = txtHTML
          AutoSize = False
          Caption = ''
          ParentFont = False
          Font.Color = 15658734
          Font.Height = -16
          Font.Name = 'Calibri'
          ParentColor = False
          Color = clGray
          TabOrder = 1
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
      TabOrder = 1
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
        OnKeyDown = dbgCompaniesKeyDown
        OnDblClick = dbgCompaniesDblClick
        OnDrawColumnCell = dbgCompaniesDrawColumnCell
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
          OnClick = btnEnterClick
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
          OnClick = btnLoginClick
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
          Width = 161
          Height = 19
          Hint = '[[translate:]]'
          Caption = 'Selecione uma Empresa'
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 1
        end
      end
    end
    object paNewRegister: TUniPanel
      Left = 9
      Top = 315
      Width = 334
      Height = 368
      Hint = ''
      Visible = False
      TabOrder = 2
      ScreenMask.Enabled = True
      ScreenMask.WaitData = True
      ScreenMask.Target = Owner
      BorderStyle = ubsNone
      Caption = ''
      Color = clWhite
      object edUserNameReg: TUniEdit
        Left = 22
        Top = 75
        Width = 285
        Height = 40
        Hint = '[['#13#10'inputico:fas-envelope|'#13#10'valid:email'#13#10']]'
        CharCase = ecLowerCase
        Text = ''
        ParentFont = False
        Font.Height = -16
        Font.Name = 'Calibri'
        TabOrder = 1
        EmptyText = 'Email de Usu'#225'rio'
        FieldLabelWidth = 20
        FieldLabelSeparator = ' '
      end
      object edPasswordReg: TUniEdit
        Left = 22
        Top = 122
        Width = 285
        Height = 40
        Hint = '[['#13#10'inputico:fas-unlock|'#13#10'valid:blank'#13#10']]'
        PasswordChar = '*'
        Text = ''
        ParentFont = False
        Font.Height = -16
        Font.Name = 'Calibri'
        TabOrder = 2
        EmptyText = 'Senha de Acesso'
        FieldLabelWidth = 20
        FieldLabelSeparator = ' '
      end
      object edNameReg: TUniEdit
        Left = 22
        Top = 27
        Width = 285
        Height = 40
        Hint = '[['#13#10'inputico:fas-user|'#13#10'valid:blank'#13#10']]'
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Font.Height = -16
        Font.Name = 'Calibri'
        TabOrder = 0
        EmptyText = 'Nome de Usu'#225'rio'
        FieldLabelWidth = 20
        FieldLabelSeparator = ' '
      end
      object UniLabel2: TUniLabel
        Left = -22
        Top = 90
        Width = 31
        Height = 15
        Hint = ''
        Visible = False
        TextConversion = txtHTML
        Caption = 'Email'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 4
      end
      object UniLabel4: TUniLabel
        Left = -22
        Top = 161
        Width = 90
        Height = 15
        Hint = ''
        Visible = False
        TextConversion = txtHTML
        Caption = 'Senha de Acesso'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 5
      end
      object UniLabel3: TUniLabel
        Left = -22
        Top = 20
        Width = 31
        Height = 15
        Hint = ''
        Visible = False
        TextConversion = txtHTML
        Caption = 'Nome'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 6
      end
      object UniContainerPanel1: TUniContainerPanel
        AlignWithMargins = True
        Left = 3
        Top = 316
        Width = 328
        Height = 49
        Hint = ''
        ParentColor = False
        Color = clWhite
        Align = alBottom
        TabOrder = 7
        object btnRegisterUser: TUniBitBtn
          AlignWithMargins = True
          Left = 15
          Top = 9
          Width = 147
          Height = 31
          Hint = '[['#13#10'cls:ButtonThemeCrud |'#13#10'translate:'#13#10']]'
          Margins.Left = 15
          Margins.Top = 9
          Margins.Right = 15
          Margins.Bottom = 9
          Caption = 'Solicitar Cadastro'
          ModalResult = 7
          Align = alLeft
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Calibri'
          TabOrder = 0
          IconPosition = ipButtonEdge
          ScreenMask.Enabled = True
          ScreenMask.WaitData = True
          ScreenMask.Target = Owner
          OnClick = btnRegisterUserClick
        end
        object btnBack: TUniBitBtn
          AlignWithMargins = True
          Left = 213
          Top = 9
          Width = 100
          Height = 31
          Hint = '[['#13#10'cls:ButtonThemeCrud |'#13#10'ico:fas-share 1x rtl:rc-mirror-h'#13#10']]'
          Margins.Left = 15
          Margins.Top = 9
          Margins.Right = 15
          Margins.Bottom = 9
          Caption = '>'
          Align = alRight
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Calibri'
          TabOrder = 3
          IconPosition = ipButtonEdge
          OnClick = btnBackClick
        end
        object btnConfirmEmail: TUniBitBtn
          AlignWithMargins = True
          Left = 43
          Top = 9
          Width = 157
          Height = 31
          Hint = '[['#13#10'cls:ButtonThemeCrud |'#13#10'translate:'#13#10']]'
          Margins.Left = 15
          Margins.Top = 9
          Margins.Right = 15
          Margins.Bottom = 9
          Caption = 'Confirmar EMAIL'
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Calibri'
          TabOrder = 1
          IconPosition = ipButtonEdge
          ScreenMask.Enabled = True
          ScreenMask.WaitData = True
          ScreenMask.Target = Owner
          OnClick = btnConfirmEmailClick
        end
      end
      object paKeyBoard: TUniContainerPanel
        AlignWithMargins = True
        Left = 3
        Top = 228
        Width = 328
        Height = 82
        Hint = ''
        Visible = False
        ParentColor = False
        Align = alBottom
        TabOrder = 8
        object btnRecPassword1: TUniBitBtn
          Left = 67
          Top = 1
          Width = 38
          Height = 38
          Hint = '[[cls:ButtonThemeCrud]]'
          Caption = '0'
          ModalResult = 10
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -21
          Font.Name = 'Calibri'
          TabOrder = 1
          IconPosition = ipButtonEdge
          ScreenMask.WaitData = True
          ScreenMask.Target = paNewRegister
          OnClick = btnRecPassword1Click
        end
        object btnRecPassword2: TUniBitBtn
          Left = 107
          Top = 1
          Width = 38
          Height = 38
          Hint = '[[cls:ButtonThemeCrud]]'
          Caption = '0'
          ModalResult = 10
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -21
          Font.Name = 'Calibri'
          TabOrder = 2
          IconPosition = ipButtonEdge
          ScreenMask.WaitData = True
          ScreenMask.Target = Owner
          OnClick = btnRecPassword1Click
        end
        object btnRecPassword3: TUniBitBtn
          Left = 147
          Top = 1
          Width = 38
          Height = 38
          Hint = '[[cls:ButtonThemeCrud]]'
          Caption = '0'
          ModalResult = 10
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -21
          Font.Name = 'Calibri'
          TabOrder = 3
          IconPosition = ipButtonEdge
          ScreenMask.WaitData = True
          ScreenMask.Target = Owner
          OnClick = btnRecPassword1Click
        end
        object btnRecPassword5: TUniBitBtn
          Left = 227
          Top = 1
          Width = 38
          Height = 38
          Hint = '[[cls:ButtonThemeCrud]]'
          Caption = '0'
          ModalResult = 10
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -21
          Font.Name = 'Calibri'
          TabOrder = 4
          IconPosition = ipButtonEdge
          ScreenMask.WaitData = True
          ScreenMask.Target = Owner
          OnClick = btnRecPassword1Click
        end
        object btnRecPassword4: TUniBitBtn
          Left = 187
          Top = 1
          Width = 38
          Height = 38
          Hint = '[[cls:ButtonThemeCrud]]'
          Caption = '0'
          ModalResult = 10
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -21
          Font.Name = 'Calibri'
          TabOrder = 5
          IconPosition = ipButtonEdge
          ScreenMask.WaitData = True
          ScreenMask.Target = Owner
          OnClick = btnRecPassword1Click
        end
        object btnRecPassword6: TUniBitBtn
          Left = 67
          Top = 41
          Width = 38
          Height = 38
          Hint = '[[cls:ButtonThemeCrud]]'
          Caption = '0'
          ModalResult = 10
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -21
          Font.Name = 'Calibri'
          TabOrder = 6
          IconPosition = ipButtonEdge
          ScreenMask.WaitData = True
          ScreenMask.Target = Owner
          OnClick = btnRecPassword1Click
        end
        object btnRecPassword7: TUniBitBtn
          Left = 107
          Top = 41
          Width = 38
          Height = 38
          Hint = '[[cls:ButtonThemeCrud]]'
          Caption = '0'
          ModalResult = 10
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -21
          Font.Name = 'Calibri'
          TabOrder = 7
          IconPosition = ipButtonEdge
          ScreenMask.WaitData = True
          ScreenMask.Target = Owner
          OnClick = btnRecPassword1Click
        end
        object btnRecPassword8: TUniBitBtn
          Left = 147
          Top = 41
          Width = 38
          Height = 38
          Hint = '[[cls:ButtonThemeCrud]]'
          Caption = '0'
          ModalResult = 10
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -21
          Font.Name = 'Calibri'
          TabOrder = 8
          IconPosition = ipButtonEdge
          ScreenMask.WaitData = True
          ScreenMask.Target = Owner
          OnClick = btnRecPassword1Click
        end
        object btnRecPassword9: TUniBitBtn
          Left = 187
          Top = 41
          Width = 38
          Height = 38
          Hint = '[[cls:ButtonThemeCrud]]'
          Caption = '0'
          ModalResult = 10
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -21
          Font.Name = 'Calibri'
          TabOrder = 9
          IconPosition = ipButtonEdge
          ScreenMask.WaitData = True
          ScreenMask.Target = Owner
          OnClick = btnRecPassword1Click
        end
        object btnRecPassword0: TUniBitBtn
          Left = 227
          Top = 41
          Width = 38
          Height = 38
          Hint = '[[cls:ButtonThemeCrud]]'
          Caption = '0'
          ModalResult = 10
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -21
          Font.Name = 'Calibri'
          TabOrder = 10
          IconPosition = ipButtonEdge
          ScreenMask.WaitData = True
          ScreenMask.Target = Owner
          OnClick = btnRecPassword1Click
        end
      end
    end
  end
  object rcSweetAlert: TUniSweetAlert
    Title = 'Title'
    ConfirmButtonText = 'OK'
    CancelButtonText = 'Cancel'
    ImageIndex = 0
    Padding = 20
    FocusCancel = True
    Left = 606
    Top = 60
  end
end
