object form_relatorios: Tform_relatorios
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 415
  ClientWidth = 549
  Color = 11976552
  Font.Charset = DEFAULT_CHARSET
  Font.Color = 11976552
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 15
  object shape_fundo_form_agendamento: TShape
    Left = 0
    Top = 0
    Width = 549
    Height = 415
    Align = alClient
    Brush.Color = 11976552
    Pen.Color = 11976552
    ExplicitWidth = 535
  end
  object PanelContainer: TPanel
    Left = 8
    Top = 8
    Width = 530
    Height = 393
    BevelOuter = bvNone
    Color = 11976552
    ParentBackground = False
    TabOrder = 0
    object PanelAgrupaCamposAgendamento: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 524
      Height = 638
      Margins.Bottom = 0
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSilver
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      object LabelTipoRelatorio: TLabel
        Left = 10
        Top = 137
        Width = 207
        Height = 21
        Caption = 'Escolha o Tipo de Relat'#243'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 5839365
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LabelDataInicial: TLabel
        Left = 10
        Top = 227
        Width = 87
        Height = 21
        Caption = 'Data Inicial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 5839365
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LabelTituloCadastrarUsuarios: TLabel
        Left = 179
        Top = 38
        Width = 131
        Height = 37
        Caption = 'Relat'#243'rios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 5839365
        Font.Height = -27
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 220
        Top = 137
        Width = 5
        Height = 15
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 103
        Top = 227
        Width = 5
        Height = 15
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object LabelDataFinal: TLabel
        Left = 199
        Top = 227
        Width = 77
        Height = 21
        Caption = 'Data Final'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 5839365
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 282
        Top = 227
        Width = 5
        Height = 15
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object PanelBotoesAgendarCancelar: TPanel
        Left = 10
        Top = 314
        Width = 364
        Height = 49
        BevelOuter = bvNone
        TabOrder = 4
        object PanelBotaoAgendar: TPanel
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
          object SpeedButtonVizualizar: TSpeedButton
            Left = 2
            Top = 2
            Width = 173
            Height = 45
            Align = alCustom
            Caption = 'Visualizar'
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = SpeedButtonVizualizarClick
            OnMouseEnter = SpeedButtonVizualizarMouseEnter
            OnMouseLeave = SpeedButtonVizualizarMouseLeave
          end
        end
        object PanelBotaoCancelar: TPanel
          Left = 187
          Top = 0
          Width = 177
          Height = 49
          Align = alRight
          BevelOuter = bvNone
          Color = 8421631
          ParentBackground = False
          TabOrder = 1
          object SpeedButtonCancelar: TSpeedButton
            Left = 2
            Top = 2
            Width = 173
            Height = 45
            Align = alCustom
            Caption = 'Cancelar'
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = SpeedButtonCancelarClick
            OnMouseEnter = SpeedButtonCancelarMouseEnter
            OnMouseLeave = SpeedButtonCancelarMouseLeave
          end
        end
      end
      object PanelBordaTitulo: TPanel
        Left = 10
        Top = 105
        Width = 505
        Height = 1
        Color = 14211288
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 5839365
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 6
      end
      object ComboBoxTipoRelatorio: TComboBox
        Tag = 5
        Left = 10
        Top = 164
        Width = 318
        Height = 29
        Hint = '  -   Escola o Tipo de Relat'#243'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clSilver
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        Text = 'Selecione'
        Items.Strings = (
          'Agendamentos Por Per'#237'odo'
          'Agendamentos Por Clientes'
          'Agendamentos Por Profissionais')
      end
      object PanelBordaDataInicial: TPanel
        Left = 9
        Top = 274
        Width = 130
        Height = 1
        Color = 5839365
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 5839365
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 5
      end
      object MaskEditDataInicial: TMaskEdit
        Tag = 5
        Left = 10
        Top = 254
        Width = 130
        Height = 20
        Hint = '  -   Data Inicial do Relat'#243'rio'
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Color = clWhite
        EditMask = '##/##/####;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 11976552
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        MaxLength = 10
        ParentFont = False
        TabOrder = 1
        Text = '  /  /    '
        OnExit = MaskEditDataInicialExit
      end
      object MaskEditDataFinal: TMaskEdit
        Tag = 5
        Left = 199
        Top = 254
        Width = 130
        Height = 20
        Hint = '  -   Data Final do Relat'#243'rio'
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Color = clWhite
        EditMask = '##/##/####;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 11976552
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        MaxLength = 10
        ParentFont = False
        TabOrder = 2
        Text = '  /  /    '
        OnExit = MaskEditDataFinalExit
        OnKeyDown = MaskEditDataFinalKeyDown
      end
      object PanelBordaDataFinal: TPanel
        Left = 198
        Top = 274
        Width = 130
        Height = 1
        Color = 5839365
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 5839365
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 3
      end
    end
  end
  object ACBrEnterTab1: TACBrEnterTab
    EnterAsTab = True
    Left = 475
    Top = 43
  end
end
