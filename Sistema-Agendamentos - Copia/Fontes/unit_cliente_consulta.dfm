object form_cliente_consulta: Tform_cliente_consulta
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 660
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
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 15
  object shape_fundo_form_agendamento: TShape
    Left = 0
    Top = 0
    Width = 716
    Height = 660
    Align = alClient
    Brush.Color = 11976552
    Pen.Color = 11976552
    ExplicitHeight = 465
  end
  object PanelContainer: TPanel
    Left = 8
    Top = 8
    Width = 700
    Height = 644
    BevelOuter = bvNone
    Color = 11976552
    ParentBackground = False
    TabOrder = 0
    object PanelAgrupaCamposConsulta: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 694
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
      object LabelConsultaNomeCliente: TLabel
        Left = 10
        Top = 141
        Width = 55
        Height = 21
        Caption = 'Buscar:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 5839365
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LabelTituloCadastrarProfissional: TLabel
        Left = 234
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
      object Label1: TLabel
        Left = 71
        Top = 146
        Width = 212
        Height = 15
        Caption = 'Digite o nome ou o endere'#231'o do cliente '
      end
      object labelMsnDELouEdit: TLabel
        Left = 10
        Top = 526
        Width = 436
        Height = 15
        Caption = 
          'Pressione DELETE para EXCLUIR ou duplo clique para EDITAR client' +
          'e cadastrado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clSilver
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object PanelBotoesConsultarCancelarCadastrarCliente: TPanel
        Left = 573
        Top = 160
        Width = 103
        Height = 35
        BevelOuter = bvNone
        TabOrder = 2
        object PanelBotaoConsultar: TPanel
          Left = 0
          Top = 0
          Width = 106
          Height = 35
          Align = alLeft
          Anchors = [akLeft, akBottom]
          BevelOuter = bvNone
          Color = 11976552
          ParentBackground = False
          TabOrder = 0
          object SpeedButtonConsultarCliente: TSpeedButton
            Left = 2
            Top = 2
            Width = 99
            Height = 31
            Align = alCustom
            Caption = 'Consultar'
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = SpeedButtonConsultarClienteClick
            OnMouseEnter = SpeedButtonConsultarClienteMouseEnter
            OnMouseLeave = SpeedButtonConsultarClienteMouseLeave
          end
        end
      end
      object EditConsultaNomeCliente: TEdit
        Tag = 5
        Left = 10
        Top = 174
        Width = 556
        Height = 20
        Hint = '  -   Nome do Profissional'
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        CharCase = ecUpperCase
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
        Width = 550
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
        Width = 666
        Height = 271
        BorderStyle = bsNone
        Color = clSilver
        DataSource = ds_cliente_consulta
        FixedColor = clSilver
        GradientEndColor = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clSilver
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clSilver
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnDblClick = dbg_registros_consulta_clienteDblClick
        OnKeyDown = dbg_registros_consulta_clienteKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'id_cliente'
            Title.Caption = 'C'#243'd.'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = 11976552
            Title.Font.Height = -16
            Title.Font.Name = 'Segoe UI'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ds_cliente'
            Title.Caption = 'Nome Cliente'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = 11976552
            Title.Font.Height = -16
            Title.Font.Name = 'Segoe UI'
            Title.Font.Style = [fsBold]
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ds_endereco'
            Title.Caption = 'Endere'#231'o'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = 11976552
            Title.Font.Height = -16
            Title.Font.Name = 'Segoe UI'
            Title.Font.Style = [fsBold]
            Width = 300
            Visible = True
          end>
      end
      object PanelBotoesCadastrarNovoClienteFechar: TPanel
        Left = 10
        Top = 571
        Width = 663
        Height = 50
        BevelOuter = bvNone
        TabOrder = 4
        object PanelBotaoCancelar: TPanel
          Left = 230
          Top = 0
          Width = 200
          Height = 50
          BevelOuter = bvNone
          Color = 8421631
          ParentBackground = False
          TabOrder = 0
          object SpeedButtonCancelarConsulta: TSpeedButton
            Left = 2
            Top = 2
            Width = 196
            Height = 46
            Align = alCustom
            Caption = 'Cancelar'
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = SpeedButtonCancelarConsultaClick
            OnMouseEnter = SpeedButtonCancelarConsultaMouseEnter
            OnMouseLeave = SpeedButtonCancelarConsultaMouseLeave
          end
        end
        object PanelBotaoCadastrarNovoCliente: TPanel
          Left = 463
          Top = 0
          Width = 200
          Height = 50
          Alignment = taRightJustify
          BevelOuter = bvNone
          Color = 5839365
          ParentBackground = False
          TabOrder = 1
          object SpeedButtonCadastrarNovoCliente: TSpeedButton
            Left = 2
            Top = 2
            Width = 196
            Height = 46
            Align = alCustom
            Caption = 'Cadastrar Cliente'
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = SpeedButtonCadastrarNovoClienteClick
            OnMouseEnter = SpeedButtonCadastrarNovoClienteMouseEnter
            OnMouseLeave = SpeedButtonCadastrarNovoClienteMouseLeave
          end
        end
        object PanelBotaoSelecionarCliente: TPanel
          Left = 0
          Top = 0
          Width = 200
          Height = 50
          Align = alLeft
          BevelOuter = bvNone
          Color = 11976552
          ParentBackground = False
          TabOrder = 2
          object SpeedButtonSelecionarCliente: TSpeedButton
            Left = 2
            Top = 2
            Width = 196
            Height = 46
            Align = alCustom
            Caption = 'Selecionar Cliente'
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = SpeedButtonSelecionarClienteClick
            OnMouseEnter = SpeedButtonSelecionarClienteMouseEnter
            OnMouseLeave = SpeedButtonSelecionarClienteMouseLeave
          end
        end
      end
      object Panel1: TPanel
        Left = 10
        Top = 541
        Width = 663
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
        TabOrder = 5
      end
    end
  end
  object ds_cliente_consulta: TDataSource
    Left = 579
    Top = 283
  end
end
