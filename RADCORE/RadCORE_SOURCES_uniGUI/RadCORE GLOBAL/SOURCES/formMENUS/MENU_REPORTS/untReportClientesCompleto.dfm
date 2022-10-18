inherited frmReportClientesCompleto: TfrmReportClientesCompleto
  ClientWidth = 1300
  Caption = 'frmReportClientesCompleto'
  ExplicitWidth = 1316
  PixelsPerInch = 96
  TextHeight = 15
  inherited RLReport: TRLReport
    Left = 16
    Top = 27
    Width = 1123
    Height = 794
    PageSetup.Orientation = poLandscape
    ExplicitLeft = 16
    ExplicitTop = 27
    ExplicitWidth = 1123
    ExplicitHeight = 794
    inherited bandHeader: TRLBand
      Width = 1047
      ExplicitWidth = 1047
      inherited paTitle: TRLPanel
        Width = 1047
        ExplicitWidth = 1047
        inherited paDataCompany: TRLPanel
          Width = 1047
          ExplicitWidth = 1047
          inherited paLogo: TRLPanel
            Left = 867
            ExplicitLeft = 867
          end
        end
        inherited paTituloRel: TRLPanel
          Width = 1047
          ExplicitWidth = 1047
          inherited RLPanel1: TRLPanel
            Left = 855
            ExplicitLeft = 855
          end
        end
      end
    end
    inherited bandColumnHeader: TRLBand
      Width = 1047
      ExplicitWidth = 1047
      object RLLabel10: TRLLabel
        Left = 6
        Top = 2
        Width = 63
        Height = 15
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel9: TRLLabel
        Left = 204
        Top = 2
        Width = 255
        Height = 15
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel8: TRLLabel
        Left = 470
        Top = 2
        Width = 181
        Height = 15
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Caption = 'Telefones'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel1: TRLLabel
        Left = 662
        Top = 2
        Width = 197
        Height = 15
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Caption = 'EMail'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel2: TRLLabel
        Left = 79
        Top = 2
        Width = 63
        Height = 15
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Caption = 'Cnpj / Cpf'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel3: TRLLabel
        Left = 874
        Top = 2
        Width = 165
        Height = 15
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Caption = 'Contato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    inherited bandFooter: TRLBand
      Top = 340
      Width = 1047
      ExplicitTop = 340
      ExplicitWidth = 1047
      inherited labSite: TRLLabel
        Left = 962
        ExplicitLeft = 962
      end
    end
    object bandDetailMaster: TRLBand
      Left = 38
      Top = 233
      Width = 1047
      Height = 107
      BeforePrint = bandDetailMasterBeforePrint
      object RLDBText6: TRLDBText
        Left = 6
        Top = 2
        Width = 63
        Height = 15
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'CODIGO'
        DataSource = dsMaster
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 204
        Top = 2
        Width = 255
        Height = 15
        AutoSize = False
        DataField = 'RAZSOC'
        DataSource = dsMaster
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText8: TRLDBText
        Left = 662
        Top = 2
        Width = 197
        Height = 15
        AutoSize = False
        DataField = 'EMAIL'
        DataSource = dsMaster
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText1: TRLDBText
        Left = 79
        Top = 2
        Width = 111
        Height = 15
        AutoSize = False
        DataField = 'CNPJ_CPF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 491
        Top = 2
        Width = 68
        Height = 15
        AutoSize = False
        DataField = 'FONE1'
        DataSource = dsMaster
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText5: TRLDBText
        Left = 583
        Top = 2
        Width = 68
        Height = 15
        AutoSize = False
        DataField = 'FONE2'
        DataSource = dsMaster
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText4: TRLDBText
        Left = 470
        Top = 2
        Width = 20
        Height = 15
        AutoSize = False
        DataField = 'DDD1'
        DataSource = dsMaster
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText7: TRLDBText
        Left = 562
        Top = 2
        Width = 20
        Height = 15
        AutoSize = False
        DataField = 'DDD2'
        DataSource = dsMaster
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText9: TRLDBText
        Left = 874
        Top = 2
        Width = 165
        Height = 15
        AutoSize = False
        DataField = 'CONTATO'
        DataSource = dsMaster
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object labEnd: TRLLabel
        Left = 112
        Top = 43
        Width = 309
        Height = 15
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Caption = 'Endere'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object RLDBText10: TRLDBText
        Left = 434
        Top = 43
        Width = 169
        Height = 15
        AutoSize = False
        DataField = 'BAIRRO'
        DataSource = dsMaster
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText11: TRLDBText
        Left = 616
        Top = 43
        Width = 149
        Height = 15
        AutoSize = False
        DataField = 'CIDADE'
        DataSource = dsMaster
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText12: TRLDBText
        Left = 776
        Top = 43
        Width = 16
        Height = 15
        AutoSize = False
        DataField = 'UF'
        DataSource = dsMaster
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLLabel5: TRLLabel
        Left = 112
        Top = 27
        Width = 309
        Height = 15
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Caption = 'Endere'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel13: TRLLabel
        Left = 434
        Top = 27
        Width = 169
        Height = 15
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Caption = 'Bairro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel14: TRLLabel
        Left = 616
        Top = 27
        Width = 150
        Height = 15
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Caption = 'Cidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel15: TRLLabel
        Left = 776
        Top = 27
        Width = 15
        Height = 15
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Caption = 'Uf'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel6: TRLLabel
        Left = 800
        Top = 27
        Width = 59
        Height = 15
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Caption = 'Cep'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object RLDBText13: TRLDBText
        Left = 800
        Top = 43
        Width = 59
        Height = 15
        AutoSize = False
        DataField = 'CEP'
        DataSource = dsMaster
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLLabel11: TRLLabel
        Left = 5
        Top = 67
        Width = 185
        Height = 15
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Caption = 'Classifica'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object RLDBText14: TRLDBText
        Left = 5
        Top = 83
        Width = 185
        Height = 15
        Alignment = taJustify
        AutoSize = False
        DataField = 'CLASSIFICACAO'
        DataSource = dsMaster
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText15: TRLDBText
        Left = 616
        Top = 83
        Width = 243
        Height = 15
        Alignment = taJustify
        AutoSize = False
        DataField = 'FORMAPAGTO'
        DataSource = dsMaster
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLLabel12: TRLLabel
        Left = 616
        Top = 67
        Width = 243
        Height = 15
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Caption = 'Forma de Pagto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object RLDBText17: TRLDBText
        Left = 6
        Top = 43
        Width = 95
        Height = 15
        Alignment = taJustify
        AutoSize = False
        DataField = 'DTCADASTRO'
        DataSource = dsMaster
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLLabel21: TRLLabel
        Left = 6
        Top = 27
        Width = 95
        Height = 15
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Caption = 'Data Cadastro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object labConsultor: TRLLabel
        Left = 434
        Top = 67
        Width = 169
        Height = 15
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Caption = 'Consultor(a)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object edConsultor: TRLDBText
        Left = 434
        Top = 83
        Width = 169
        Height = 15
        Alignment = taJustify
        AutoSize = False
        DataField = 'CONSULTOR'
        DataSource = dsMaster
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object edVendedor: TRLDBText
        Left = 204
        Top = 83
        Width = 217
        Height = 15
        Alignment = taJustify
        AutoSize = False
        DataField = 'VENDEDOR'
        DataSource = dsMaster
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object labVendedor: TRLLabel
        Left = 204
        Top = 67
        Width = 217
        Height = 15
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Caption = 'Vendedor(a)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
    end
  end
  inherited RLExpressionParser: TRLExpressionParser
    Left = 1058
    Top = 364
  end
  inherited RLPDFFilter: TRLPDFFilter
    Left = 1058
    Top = 318
  end
  inherited sqlMaster: TFDQuery
    SQL.Strings = (
      
        'Select C.*, tc.descricao as Classificacao, tc.valor_p13, tc.valo' +
        'r_p45, fp.descricao as formapagto,'
      'f1.nome as vendedor, f2.nome as consultor'
      ''
      'From Clientes C'
      ''
      'Left join tiposclientes tc'
      'on tc.codigo = c.codiclassifcli'
      ''
      'left join formaspagamento fp'
      'on fp.codigo = c.codiformapagto'
      ''
      'left join funcionarios f1'
      'on f1.codigo = c.codifunc'
      ''
      'left join funcionarios f2'
      'on f2.codigo = c.codifunc2'
      ''
      'order by Nome'
      '')
    Left = 1058
    Top = 419
  end
  inherited sqlSearchMaster: TFDQuery
    Left = 1058
    Top = 525
  end
  inherited dsMaster: TDataSource
    Left = 1058
    Top = 473
  end
  inherited dsSearchMaster: TDataSource
    Left = 1058
    Top = 569
  end
end
