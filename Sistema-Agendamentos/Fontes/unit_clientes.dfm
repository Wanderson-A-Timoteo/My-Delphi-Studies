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
      object PanelGrupoCampos: TPanel
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
          Left = 336
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
          Left = 173
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
          Top = 161
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
        object SpeedButtonLupaPesquisaNomeCliente: TSpeedButton
          Left = 624
          Top = 172
          Width = 46
          Height = 40
          Cursor = crHandPoint
          Flat = True
          Glyph.Data = {
            F6120000424DF612000000000000360000002800000028000000280000000100
            180000000000C0120000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFE1D5D1B99F96966F62784534662D195C1D0B5C1D0B662D1978453496
            6F62B99F96E1D5D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F2F2A583776D34225717024D
            09005210005515005717025819045819045717025514005210004D0900571802
            6D3522A68478F6F3F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF9771645412004D0900541400571702581904591A05591A05
            591A05591A05591A05591A05591A05591A055819045717025414004D09005314
            00976F62FDFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC4ADA65F230F
            4E0C00571702591A05591A05591A05591A05591A05591A05591A05591A05591A
            05591A05591A05591A05591A05591A05591A05591A055717024E0B005F230FC4
            ADA7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA27F734E0B00541400581904591A05591A
            05591A05591A05591A05591A05591A05591A05591A05591A05591A05591A0559
            1A05591A05591A05591A05591A05591A055819045514004D0A00A27F74FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF845646480300581803591A05591A05591A05591A05591A05591A0559
            1A05591A05591A05591A05591A05591A05591A05591A05591A05591A05591A05
            591A05591A05591A05591A05591A05581803480300825343FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8355444F0D0058
            1904591A05591A05591A05591A05591A05591A05591A05591A05591A05591A05
            591A05591A05591A05591A05591A05591A05591A05591A05591A05591A05591A
            05581803591A05591A05581904500D00825242FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFA17D72480300581904591A05591A05591A05
            591A05591A05591A05591A05591A05591A05591A05591A05591A05591A05591A
            05591A05591A05591A05591A05591A05591A05591A05541400541400500D0058
            1904591A05581904480300A38074FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFC3ADA54E0B00581803591A05591A05591A05591A05591A05591A05591A
            05591A05591A05591A05591A05591A05591A05591A05591A05591A05591A0559
            1A05591A05591A05591A05531300612511E7DEDA977063500D00581904591A05
            5818034D0B00C4ADA6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFF5E230D5414
            00591A05591A05591A05591A05591A05591A05591A05591A05591A05591A0559
            1A05591A05591A05591A05591A05591A05591A05591A05591A05591A05591A05
            541300500E00DDD0CCFFFFFFFFFFFF9E786D500E00591A05591A055414005F23
            0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9770624F0B00581904591A05591A0559
            1A05591A05591A05591A05591A05591A05591A05591A05591A05581904581904
            581904581904591A05591A05591A05591A05591A055312005C1D09E9E1DFFFFF
            FFFFFFFFFFFFFF9C786B510E00591A05591A055819044E0C00997264FFFFFFFF
            FFFFFFFFFFF6F2F1531200571702591A05591A05591A05591A05591A05591A05
            591A05591A05591A05581904561600500E004F0D00510F00510F004F0C005312
            00581803591A05591A055413005C1E0AD8CAC4FFFFFFFFFFFFFFFFFF93695C50
            0E00581904591A05591A05591A05571702541300F6F2F1FFFFFFFFFFFFA38176
            4D0A00591A05591A05591A05591A05591A05591A05591A05591A055819045514
            004A06005E220D956D60B1958BBDA49ABCA198A684797A48374D0900500E0052
            1100510E00E9E1DEFFFFFFFFFFFFFFFFFF9A7468480200581904591A05591A05
            591A05591A05591A054D0900A58377FFFFFFFEFDFE6C3421541400591A05591A
            05591A05591A05591A05591A05591A05581904510F00672D1AC8B5ADFEFFFEFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1ECEA8C6152642815DCD0CBFFFFFF
            FFFFFFFFFFFF9167594D0A00581904591A05591A05591A05591A05591A05591A
            055414006D3522FFFFFFE0D4D0571602571802591A05591A05591A05591A0559
            1A05591A05591904490500845646FBF9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDE7E5FFFFFFFFFFFFFFFFFF9A74674D0A
            00581803591A05591A05591A05591A05591A05591A05591A05571702571803E0
            D6D2B89D954C0900591A05591A05591A05591A05591A05591A055819044C0800
            9B7568FFFFFFFFFFFFFFFFFFFFFFFFCDBAB39F7B708557478F6557B3958CEBE4
            E1FFFFFFFFFFFFFFFFFFFFFFFFFEFFFF91685B480200581904591A05591A0559
            1A05591A05591A05591A05591A05591A055919044C0900BAA097956D60521000
            591A05591A05591A05591A05591A05581904541300642916FFFFFFFFFFFFFFFF
            FFE6DDDA7C4A394F0C004E0C00521000510F004C07005C200BA48277FFFFFFFF
            FFFFFFFFFFCFBEB74D0A00571702591A05591A05591A05591A05591A05591A05
            591A05591A05591A05591A05521000966F61774432551500591A05591A05591A
            05591A05591A05571803541400D7C7C2FFFFFFFFFFFFE5DDD9561500500E0058
            1803591904591A05591A055819045615004B07008B6152FFFFFFFFFFFFFFFFFF
            7F4D3E521100591A05591A05591A05591A05591A05591A05591A05591A05591A
            05591A05551400784535662C18571702591A05591A05591A05591A05591A0553
            12007B4837FFFFFFFFFFFFFFFFFF6A311F521100581904591A05591A05591A05
            591A05591A05591A055819034A0500B69A91FFFFFFFFFFFFD5C7C24A05005819
            04591A05591A05591A05591A05591A05591A05591A05591A05591A0557170266
            2D185D1F0B581904591A05591A05591A05591A05591A054E0B00B19389FFFFFF
            FFFFFFC8B4AD480300581904591A05591A05591A05591A05591A05591A05591A
            05591A0554140069301EFBF9F9FFFFFFFFFFFF5F220D561601591A05591A0559
            1A05591A05591A05591A05591A05591A05591A055819045D1F0B5D1E0A581904
            591A05591A05591A05591A05591A05490300E7DDDAFFFFFFFFFFFF7D4B3B5211
            00591A05591A05591A05591A05591A05591A05591A05591A05591A0558180352
            1100D2C0BBFFFFFFFFFFFF845445521100591A05591A05591A05591A05591A05
            591A05591A05591A05591A055819045D1F0B662C18571702591A05591A05591A
            05591A05581904470100F6F2F1FFFFFFFFFFFF6F3927541300591A05591A0559
            1A05591A05591A05591A05591A05591A05591A055819044C0800C0AAA1FFFFFF
            FFFFFF956D5F510F00591A05591A05591A05591A05591A05591A05591A05591A
            05591A05571702662D18774432551500591A05591A05591A05591A0558190448
            0200F8F6F4FFFFFFFFFFFF6F3827541300591A05591A05591A05591A05591A05
            591A05591A05591A05591A055819044B0700BFA79FFFFFFFFFFFFF946B5E510F
            00591A05591A05591A05591A05591A05591A05591A05591A05591A0555140078
            4535956C60521000591A05591A05591A05591A05591A05490400E0D5D1FFFFFF
            FFFFFF865849521000591A05591A05591A05591A05591A05591A05591A05591A
            05591A05571803551400D6C6C1FFFFFFFFFFFF825344531100591A05591A0559
            1A05591A05591A05591A05591A05591A05591A05521000966E61B89D954C0900
            591A05591A05591A05591A05591A054D0A00BA9F96FFFFFFFFFFFFC4AEA64600
            00581904591A05591A05591A05591A05591A05591A05591A05591A0554140066
            2B19FAF9F9FFFFFFFFFFFF622511561600591A05591A05591A05591A05591A05
            591A05591A05591A055919044C0900BA9F96E0D4D0571701571802591A05591A
            05591A05591A0553120075412FFFFFFFFFFFFFFFFFFF75402F510F0058190459
            1A05591A05591A05591A05591A05591A05571803490300C6B2AAFFFFFFFFFFFF
            D3C2BE490300581904591A05591A05591A05591A05591A05591A05591A05591A
            05571702571803E0D5D2FEFDFE6C3321541400591A05591A05591A05591A0557
            1802561601D6C6C1FFFFFFFFFFFFEAE2E05D200C500D00581904591A05591A05
            591A05591A055515004D0900966F61FFFFFFFFFFFFFFFFFF815243521100591A
            05591A05591A05591A05591A05591A05591A05591A05591A055414006D3422FF
            FFFFFFFFFFA381754D0A00591A05591A05591A05591A05591A0553120068301D
            FFFFFFFFFFFFFFFFFFEFEAE787594A4500004D0A00500E004F0D004904005919
            05B2968BFFFFFFFFFFFFFFFFFFC0A8A0510E00581803591A05591A05591A0559
            1A05591A05591A05591A05591A05591A054D0900A58377FFFFFFFFFFFFF5F1F0
            541100571702591A05591A05591A05591A055819044D0A0092695BFFFFFFFFFF
            FFFFFFFFFFFFFFE5DBD8B19289966E609E7A6DC3ACA5FEFDFDFFFFFFFFFFFFFF
            FFFFE5DBD84F0D00561601591A05591A05591A05591A05591A05591A05591A05
            591A05591A05571702541300F6F2F1FFFFFFFFFFFFFFFFFF966E614F0B005819
            04591A05591A05591A05591A055819044F0C008C6153FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3C2BD5D1F0B541400
            591A05591A05591A05591A05591A05591A05591A05591A05591A055819044F0C
            00977163FFFFFFFFFFFFFFFFFFFFFFFFFEFFFF5F220D551400591A05591A0559
            1A05591A05591A055819044E0C005B1D08C4ADA5F9F7F6FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFE4D9D68E6355490300551500591A05591A05591A05591A
            05591A05591A05591A05591A05591A05591A055414005F230FFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFC2ABA44D0B00581803591A05591A05591A05591A05
            591A05591904551500521000672E1B936A5CB3978DC7B1ABBFA69EA8887D7541
            305C1E094F0D00581904591A05591A05591A05591A05591A05591A05591A0559
            1A05591A05591A055818034E0A00C3ADA6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFA07C71480300581904591A05591A05591A05591A05591A05591A
            05581803551500510F004E0A004C08004C09004F0C0053130056170158190459
            1A05591A05591A05591A05591A05591A05591A05591A05591A05591A05581904
            490300A17D71FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF825444500E00581904591A05591A05591A05591A05591A05591A05591A0559
            1A05591A05591A05591A05591A05591A05591A05591A05591A05591A05591A05
            591A05591A05591A05591A05591A05591A05581904500E00815141FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF81514048
            0300581803591A05591A05591A05591A05591A05591A05591A05591A05591A05
            591A05591A05591A05591A05591A05591A05591A05591A05591A05591A05591A
            05591A05591A05581803480300825242FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA17E724E0B00541400
            581904591A05591A05591A05591A05591A05591A05591A05591A05591A05591A
            05591A05591A05591A05591A05591A05591A05591A05591A055819045514004D
            0A00A07C70FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3ACA45F210D4F0C00571702591A
            05591A05591A05591A05591A05591A05591A05591A05591A05591A05591A0559
            1A05591A05591A05591A05591A055717024F0B005E210DC3ACA5FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF966F615312004D0A0054140057180258
            1904591A05591A05591A05591A05591A05591A05591A05591A05581904571802
            5414004D0A00541200976E61FBF9F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFF5F1F0A481756B34215717014D0900521000551500
            5717025819045819045717025515005210004D09005717016B3421A48275F6F2
            F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFEFDFEE0D4D0B99D95956D60774332662C185C1E0A5C1E
            0A662C18784432966E60B99D95E0D4D0FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          OnClick = SpeedButtonLupaPesquisaCEP
        end
        object Label1: TLabel
          Left = 145
          Top = 90
          Width = 5
          Height = 15
          Caption = '*'
          Color = 8421631
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 8421631
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label2: TLabel
          Left = 197
          Top = 161
          Width = 5
          Height = 15
          Caption = '*'
          Color = 8421631
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 8421631
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label3: TLabel
          Left = 42
          Top = 161
          Width = 5
          Height = 15
          Caption = '*'
          Color = 8421631
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 8421631
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label4: TLabel
          Left = 495
          Top = 161
          Width = 5
          Height = 15
          Caption = '*'
          Color = 8421631
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 8421631
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label5: TLabel
          Left = 553
          Top = 161
          Width = 5
          Height = 15
          Caption = '*'
          Color = 8421631
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 8421631
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label6: TLabel
          Left = 85
          Top = 232
          Width = 5
          Height = 15
          Caption = '*'
          Color = 8421631
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 8421631
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label7: TLabel
          Left = 643
          Top = 232
          Width = 5
          Height = 15
          Caption = '*'
          Color = 8421631
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 8421631
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label8: TLabel
          Left = 599
          Top = 300
          Width = 5
          Height = 15
          Caption = '*'
          Color = 8421631
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 8421631
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label10: TLabel
          Left = 347
          Top = 300
          Width = 5
          Height = 15
          Caption = '*'
          Color = 8421631
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 8421631
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label11: TLabel
          Left = 61
          Top = 296
          Width = 5
          Height = 15
          Caption = '*'
          Color = 8421631
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 8421631
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label12: TLabel
          Left = 252
          Top = 440
          Width = 5
          Height = 15
          Caption = '*'
          Color = 8421631
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 8421631
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object MaskEditCelular: TMaskEdit
          Tag = 5
          Left = 193
          Top = 478
          Width = 150
          Height = 20
          Hint = '  -   Celular'
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
          Width = 556
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
              Left = 2
              Top = 2
              Width = 173
              Height = 45
              Align = alCustom
              Caption = 'Salvar'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = SpeedButtonSalvarClick
              OnMouseEnter = SpeedButtonSalvarMouseEnter
              OnMouseLeave = SpeedButtonSalvarMouseLeave
            end
          end
          object PanelBotaoCancelar: TPanel
            Left = 379
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
          object PanelBotaoLimpar: TPanel
            Left = 193
            Top = 0
            Width = 177
            Height = 49
            BevelOuter = bvNone
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clSilver
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 2
            object SpeedButtonLimpar: TSpeedButton
              Left = 2
              Top = 2
              Width = 173
              Height = 45
              Align = alCustom
              Caption = 'Limpar'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = SpeedButtonLimparClick
              OnMouseEnter = SpeedButtonLimparMouseEnter
              OnMouseLeave = SpeedButtonLimparMouseLeave
            end
          end
        end
        object EditNomeCliente: TEdit
          Tag = 5
          Left = 10
          Top = 121
          Width = 660
          Height = 20
          Hint = '  -   Nome do Cliente'
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
          Tag = 5
          Left = 10
          Top = 268
          Width = 543
          Height = 20
          Hint = '  -   Endere'#231'o'
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
          TabOrder = 5
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
          Top = 478
          Width = 150
          Height = 20
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
          Top = 416
          Width = 660
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
          TabOrder = 20
        end
        object EditComplemento: TEdit
          Left = 10
          Top = 396
          Width = 660
          Height = 20
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
          TabOrder = 10
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
          Top = 547
          Width = 654
          Height = 20
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
          Tag = 5
          Left = 336
          Top = 195
          Width = 160
          Height = 20
          Hint = '  -   Data de Nascimento'
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
          OnExit = MaskEditDataNascimentoExit
        end
        object PanelBordaDataNascimento: TPanel
          Left = 336
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
          Tag = 5
          Left = 575
          Top = 268
          Width = 95
          Height = 20
          Hint = '  -   N'#250'mero'
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
          TabOrder = 6
        end
        object MaskEditRG: TMaskEdit
          Tag = 5
          Left = 167
          Top = 195
          Width = 150
          Height = 20
          Hint = '  -   RG'
          BorderStyle = bsNone
          CharCase = ecUpperCase
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
          Left = 167
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
          Tag = 5
          Left = 10
          Top = 195
          Width = 147
          Height = 20
          Hint = '  -   CPF'
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
          OnExit = MaskEditCPFExit
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
          Tag = 5
          Left = 520
          Top = 195
          Width = 105
          Height = 20
          Hint = '  -   CEP'
          BorderStyle = bsNone
          EditMask = '##.###-###;1;_'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 11976552
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          MaxLength = 10
          ParentFont = False
          TabOrder = 4
          Text = '  .   -   '
          OnExit = MaskEditCEPExit
        end
        object PanelBordaCEP: TPanel
          Left = 520
          Top = 214
          Width = 105
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
          Tag = 5
          Left = 10
          Top = 333
          Width = 247
          Height = 20
          Hint = '  -   Bairro'
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
          TabOrder = 7
        end
        object EditCidade: TEdit
          Tag = 5
          Left = 290
          Top = 334
          Width = 259
          Height = 20
          Hint = '  -   Cidade'
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
          TabOrder = 8
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
          Tag = 5
          Left = 575
          Top = 333
          Width = 92
          Height = 20
          Hint = '  -   UF'
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
          TabOrder = 9
        end
      end
    end
  end
  object ACBrCEP1: TACBrCEP
    ProxyPort = '8080'
    ParseText = True
    WebService = wsViaCep
    PesquisarIBGE = True
    Left = 622
    Top = 470
  end
  object ACBrEnterTab1: TACBrEnterTab
    Left = 446
    Top = 470
  end
  object ACBrValidador1: TACBrValidador
    IgnorarChar = './-'
    Left = 542
    Top = 470
  end
  object ACBrEnterTab2: TACBrEnterTab
    EnterAsTab = True
    Left = 622
    Top = 46
  end
end
