object Form_Principal: TForm_Principal
  Left = 0
  Top = 0
  Caption = 'Manipulando DBGrid'
  ClientHeight = 525
  ClientWidth = 886
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PanelContainer: TPanel
    Left = 0
    Top = 0
    Width = 886
    Height = 525
    Align = alClient
    TabOrder = 0
    ExplicitTop = 56
    ExplicitWidth = 881
    ExplicitHeight = 465
    object BtnAtivar: TButton
      Left = 782
      Top = 8
      Width = 91
      Height = 41
      Caption = 'Ativar'
      TabOrder = 0
      OnClick = BtnAtivarClick
    end
    object PanelGRID: TPanel
      Left = 16
      Top = 64
      Width = 857
      Height = 449
      TabOrder = 1
      object dbg_registros: TDBGrid
        Left = 1
        Top = 1
        Width = 855
        Height = 447
        Align = alClient
        BorderStyle = bsNone
        Color = clWhite
        Ctl3D = True
        DataSource = ds_unidades
        DrawingStyle = gdsClassic
        FixedColor = 7165253
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7165253
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgTitleClick]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = dbg_registrosDrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -16
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Title.Alignment = taCenter
            Title.Caption = 'Nome'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -16
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Width = 696
            Visible = True
          end>
      end
    end
  end
  object ds_unidades: TDataSource
    DataSet = dmDados.QryUnidades
    Left = 824
    Top = 96
  end
end
