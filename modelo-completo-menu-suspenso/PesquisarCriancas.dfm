object FormPesquisarCriancas: TFormPesquisarCriancas
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'FormPesquisarCriancas'
  ClientHeight = 729
  ClientWidth = 1168
  Color = clBlack
  TransparentColor = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 18
  object PanelContainer: TPanel
    Left = 27
    Top = 8
    Width = 1105
    Height = 689
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      1105
      689)
    object LabelNome: TLabel
      Left = 24
      Top = 117
      Width = 42
      Height = 19
      Caption = 'Nome'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object SpbPesquisar: TSpeedButton
      Left = 423
      Top = 133
      Width = 106
      Height = 29
      Cursor = crHandPoint
      Hint = 'Pesquisa de Tipos de Animais'
      Caption = 'Pesquisar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        C6050000424DC605000000000000360400002800000014000000140000000100
        0800000000009001000000000000000000000001000000010000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A600D4F0FF00B1E2F8008ED4DF006BC9D10048B8C30025AABD0000AAC5000092
        AF00007A930000626200004A4A0000323200D4E3FF00B1C7FF008EABFF006B8F
        FF004873FF002557FF000055FF000049DC00003DB90000319600002573000019
        5000D4D4FF00B1B1FF008E8EFF006B6BFF004848FF002525FF000000FE000000
        DC000000B900000096000000730000005000E3D4FF00C7B1FF00AB8EFF008F6B
        FF007348FF005725FF005500FF004900DC003D00B90031009600250073001900
        5000F0D4FF00E2B1FF00D48EFF00C66BFF00B848FF00AA25FF00AA00FF009200
        DC007A00B900620096004A00730032005000FFD4FF00FFB1FF00FF8EFF00FF6B
        FF00FF48FF00FF25FF00FE00FE00DC00DC00B900B90096009600730073005000
        5000FFD4F000FFB1E200FF8ED400FF6BC600FF48B800FF25AA00FF00AA00DC00
        9200B9007A009600620073004A0050003200FFD4E300FFB1C700FF8EAB00FF6B
        8F00FF487300FF255700FF005500DC004900B9003D0096003100730025005000
        1900FFD4D400FFB1B100FF8E8E00FF6B6B00FF484800FF252500FE000000DC00
        0000B9000000960000007300000050000000FFE3D400FFC7B100FFAB8E00FF8F
        6B00FF734800FF572500FF550000DC490000B93D000096310000732500005019
        0000FFF0D400FFE2B100FFD48E00FFC66B00FFB84800FFAA2500FFAA0000DC92
        0000B97A000096620000734A000050320000FFFFD400FFFFB100FFFF8E00FFFF
        6B00FFFF4800FFFF2500FEFE0000DCDC0000B9B9000096960000737300005050
        0000F0FFD400E2FFB100D4FF8E00C6FF6B00B8FF4800AAFF2500AAFF000092DC
        00007AB90000629600004A73000032500000E3FFD400C7FFB100ABFF8E008FFF
        6B0073FF480057FF250055FF000049DC00003DB9000031960000257300001950
        0000D4FFD400B1FFB1008EFF8E006BFF6B0048FF480025FF250000FE000000DC
        000000B90000009600000073000000500000D4FFE300B1FFC7008EFFAB006BFF
        8F0048FF730025FF570000FF550000DC490000B93D0000963100007325000050
        1900D4FFF000B1FFE2008EFFD4006BFFC60048FFB80025FFAA0000FFAA0000DC
        920000B97A000096620000734A0000503200D4FFFF00B1FFFF008EFFFF006BFF
        FF0048FFFF0025FFFF0000FEFE0000DCDC0000B9B90000969600007373000050
        5000F2F2F200E6E6E600DADADA00CECECE00C2C2C200B6B6B600AAAAAA009E9E
        9E0092929200868686007A7A7A006E6E6E0062626200565656004A4A4A003E3E
        3E0032323200262626001A1A1A000E0E0E00F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010101010101
        01010101010101010101F100F1EA010101010101010101010101010101F10013
        15F10101010101010101010101010101F100110B130001010101010101010101
        010101F100110B1200F1010101010101010101010101F100110B1200F1010101
        010101010101010101F100110B1200F10101010101E8ECEEEEEEEEECF100110B
        1200F10101010101EAEEF000000000F10013111200F10101010101EAF000EDE7
        E4E4E7ED00F01400F10101010101E8EE00E7E46A6A6A6AE4E70000F101010101
        0101ECF0EDE46A6A00006A6AE4EDF1EC010101010101EE00E76A6A6B00006B6A
        6AE700EE010101010101EE00E46A0000000000006AE400EE010101010101EE00
        E46A0000000000006AE400EE010101010101EE00E76AFFFF00006B6A6AE700EE
        010101010101ECF0EDE46AFF00006A6AE4EDF0EC010101010101E8EE00E7E46A
        6A6A6AE4E700EEE801010101010101EAF000EDE7E4E4E7ED00F0EA0101010101
        01010101EAEEF000000000F0EEEA0101010101010101010101E8ECEEEEEEEEEC
        E8010101010101010101}
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SpbPesquisarClick
    end
    object DbgPesquisarCrianca: TDBGrid
      Left = 24
      Top = 192
      Width = 1057
      Height = 377
      DataSource = DataModuleDados.DscPesquisarCrianca
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -16
      TitleFont.Name = 'Arial'
      TitleFont.Style = []
      OnDrawColumnCell = DbgPesquisarCriancaDrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'data_hora_entrada'
          Title.Caption = 'Data'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = 12607053
          Title.Font.Height = -16
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Width = 88
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'numero_pulseira'
          Title.Caption = 'N'#186' Pulseira'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = 12607053
          Title.Font.Height = -16
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Width = 92
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome_crianca'
          Title.Caption = 'Nome da Crian'#231'a'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = 12607053
          Title.Font.Height = -16
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Width = 259
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome_mae'
          Title.Caption = 'Nome da M'#227'e'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = 12607053
          Title.Font.Height = -16
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Width = 242
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome_pai'
          Title.Caption = 'Nome do Pai'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = 12607053
          Title.Font.Height = -16
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Width = 228
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'sair_sozinho'
          Title.Caption = 'Sair Sozinho'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = 12607053
          Title.Font.Height = -16
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Width = 103
          Visible = True
        end>
    end
    object EditNome: TEdit
      Left = 24
      Top = 141
      Width = 400
      Height = 18
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnKeyDown = EditNomeKeyDown
    end
    object PanelBarraNome: TPanel
      Left = 24
      Top = 161
      Width = 400
      Height = 1
      BevelOuter = bvNone
      Color = 15000804
      ParentBackground = False
      TabOrder = 2
    end
    object PanelBarraTitulo: TPanel
      Left = 0
      Top = 89
      Width = 1105
      Height = 5
      Color = 10329501
      ParentBackground = False
      TabOrder = 3
    end
    object PanelBtnCadastrar: TPanel
      Left = 24
      Top = 598
      Width = 200
      Height = 50
      Anchors = [akLeft, akBottom]
      BevelOuter = bvNone
      Color = 12607053
      ParentBackground = False
      TabOrder = 4
      object SpbCadastrar: TSpeedButton
        Left = 2
        Top = 2
        Width = 196
        Height = 46
        Cursor = crHandPoint
        Caption = '&Cadastrar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = SpbCadastrarClick
        OnMouseEnter = SpbCadastrarMouseEnter
        OnMouseLeave = SpbCadastrarMouseLeave
      end
    end
    object PanelBtnSair: TPanel
      Left = 239
      Top = 598
      Width = 200
      Height = 50
      Anchors = [akLeft, akBottom]
      BevelOuter = bvNone
      Color = 3618754
      ParentBackground = False
      TabOrder = 5
      object SpbSair: TSpeedButton
        Left = 2
        Top = 2
        Width = 196
        Height = 46
        Cursor = crHandPoint
        Caption = '&Sair'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = SpbSairClick
        OnMouseEnter = SpbSairMouseEnter
        OnMouseLeave = SpbSairMouseLeave
      end
    end
    object PanelHeader: TPanel
      Left = 0
      Top = 0
      Width = 1105
      Height = 90
      Align = alTop
      BevelOuter = bvNone
      Color = 15895915
      ParentBackground = False
      TabOrder = 6
      DesignSize = (
        1105
        90)
      object Label1: TLabel
        AlignWithMargins = True
        Left = 469
        Top = 32
        Width = 219
        Height = 29
        Alignment = taCenter
        Anchors = [akTop]
        Caption = 'Consultar Crian'#231'as'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -24
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitLeft = 468
      end
      object SpbFechar: TSpeedButton
        Left = 1079
        Top = 4
        Width = 21
        Height = 24
        Cursor = crHandPoint
        Hint = 'Fechar o Sistema'
        Anchors = [akTop, akRight]
        Caption = 'X'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 14671839
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        OnClick = SpbFecharClick
        OnMouseEnter = SpbFecharMouseEnter
        OnMouseLeave = SpbFecharMouseLeave
        ExplicitLeft = 1077
      end
    end
    object StatusBar: TStatusBar
      Left = 0
      Top = 670
      Width = 1105
      Height = 19
      AutoHint = True
      Panels = <>
      ExplicitTop = 632
    end
  end
end
