object frmDEMO_VIDEOIMG: TfrmDEMO_VIDEOIMG
  Left = 0
  Top = 0
  Width = 1004
  Height = 677
  OnCreate = UniFrameCreate
  OnReady = UniFrameReady
  ParentAlignmentControl = False
  AlignmentControl = uniAlignmentClient
  TabOrder = 0
  ParentColor = False
  ParentBackground = False
  object sboxGridBlock: TUniScrollBox
    Left = 0
    Top = 0
    Width = 1004
    Height = 677
    Cursor = crHandPoint
    Hint = ''
    Align = alClient
    Color = 15395562
    TabOrder = 0
    ScrollY = 119
    object rcBlock1000: TUniContainerPanel
      Tag = 4
      Left = 29
      Top = 1273
      Width = 729
      Height = 43
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 0
    end
    object rcBlock440: TUniContainerPanel
      Tag = 2
      AlignWithMargins = True
      Left = 5
      Top = 800
      Width = 593
      Height = 415
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-6 | '#13#10'hr-childs:xs-exp sm-exp md-exp |'#13#10 +
        'round:no | '#13#10'cls:card-info-box-white'#13#10']]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 1
      object rcBlock450: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 593
        Height = 42
        Hint = 
          '[['#13#10'cols:12 |'#13#10'noborder-top | '#13#10'noborder-left | '#13#10'round:t | '#13#10'cl' +
          's:card-light'#13#10']]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel1: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 0
          Width = 587
          Height = 42
          Hint = '[[bsh5:|cls:left-center]]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = False
          Caption = 'Sample: "img:" '
          Align = alClient
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object rcBlock455: TUniContainerPanel
        Left = 14
        Top = 48
        Width = 543
        Height = 340
        Hint = 
          '[['#13#10'cols:12 |'#13#10'hr:340 mobile-v-180 mobile-h-180 |'#13#10'img:files/ima' +
          'ges/nature/1.jpg |'#13#10'img-cls:rc-zoomer-def rc-zoomer '#13#10']]'#13#10#13#10#13#10#13#10 +
          #13#10#13#10#13#10#13#10#13#10#13#10#13#10
        ParentColor = False
        TabOrder = 2
        object UniLabel2: TUniLabel
          Left = 100
          Top = 26
          Width = 249
          Height = 39
          Hint = ''
          Visible = False
          Caption = 
            'o '#39'hr'#39' aplicado no rcBlock455 '#233' usado para ajustar o '#13#10'"height" ' +
            'do bloco para garantir a melhor '#13#10'responsividade da imagem |UniL' +
            'abel2'
          TabOrder = 1
        end
      end
    end
    object rcBlock400: TUniContainerPanel
      Tag = 2
      AlignWithMargins = True
      Left = 6
      Top = 377
      Width = 593
      Height = 415
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-6 | '#13#10'hr-childs:xs-exp sm-exp md-exp |'#13#10 +
        'round:no | '#13#10'cls:card-info-box-white'#13#10']]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 2
      object rcBlock402: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 593
        Height = 42
        Hint = 
          '[['#13#10'cols:12 |'#13#10'noborder-top | '#13#10'noborder-left | '#13#10'round:t | '#13#10'cl' +
          's:card-light'#13#10']]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel3: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 0
          Width = 587
          Height = 42
          Hint = '[[bsh5:|cls:left-center]]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = False
          Caption = 'Sample: "video:'#39' '
          Align = alClient
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object rcBlock410: TUniContainerPanel
        Left = 57
        Top = 62
        Width = 460
        Height = 340
        Hint = 
          '[['#13#10'cols:12 |'#13#10'video:https://www.youtube.com/embed/feVEDq7WTeQ '#13 +
          #10' width-560 mobile-h-560 mobile-v-295'#13#10' height-340 mobile-h-340 ' +
          'mobile-v-180 |'#13#10']]'#13#10#13#10#13#10#13#10#13#10#13#10
        ParentColor = False
        TabOrder = 2
      end
    end
    object rcBlock270: TUniContainerPanel
      Tag = 2
      AlignWithMargins = True
      Left = 7
      Top = -21
      Width = 412
      Height = 365
      Hint = '[[cols:xs-12 sm-12 md-6 | round:no | cls:card-info-box-white]]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 3
      object UniContainerPanel1: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 412
        Height = 42
        Hint = '[[round:t | cls:card-light]]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel4: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 0
          Width = 406
          Height = 42
          Hint = '[[bsh5:|cls:left-center]]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = False
          Caption = 'bsVIDEO ( CENTER V_Offset 42px )'
          Align = alClient
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object UniContainerPanel2: TUniContainerPanel
        AlignWithMargins = True
        Left = 8
        Top = 110
        Width = 366
        Height = 205
        Hint = '[[round:all | cls:card-info-box-white | center:parent x:0 y:42]]'
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 8
        Margins.Bottom = 8
        ParentColor = False
        TabOrder = 2
        object UniHTMLFrame1: TUniHTMLFrame
          Left = 0
          Top = 0
          Width = 366
          Height = 205
          Hint = 
            '[['#13#10'bsvideo:files/videos/clouds.webm controls loop autoplay '#13#10']]' +
            #13#10#13#10
          Align = alClient
        end
      end
    end
    object rcBlock280: TUniContainerPanel
      Tag = 2
      AlignWithMargins = True
      Left = 461
      Top = -21
      Width = 384
      Height = 365
      Hint = '[[cols:xs-12 sm-12 md-6 | round:no | cls:card-info-box-white]]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 4
      DesignSize = (
        384
        365)
      object UniContainerPanel3: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 384
        Height = 42
        Hint = '[[round:t | cls:card-light]]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel5: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 0
          Width = 378
          Height = 42
          Hint = '[[bsh5:|cls:left-center]]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = False
          Caption = 'bsWEBCAM ( anchors left + right + top )'
          Align = alClient
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object UniContainerPanel4: TUniContainerPanel
        AlignWithMargins = True
        Left = 34
        Top = 70
        Width = 320
        Height = 240
        Hint = '[['#13#10'round:all | '#13#10'cls:card-info-box-white|'#13#10'center:parent x'#13#10']]'
        Margins.Left = 12
        Margins.Top = 12
        Margins.Right = 12
        Margins.Bottom = 12
        ParentColor = False
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        object imgCap: TUniImage
          Left = 0
          Top = 0
          Width = 320
          Height = 240
          Hint = ''
          Center = True
          Stretch = True
          Picture.Data = {
            0A544A504547496D616765B6040000FFD8FFE000104A46494600010101006100
            610000FFE100224578696600004D4D002A000000080001011200030000000100
            01000000000000FFDB0043000201010201010202020202020202030503030303
            030604040305070607070706070708090B0908080A0807070A0D0A0A0B0C0C0C
            0C07090E0F0D0C0E0B0C0C0CFFDB004301020202030303060303060C0807080C
            0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
            0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC0001108005A006C030122000211
            01031101FFC4001F000001050101010101010000000000000000010203040506
            0708090A0BFFC400B5100002010303020403050504040000017D010203000411
            05122131410613516107227114328191A1082342B1C11552D1F0243362728209
            0A161718191A25262728292A3435363738393A434445464748494A5354555657
            58595A636465666768696A737475767778797A838485868788898A9293949596
            9798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2
            D3D4D5D6D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F
            0100030101010101010101010000000000000102030405060708090A0BFFC400
            B511000201020404030407050404000102770001020311040521310612415107
            61711322328108144291A1B1C109233352F0156272D10A162434E125F1171819
            1A262728292A35363738393A434445464748494A535455565758595A63646566
            6768696A737475767778797A82838485868788898A92939495969798999AA2A3
            A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8
            D9DAE2E3E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C0301000211031100
            3F00FDACA28A2BDC3C70A28A2800A28A2800A28A2800A28A2800A28A2800A28A
            2800A28A2800A28A2800A28A92D6CE6D42711411B4921EC3FCF1F8D17B6AC08E
            8ADDB7F87B7B2A65E5B78CFA72D55B52F065FE9C8CFB56E235EA633C8FC3AFE5
            59FB68376B9A7B29AD6C65D14039A2B4330A28A2800A28A2800A28A2800A28A2
            8016389AE2658E35DD24842A8F526BD0F44D122D0EC5628C0663CC8F8E5CFF00
            9ED5C6F841164F12DAEEE80B11F50A6BBEAE0C64DDD44EDC2C559C828AE73C65
            A8DE44638D6DDE385674DB2AC98F30FF00771D79E95B7A65CCF756DBAE2DFECD
            26E2366EDDC7AE6B9A54DA8A91D0A69CB94E73C77A02DBAFDBA150BB8E265038
            24F46FF1AE6ABD0BC4F1ACBE1DBD0DFF003C58FE20647EB5E7A3A577E166E50D
            7A1C5898A52BA0A28A2BA4E70A28A2800A28A2800A28A28025B1BD6D3AFA1B85
            1B8C2C1B1EBEBFA57A3DA5D477D6C9344DBA3906548EF5E6757F43F125C680DF
            BBFDE42C72D131E3F0F4AE7C451E7575B9D142B7268F63BCBBB286F915668D64
            5560C030E8474352D73F07C44B374F9E3B88DBB8DBBAABEA5F1197695B481B71
            E8F2F007E1DFF4AE1542A3D2C757B682D6E58F1FEACB6FA67D954E64B8EA3D10
            75FCFA7E75C78E94FB8B992F276966669247392C7BD32BD2A34F9236386AD4E7
            95C28A28AD0CC28A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A
            28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A
            28A00FFFD9}
          Proportional = True
          Align = alClient
        end
      end
      object UniButton1: TUniButton
        Left = 34
        Top = 323
        Width = 47
        Height = 31
        Hint = '[[cls:ButtonDark]]'
        Caption = 'CAM '
        TabOrder = 3
        OnClick = UniButton1Click
      end
      object UniButton2: TUniButton
        Left = 297
        Top = 323
        Width = 57
        Height = 31
        Hint = '[[cls:ButtonOrange]]'
        Caption = 'CLEAR'
        Anchors = [akTop, akRight]
        TabOrder = 4
        OnClick = UniButton2Click
      end
      object UniButton3: TUniButton
        Left = 87
        Top = 323
        Width = 70
        Height = 31
        Hint = '[[cls:ButtonDark]]'
        Caption = 'QR CODE'
        TabOrder = 5
        OnClick = UniButton3Click
      end
      object UniButton4: TUniButton
        Left = 163
        Top = 323
        Width = 78
        Height = 31
        Hint = '[[cls:ButtonDark]]'
        Visible = False
        Caption = 'BAR CODE'
        TabOrder = 6
        OnClick = UniButton4Click
      end
    end
    object rcBlock260: TUniContainerPanel
      Tag = 4
      Left = 9
      Top = -80
      Width = 729
      Height = 43
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 5
      object UniLabel6: TUniLabel
        AlignWithMargins = True
        Left = 6
        Top = 6
        Width = 717
        Height = 31
        Hint = '[[bsh5:|cls:left-center]]'
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        AutoSize = False
        Caption = 'Video and WebCam'
        Align = alClient
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
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
    Left = 894
    Top = 46
  end
end
