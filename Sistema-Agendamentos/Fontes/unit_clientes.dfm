object form_clientes: Tform_clientes
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 686
  ClientWidth = 716
  Color = 11976552
  Font.Charset = DEFAULT_CHARSET
  Font.Color = 11976552
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 15
  object shape_fundo_form_agendamento: TShape
    Left = 0
    Top = 0
    Width = 716
    Height = 686
    Align = alClient
    Brush.Color = 11976552
    Pen.Color = 11976552
    ExplicitHeight = 625
  end
  object PanelContainer: TPanel
    Left = 8
    Top = 8
    Width = 700
    Height = 673
    BevelOuter = bvNone
    Color = 11976552
    ParentBackground = False
    TabOrder = 0
    object PanelAgrupaCamposAgendamento: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 694
      Height = 662
      Margins.Bottom = 0
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      object Panel10: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 688
        Height = 646
        Margins.Bottom = 0
        Align = alTop
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        object LabelNomeCliente: TLabel
          Left = 10
          Top = 90
          Width = 129
          Height = 21
          Caption = 'Nome do Cliente'
          Color = 5839365
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5839365
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object LabelCelular: TLabel
          Left = 193
          Top = 440
          Width = 54
          Height = 21
          Caption = 'Celular'
          Color = 5839365
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5839365
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object Label9: TLabel
          Left = 200
          Top = 30
          Width = 221
          Height = 37
          Caption = 'Cadastrar Cliente'
          Color = 5839365
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5839365
          Font.Height = -27
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object LabelEndereco: TLabel
          Left = 10
          Top = 232
          Width = 71
          Height = 21
          Caption = 'Endere'#231'o'
          Color = 5839365
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5839365
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object LabelTelefoneFixo: TLabel
          Left = 10
          Top = 440
          Width = 102
          Height = 21
          Caption = 'Telefone Fixo'
          Color = 5839365
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5839365
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object LabelComplemento: TLabel
          Left = 7
          Top = 366
          Width = 109
          Height = 21
          Caption = 'Complemento'
          Color = 5839365
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5839365
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object Label13: TLabel
          Left = 10
          Top = 510
          Width = 97
          Height = 21
          Caption = 'Observa'#231'oes'
          Color = 5839365
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5839365
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object LabelDataNascimento: TLabel
          Left = 368
          Top = 161
          Width = 155
          Height = 21
          Caption = 'Data de Nascimento'
          Color = 5839365
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5839365
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object LabelNumero: TLabel
          Left = 575
          Top = 232
          Width = 63
          Height = 21
          Caption = 'N'#250'mero'
          Color = 5839365
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5839365
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object LabelRG: TLabel
          Left = 186
          Top = 161
          Width = 21
          Height = 21
          Caption = 'RG'
          Color = 5839365
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5839365
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object LabelCPF: TLabel
          Left = 10
          Top = 161
          Width = 28
          Height = 21
          Caption = 'CPF'
          Color = 5839365
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5839365
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object LabelCEP: TLabel
          Left = 520
          Top = 366
          Width = 29
          Height = 21
          Caption = 'CEP'
          Color = 5839365
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5839365
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object LabelBairro: TLabel
          Left = 10
          Top = 296
          Width = 46
          Height = 21
          Caption = 'Bairro'
          Color = 5839365
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5839365
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object LabelCidade: TLabel
          Left = 290
          Top = 300
          Width = 53
          Height = 21
          Caption = 'Cidade'
          Color = 5839365
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5839365
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object LabelUF: TLabel
          Left = 575
          Top = 300
          Width = 20
          Height = 21
          Caption = 'UF'
          Color = 5839365
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5839365
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object MaskEditCelular: TMaskEdit
          Left = 193
          Top = 473
          Width = 150
          Height = 22
          BorderStyle = bsNone
          EditMask = '(##) #.####-####;1;_'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 11976552
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          MaxLength = 16
          ParentFont = False
          TabOrder = 12
          Text = '(  )  .    -    '
        end
        object PanelBotoesSalvarCancelar: TPanel
          Left = 10
          Top = 591
          Width = 364
          Height = 49
          BevelOuter = bvNone
          TabOrder = 18
          object PanelBotaoSalvar: TPanel
            Left = 0
            Top = 0
            Width = 177
            Height = 49
            Align = alLeft
            Anchors = [akLeft, akBottom]
            BevelOuter = bvNone
            Color = 11976552
            ParentBackground = False
            TabOrder = 0
            object SpeedButtonSalvar: TSpeedButton
              Left = 0
              Top = 0
              Width = 177
              Height = 49
              Align = alClient
              Caption = 'Salvar'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 96
              ExplicitTop = 24
              ExplicitWidth = 23
              ExplicitHeight = 22
            end
          end
          object PanelBotaoCancelar: TPanel
            Left = 193
            Top = 0
            Width = 171
            Height = 49
            Align = alRight
            BevelOuter = bvNone
            Color = 8421631
            ParentBackground = False
            TabOrder = 1
            object SpeedButtonCancelar: TSpeedButton
              Left = 0
              Top = 0
              Width = 171
              Height = 49
              Align = alClient
              Caption = 'Cancelar'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = SpeedButtonCancelarClick
              ExplicitLeft = 88
              ExplicitTop = 8
              ExplicitWidth = 23
              ExplicitHeight = 22
            end
          end
        end
        object EditNomeCliente: TEdit
          Left = 10
          Top = 117
          Width = 660
          Height = 29
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 11976552
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object PanelBordaNomeCliente: TPanel
          Left = 10
          Top = 142
          Width = 660
          Height = 2
          Caption = 'PanelBorda'
          Color = 5839365
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5839365
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 24
        end
        object PanelBordaEndereco: TPanel
          Left = 10
          Top = 287
          Width = 540
          Height = 2
          Caption = 'PanelBorda'
          Color = 5839365
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5839365
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 22
        end
        object EditEndereco: TEdit
          Left = 10
          Top = 262
          Width = 543
          Height = 22
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 11976552
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
        end
        object PanelBordaCelular: TPanel
          Left = 193
          Top = 496
          Width = 150
          Height = 2
          Caption = 'PanelBorda'
          Color = 5839365
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5839365
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 23
        end
        object MaskEditTelefoneFixo: TMaskEdit
          Left = 10
          Top = 473
          Width = 150
          Height = 22
          BorderStyle = bsNone
          EditMask = '(##) ####-####;1;_'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 11976552
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          MaxLength = 14
          ParentFont = False
          TabOrder = 11
          Text = '(  )     -    '
        end
        object PanelBordaComplemento: TPanel
          Left = 10
          Top = 419
          Width = 490
          Height = 2
          Caption = 'PanelBorda'
          Color = 5839365
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5839365
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 20
        end
        object EditComplemento: TEdit
          Left = 10
          Top = 394
          Width = 487
          Height = 22
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 11976552
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
        end
        object PanelBordaObservacoes: TPanel
          Left = 10
          Top = 566
          Width = 660
          Height = 2
          Caption = 'PanelBorda'
          Color = 5839365
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5839365
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 16
        end
        object EditObservacoes: TEdit
          Left = 10
          Top = 540
          Width = 654
          Height = 22
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 11976552
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 13
        end
        object PanelBordaTelefoneFixo: TPanel
          Left = 10
          Top = 496
          Width = 150
          Height = 2
          Caption = 'PanelBorda'
          Color = 5839365
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5839365
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 21
        end
        object PanelBordaCidade: TPanel
          Left = 290
          Top = 354
          Width = 259
          Height = 1
          Caption = 'PanelBorda'
          Color = 5839365
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5839365
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 19
        end
        object MaskEditDataNascimento: TMaskEdit
          Left = 368
          Top = 194
          Width = 160
          Height = 29
          BorderStyle = bsNone
          EditMask = '##/##/####;1;_'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 11976552
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          MaxLength = 10
          ParentFont = False
          TabOrder = 3
          Text = '  /  /    '
        end
        object PanelBordaDataNascimento: TPanel
          Left = 368
          Top = 214
          Width = 160
          Height = 2
          Caption = 'PanelBorda'
          Color = 5839365
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5839365
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 14
        end
        object PanelBordaNumero: TPanel
          Left = 575
          Top = 287
          Width = 95
          Height = 2
          Caption = 'PanelBorda'
          Color = 5839365
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5839365
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 17
        end
        object EditNumero: TEdit
          Left = 575
          Top = 262
          Width = 95
          Height = 22
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 11976552
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
        end
        object MaskEditRG: TMaskEdit
          Left = 180
          Top = 194
          Width = 150
          Height = 22
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 11976552
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          Text = ''
        end
        object PanelBordaRG: TPanel
          Left = 180
          Top = 214
          Width = 150
          Height = 2
          Color = 5839365
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5839365
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 15
        end
        object MaskEditCPF: TMaskEdit
          Left = 10
          Top = 194
          Width = 147
          Height = 22
          BorderStyle = bsNone
          EditMask = '###.###.###-##;1;_'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 11976552
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          MaxLength = 14
          ParentFont = False
          TabOrder = 1
          Text = '   .   .   -  '
        end
        object PanelBordaCPF: TPanel
          Left = 10
          Top = 214
          Width = 150
          Height = 2
          Caption = 'PanelBorda'
          Color = 5839365
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5839365
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 28
        end
        object MaskEditCEP: TMaskEdit
          Left = 520
          Top = 399
          Width = 150
          Height = 29
          BorderStyle = bsNone
          EditMask = '##.###-###;1;_'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 11976552
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          MaxLength = 10
          ParentFont = False
          TabOrder = 10
          Text = '  .   -   '
        end
        object PanelBordaCEP: TPanel
          Left = 520
          Top = 419
          Width = 150
          Height = 2
          Caption = 'PanelBorda'
          Color = 5839365
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5839365
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 26
        end
        object PanelBordaBairro: TPanel
          Left = 10
          Top = 352
          Width = 247
          Height = 2
          Caption = 'PanelBorda'
          Color = 5839365
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5839365
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 25
        end
        object EditBairro: TEdit
          Left = 10
          Top = 327
          Width = 247
          Height = 22
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 11976552
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
        end
        object EditCidade: TEdit
          Left = 290
          Top = 328
          Width = 259
          Height = 22
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 11976552
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
        end
        object PanelBordaUF: TPanel
          Left = 575
          Top = 352
          Width = 92
          Height = 2
          Caption = 'PanelBorda'
          Color = 5839365
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5839365
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 27
        end
        object EditUF: TEdit
          Left = 575
          Top = 327
          Width = 92
          Height = 22
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 11976552
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 8
        end
      end
    end
  end
end