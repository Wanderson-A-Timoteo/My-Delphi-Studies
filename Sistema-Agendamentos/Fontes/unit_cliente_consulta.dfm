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
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
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
      object Label1: TLabel
        Left = 71
        Top = 146
        Width = 212
        Height = 15
        Caption = 'Digite o nome ou o endere'#231'o do cliente '
      end
      object labelMsnDELouEdit: TLabel
        Left = 10
        Top = 478
        Width = 434
        Height = 15
        Caption = 
          'Pressione DEL para excluir ou duplo clique para editar profissio' +
          'nais cadastrados'
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
        Top = 146
        Width = 103
        Height = 49
        BevelOuter = bvNone
        TabOrder = 2
        object PanelBotaoConsultar: TPanel
          Left = 0
          Top = 0
          Width = 100
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
            Width = 100
            Height = 49
            Align = alClient
            Anchors = []
            Caption = 'Consultar'
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = SpeedButtonConsultarClienteClick
            ExplicitLeft = 96
            ExplicitTop = 24
            ExplicitWidth = 23
            ExplicitHeight = 22
          end
        end
      end
      object EditConsultaNomeCliente: TEdit
        Tag = 5
        Left = 16
        Top = 168
        Width = 550
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
        Height = 214
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
        Left = 47
        Top = 507
        Width = 578
        Height = 49
        BevelOuter = bvNone
        TabOrder = 4
        DesignSize = (
          578
          49)
        object PanelBotaoCancelar: TPanel
          Left = 382
          Top = 0
          Width = 200
          Height = 49
          Anchors = []
          BevelOuter = bvNone
          Color = 8421631
          ParentBackground = False
          TabOrder = 0
          object SpeedButtonCancelarConsulta: TSpeedButton
            Left = 0
            Top = 0
            Width = 200
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
            ExplicitLeft = -4
            ExplicitWidth = 100
          end
        end
        object PanelBotaoCadastrarNovoCliente: TPanel
          Left = 10
          Top = 0
          Width = 200
          Height = 49
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
      end
    end
  end
  object ds_cliente_consulta: TDataSource
    Left = 579
    Top = 283
  end
end
