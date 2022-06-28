object form_cliente_consulta: Tform_cliente_consulta
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 596
  ClientWidth = 716
  Color = 11976552
  Font.Charset = DEFAULT_CHARSET
  Font.Color = 11976552
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 15
  object shape_fundo_form_agendamento: TShape
    Left = 0
    Top = 0
    Width = 716
    Height = 596
    Align = alClient
    Brush.Color = 11976552
    Pen.Color = 11976552
    ExplicitHeight = 465
  end
  object PanelContainer: TPanel
    Left = 8
    Top = 8
    Width = 700
    Height = 585
    BevelOuter = bvNone
    Color = 11976552
    ParentBackground = False
    TabOrder = 0
    object PanelAgrupaCamposConsulta: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 694
      Height = 574
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
      object LabelConsultaNomeCliente: TLabel
        Left = 10
        Top = 137
        Width = 129
        Height = 21
        Caption = 'Nome do Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 5839365
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LabelTituloCadastrarProfissional: TLabel
        Left = 203
        Top = 38
        Width = 220
        Height = 37
        Caption = 'Consultar Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 5839365
        Font.Height = -27
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LabelClientesCadastrados: TLabel
        Left = 10
        Top = 213
        Width = 158
        Height = 21
        Caption = 'Clientes Cadastrados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 5839365
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LabelAsteriscoNomeCliente: TLabel
        Left = 143
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
      object PanelBotoesConsultarCancelarCadastrarCliente: TPanel
        Left = 10
        Top = 497
        Width = 660
        Height = 49
        BevelOuter = bvNone
        TabOrder = 2
        object PanelBotaoConsultar: TPanel
          Left = 0
          Top = 0
          Width = 180
          Height = 49
          Align = alLeft
          Anchors = [akLeft, akBottom]
          BevelOuter = bvNone
          Color = 11976552
          ParentBackground = False
          TabOrder = 0
          object SpeedButtonConsultarCliente: TSpeedButton
            Left = 0
            Top = 0
            Width = 180
            Height = 49
            Align = alClient
            Caption = 'Consultar'
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
        object PanelBotaoCadastrarNovoCliente: TPanel
          Left = 460
          Top = 0
          Width = 200
          Height = 49
          Align = alRight
          BevelOuter = bvNone
          Color = 5839365
          ParentBackground = False
          TabOrder = 1
          object SpeedButtonCadastrarNovoCliente: TSpeedButton
            Left = 0
            Top = 0
            Width = 200
            Height = 49
            Align = alClient
            Caption = 'Cadastrar Novo Cliente'
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = SpeedButtonCadastrarNovoClienteClick
          end
        end
        object PanelBotaoCancelar: TPanel
          Left = 193
          Top = 0
          Width = 180
          Height = 49
          BevelOuter = bvNone
          Color = 8421631
          ParentBackground = False
          TabOrder = 2
          object SpeedButtonCancelarConsulta: TSpeedButton
            Left = 0
            Top = 0
            Width = 180
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
            OnClick = SpeedButtonCancelarConsultaClick
            ExplicitLeft = -7
          end
        end
      end
      object EditConsultaNomeCliente: TEdit
        Tag = 5
        Left = 10
        Top = 168
        Width = 660
        Height = 22
        Hint = 'Nome do Profissional'
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
      object PanelBordaConsultaNomeCliente: TPanel
        Left = 10
        Top = 193
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
        TabOrder = 1
      end
      object dbg_registros_consulta_cliente: TDBGrid
        Left = 10
        Top = 243
        Width = 660
        Height = 193
        BorderStyle = bsNone
        DataSource = ds_cliente_consulta
        FixedColor = clWindow
        Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgTitleClick, dgTitleHotTrack]
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clSilver
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
    end
  end
  object ds_cliente_consulta: TDataSource
    Left = 579
    Top = 283
  end
end