﻿object frmFreeFrame: TfrmFreeFrame
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
    ScrollHeight = 6557
    ScrollWidth = 982
    ScrollY = 788
    object rcBlock240: TUniContainerPanel
      Tag = 2
      AlignWithMargins = True
      Left = 25
      Top = 2449
      Width = 412
      Height = 316
      Hint = '[[cols:xs-12 sm-12 md-6 | round:no | cls:card-info-box-white]]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 0
      object UniContainerPanel28: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 412
        Height = 42
        Hint = '[[round:t | cls:card-light]]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel13: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 0
          Width = 406
          Height = 42
          Hint = '[[bsh5:left-center]]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = False
          Caption = 'bsTABS'
          Align = alClient
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object pgTabSample: TUniPageControl
        Left = 0
        Top = 103
        Width = 412
        Height = 213
        Hint = ''
        ActivePage = tabEx1
        Align = alClient
        TabOrder = 2
        object tabEx1: TUniTabSheet
          Hint = ''
          Caption = 'Exemplo 1'
          object pa1: TUniPanel
            Left = 0
            Top = 0
            Width = 404
            Height = 185
            Hint = ''
            Align = alClient
            TabOrder = 0
            Caption = ''
            ParentAlignmentControl = False
            object UniMemo1: TUniMemo
              AlignWithMargins = True
              Left = 4
              Top = 4
              Width = 396
              Height = 177
              Hint = ''
              BorderStyle = ubsNone
              Lines.Strings = (
                
                  'Lorem Ipsum is simply dummy text of the printing and typesetting' +
                  ' industry. Lorem Ipsum has been the industry'#39's standard dummy te' +
                  'xt ever since the 1500s, when an unknown printer took a galley o' +
                  'f type and scrambled it to make a type specimen book. ')
              Align = alClient
              TabOrder = 1
            end
          end
        end
        object tabEx2: TUniTabSheet
          Hint = ''
          Caption = 'Exemplo 2'
          object UniMemo2: TUniMemo
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 398
            Height = 179
            Hint = ''
            BorderStyle = ubsNone
            Lines.Strings = (
              
                'It is a long established fact that a reader will be distracted b' +
                'y the readable content of a page when looking at its layout.')
            Align = alClient
            TabOrder = 0
          end
        end
        object tabEx3: TUniTabSheet
          Hint = ''
          Caption = 'Exemplo 3'
          object UniMemo3: TUniMemo
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 398
            Height = 179
            Hint = ''
            BorderStyle = ubsNone
            Lines.Strings = (
              
                'There are many variations of passages of Lorem Ipsum available, ' +
                'but the majority have suffered alteration in some form, by injec' +
                'ted humour, or randomised words which don'#39't look even slightly b' +
                'elievable. ')
            Align = alClient
            TabOrder = 0
          end
        end
      end
      object paTabSample: TUniContainerPanel
        Left = 0
        Top = 42
        Width = 412
        Height = 61
        Hint = ''
        ParentColor = False
        Align = alTop
        TabOrder = 3
        object labTabs: TUniLabel
          AlignWithMargins = True
          Left = 8
          Top = 10
          Width = 396
          Height = 49
          Hint = 
            '[['#13#10'bstabs:light cls:btn-sm pgc:pgTabSample sbox:sboxGridBlock'#13#10 +
            ']]'
          Margins.Left = 8
          Margins.Top = 10
          Margins.Right = 8
          Margins.Bottom = 2
          Alignment = taCenter
          TextConversion = txtHTML
          AutoSize = False
          Caption = 'bsTabs'
          Align = alClient
          ParentFont = False
          Font.Height = -16
          ParentColor = False
          Color = clBtnFace
          TabOrder = 1
        end
      end
    end
    object rcBlock250: TUniContainerPanel
      Tag = 2
      AlignWithMargins = True
      Left = 512
      Top = 2449
      Width = 412
      Height = 316
      Hint = '[[cols:xs-12 sm-12 md-6 | round:no | cls:card-info-box-white]]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 1
      object UniContainerPanel17: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 412
        Height = 42
        Hint = '[['#13#10'round:t | '#13#10'cls:card-light'#13#10']]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel14: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 0
          Width = 406
          Height = 42
          Hint = '[['#13#10'bsh5: | '#13#10'cls:left-center'#13#10']]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = False
          Caption = 'bsPILLS'
          Align = alClient
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object pgCardTab: TUniPageControl
        Left = 0
        Top = 96
        Width = 412
        Height = 220
        Hint = ''
        ActivePage = UniTabSheet2
        Align = alClient
        TabOrder = 2
        object UniTabSheet1: TUniTabSheet
          Hint = ''
          Caption = 'Ex. 1'
          object UniPanel1: TUniPanel
            Left = 0
            Top = 0
            Width = 404
            Height = 192
            Hint = ''
            Align = alClient
            TabOrder = 0
            Caption = ''
            ParentAlignmentControl = False
            object UniMemo4: TUniMemo
              AlignWithMargins = True
              Left = 4
              Top = 4
              Width = 396
              Height = 184
              Hint = ''
              BorderStyle = ubsNone
              Lines.Strings = (
                
                  'Lorem Ipsum is simply dummy text of the printing and typesetting' +
                  ' industry. Lorem Ipsum has been the industry'#39's standard dummy te' +
                  'xt ever since the 1500s, when an unknown printer took a galley o' +
                  'f type and scrambled it to make a type specimen book. ')
              Align = alClient
              TabOrder = 1
            end
          end
        end
        object UniTabSheet2: TUniTabSheet
          Hint = '[[closebtn:false]]'
          Caption = 'Ex. 2'
          object UniMemo5: TUniMemo
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 398
            Height = 186
            Hint = ''
            BorderStyle = ubsNone
            Lines.Strings = (
              
                'It is a long established fact that a reader will be distracted b' +
                'y the readable content of a page when looking at its layout.')
            Align = alClient
            TabOrder = 0
          end
        end
        object UniTabSheet3: TUniTabSheet
          Hint = ''
          Caption = 'Ex. 3'
          object UniMemo6: TUniMemo
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 398
            Height = 186
            Hint = ''
            BorderStyle = ubsNone
            Lines.Strings = (
              
                'There are many variations of passages of Lorem Ipsum available, ' +
                'but the majority have suffered alteration in some form, by injec' +
                'ted humour, or randomised words which don'#39't look even slightly b' +
                'elievable. ')
            Align = alClient
            TabOrder = 0
          end
        end
      end
      object paPillSample: TUniContainerPanel
        Left = 0
        Top = 42
        Width = 412
        Height = 54
        Hint = ''
        ParentColor = False
        Align = alTop
        TabOrder = 3
        object labPills: TUniLabel
          AlignWithMargins = True
          Left = 8
          Top = 10
          Width = 396
          Height = 34
          Hint = 
            '[['#13#10'bspills:light cls:btn-sm pgc:pgCardTab closeall:off cls-tab1' +
            '-active:ButtonTabPurple cls-tab2-active:ButtonTabGreen '#13#10']]'#13#10
          Margins.Left = 8
          Margins.Top = 10
          Margins.Right = 8
          Margins.Bottom = 10
          TextConversion = txtHTML
          AutoSize = False
          Caption = 'bsPills'
          Align = alClient
          ParentFont = False
          Font.Height = -16
          ParentColor = False
          Color = clBtnFace
          TabOrder = 1
        end
      end
    end
    object rcBlock172: TUniContainerPanel
      Tag = 1
      AlignWithMargins = True
      Left = 21
      Top = 1010
      Width = 170
      Height = 270
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-6 lg-3 xl-3 | '#13#10'round:no | '#13#10'cls:card-in' +
        'fo-box-white'#13#10']]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 2
      DesignSize = (
        170
        270)
      object UniContainerPanel24: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 170
        Height = 42
        Hint = '[[round:t | cls:card-green]]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel11: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 0
          Width = 164
          Height = 42
          Hint = '[[bsh5:|cls:left-center]]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = False
          Caption = 'RadCORE DEMO'
          Align = alClient
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object labAlert: TUniLabel
        Left = 9
        Top = 59
        Width = 153
        Height = 79
        Hint = '[[ bsalert:success ]]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Exemplo Alerta'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -12
        Font.Style = [fsBold]
        TabOrder = 2
      end
      object UniLabel75: TUniLabel
        Left = 8
        Top = 155
        Width = 153
        Height = 79
        Hint = '[['#13#10'rcalert:success title:Success Sample'#13#10']]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Exemplo Alerta'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -12
        Font.Style = [fsBold]
        TabOrder = 3
      end
    end
    object rcBlock270: TUniContainerPanel
      Tag = 2
      AlignWithMargins = True
      Left = 15
      Top = 2838
      Width = 412
      Height = 365
      Hint = '[[cols:xs-12 sm-12 md-6 | round:no | cls:card-info-box-white]]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 3
      object UniContainerPanel27: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 412
        Height = 42
        Hint = '[[round:t | cls:card-light]]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel15: TUniLabel
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
      object UniContainerPanel19: TUniContainerPanel
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
      Left = 469
      Top = 2840
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
      object UniContainerPanel35: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 384
        Height = 42
        Hint = '[[round:t | cls:card-light]]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel16: TUniLabel
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
      object UniContainerPanel18: TUniContainerPanel
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
      object UniButton4: TUniButton
        Left = 34
        Top = 323
        Width = 47
        Height = 31
        Hint = '[[cls:ButtonDark]]'
        Caption = 'CAM '
        TabOrder = 3
        OnClick = UniButton4Click
      end
      object UniButton5: TUniButton
        Left = 297
        Top = 323
        Width = 57
        Height = 31
        Hint = '[[cls:ButtonOrange]]'
        Caption = 'CLEAR'
        Anchors = [akTop, akRight]
        TabOrder = 4
        OnClick = UniButton5Click
      end
      object UniButton8: TUniButton
        Left = 87
        Top = 323
        Width = 70
        Height = 31
        Hint = '[[cls:ButtonDark]]'
        Caption = 'QR CODE'
        TabOrder = 5
        OnClick = UniButton8Click
      end
      object UniButton9: TUniButton
        Left = 163
        Top = 323
        Width = 78
        Height = 31
        Hint = '[[cls:ButtonDark]]'
        Visible = False
        Caption = 'BAR CODE'
        TabOrder = 6
        OnClick = UniButton9Click
      end
    end
    object rcBlock200: TUniContainerPanel
      Tag = 4
      Left = 20
      Top = 1870
      Width = 729
      Height = 43
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 5
      object UniLabel37: TUniLabel
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
        Caption = 'Slides and Carousel'
        Align = alClient
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock230: TUniContainerPanel
      Tag = 4
      Left = 25
      Top = 2396
      Width = 729
      Height = 43
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 6
      object UniLabel40: TUniLabel
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
        Caption = 'Tabs and Pills'
        Align = alClient
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock260: TUniContainerPanel
      Tag = 4
      Left = 17
      Top = 2782
      Width = 729
      Height = 43
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 7
      object UniLabel41: TUniLabel
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
    object rcBlock170: TUniContainerPanel
      Tag = 4
      Left = 23
      Top = 957
      Width = 729
      Height = 43
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 8
      object UniLabel43: TUniLabel
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
        Caption = 'Cards and Alerts'
        Align = alClient
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock174: TUniContainerPanel
      Tag = 1
      AlignWithMargins = True
      Left = 206
      Top = 1010
      Width = 170
      Height = 270
      Hint = 
        '[[cols:xs-12 sm-12 md-6 lg-3 xl-3 | round:no | cls:card-info-box' +
        '-white]]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 9
      DesignSize = (
        170
        270)
      object UniContainerPanel13: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 170
        Height = 42
        Hint = '[[round:t | cls:card-red]]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel21: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 0
          Width = 164
          Height = 42
          Hint = '[[bsh5:|cls:left-center]]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = False
          Caption = 'RadCORE DEMO'
          Align = alClient
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object UniLabel56: TUniLabel
        Left = 10
        Top = 59
        Width = 153
        Height = 79
        Hint = '[[ bsalert:danger ]]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Exemplo Alerta'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -12
        Font.Style = [fsBold]
        TabOrder = 2
      end
      object UniLabel76: TUniLabel
        Left = 10
        Top = 155
        Width = 153
        Height = 79
        Hint = '[['#13#10'rcalert:danger title:Danger Sample'#13#10']]'#13#10
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Exemplo Alerta'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -12
        Font.Style = [fsBold]
        TabOrder = 3
      end
    end
    object rcBlock178: TUniContainerPanel
      Tag = 1
      AlignWithMargins = True
      Left = 579
      Top = 1010
      Width = 170
      Height = 270
      Hint = 
        '[[cols:xs-12 sm-12 md-6 lg-3 xl-3 | round:no | cls:card-info-box' +
        '-white]]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 10
      DesignSize = (
        170
        270)
      object UniContainerPanel15: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 170
        Height = 42
        Hint = '[[round:t | cls:card-orange]]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel24: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 0
          Width = 164
          Height = 42
          Hint = '[[bsh5:|cls:left-center]]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = False
          Caption = 'RadCORE DEMO'
          Align = alClient
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object UniLabel58: TUniLabel
        Left = 10
        Top = 59
        Width = 153
        Height = 79
        Hint = '[[ bsalert:warning ]]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Exemplo Alerta'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -12
        Font.Style = [fsBold]
        TabOrder = 2
      end
      object UniLabel78: TUniLabel
        Left = 10
        Top = 155
        Width = 153
        Height = 79
        Hint = '[['#13#10'rcalert:warning title:Warning Sample'#13#10']]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Exemplo Alerta'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -12
        Font.Style = [fsBold]
        TabOrder = 3
      end
    end
    object rcBlock176: TUniContainerPanel
      Tag = 1
      AlignWithMargins = True
      Left = 398
      Top = 1010
      Width = 170
      Height = 270
      Hint = 
        '[[cols:xs-12 sm-12 md-6 lg-3 xl-3 | round:no | cls:card-info-box' +
        '-white]]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 11
      DesignSize = (
        170
        270)
      object UniContainerPanel30: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 170
        Height = 42
        Hint = '[[round:t | cls:card-blue]]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel44: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 0
          Width = 164
          Height = 42
          Hint = '[[bsh5:|cls:left-center]]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = False
          Caption = 'RadCORE DEMO'
          Align = alClient
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object UniLabel57: TUniLabel
        Left = 10
        Top = 59
        Width = 153
        Height = 79
        Hint = '[[ bsalert:info ]]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Exemplo Alerta'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -12
        Font.Style = [fsBold]
        TabOrder = 2
      end
      object UniLabel77: TUniLabel
        Left = 10
        Top = 155
        Width = 153
        Height = 79
        Hint = '[['#13#10'rcalert:info title:Info Sample'#13#10']]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Exemplo Alerta'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -12
        Font.Style = [fsBold]
        TabOrder = 3
      end
    end
    object rcBlock290: TUniContainerPanel
      Tag = 2
      AlignWithMargins = True
      Left = 46
      Top = 3238
      Width = 807
      Height = 365
      Hint = '[[cols:12 | round:no | cls:card-info-box-white]]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      Color = 9996170
      TabOrder = 12
      object UniContainerPanel37: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 807
        Height = 42
        Hint = '[[round:t | cls:card-light]]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel60: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 0
          Width = 801
          Height = 42
          Hint = '[[bsh5:|cls:left-center]]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = False
          Caption = 'rc_Anim'
          Align = alClient
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object UniButton3: TUniButton
        Left = 9
        Top = 325
        Width = 74
        Height = 31
        Hint = '[[cls:ButtonDark]]'
        Caption = 'Play'
        TabOrder = 2
        OnClick = UniButton3Click
      end
      object imgCarRed: TUniImage
        Left = 127
        Top = 165
        Width = 57
        Height = 130
        Hint = ''
        Center = True
        AutoSize = True
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000390000
          00820806000000FC156033000001376943435041646F62652052474220283139
          39382900002891958FBF4AC3501487BF1B45C5A15608E2E0702751506CD5C18C
          495B8A2058AB4392AD49439562126EAE7FFA108E6E1D5CDC7D022747C141F109
          7C03C5A98343840C058BDFF49DDF391CCE01A362D79D865186F358AB76D391AE
          E7CBD917669802804E98A576AB7500102771C418DFEF0880D74DBBEE34C6FB7F
          321FA64A032360BB1B6521880AD0BFD2A9063104CCA09F6A100F80A94EDA3510
          4F40A997FB1B500A72FF004ACAF57C105F80D9733D1F8C39C00C725F014C1D5D
          6B805A920ED459EF54CBAA6559D2EE2641248F07998ECE33B91F87894A13D5D1
          5117C8EF0360311F6C371DB956B5ACBDF57FFE3D11D7F3656E9F4708402C3D17
          594178A12E7F55183B93EB62C770190EEF617A5464BB3770B7010BB745B65A85
          F2163C0E7F00C0C64FFDF3533FC8000000097048597300000B1300000B130100
          9A9C180000074569545874584D4C3A636F6D2E61646F62652E786D7000000000
          003C3F787061636B657420626567696E3D22EFBBBF222069643D2257354D304D
          7043656869487A7265537A4E54637A6B633964223F3E203C783A786D706D6574
          6120786D6C6E733A783D2261646F62653A6E733A6D6574612F2220783A786D70
          746B3D2241646F626520584D5020436F726520352E362D633134352037392E31
          36333439392C20323031382F30382F31332D31363A34303A3232202020202020
          2020223E203C7264663A52444620786D6C6E733A7264663D22687474703A2F2F
          7777772E77332E6F72672F313939392F30322F32322D7264662D73796E746178
          2D6E7323223E203C7264663A4465736372697074696F6E207264663A61626F75
          743D222220786D6C6E733A786D703D22687474703A2F2F6E732E61646F62652E
          636F6D2F7861702F312E302F2220786D6C6E733A786D704D4D3D22687474703A
          2F2F6E732E61646F62652E636F6D2F7861702F312E302F6D6D2F2220786D6C6E
          733A73744576743D22687474703A2F2F6E732E61646F62652E636F6D2F786170
          2F312E302F73547970652F5265736F757263654576656E74232220786D6C6E73
          3A70686F746F73686F703D22687474703A2F2F6E732E61646F62652E636F6D2F
          70686F746F73686F702F312E302F2220786D6C6E733A64633D22687474703A2F
          2F7075726C2E6F72672F64632F656C656D656E74732F312E312F2220786D703A
          43726561746F72546F6F6C3D2241646F62652050686F746F73686F7020434320
          32303139202857696E646F7773292220786D703A437265617465446174653D22
          323031392D30382D32325431353A33343A34362D30333A30302220786D703A4D
          65746164617461446174653D22323031392D30382D32325431353A33343A3436
          2D30333A30302220786D703A4D6F64696679446174653D22323031392D30382D
          32325431353A33343A34362D30333A30302220786D704D4D3A496E7374616E63
          6549443D22786D702E6969643A61363234663237612D396431632D386134652D
          623165302D3235303832653164616335662220786D704D4D3A446F63756D656E
          7449443D2261646F62653A646F6369643A70686F746F73686F703A3234646461
          6662372D633064322D663034302D626262332D66643365373636336537336622
          20786D704D4D3A4F726967696E616C446F63756D656E7449443D22786D702E64
          69643A31376430343337662D343335612D396234312D393335662D6237373137
          37653033373431222070686F746F73686F703A436F6C6F724D6F64653D223322
          2064633A666F726D61743D22696D6167652F706E67223E203C786D704D4D3A48
          6973746F72793E203C7264663A5365713E203C7264663A6C692073744576743A
          616374696F6E3D2263726561746564222073744576743A696E7374616E636549
          443D22786D702E6969643A31376430343337662D343335612D396234312D3933
          35662D623737313737653033373431222073744576743A7768656E3D22323031
          392D30382D32325431353A33343A34362D30333A3030222073744576743A736F
          6674776172654167656E743D2241646F62652050686F746F73686F7020434320
          32303139202857696E646F777329222F3E203C7264663A6C692073744576743A
          616374696F6E3D227361766564222073744576743A696E7374616E636549443D
          22786D702E6969643A61363234663237612D396431632D386134652D62316530
          2D323530383265316461633566222073744576743A7768656E3D22323031392D
          30382D32325431353A33343A34362D30333A3030222073744576743A736F6674
          776172654167656E743D2241646F62652050686F746F73686F70204343203230
          3139202857696E646F777329222073744576743A6368616E6765643D222F222F
          3E203C2F7264663A5365713E203C2F786D704D4D3A486973746F72793E203C70
          686F746F73686F703A446F63756D656E74416E636573746F72733E203C726466
          3A4261673E203C7264663A6C693E61646F62653A646F6369643A70686F746F73
          686F703A33393134636239322D383065302D316434662D396435342D64393966
          34666534326534313C2F7264663A6C693E203C7264663A6C693E61646F62653A
          646F6369643A70686F746F73686F703A35633437653336322D376534362D6566
          34382D393739372D3965346161636666356264633C2F7264663A6C693E203C72
          64663A6C693E61646F62653A646F6369643A70686F746F73686F703A39326561
          636234312D303632612D653634652D623439652D393564373636626435666438
          3C2F7264663A6C693E203C7264663A6C693E786D702E6469643A316638393532
          65622D626139622D353434332D623439382D3562343262616466336437323C2F
          7264663A6C693E203C2F7264663A4261673E203C2F70686F746F73686F703A44
          6F63756D656E74416E636573746F72733E203C2F7264663A4465736372697074
          696F6E3E203C2F7264663A5244463E203C2F783A786D706D6574613E203C3F78
          7061636B657420656E643D2272223F3E54FE957A000041104944415478DACDBD
          079C5C65D9367E9D7EA6CF6CAFE96149422A21219D4E40A902110B0808A288A2
          28E02B4D05B10022F2BE6201EB8B05B1222FD211294284F4EC269BDDCDF6DD99
          9DDE4EFFDFCF9999ECA44092D7FFF7FDBEE537EC66F6CC39CFF5DCEDBA9FE77E
          EEE50008E5974C2F855EAAFBE2791EB2C2C371786845BEFC7BF6C5D18B2F7F46
          2CFF5C798F07C7CB1E5E50A78602CD3314A1A50EF02E08873A56873CF3549B17
          5FCD693B372672EF8C5A666AC4D29303F9C268BC504C3A8EADD1E74D7A59E5FB
          D998FCE2CADF1D7A69BCEA2DF23C5734B5620196C5AE37AA5E0E0EF8E2AA06CB
          007AE8E505C7C9172D5EB47AC3CCE96B629A66FEB56FF88DA7776EDB6D1A46E5
          E1DC3E6082A4B6797DF575BCE85F5E135C7042409955EB58C1A0644F0D4B52BD
          E24808C91C3D40A3DB2AD01C07391A57C6341C5BB0ADB4CDF54C14A5E1AD39A3
          EFB544FCED31CB4E76E7F3E3A6A1E5F69BBCD2E00B27CF9D3BE313F38E3DCDAB
          FAEDCDD9EC3FEF7FFEF93F27D2A95C19A079C0E4EC03C9004A65097AD94BF1F8
          D4C797CE79F0FD419C0453C533BEE92FAC7FEAF16FC03285C6703012B29CC8FB
          E6CFEB98671617D4E4932D6D2A1F0E93D86B1D31A40B0E321CBD3407966DC1CF
          73F00A22784984240B30F245E46C1B4902AAF202EA0401A2581254D1B4F359DB
          2A6C2CE437F759EAEE42A4517BB2737B57D43493FED636B5A6A9C9FFA570CD79
          E7A5FB4E712C1B5AFBACBE53DED8F4FEB7BA76F694C1198703C900FAD82BE00F
          45FEB47AEE7717DB586AEA4574D74ED9F57077CF0BC758685B3F7BCA71E178B4
          CD676BEC73106C9EEEEC9056DB348D254D71485A2429646C0E4149829777207B
          BD50640F728904B21C495237E86122828A02CE36C0B38F9285B0FFD88D1DDE24
          C98B48717231E1F50E8F0643A2346BE194FABE2E4C8BF683541598366360FD2B
          9BCEDDDCBBA7EB4840CA6555F5B3572418AE7F7CE582FBE7E7B384D34651149D
          74D1E022240191001802EF02E16840ECFF0EE7EC7743F6552049252C13610692
          C07A020128AA80D4441205BA2A5D2CC247BFF38B7CD9D8CAF7703802C7813D97
          A3FB72F46F999EABD90EC68B0682613F3C02FDBE508067FABC9EB3DFD874C1DB
          BDDD7BCAB66C94BFBF2B48EF24C850C3E3272EBC7F6E36B5909E8122A9543C9B
          435095A1D2009C834CFBE09B16686069D3267B14A1D2003DC10064FA7C3A9624
          BB0452BA068F28C0CF26ECBD6FE74AD9FD0C492FE8F3C24312B7F502E4A9737A
          CF7E73F305EFF4EEE92E4B507B374972FB1CCE24C8C6DF2C9F7FDFFC7C66A149
          880A349078BE80882C11C8C30F8ADD507355D6267515A1D0CF9E7010227D3E4B
          208B16FDCED021D37D03E29181D41948FA4C4051092449D2284298724CDFB91B
          B73349EE3E1290DE32D0007B8503A1865F2F9B77DFA27C6E81CED9C8F14CBD74
          0229BB2EF84840EAAE17B55D102249D5531B714116A22914083CB359E66F8292
          7044F72BDA6C620CD786557AC33175706DB3FACE7F7B0781DCF3AE206BEBEAF7
          03E92B4B9281ACFFF50973EF5D54C82DD4C92EB20432478E22224AAE6E97BE98
          3572EEFF4BB099FD4CC623937E4E12382FD90F7B8F815468920AD124F28649EA
          4CD2256715A0F06296AF77F68D50A07BD1BFCA36C94CA640BF496B2449598187
          3DD232C0B5CCECBB6053E7BB4AB27DEA745CFBD99BF681F455AB6B2810AAFBF5
          9239F72DD4738B4CB2C10C7DAE60580890A390CB00C92B8023B57348D21EFAB7
          207AA093938E8B2206EC0206B2E438641BEB69A03C0B25752DD042144A862650
          D05378D9F40E264C7EB45532F4102F882DA254E3B3B490CA59F5263DA5689A14
          5A4CF03A455895A7CF18C813B0802893B7A66924D5E5DB67F59EFFCE8E6A90FB
          1C4F4BDB145C73FD17100C85F681F497D5D50D216493B5BF597AEC778E2BE417
          3390599AF1BC692148F1CEC3392E09D2C9BD8B6CEA7D8AB33DD0F27A9F47E8EF
          71B8C19E6822E99B3663D9B4E3579C3BBBF31D9CF9CA4B303CE430C2F5301B22
          D007C7E1CB99B87664FC5B8F8D471F26DDE00244936A793E30B3BEB6E984FA9A
          65EBE5E2FA06C15A269B12EF3845588E0C8A9FD0C85BFB05193E72848EA5816F
          9BD977E13B5DE76DECD90FA4DD3E6D06AEBEEEF3F0783CB0499BAA255901E909
          0543E1C78F3FEEC1E38A99A5165357029365718DBCA122918D5912C5B114010E
          E02F2D1D0FDDF8D22BDF488D0F0BE57B08977DFCFA2BCFBE64C38D752FFD1EB3
          9FFE0B8A6105CD4A1DACF616A4877AE18967F1B0E5BBF7F67FBDF54DA265AE76
          9775DEA589674E9BBEECFB2DA10755539F92230DB1288EE62C9DBE3B0810482F
          19B343FF165A67F75EB069E73904B2BBACA106A9A8CD007A7D7EE8E4C1059A10
          2E100C718E6D07357A83685B8EC5BFA03F28FC70DECC274F169DD3749AC11CF3
          946447AAC8BBEA1234051A5516E9690BB75EB273D7F93B77EFCADA8EED2705F6
          D9B6E56F9B326D6AFB8C39332EB272675C9A8AAED302A4015E9A559A61A7B717
          46620C8F5ADE6FDEFAF6F66FD14359A02485212B741C464AD8CBFAC1A2790F5F
          16902F886916F2646A44FF5C1401813CBC3B2D342F4DD3775DDAB5F79C2DC303
          FD1EC5E3101673C3655739ED53A639F97C8E081A2314F44542E348A4415D2BDA
          A66966E6474258D5DE5EFB3ED97A65B12CCD3149454C7A409E66D19678BA4698
          98908BB9BDA87DE13FF70C3CB4331BEF96089C6118445DE0B74C2B488EA24190
          E5C63B66B47CF88A906FAD4ECEC71F56C1B5CF44B16F0002B19EC7D2FAC39FDF
          DA751B31A57D419C7202A1B6BE3E4032152316667FA1E398DF76A85AAD90D748
          7B7428CC91D1444B64368C0B27D5C0E047BBA367EF49A676916A725EAFCF543D
          1E47104467FEA2E39D858B977241229C15750D325D0EC852E6CE554BE008DC8A
          153AF7DA5C3B0F5EB0B0D5F20FFE7E2CFDAB4E3DBDF9B5F1F88B498DA6097C9E
          14DE2AAB788516B210A446EA9BD62D5CBDF2FE9B127BB88505075A5042AD4A97
          CD3A06C69E3DE461E3E89794D133DF78E7143283A1B2BAB217E7F5F91485469A
          CC6472F54D4D274D6F6FDBE0D1356E5E307449ADA849A716342C2609197C1169
          A52D7AFA964DA77447A35D2839F68ADA33FB7498F359BE6AED3E965FC32E5015
          39F9BE554BC9DEF8E3EB8BC6AD4B72055D1125E517C9C4A3CF77F7FC953ECE97
          EDC62ADF8CC3FEE43EC4EC3218A95D76E2DA750FDD9CE8C5B1451A50484144F5
          82EF988B427717B4F1388639217DDA9B5B5691190C60FF34A992C6492CDBA337
          6C515184A629333F1A696BBB6641263BB0CE88DBA62438FD76F0EFDFEFDAF22B
          9A904C19582555B3AB428953A1758DEC21A4BDE3B297F90E4E25156E370A854C
          39F654E275653076D580E432487F19A4BF63E1E22F1F3365DAD95F4EEE45ABAE
          D3BB2AFC0AD1F1B9C721DFD30563781C51C7D1D7BDB96379DAB47AABEE5BC925
          2B9359491E644162DE06BC2590516A5A351117AA3EAF1F02E83E90D3C1E22D30
          58FE202336B3CB1FD2CABFD3AA6E52B9C181E49E810C2E3FE5B4DFB47BFDCD77
          2407113472908244AA3D0472CE71289077D57AFBC99198FADA7F759F38A11BBD
          E5FBEA9824D79544BEE28894F24BAE028FAAB051F97CB13CCE0A50AB02927DF8
          387A65E9D557FE3053BD596570F9F24BAF7A55745F287FBE628F2152B1E092B5
          27FF7496CF37EDCEC4103C1611E9A00FAAD70781D4558F0E23BF6B378D8C37CF
          DB337EEAB6D1B12DE5816A0780ACCE732BE6A05481E4CBD757C694AF02A95769
          865D21E74BBD5E2F0D50F0330EC3B9048D3E406C4EE0459313F86C3A95ECB72D
          AB503553F6A140525C0A2F5977DA4F167A85A9372746E121BE891A1F71542F9C
          6367C2486791DFBA098EE8C74D89FC95BFD9BAFD89AAC19A5520A5AA7BBB2485
          CCC9E30F04DA29D4888EED30F3A2C1722CFCE47941285A96399249A7E3551A68
          5640CA7E9FF7E2A6BA9A2BE8E2E3195D8363B3548E2C80B758A021F6D61D4F65
          EE49C4E3CF62FFE4F450920C2D5E77EA4F567AC4A99F4D8D40316CF0355EA284
          44FE8E9D05ABA023F7F64692850777248A5F7874EBB61F97B542AB02596D06BE
          F2BD1502B83012F45EA7280A055C0A392C9375D830059B0D9718E6EB13A9ECDD
          B1447C3326F34B9BA3F8E20D78D49BEB42BE5B0DCBA00911CB6B4370D9021105
          E2910E1239EDC67432F170594D2A9EF0409041A6AE0BD79DF4C8FB1469EA55E9
          11500482521B804A4CC59935D35D1F4BBEFA2A652422EE9B301FB86FFBF6AF95
          9D8D56BE6FC54F54EEEB1745316213185996CE6A8EF86E55299BB1E9D10C2049
          D41D271BB342BC399ACE5E3C369178B2CA515ADC868B2FEE4846C7768C8E0EF3
          EC425592A1531C624A2B50F6E1106765D33B144B7D369998F845F9C3D5344CA9
          9A712649CF71EBD6FEF823B234ED92F428293E0F5F8D9F08BC086EFA2C88649B
          89175F80AC70F8D198F9DB5B3B775E5FBE4FB17CDF0A48B57CDFA0A2AAB52D53
          A69DABE773C70544EB2499DD4B544B20E92552CE6AD2385581D707C663178CC6
          265EAE92A4C55DFED1CB3AF2A964673C3AE6D2A00A48A6C80225C89C438C876E
          D4B577F89A91B1D127CB83A80659512B36EB62CB94A9174F5BB4F033976433F2
          078A31E20B84BE86724992B90B325C83C4DF9E81A4DAF8E5A8F6D48D5DBBAFAD
          0259713CD5F6182049F9D69C71F6EFF3A97880CFA5A152E2CC314E4A890323E0
          1265474C4022C7E777F4F49E313836B6B5CAEB5ADC55975DD6514CC43BC7A2E3
          30D885E2A4BA8AA4BAA4FAB0495D3BFB063E3D121D7BBA0CB23218F180013933
          3BE67C6AFAC2251FFE486C0467E487E842019EFA16BA40833D653AB8A676E4FE
          FAA43B35BF8E269EFBDCCEFE6BCBF7A878C40AC8CAE4C90DCD2D67CE5B7AC2CD
          D9E8B857D5F3204A0437B720906CAC1590646AF9CE3D3D8706592090E3FB812C
          698D481F362803E7491A9D7D839F2790CF97EDD0C6FE2B7D9541F1B58D8D2747
          9A5A56DD20DA1D17296603B96628913A283C319FF62990DAA623F7E49364D816
          FE9C29FCFDEA2DBB3F81494A661E00D2555959559B4E5C73D24346365327123F
          612B0CA09C92B1837F036449504C25283376D3F69D3D7B6F1F8DC55E2A0FC8C1
          24AD73E3163DC84394D3CF6CC41404E3BB33DB3E77BECC2DD7E90A6F6D3D58DE
          62B6B5419DD181F41FFF08C7D0B03B5CD7FD15D17BEFD64D9BB75ABA5E2C168A
          59AD50200DB42B218449D2437C76CA096BD63D504C246A252D077A0EE598A535
          897701B9A53C61EE82F321419AF49D2D6D8804D2B47517CED65D3D774E2493AF
          B019565555699B3EADAEA6B62E28C9B2D83A7DEAECE3162F9917A9AB0D5A3C47
          B2B3B9137FFDF3D6A6C1C1105BC8F1D6D6412247A63735C13B671EE2BF7F0266
          210F93B292CECF7DC61E33F18E93D7B55C3C13EF1BDCD5B573E396D7B542918F
          C76246E7D6AD236D33665E3FF3B8E33E3CD1D707AFA9B9A0B8B2E77F0F90FB62
          2FF7F1CB2F2790090239360992E5614CF778C1B5494DD358E2FCAB15A7AF37BC
          91808FD297DA63E62F58425E4E12C905930C553621CC09147413FAF82816FCE0
          BBF00D0C83F74A0890B3715383FA06A80B1721F9FBDFC1C8539618AEC53B9FBC
          0E02E5995E72721EE2B7053B07DB1135DBB4AD5C26A3E753A922F9D09022AB9E
          671EFF1DBADE7815617F90AE81AB4C165B0BA631DB0CA428E577EEEE3E73707C
          BC2249974571577EF4F28E6C62A2334A0363B1681F48C67B040A8974B76C2E85
          B9AB56E08A9B6F8596CD90F7A5449A723C532B2047FF8EC62690A5577C6202C9
          8C065F6C1C9F1EED46239173CA32D110AA4391F18A483DE4139622FBC41F60E6
          B3C888BC734351F98ED63E65EAAC8EE9A7F80211BB3614E4EA9B9BF8502412F6
          F87CEEE2175119DDE70FF07F78E411EDADFF79D21BF4F9399B4213A5A9EEC456
          E2242F49855D3DBD670F8E8EBDBD1FC80D175FC2E264E7D060FF3E906C0FC3DD
          09A23869918BC9D2808E396139CEBBEA931827721D1F1D462E93403A9571C30B
          0B3532BDE2C90452F902A691F4BF941F470D7DD8A1A01F26499A1C3D9324A72E
          5F86FC1FFF8C6C3A0987D4EC9C7F755EB22DAFBDEA0DF8C394706BB5B53542BE
          50D05B5BDBCE6F9B367D99204B856C36FBBACFE70BEDDCB4C98B62E6B6A0DF2B
          396414C470687CA60B92C5498AC57A2C96B8786462E2C5B2BA96405E4464203E
          3AD23938D0E71A33533BC328797289B270366339B29F9AA93371FC69E7209ECB
          4020097A68227CA4CEAE05B2B5550239323E82682A850E8AAD5FCE8C4224CF2C
          93BBF7456A68C6C93CC275904F5C06EDC9BF22198BC1EF5571DE969E2BDE48A4
          FE5C766206D91747CFE7CB5E96795896DDD4B19F659F6F6D63C47F175B3524B6
          E86E2D3815C1944CCD4825321B4626E967C9262FDA7049476C74B873686FDFBE
          0F307575BD2BCFF62578B0F5125F5D134E5C7F218D422C39589A39D12C42A2C1
          336AC5D64747A2A3489284E6DA06EE2090BA63C027F989D645C091C3B0823590
          572C83F9F4DF101F1F438DAAE2AC77767DE48D4CEEC9325DACAC9B56626F750A
          27293EDFEAA6B0FFEB3E45220DE226194F19244F2093F1D486B178E2992A3E4C
          92BCE8A28E0952D76126497736245792CC26799177F3119D72548DE3B7374E9D
          1D9D36F3D893BCB59463AB1E9232499C1213D5A007EA458C8CF52343EABA8CDE
          BF29394C76E8C043D9871C0E52ACA589238721AD5E0DFDB967911C1961290B2E
          EF1DBFE6C9E1D15F57F1D76A4EECAEEAD35802AAC7DB1C09D77C5C71B4F34485
          AD16F2E00960C526ED9203D21389CC45A313F117AA1209933BFFDCF33B9213E3
          9DC3437D654F25BB6019489691F0C42A0CD3C678327B4B2E97FBC5EC39F36E6F
          9D35FB0314F0EBD440188E22BB262E52DC8B4D90BD4E64718696C475B928794A
          16E4BCF050D26C9001B10D1F7EE5A9C8FEFD45148607E1212DF99EA17EE5EE37
          DFFC0EF65F01AF06E9A740195E78C2F21FA663B125B9187DCEE325F194D6EF19
          3846FAD9D8658E331299FCF9A3138917CB9355E2AEEBCF5CDF313E3CD8393A32
          E82EF953D8836994080D47EE8BA70FB325FC7441FF52369B795420A30D466A66
          35B4B67DA46DC6AC8FD7B634F36A88D91C4731D5462E9DC3497BB7E34304B848
          2054AF075E0269D164F1AA0461C5A928BEF632328303C4E839FCC450BF77CB5B
          1BEF64BB1B5520AB9755BCE46523CBD79DFCECE8DEDEBAE4701FF90A1936F307
          28ED85F2140598891107722C5EB8271A4FDE4EDA28EE4BB5D69F7166C7F8C810
          4972D0DD9263EA5A0A2134996493604E88D4216F599FA5C4F95136BB4CCA1478
          8DB669D3AEAC6F69FE202FAA7CEBB11D8B247FADC03CE6D97BDEC6197B76BA5B
          7EAADFCB7675C176861D4580B8FC6418FF7A1DC9BD7B89EAD9F8A3EDFDF575AF
          6DA44CC4A9AC0E986590FB963D148FEA27902F8CF4F7B74D0CF4C0AB78DD8977
          F7F69D72AAC57C040D5990D5FF1C9D98F8B4AE69122A2B0367AD3F6B4E7C7C74
          C7D0C010F912D26F9EE9B7E3AA2B334755121DDDD0D932C1951313E3BF29AB90
          5B48C1B93301956633B464CDEAC76BEBA74C531B1AA50F8FEEC6DAE11E14C821
          7818488A771CDDDB5228B62D3D09F6E68D48ECED814436FB775379F943AFBFBD
          81406A55E9D63EF24FCF907C81A077E9AAB55BC6468623633DBBE193993FE0DC
          0D21B62E2C8952D165A112A7EB96733E251B2F94A9A1CB41B81357AE6AD60BB9
          7B928914C7628DBBCBEB30BBE68D6221FF07CBD035F2B0765E2BBE93CBE72AC5
          0A42953AF9D99287ACC83573E72DFA66B0B56DF1A753A35859482047F7F291AA
          7AC92EC9D0E1D054F34B57C0EEDC8E64772F24C1C0E682D075F6C62DA7A0B49E
          54ACCA442A05112281548E99B7E03F4C43AF65319A2D7AC894901A864E5A2BE4
          69887F29168B9AAACAC58256DC9D4824E3E57B9456EB38325A868CA7FFB8CA5E
          38434FFF70F5DA712A6BAC0226BFAA093473F16C71DA5F53DFB86AFEF213BE71
          4B26C62FA694284B1F0B906725AE0B9755B00DDCE31703BDBDC874F591C328A0
          B3E00C9CFAAF9DAB515A882A94635B7585095906A9049C2C33279E7999D21773
          FC96EB744C53265AA7574D4EA54AC5257F951BC9D8FFAB926554FF5C9D795424
          B9DF522405FED635EB4EFAE5AD7A4AE8D0B2EEA88304526120D92A3101E5172D
          8043EC2ABDBB1F8253C06E0D83A76DDA7532DBA2C0E4D2A755F57CAEEA3B7F14
          E3DCB7B75BB9C1811F060EDE50AE003C680DA60CD257DFD67AF6CAF90B6FFA52
          36CA4F21A2C0461C8884C87328AE17B4D9A2D69C632010B78DEFE9076FE41113
          BCD10BF78C9CDF3B3AB2B7ACAEC52A691E6E13FADDC6B9DF17770437A9BEB632
          9B95F5D0CAEE3403291FB77AD5F7E6876B177E313E884672960552F910932481
          64DB6E6CD9CF9CD206291327EF3A4AF4304F24DD97DAB037FAD12D837BB761FF
          85ECEA95F02301FB9E033FD2AF8A23A80ED495E5426693CAFC156BEE591BF22E
          FD4C6AD8FD05112DA2747E4AED65D72459ED80160A43281A4851D623529662F1
          8AF1C564FAAEC7B77713EB71ED3F87FD57C2F72DF7FF9F04592DC1EA55ED7D35
          06EE8BE7C593172FFEEA35127FFC0A16703846356404433E229D14A62DCA1404
          DBDD5AE77919B9440A79234B332660AB210C5EDBD57DFD503AB3AD0CA8E2842A
          A564FF96440F07B202EE50E569FE2AA0CA94C6C6659F6BADFFDC4A5B0F3513ED
          3278B6262AA22E4C14CCCB95B89A05978AB11B6633147BF329B0DABBF18283E7
          1CFDAD8707A25FEF4924769681552FFB5703C5D182E50EF3BB8A27ADAEA2DC57
          B9550629354722B33EDB5AFF9925E03A24D9C10C1F451E8D3E22F3F0D67AA158
          8C8291CA324A4243E6141D792D874242234A2660901280949EC510E7D9F1959E
          919B8733A9AE32A80226C3CAFF5AA2DC7BBC5F9160F5CED2BE7D8912484E9CDD
          D8B4F686E69A4FCE36CCDA1C8D25E891305BF1B889B740598CDF17417CCE09E8
          5C7F26E59C3E4C79F969346D7D8E955721551488AD18E8D3744C50CECA62DE28
          A46D3F4EE7EFFDE7DEFE7F94C7521D3F2BDB134705F4DD400A98743215097A31
          B91DC040721D75F5AB6F696DB9A5CDC97952285564B4A80AA68B3E14F822D4A2
          8DFE732E45F74517A2A96926EA88AC6FEDEBC794A7FE88397FFD09921442C28E
          17034E163D699E15D912E822C66D65EFF726925FD93832F68F7791686571FB88
          807287F8F7A19C4C7531938F3888B2B0BE6EE5A71A6AAF68B30B6DBAC3338AE4
          D6C9319021B24751D3B07DC189D873D94D689FDE8079CDB57433077D710D6F8F
          ECC1FC471EC1F47F3E4DD31740DA2160790139238D222B3864A56EB638766F2C
          75EB3FC7C75E292D2BECA37DD5367A44400F04591D26AA2538E9643888CBEA9B
          4EBDA521F43989CFC996E561159CF04BB27B4150E2DC5A9F943780A73EF125B4
          CE5987996D407B482532CDC32814B071D8407F5717563FF2154C1FE927A97B90
          A23127F514B2B6E2A66D32F1754EF0A6BE9BD36E7BA6B7F79932D06AD5AD6CB2
          DA4703B2BAECFA400996545412BD8B6AEA577DA93EFC79AFA0A9962E536A2610
          40565E26412282EFA5A9F138029E597B3E262EBE14B3030AE64C6B7567C792D8
          EA9A89CEFE24B691D3F13FF524CE7BEA41E4E9FA28C7CA4C79141C1109CB8066
          F2F091840BAA37F6C378EE6BCFF6F63F8952A5C881E1E5B0F6590DB2BAAEBC3A
          4C9462A1247A9636349F74639DEF06D5B164C68E59A96A841258852B15F5B25C
          3D446FE683F5F8EF0F7F01D3E62E414B9D81131ADB501429A965CB6B949DED1A
          4BA33B9A465F671F2E7CEC3E84C6F620CB3C30FD9E91F002A97BCA706019961B
          770A823AFC70B270DB4BBD7DCF960155C24B85FED94702B2122AAA375A5CED43
          29D0CB8B1A9A4EFE4253F8F31147574D5380978079BC4CADD8EE52697B4FA164
          3B4881BFE798B5F8C3864F6059631DA6D58630658A9FC66AB91152A23CB03799
          C7AEE124DE8966B0EA2F3FC549AFFF0F461C1319DE207BA4748C132929B69124
          2AA8EBB63B3949C133FAD078F2965747862A2B71F903ECF3B0202B8EA67A1BAE
          44D738CED35EDBB0E2CEE6962FD5F119AF63518E2811488A6F6C2B9463A1825E
          62C00B31D4065FB21BCFACB8145DA75C80D9CD0ADA7DB59837ADB6B4CF49F6AA
          D0E7BBC763E89FA00C64248FC0BF5EC047FFFA4324EB49A15322F4D4388A342A
          56905414387246367214621491C35E31B8E9ABBBF65C4771B40793851015FB74
          0E07B2526C505DDCCBA4E809D4448EBD63C6B10FCCD3C73D9A49B6274BF0CBA5
          6A49DBD4693074F109AB105B7412A44D6FA0EE9FCFE177E7DE88414A8E173446
          E05778CC6DADA51BA9A4DE1CB49C811D7DC388D93C76F527E0D9BB1957FEFC2E
          C467AE43E6F49568DBB505C9979F81533429C9165DC0264D4C86F25387E79CDD
          083CF5E5AE9D9F2D6A5A1207D406BC17C84AC0AF5653373F842405CF9D3AFD93
          D706F8F7B102BE08498F01E4595E58DE8B802CC05ABA1EC6F02894BE97D12004
          B171E90578F68CB3B170EA2C44BCE440085C24E465DB894810BBC9152DB720F1
          EDEE7E1CFFC64B38FBC51F63D494906A6C44F8B805B0DF7C19563257DAE36089
          322761C26435B2455267D9F97622FFF1BF0DEDFD43597A95D504EB70202B7532
          15350D33C9D64D6F3BEF6B2D4D37B52693F0082A024AB9EA9FEC8AE74A1F6527
          081CB6546F9163911472448ABB76F3B7BA63303CE73828D39A9194232E31B7D8
          F63C91F47036077B6810FEEE9D3867AC1B9CEE204D366B1905B778572432C1B6
          FAD8E2B4C04BEEF6A168783041BF338C096C71224FDCD9D37D7DB1503CA2FCB3
          02B2B23FEFAA29AB2BF404C31DAB16CCBBFD8A6C745A903C5D445669F096EB64
          C055F9AB7285B145CFA0CC110A8D4921157E359DC196D1287A39156FB2156E87
          3910071A0D7A21A55A0BF802E693533A395C4B129210273FC2CED6B8D5CFE5D3
          040E5F7A8E49CFF4D335699ABCA44E13E109C6BE3D347EE59B83232F62723BC0
          3A1CC88A9A561260F1D8A5CBEF59D5507FDAFAC12E8439DEAD5AE699A3A1C11E
          9C8A0BF41B0B01623CECA00B3BD4F25A863C28A5534324F5E7E5009CE606440A
          1C1289388E77063197EC6C2639AA93032249CF2A150EB3957BD735EC6F5EA5D2
          2F0E6C87244B8E884DD4B78646AEFCFBD8C4E3E54B2A76F99E202BA4DBCD0D25
          596E9E73E289779F220A8BD64E0CA28E2E5164B6D0CC9541ED8790B49777CBB4
          FD447D7C0C24D9D0D3058A83A9510AECAD883536E302BF48E146C44F8B1A3CB1
          18666BFD981669C0995E2F89813C28492B6BB07D51E120906CF5D1AD1D6315D3
          04324FC9F77DA3B1EB9F8DC67F8AFDCB63DE1364A00AA4A7BEB9E5CC052B577D
          73C5E8109626C75043AC469558C22B13473DC089B96584C23E904C923EFAF92F
          E92C762729F3AFADC30729719E5EE3219B253E3B013C96E2D032B407919A00CE
          0D795CBBCE3A25678443806424C31458F52049931DB7B035FCD552EE7FA8B3FB
          6BB04CBB0AA4FD5E2083980CFE9EBAC6A65317AD5CF5EDB56343383E99404065
          83A7F9B63DAE13E00E00E9B8ABED9320557AF3D1740A5C52C219AD41B4B707E8
          639C6B344C95FB46A27866280D43E570655D1006B9D03C814C93E7E5F8CA9AF0
          E49740C034D224C91650202F1BB7B3D826353E76C7E6ED379846B1E278DE1324
          5F05D2AD57AD69683879E9AAD5DF3E63642FE664B2F0935B620C0794E973BC73
          904ED8BCBBE54B944E764FDFB003320FA4D34853C0FFE4B41AD435B7D0000D97
          A290BF446EA01FBF246A97A18CE5F6C61A14C98B5A3409515669C20A1EB8FD17
          0FDD63136C7998ECB6404F4F5286D32F055FFBC2D6CE0F170C7D02FB9792BE2B
          C8F0FE201B4F59BA62C537CE1DEEC3B45C017EAFE3EEE93369B0E71F04D2B517
          0A0D94897858490B79C7AFC593E823E95C4512680D8420533C6517160A1662D9
          147EC74E07F022BE1D0C922A52F8A00C2546B1989D07E10F5A21E5CAA74F2C37
          5EA4C83B8F889E2D376CDF7561CE30C68F1464A40AA42F52DFB06AD9892BEEBD
          68A8172D5A013E0F39148E773757F843E4D976596F19482FDB4321F5FB11859D
          448D1FAB88930626525074CB55698378479118D026BA36371AC32744091ED171
          4FFD248C92EF782F901A493545B63BCE2BBBAFDFBEFB7D59D3183D1A90FEB244
          FDF3972EFBE694E6E6551B06BA516B1269F60808DAACB499058B8341B273223C
          67BBC708D94CB170F04B52DD0471D5451D3310C86721A70D0AEE45987E2FD23E
          157B876310A3095C42B1B54660DED526EF6A959EE11CF00CA7B417C9A653A349
          4C6A26920E3F7C6D67CF6919D31C3C529035FB407208AC5877EA6FEAFCBEE60D
          83BB112626E2550544C8F875DE760B020FBE09D92A39A4103B2AC86C8624FE5B
          41468F938357F12142E1C352FCC45AC8FD6B4564D31A7954526FC1C415A68A3A
          B2C91CD97A41B390730BD50E5EB0109883A36B988749EA94B198885DDDD57B32
          3125B6F2CE62A47E1420B9E0F27527FFBCC9EB9F7AE95017714576065271D590
          1D03E50E502536C796E3A689EE592E85ED435202BD9922F7BF7C45D4D92A25BF
          CC967908A6E56EFA6429BB88D2985A69624E656ACC7C1ADD204B83D7DC1352FB
          5BBDBB3FE13A24871D1A2649922776B8F16B3AF79C9231AD4AA1FE6141D69641
          8668306102F9B3268F6FCA07873A09A4B51F481CA04A159032A523411AA84AAC
          47F1C870C8E1E844E76A75CA58540F1CCA460C9A30DEE4DCE3489A5174B7EA2D
          B243ADA0C3243B4E59CCE66CD7C31E0E64C626905D7B4E4D9B56FF5183E409E4
          3202D942202F390290259BE4DCD0E1E5D912A417AA57A18192123B12A4A63AE8
          14F05988E1733A49B304CCCE676858A6EBCC8AB92C328522D204879DBB64A1E2
          A08172A585E90AC882C365AFEB1D5C3B96CBEF396A9082284696AF594720BDED
          1793BA7A0E0079A0BA9666998787D454256986C2E570C1CAC07C4402A6365330
          279B624E85C00814361CB26D339B8546AC4824DB35323924893C14488D8B87E0
          C607824C1048A20DD6E786A22BFBE2FB56DC8F429204F24402D9AA7ADB2F1A3E
          18E481922CEDCE92AAD2ED459947B0264C593C715956411208436E6D044FF3AC
          991AF842C12D4D71EB837279148968507C82194B22934CBB67A5D9E1519B3F3C
          487281E617C7E26BBAC663DB8F1A2493E43202D9E651DB2F1EEE264762B86996
          972EB5B9438364842740EF2BF43D5457C3B686DDBA039124A9B436B9555D28E4
          61EB9A5BA7CA9630ED7C0E662A0FB3290CB37F085A2C8B1C4D52DAD270A8E5E0
          D23B36748E81346172BC79EB44E6A46D432395A2FAFFD3201D02C943A66BC2F5
          11B7DE9CA59D82D707A5AD0916FB4896A4C8823D2B4D61AC8954D7C8B323BB8D
          287676233FC11696C9C39222DA87D8463D14C8DB26B2276D1D1AFEDF836C2190
          1B08A44A20C3EF05B2548441E457A054CA41B0360C49965CD6C37B4A206D566D
          99CEC3215574630D5B5E2090E47720B435A3B8791BB2C9ACABAE297A8673D0F1
          F7FF27403A0839B2BB0DE08FB07E02925B42CA51E8706D92E2A79DCEB935A915
          904E2603536275A2F5D0DFDE8C5496950C8898E08C4370AA4383BC7D2277D296
          A1A14A6DEBD1836CF6AAED1F1C3A5290760924A9AC3F42D2F31048163C55956C
          B2D16D896131495AF63E90362B0525C76487290B79F32DA40A59B62A8B28671C
          92F11CD22663D9B5DB8687B71EB5244549AA59BA66CD4F1B554FFB8707764325
          144185353DB0DD5B38DC21E224EB08C16A76487AA1500062C043BE8FBC2B494A
          6A6F62C712C0A5D82247B9CB04715A3316051A9B49B5C3187FE7155859DDADE0
          CA38FA41610AA8546E1077A59F52EC74ACE398D7F50D9F4871B2EBA84132499E
          40926CF4F8DA3F34B80B1E36700692629B7D0822E082A4F7DDAA259A07BF9F24
          19F2BA15581C5BB96B6F24B024D954CE0D1FAC6E9C85106B220E4C9B46C35690
          7CF36598391359723CE473DD22E18340BA6B6624C97208C9D9487D6ACFC0DA58
          B178E0D1C4C383E40521BC6CCD4904D23F65C3F02EF8C88E2244C958D26C1F22
          D12A771880423FF8E815F078E00DFBC1B1E3C1144A98244556E212CFBA15592C
          EF64A7DAB5581CF69CD9EEFC675E7B0906458E24812CB8EA7A00E1E0AA24E954
          681DA2D774F69C44047DE048411E4CD03D81A9178FEC22E99888907AF958A103
          3B57CD972817C724422A6A71A55526E67402EC348FAC2050132C974B092E4889
          6CD3496459F994BBB22051AE994D2481E33A202535A4DEF83B0A746D929D1629
          2FAFF0E5825DA7741AB6BC0ACAB82D5F22E8C45DAFEDDA7372DA3C7A90A132C8
          5F34FAFC532F26C7E367719240B2BE3AB6233274AE7A9A92BB0F4761C3041B96
          C48EC78373B7F0FC7525902CB350DA9B217AC9464992865BBC6F13C57390234A
          C7CF9F0B61288AF8DB6F903D2A48309D6075B1366BAA4280E9255182CC560339
          AEB479A53B25754D3BFCE8B52C0B2949D23C129095A4D925E8CBD79DF2F390DF
          3FF58383EC4480465984C88ED3D1330C883A197EB0069BBF7825865EDF82554F
          3E8D76FA3DEB4710A0417829B5F237FA4B0B52EC305A732379512F0492A4C95A
          64B0E49B11B404A9EB92D5D0BADE41A6733B513F1F86BC3A3CA68E58D1C19FD6
          AEC2CC734FC7D27BBF0BEF4416ACE691694181B5DB20EF9A863874EDCE6E4A9A
          ADC1A301E9AED695B3905F32901B867AD04449AEAAF26E1AC54E04C89A8DD199
          53B1FDD1FBB0E5B55DD8FBF9BBF1753F2BAC2D20E808AEA3AA8BD4B9B5AD8C84
          AA4DF534753E08C91C73FBEE3234091226C54969E92A14DF7811C9C1211448E1
          B3420EAAEDC74DC46B3D5FB8196B2EBF00D3AFBA026D6F6F022707AA401AAC19
          51FF2777EC3E23639A43470A32847D470385D009EB4E7A2CE8F74DBD78B80F2D
          C5023C2A4B34898F92B4D4BC89AE8E76747FFF01143A13B8FFDA5B708398C625
          0A5B9931C9CB5A08866B49FA0AABFE865C5F0BAE8EC24AB2E08E42209B3309A5
          4E144F59BA0C85FFF93352A4CA79C9713B2C3DA7D5E03FD236AEFDDECDA85977
          2C66DF700FA66FDCE896CB301FC0FA1D24C94B2538CFEEEB76EC3EFB80359EC3
          2E4956F64102CB4F3EF58980DFD77AE1F05EB41672F02BAEDB75B73D1CC3C6DE
          63A661D777EF4360248EBB6EBC1B81D1617CDF27A145D2A168AC638B077EA274
          AC1659AC8B806BA06CA40292A76899676B35F4E0458B5178F20FC8A675E88289
          612214B7D02F3A0335B8F9ABB7C0BB6C161A6EBC11B3DFDC0C8EB599223D60AB
          E7493D8F09D1BBF3FA6DDDE710C8B123055959416712F5B64C9DFEC1798B167D
          E182A15E029925901C22AC9B91C3F242033B96CC47F2AE7BE19134BCB1BD1B7F
          BEE347F8606A37AE5124B2298A8D3E13FE70B854801F09816F8C40CC145D3515
          D9460E25CF06B12867F66CE84FFF95D80E49972FE277B607F773415C78C727B0
          6CC972E40312020476C9336F41F750F6428ECF9524811C97BC5B3EBBADFBFC9C
          A1478F04E4412BE891BAFAB54B57AF7BE0BCC11E4C2B26A1C8226A39DE4D9905
          5DC7ABEF3F0DC12FDCE29E09E92547F1A73BBF8FCC73AFE007211153D8369BCC
          887A84428E40F6EC83D856471907390F8BBCAD2D412F8CC1ACEB8048ECA1F0C2
          DF91244BCA4B16AE8E533E397F313EF29DEB50AB84514BB4AFF7BFBE87D37EF6
          184C956DE2D2EF0D8E5E1AFA14F5952F6ED9C51697E3788F766E0782F45640D6
          34349EBA64C5EA7BCF1EE9C331790652408D0B92DC3A79CC173F7F39165E7A0D
          06477AC9EB29F8F343BFC48B3FF913BED5ECE01C76F69852AD603DE58974ADA2
          7A298C3440A38499ADEFB055043345933F6B01CC6C0C9937FFE59E2C7A85C07F
          3AEE60E6FA95B8EACE4F42A7BC7245F3B178E6A92770D2DD0FC2A353C8217291
          2538199AD86ED5F3FC2D5BBA2E2FEA7AB24A9247B4E1530259DF70CAE2556BEE
          3B6DB41FF33271780924098906C9A33B1CC06FCF5A874F5CF579EC480F201CAA
          C51FFFEB31FCF1074FE2BC4816F78982BB8AE0AD0FB9815C9454A8539A619006
          F07A690B518BC7212E5A06A37B2772143E58FCFC46C18B87B30E569FB7069FB8
          ED7AF419099CAAB6E381FFFE25CEFCCB9F707C34EAD6E631496649923B7CBEBF
          DCBAA9F36A5DD7B3FF2B90A4AE272F59BDF6FE35D1412C494EC04B361910899F
          9A0236B5D4E1D1E9C760D69C39987ADA0998DB320BBFFDCFC7F0C40F7E8336E2
          073FF71A984134DA5B575B3AB1CA56F0A6B4BAF9258ABA7B02369FCA805BB004
          DC168A9183BD182782FFF19C17EF9826D6BD7F3DBE78D7E7F0DA582FB27F7F07
          AF6EDD8E2B7ABAB0BA6F00BAC81340562CA16193CFFFDB3B37775D67E85A7539
          DA116FDD79237575272F5AB5F6FE551343589E88B97B93AC6B996CDAE88FD4E0
          91E52B306A14B1F4A2D370F1E27578F0DE47F1CC634F40B4147C4B4CE1FD7281
          487A0D548FE2B221B5ADA594621535F73853D1B0DCDE3CD8BC19C9B111BC632B
          B826EF419637B074FD99F8DAD73E83E749CA2FFDE677D0151537BCB911734686
          884C482449077902F986C7FFB3AF6FEDFA9CA56B956DBB2302E9AD92E4290BD7
          ACBB7F596C08274F0C5360175143B6271219E0C9769E9837175BDADBD0F1D1F7
          E3D2A98BC9DDDF8FCDCFFE13C97C069F22FA778B1A05E709BA0DF918E9541BEB
          598B1888799D353622BAA6C0AEF5C1D8DC053319C5238E1F776565A8610F661D
          3F0FDFB9E7CBF847722F5EFDF51398B57B08176DDB44792DB93D5E72F741744A
          1AFE684BDF7EB86BF79DB04CEE6824B90F646D63E3A9F357ACBEEFF8F8084E89
          8D80A7401FA1813155136C562822E0A7C71F036BFD59D8B0E64C7CE9B6FBD0B3
          B31B99540AC713E1FA9158845F95DD30C2CE5279EAEB21500A66E68AEE613781
          57A0D7795078731BCC6206B7983EFC8EED89849A51D35E8307BF712B9EDBBD11
          B1279EC1556FFC033265268C07B3B33669C3844EF7FC79D6B8EDB1DEFE7BC90E
          D886E68127100E09B27A3B5D2590A7CD5FB9E63BF3E3A338233AE236BA8C90AA
          70EEFA8BED26D28F2E588C4D0D6D58BA742E9E7AE235A4C613B0F21A94DC287E
          45E160AA6C20505BEBDAA25C530399E2A5912B1028C61048921E622FDBBA3051
          28E2C356007B88C4D779DAC0A916DEFFF1F5E87B672B1A4727F0B11DAF40719B
          36513E4B1E3ECDD66F69900F0C453FFDB768FCC7286D4D1F516144A5A59BDB63
          A3AEB1E9F4E356AE7E604E6A1C67129BF1509EC7F6393894733D1AF83373E7E0
          F7940F3AA329F46EEEA378E88753A05C8FECF8BB447BDE27E469B66ADDE5492B
          E883A7AE061C01B2523A34F2D0422A89C2E05EFCB3087C4CF781272A18F00650
          A0896A5A1221EF5C83958383B86CE33662478E9BBDB07CD6952499C0FDFDA3D7
          3D37917AE400903814D0EA966E954A2CA596E2E4FC556B1E3C269DC459637BE1
          A787B0CE7F6C47593219EFD6311688E0F963A7E3B99D590CB2DD6802C10E3047
          E3E3B8D288E23655834AD7F03E99C83511F49608E48209235E40B1310CA96F08
          1AD9FBF73519DFA0B98DD435B9854F762C479FC9E203F3A66375F71ECC9A98A0
          D041EE8B9DEA233C69D37049C97D83639F7C3E96FC294A9564D592740E045B4D
          D02B652E526D43C3E90B57AF7DA03599C279517604D041032BD061ED322813E0
          D852884536E6D1717BD28737E5200D92A5A21EC428D01F4FB1F5C734D0904212
          AB55E1A134CA9E4A249D78692E9EA39CC7076E7004C5780C9FCA7BF1AC2F8470
          98268153114F0E6156218F070206BC063B5261B9F57BBCC316C064C474B6862E
          5B5F1B1FFDD82BA3D13F97C75F01592958B2AB015740D661B2AE4EF578BDB3E7
          AE5CF9AD634473EA86812138940134D27C2944E32CCE4B400DB7779DC46BF855
          DE8F873806B21E92A0226166513336809F2B054CF72A44EF02E4510508CD4128
          ACB42C4D29965786393E8EC1641A57D3E7BB6AEB4955FD2E900469C207AC3C6E
          A4CC86C9CC29AFF7987C691F66824297898076CFC8F895AF8F469FAD025929DB
          3EB0D8775FFBA866EC5FE3EACC5E72FC1DCB9BA79E7171EF4EA8828E902C5308
          299D083744D34D7E19C8372D0FAED7FC88D4B7D32CC9C45E280E921DDF27A571
          BA4ACC27447920ABBF23AAE7B5441469A2D8D1793395C6AB390D1F2F84603635
          C2C39C9165602236815BB9242E12B2EE3EA6C55605288E726E318F85384D8025
          0570D7D0E8E5AF8D8CBD5405B2F2320E00EA548A07679625597961F6C2C55F9C
          DDD6B8766D7C589995E7F95AD1A04C440747122CB20D1B7696986CA5CF652B44
          C21BA64065ED63E819F1680A9FE1A2B89166C4227AE755D9C938B88B5B6C2DAB
          4883E528BD7A2C93C34D16850DCA5224B237DDC92113CDE221710C0B64FA2C49
          DE760F9398342889EC512DEC340A83038AD8FDD3FEA11FEC1D4FF462F29870A5
          CE4EC301E5DBD53DB22A15CBEE4B94A4105B9159B072F97FD4879A67351A1922
          EB199C48AF0081158B143389058D1183F96C3184895023A921311CA25EA96406
          E76662C463B3944F86E1F59067A670668836A9B94DC19CA682AEB9270D3CE26D
          446D84A44DAA5A34D3E026D2F8A194402B51495327824FE31D1195E413A9E253
          2FC6122FF727127B0DB6B9C5AA16277B09B0EA995CF97BE5C0B6560D52952469
          6D241C59613B366BA129D8B623D3ACB3FA04BDA6B6EE225E101AD5501891C656
          AC4AC7716E81754C32203B646374CF2F1683D8E3AB8337A0C2103C14F427D036
          91C24F02F49D08BA5C53EB6EE559E4B004A6F2943F8E12D3B93A1FC296204D82
          3FE09E4B2EE473A823C7F580924733A3BA42110AEFB3EF8EE67EFCF89EDE3F72
          925857E3F32FE5D8AA16CF1BEE771233C77305D62B4B12C55436937D2E994EEE
          B75AE09E9D0C050357B537D43FA81BBA2888A5E3BE7CA5DF2AA541D9223D8C3C
          E0B479F3DC0606D78DC730CB9A201B125DDA762B25CAAF49356E3F64763E4B24
          E790A578F933851DC727604D756E4709D331D9995C8A95597451127DA949361C
          6887481C97ADCCE7494B6612C86F7953A831198DCC6387EC8B5FB6B9FB4B8665
          E95E455DD8EC536F7002A59A2081A46F3B936D313C928CB144FAFD23D1D80BA8
          3E9DCE4006BC9EABDB1A1BBE6559A6B7D26282F95DA1D4361A79E2C0A2BF16D3
          E7CD47966C7105CDF8479383605E9D55473E48E4FA09B106759443DA245D562E
          CABCE4AD4E0657B36643F4BE874250D1ED6CC5C38E26F04C4EC2B5BC8840640A
          38E2C66C7933934DE3845C0C772B948A119F657DB99F6A9F663D5510D21C6F08
          C3BD7D921E1FF7A81E4AA0E94E96BB3C6ABBCD914CB74796608D27321F1A4FA4
          FEB21FC8D34F3F6D8A51C83DA317F2B31CCB16445E70BBB9549A9BB065C80265
          0F52A81E0DEDB3902BA689D699B83C95C01C33E1CEE68F0A22FE4BAC43233919
          56FFC61C532E9EC2B9DA18EE93358AA77ECA3B3D6EDEC8367D2CCA27BF9155F0
          03F292A1BA46571B5857EE38C5E5D3E99E774A491A038F1122137F9BBD083B68
          C298CE45891C08C475D9FA91E8301B77DCD3B5B2DB1CC9625CA2D83D307CEED0
          78F47554ED8F70575F75E59C6C3CB6233A3AE2AA29E975A911189B08A272023B
          F34892548224A9B6D918A5006EF1792CD58AB89CF24D8FA4E05932DE878C0862
          91067A109B630DE99C8139E951FCD85B243E6321CC16B488F91408482E1BC5F5
          7A1D5E5042A8A394CCA0E7141C033589117CDC2AE07D72D6250EFF98361BAFB7
          4CC5C0601F4DA68A3C8526DEA61C99D45BB279B0466EA50610927B364C1284FC
          F6EE9ED307C7C6B6E1487B6471ACF3B3C18A34C89B060398DAB100BD837BC8EB
          3908D125578CF4602A7154851E32408378CA578397C520A2C47CB4BC09EFF800
          7EEAB7713C9175331C62879EA11101D8A9657159A20663B57E723A5ED46B3656
          21817374F2AA0E6B1DAF2361F9F1BB139721638731DABF070691817C7C021E53
          2B9DAC2D7544DED716C3ED012288F99D47DA3E8A35536027E078DEDD00A14CBC
          88607B2BD6BDEF7C622C71525FC3DD2A58188BA29966D76115CB3E81D2AB207A
          3CB5D8E8F56194C24B9A08FE47B6EFC2CA31B6C4E1814393A668796CA999821F
          1FB7140AD1BB5A8A58CBB41C66D1441A20024076C9A5081071D96DF36681CF0B
          88E713E48438746EDC8878F72EF8548FBBAFE294BB9D1D02E4E1DB474D36E7E3
          DDBDFF742183B92B97E38A1B6E4291B2843CD902337D9D227CB2EB6DD8F92274
          C9715535A4125F953D18A6E4B6732489864D9BF1B1B75E862DEA742F090AD9F3
          AF96ACC0CEE5EB30B7A91ECD350AD12C1E3102EA50EC943269143C1E344C9F07
          81E81F6769443A649711FDE117BFC0EB4FFD197EC58B52E181F3EF8174BB2C8A
          4CEF050A2139781AEA307FC55AB0F6C432572A282AF25E1C37DC87996351F7EF
          0A4C504EB82BE8C51EB61B9C3611321D1C9B1BC2793D6370F834BCA4D2B653C4
          53D3E6E09F350D306C1F02612F6610179E111D424D51874A43DBD910C4D6A9B3
          A0B23D4E1A87DB318D80EC7AFB6D4CF4EE06B957F7798704D9BDE78CC1F1F1AD
          A8EEAC74D5E59777E49389CED8F8D84192E425CE3DCBA1D3C32D5945DDB45990
          0C1E1F1CEFA3CC248D4785887B4E6B7D6A18BB420DD84D034F8B5ED450F6705C
          6208EDF10C5AF313AE8465775F52826917C8C9C818F20B180CD76157A00E7B03
          355028E6CE8FF6612EA5779D352DD8159671F1508C92031BFF2D06304140F544
          0CAA5DA424DE536EEB39A9AECC0109B294EFDCB5E72C92E4E66AD6C37DF4C397
          76A427629DB1B131F7987CA5A1970B92F516625D5C34B2512588967973295DB1
          70C7683F82C45EBE1A6EC78EA656048B744D3A81DA7C14C7C607309306EAD529
          6EB13A3AC171796390FD350A8E6DF6706E120C976870C8901319A2A47A774D3D
          067C945306FC302963E988A5F1E55D9DD0EC346E941AD1AFA8C88CF4C3C92588
          26065C906C0FD33D71CBC6CC62BB2C16FBF60E9E373C1E7D633F495E74F185A5
          F651FDFD939DC3CA202BE7334CC38249126A9FBF1853C97DDF911D409B55C4EB
          05D97D5F9669121825D32CF80DD60F9954991D692660165F6E49E1B0C20ACBF5
          8A2E93721D07C5477A4326DB2E92A31A0F789153650ACD9483160C2C170A48C9
          1C6EF6B562802439DCB50DFAC408FC3E9FDBC585A9ABC59AB290EF70252A4946
          2291BE743C9EF81BF66B1F75F1073AE2E3239D43FD0325919729921B26D9CFE4
          2834220372A4198B4E3F1B616229D7EF7E1D33F41C06A2511AA0E01270D664DE
          E4E1AE9AB3153DB715A93B495CB9013EE79E3898CCF0D82921C6AC5871125141
          225F0AFBBB21F4EF7C86B525E751D31A4451F4E13B33166188CC65DBAB2F21B9
          B70B213F49BB7CAB72472557A22203194F5F3236117F6E3F90176FB8A8233636
          D239B2B7DF650FA5DE36A66BD89C3B43A6CB78C2538FC1A2F5E7C21C1BC4EDBD
          DBD04E1A3F40648075E7642B733AEF94FF86482915775B3BB1EF76891AB2D33A
          5CB9B0822B2F4E94FAC8947691D9B620EF96660BEE0232972EA2B12D82345DF4
          CDF6F948B74EC5EED75FC6D0B68D087ABDEE69599697BA82296B1F270A66229E
          BAE4A01E59175E786147223AD6393234B05F0F387689AB0624C9A2AE430A3661
          C6A2659027A2B8C79E403B8591E19151F7083DABDB116DC1DDE760EB40ACCED1
          A99C702AFF8986C9D5964ABE5E7A9F73CA55E7ACFEA0FC87500C320F3DAFA3B1
          A50E190A55FFC1873112A9C5D8EE9DC80CF7527EEA716338130063693225F46E
          6725413062C9CC8563B1F8F3FB71D7B3D79FDD118F8E768E8F0D971A1E94DB17
          BA6D9938DE5D6BCD511622FBEB3063DE62044C03775B09623A3AFA87136E5EEE
          F7A9EE0495EAEC8EA6D3C6FEAD5A5C4D200DD2281533C8433737D622CB4BB80D
          7E0C10B0FEAE1D28904DB21062BB3DB2CA0E92F16D1A97CC0B663257B8249648
          FD4FB974AD04F28CD3CFE8888E0C758E0E0F96EC84E7276BDBD8F1249A2D83D4
          D857D38899F317214052FDBA9DC414C140FF50DCDD910AF83CEE5637CA03DDEF
          1E870379C0F56CD845E2BD6CA29B9B6A90218773071F442F496B78F72E248758
          B322220982FB977E4A6ACA95CE1A300191F7FE412C91FC24495642A5E7F2E9A7
          9DEE821C191A41B9A94FE9815CE96FE9B037D9D15B8592E663172F818FECF3EB
          569224696170244DBC56036B0FEC361662E5646E6F8FC3FF099C038172E5E7B1
          E48081643FB7343149F2B88D0BA29F5850FFCE1D98D8DB03AFD7EF364C71CFDC
          947B64B97DBD58F98CC77F3B119BBB745DAF9C87B2B973DE7FCE9C743CBA6360
          60942EA4845B289DEB283FBC93FE5FD40C6338AB159F9EBD60C1C7A6476A967C
          4D8B612A6F61682C038DFDDD0EB223D6F3D16DD9C68A9ADC662CFC5181743B24
          912FC89369583AE7AE14B411C80C21B94308A397D2B5D4D020C689F14892EA86
          1F66BF65496EA6CF9B94276633B9DC75E3D1E84EC7712A7FADC5E6661FD311B4
          4CE3029372497B5F0731F27524BD5C26FB4FD3300C7223FE7C3E9F9B7BC2F21F
          CC6B6A5EFB556D1875C444A2037997E6F14EA9C0889580CA8A5892A4CD959B89
          39FB0C6FB23F9553AA3F40E9447B09A083226909DB2B3149062143406D5B03E2
          2297BB7230716F57B630ACD075A65EB059D36C9E176DCB322C49518D623EF74A
          219FCF92A32C66B359BA8551DD4DF8A062B90AFACA717C77DB00A5C52D6EFE89
          2B7E32B3BE71ED5D05E678384C0CC4901033045229794B767045E0DC46CF9224
          EC0335A9B94E196CC5F372E5E382067462486E3E4B43CBD0FFFCEC4F55343520
          232BC90F6DE93DEB8DFEBEB731D9EFF9C053AF32F62F6F99FC4B39D8FF4CF381
          602B1D94DCF3CEAC1DFA8295AB7E3533527BCADDC534DA8422FAC7636E0DAB6C
          A965C7517EF1CC4B9754902D4DB0EF93804B6DBD9D32B96626C2BEDB6E82C85A
          27F2AEB17144DA1B1A6B50907CD98FF48C9CF57CD7CEB73079EEB0BA65CDA17A
          64ED37B7DC01DF0F045939B54E2148D017AE59F3CCB45068D55DD9245AF9A2F9
          4E2243744825565270C75E92507550E0B05F44E12AAAEBB80EA3F2335F6ACCC9
          6A83D92F58DDAC372F1803AB6B9B9B720A12E7F70CAE7E6B674F4F95A61DAA00
          E2B047F00FF53E5FF51228E0DAC72E5C749347F6CD9FAE675F482753BDFDBC93
          4AA532059D0C97D892CDFE740B390FD60E8E1398DE1EA0AA07555832CF4DD7B3
          2542B2279E7E347D3E9F54D7D67AEEEE6D3B7E76CAF48EA92D35DED00F5F7BED
          45D3B42A350147DCBDE5702081C97E3C2E600AD2A2C8FAFF93472256433C8E9E
          2991F11946C53E8E8E051C3C86D2E0C9ADD284EA6E08B02D5D208F6D15F5CA41
          E7A306783890D5AA5CFDFABFF15569CEF7AE76F6FF17C8435D73A8EBFFAD766B
          47F8F56F3DE3FF03887129222029145C0000000049454E44AE426082}
        Transparent = True
      end
    end
    object rcBlock300: TUniContainerPanel
      Tag = 2
      AlignWithMargins = True
      Left = 46
      Top = 3610
      Width = 412
      Height = 404
      Hint = '[[cols:xs-12 sm-12 md-6 | round:no | cls:card-info-box-white]]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 13
      object UniContainerPanel38: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 412
        Height = 42
        Hint = '[[round:t | cls:card-light]]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel61: TUniLabel
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
          Caption = 'Chat Basic Sample'
          Align = alClient
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object UniContainerPanel39: TUniContainerPanel
        Left = 0
        Top = 362
        Width = 412
        Height = 42
        Hint = ''
        ParentColor = False
        Align = alBottom
        TabOrder = 2
        DesignSize = (
          412
          42)
        object UniButton6: TUniButton
          Left = 8
          Top = 0
          Width = 57
          Height = 34
          Hint = '[[cls:ButtonDark]]'
          Caption = 'Ask'
          TabOrder = 1
          OnClick = UniButton6Click
        end
        object UniButton7: TUniButton
          Left = 347
          Top = 0
          Width = 57
          Height = 34
          Hint = '[[cls:ButtonOrange]]'
          Caption = 'Answer'
          Anchors = [akTop, akRight]
          TabOrder = 2
          OnClick = UniButton7Click
        end
        object edMsg: TUniEdit
          Left = 71
          Top = 0
          Width = 269
          Height = 32
          Hint = ''
          Text = ''
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
        end
      end
      object hfChat: TUniHTMLFrame
        AlignWithMargins = True
        Left = 8
        Top = 50
        Width = 396
        Height = 304
        Hint = ''
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 8
        Margins.Bottom = 8
        Align = alClient
      end
    end
    object rcBlock350: TUniContainerPanel
      Tag = 2
      AlignWithMargins = True
      Left = 498
      Top = 3610
      Width = 412
      Height = 404
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-6 | '#13#10'hr-childs:xs-exp sm-exp md-fix |'#13#10 +
        'round:no | '#13#10'cls:card-info-box-white'#13#10']]'#13#10
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 14
      object rcBlock355: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 412
        Height = 42
        Hint = 
          '[['#13#10'cols:12 |'#13#10'noborder-top | '#13#10'noborder-left | '#13#10'round:t | '#13#10'cl' +
          's:card-light'#13#10']]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel62: TUniLabel
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
          Caption = 'Sample: "ico-stack:" e "fontsize-r:"'
          Align = alClient
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object rcBlock360: TUniContainerPanel
        AlignWithMargins = True
        Left = 35
        Top = 54
        Width = 291
        Height = 281
        Hint = 
          '[['#13#10'cols:xs-12 sm-12 md-12 |'#13#10'hr-childs:xs-exp sm-exp md-fix '#13#10']' +
          ']'#13#10
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 8
        Margins.Bottom = 8
        ParentColor = False
        TabOrder = 2
        object rcBlock370: TUniContainerPanel
          Left = 74
          Top = 18
          Width = 112
          Height = 100
          Hint = '[['#13#10'cols:12 |'#13#10'noborder-all'#13#10']]'
          ParentColor = False
          TabOrder = 1
          DesignSize = (
            112
            100)
          object UniLabel63: TUniLabel
            Left = 6
            Top = 3
            Width = 100
            Height = 88
            Hint = 
              '[['#13#10'ico-stack:fa-object-group cls:color-green size:3x|'#13#10'center:p' +
              'arent x'#13#10']]'#13#10#13#10#13#10#13#10
            Alignment = taCenter
            TextConversion = txtHTML
            AutoSize = False
            Caption = 'Icon'
            Anchors = [akLeft, akTop, akRight, akBottom]
            ParentFont = False
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
        object rcBlock380: TUniContainerPanel
          Left = 9
          Top = 129
          Width = 264
          Height = 44
          Hint = '[[cols:12]]'
          ParentColor = False
          TabOrder = 2
          DesignSize = (
            264
            44)
          object UniLabel64: TUniLabel
            Left = 0
            Top = -1
            Width = 265
            Height = 31
            Hint = '[['#13#10'fontsize-r:24 mobile-v-14 mobile-h-18 |'#13#10'label-wrap: '#13#10']]'
            Alignment = taCenter
            TextConversion = txtHTML
            AutoSize = False
            Caption = 'LAYOUT EXCLUSIVO'
            Anchors = [akLeft, akTop, akRight, akBottom]
            ParentFont = False
            Font.Color = clBlack
            Font.Height = -19
            Font.Name = 'Montserrat'
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
        object rcBlock390: TUniContainerPanel
          Left = 9
          Top = 180
          Width = 276
          Height = 85
          Hint = '[['#13#10#13#10'cols:12 |'#13#10'hr:xs-100 sm-100 md-85 |'#13#10#13#10']]'
          ParentColor = False
          TabOrder = 3
          DesignSize = (
            276
            85)
          object UniLabel65: TUniLabel
            Left = 0
            Top = -1
            Width = 273
            Height = 83
            Hint = '[['#13#10'label-wrap: |'#13#10'cls:rc-text-height-175 |'#13#10'translate:'#13#10']]'#13#10
            Alignment = taCenter
            TextConversion = txtHTML
            AutoSize = False
            Caption = 
              'Sem uso de componentes de terceiros. Layout exclusivo e facilmen' +
              'te expans'#237'vel e melhorado.'
            Anchors = [akLeft, akTop, akRight, akBottom]
            ParentFont = False
            Font.Color = clGray
            Font.Height = -15
            Font.Name = 'Calibri'
            TabOrder = 1
          end
        end
      end
    end
    object UniContainerPanel20: TUniContainerPanel
      Tag = 1
      AlignWithMargins = True
      Left = 883
      Top = 3158
      Width = 212
      Height = 171
      Hint = '[[round:no | cls:card-info-box-white]]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      Enabled = False
      Visible = False
      ParentColor = False
      TabOrder = 15
      DesignSize = (
        212
        171)
      object UniContainerPanel31: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 212
        Height = 48
        Hint = '[[round:t | cls:card-light]]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel59: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 6
          Width = 200
          Height = 36
          Hint = '[[bsh5:|cls:left-center]]'
          Margins.Left = 6
          Margins.Top = 6
          Margins.Right = 6
          Margins.Bottom = 6
          AutoSize = False
          Caption = 'bsBARCODE ( em testes )'
          Align = alClient
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object UniContainerPanel34: TUniContainerPanel
        AlignWithMargins = True
        Left = 14
        Top = 68
        Width = 156
        Height = 30
        Hint = '[[round:all | cls:card-info-box-white]]'
        Margins.Left = 12
        Margins.Top = 12
        Margins.Right = 12
        Margins.Bottom = 12
        ParentColor = False
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        object labCodeReaded: TUniEdit
          Left = 0
          Top = 0
          Width = 156
          Height = 30
          Hint = ''
          Text = ''
          ParentFont = False
          Font.Height = -16
          Align = alClient
          TabOrder = 1
        end
      end
      object UniButton1: TUniButton
        Left = 14
        Top = 104
        Width = 87
        Height = 31
        Hint = '[[cls:ButtonDark]]'
        Caption = 'READ CODE'
        TabOrder = 3
        OnClick = UniButton1Click
      end
      object UniButton2: TUniButton
        Left = 116
        Top = 109
        Width = 54
        Height = 31
        Hint = '[[cls:ButtonOrange]]'
        Caption = 'CLEAR'
        Anchors = [akTop, akRight]
        TabOrder = 4
        OnClick = UniButton2Click
      end
    end
    object rcBlock500: TUniContainerPanel
      Tag = 2
      AlignWithMargins = True
      Left = 39
      Top = 4970
      Width = 593
      Height = 571
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-12 | '#13#10'round:no | '#13#10'cls:card-info-box-wh' +
        'ite'#13#10']]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 16
      object rcBlock510: TUniContainerPanel
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
        object UniLabel66: TUniLabel
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
          Caption = 'Sample: "pdf:"'
          Align = alClient
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object rcBlock520: TUniContainerPanel
        Left = 71
        Top = 60
        Width = 460
        Height = 305
        Hint = 
          '[['#13#10'cols:12 |'#13#10'scale:parent h:100%-top off:15 | '#13#10'pdf:files\pdf\' +
          'Bem_Vindo_ao_Trunk2.pdf'#13#10']]'#13#10
        ParentColor = False
        TabOrder = 2
      end
    end
    object rcBlock440: TUniContainerPanel
      Tag = 2
      AlignWithMargins = True
      Left = 39
      Top = 4535
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
      TabOrder = 17
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
        object UniLabel12: TUniLabel
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
        object UniLabel74: TUniLabel
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
      Left = 40
      Top = 4031
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
      TabOrder = 18
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
        object UniLabel67: TUniLabel
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
          'mobile-v-180 |'#13#10']]'#13#10#13#10#13#10#13#10#13#10
        ParentColor = False
        TabOrder = 2
      end
    end
    object rcBlock210: TUniContainerPanel
      Tag = 2
      AlignWithMargins = True
      Left = 11
      Top = 1923
      Width = 412
      Height = 460
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-6 | '#13#10'hr-childs:xs-exp sm-exp md-exp |'#13#10 +
        'round:no | '#13#10'cls:card-info-box-white'#13#10']]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 19
      object rcBlock222: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 412
        Height = 42
        Hint = 
          '[['#13#10'cols:12 |'#13#10'noborder-top | '#13#10'noborder-left | '#13#10'round:t | '#13#10'cl' +
          's:card-light'#13#10']]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel10: TUniLabel
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
          Caption = 'Sample "carousel:"'
          Align = alClient
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object rcBlock225: TUniContainerPanel
        AlignWithMargins = True
        Left = 28
        Top = 61
        Width = 365
        Height = 386
        Hint = 
          '[['#13#10'cols:12 |'#13#10'hr:394 mobile-v-160 mobile-h-240 |'#13#10'carousel:file' +
          's/images/slides |'#13#10']]'#13#10#13#10#13#10#13#10
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 8
        Margins.Bottom = 8
        ParentColor = False
        TabOrder = 2
      end
    end
    object rcBlock220: TUniContainerPanel
      Tag = 2
      AlignWithMargins = True
      Left = 435
      Top = 1923
      Width = 368
      Height = 460
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-6 | '#13#10'round:no | '#13#10'cls:card-info-box-whi' +
        'te'#13#10']]'#13#10#13#10
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 20
      object rcBl: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 368
        Height = 42
        Hint = '[['#13#10'round:t | '#13#10'cls:card-light'#13#10']]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel68: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 0
          Width = 362
          Height = 42
          Hint = '[[bsh5:|cls:left-center]]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = False
          Caption = 'Slides( manual ) ( CENTER V_Offset 0px )'
          Align = alClient
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object UniContainerPanel12: TUniContainerPanel
        Left = 10
        Top = 62
        Width = 330
        Height = 247
        Hint = '[['#13#10'center:parent x:0 y:0 |'#13#10'cls:rc-dashed-block '#13#10']]'#13#10
        ParentColor = False
        TabOrder = 2
        object btnPrior: TUniButton
          Left = 5
          Top = 98
          Width = 45
          Height = 42
          Hint = '[[cls:ButtonThemeCrud | ico:fas-angle-left 2x]]'
          Caption = '<'
          TabOrder = 1
          OnClick = btnPriorClick
        end
        object btnNext: TUniButton
          Left = 279
          Top = 98
          Width = 45
          Height = 42
          Hint = '[[cls:ButtonThemeCrud | ico:fas-angle-right 2x]]'
          Caption = '>'
          TabOrder = 2
          OnClick = btnNextClick
        end
        object paSlides: TUniContainerPanel
          Left = 50
          Top = 25
          Width = 229
          Height = 197
          Hint = '[[round:all | cls:card-info-box-white]]'
          ParentColor = False
          Color = clWhite
          TabOrder = 3
          object paImg1: TUniPanel
            Left = 3
            Top = 2
            Width = 224
            Height = 193
            Hint = ''
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -19
            TabOrder = 1
            Background.Picture.Data = {
              0954506E67496D61676589504E470D0A1A0A0000000D49484452000000D70000
              00D70803000000BEA3348700000300504C5445DDA169393939A05C1FCC591FE6
              7C1ED4965DF7931E42424274B64AABD39181BD5B8FC46D9DCB7F22222277B74E
              A7D18CA0CD83594736A4CF887AB95285BF6096C87692C6713A3A3AD0935988C0
              643C3C3C40404099C97A7EBB57E7C8AB8CC2695543323E3E3ED99C64CD8F562E
              2925564432FFFFFFDB9E662423232A2A2AD5985FEBC9A8323232343333AF6D31
              CE5C1FDCA068BE7E44363636A35F22D698602C2C2CECCBACE2761EEE871E2727
              27C7874D46392EF48F1E303030373737B67539262625D6671ED79A61D1601E2E
              2E2EB37136E87D1EE9C3A0A86529A7784EEC841EE2B081D2945B212121B17F50
              AD6A2D4D3E30C98B52DC6E1ED29A65EA801EE2BA967A5C3FEAC6A4292522BD8A
              5C372F28DE721EE6C6A7CC8D53E4791ED96A1EC39872F5911EEECEB1F18B1EA5
              97584B3D303B3229AE8157584534BA7A3E804D1FD3945CD4631EAB682CC98A50
              C18348ABCB89504132DB9D64A36326B78456A27A3B68513C7F61448A6848634C
              37689E46C18045B9895BC4844A926C47E0AB79D58248C4906097714ECA915D32
              2C27A27952BF88555C493634422B9B7450BC7B40B7A56642362A292C26745A42
              B9773CCB612674573BA8B574523E2D9F5B1EB07744856140484943C1956DCA67
              2CC3773B609142CFA7826DAA4753793A8B8935D6B08E4058319C7149AB7F553F
              4A3872AC4DA16A2DDBAD83CD5B1E6E543C4A5343906945E6BE99DFB691D16D34
              5544344E5F43536A45564739ACBC7BBB995AA9C482A07433CBA079E1BC99A48C
              4CA6A6669B5E21597946D76D27E5B78CDCA6735C864091772CF28E225F7054D5
              A06EA4764A839C3FDD7726AFC382455F3589AC738C5321B6895FA7AF6B5B4F44
              6C805E6289494B6C36524233704926D164249A6926C17F4294B57EBC8D4ED377
              3D9B9445B3B4747D5D3ECEA47EE7D6C7D9935B7F986F9C843C93A654768D6896
              B866F59322E98628B5AC6DE2842E3B36312C34277DAD5E7AA842B75A1FF7F1ED
              B96A2889B256D7BBA2C56F346842207FB65C5E3D20AE5B1FEE8D27A4C986BB80
              49A4C98CA57C55EC8E2CEA8A2CBE591FE6C8AC6E7C13370000414E4944415478
              DABD7D097C5355F6FFC9D2AC4D689BB4C596B5505AA002850A28142A206B1118
              4440406744AD208C02F307C70D5019D41916070451711644C1E5878C289BB2A3
              88C8664191619345BA97B649DB34CBFF9C7BDF4BEE4BD23645C7FB519ABCBC24
              F77BCF39DFB3DC252A03FCA2B642F77A3E40BAA7A0B8FE7BECC5917F5ED2C581
              5763A05C7AE3B912BBCEB9E4F4D2A6F74B15092E3580D1117C31D151052B4A16
              0124C79F6FA4E349B5AAC8A0D975B53F075F4B98DA082C9D1BC01B19AE68974B
              7C1A0F45F2C343DFCC94EF71AED04F0368612C68BCCF76FC6A8D1EAE357A63D2
              C560549A4DFD836F32D71814A3ACB615857C50585C3AB5C6117AD5044E009FED
              8F09FF6503F85AD6F8AB90FE5379A37D5574380101F2477A7015D77F9FD4DA5C
              EB79FFCCE07BE2CB62438180D523F699E38AF7957A43EFD481426AB1BA02C405
              9DCFC2D3F41435B0456984A8B0D97D3F875E4CD0809EA1B3EBAE312D2CC17F9C
              85F2ABA66B60AB5CFE18A8D5FA30E36CAE53742FD15516824B67AD0E7DA3D957
              EB09B9F8EF2910D3EA077A946C296E5CAF1A45C6FA8FFF17E2BF85095A26C1A4
              5AFA57CF3E3DE58105A8686AB52BF46D86BAD0EE81DA5C29E092211729A426E9
              6DBC28F42D239A842508998E46AA30B31A925DFB1922D449BAC2E19942C729F5
              D2D2801A1253092DD61106ACD96D2D0AC6A553A96A42EFD4784D822CD7464DF9
              05C0A49664B8921C85EE01B2CF34ACC836ABE52E3F1BC617475786E99EDE1D0E
              9E425E120D2A04046A438D28C5D9DD7E29B02434A0F42BF82059A5CD4F6A884C
              ED499E82672EFB81F1EEE9A29464A8B38492486251183ED47AECA177AA752E09
              DDDAC41131695FDF342ABB1BB52EBB10A9D4789918A2216036E6F6562A09D152
              ED0EBD33B65631F86AA687D1E602F11E7335BB45C186AFB54EEE5F410F566834
              3F6FAB3875D3B06C8C3BFA7F9BCA3E0259FD969246DFF369C154B1CF2A4DA8E2
              A97D960AC573C2652F0923A0C44275806E5EB397942D901EB730DE3C2A8912B3
              CC3F96F82FB4699C55976B437C98C66B53089AD98E4E0712B3E808577C090948
              17AB909A4EAB15460069B073DC55FA3C47D3C85D814A724D9D6385C0CBEE6B5C
              60001B0FAF54762F5840121A97CC7101FBB254C59485DC69AE05AECDFFFE856C
              61F78147F2B76D94F11473C98DB775B71B5A86E99E4D8156632F231D557B055C
              F165261A81202F6EAA3633D1AE358F87CE65372F2BC9B0A061A268B8BDDFFAD4
              54B522C455FB202AD4D8EC252A6F301FAA7D4A2711CD355663ACDA36FED6FD37
              0F8B244602BB25C2C83EA425B131DDD8AD3A53BC6AD533BBD23B44B4962AB547
              65D0D815A234B958CC625638097B89D1B9E1C9DA5F20AE5FDC7A95BE487F6C50
              12B3232871D1793D1A91FBC9C3A90C2A50B0A18EF93E2B8A52B8A88EF6BCF296
              F91789EB17B79427F3F0DF5897831215BDC25D455753E212AF16C2409541AB63
              F728830C53351B01C1B7AF99618984B8FE772D49FFE73CE9A1D9ED0AC386A66A
              6320A4521998C6C53B3C5A51F3A2ABC979457B5DB27C57CC6E71BEDE6FACA5E0
              15344D309D244CE54C4D54EBD44B2B656089C06CC7EA13B920B6DC6866D6E602
              3FCFEBB4D5CC0D2B822F74072073FF4FED4CE143544E07D43223A54B7B5C3405
              BDD0E6C7A601EB9EBF72A6C87E962A1043729D99FAAA56EB486A321F72FED4E8
              BD6244AFF1EA292A8C8E2A5BF5787871C9395546E255FB950861D9E2F8DFE657
              2A4AEC713E888B34D8B459AF1EE8253C8F2DD750BE195B27A62F280C929092E7
              ED25C0DC95C4867C047058CCA7DB85B12E297E404CBEAB2D6A6E822CEDC531F1
              1EDFD5F46B112A30A6EA7E55A4EEE9AA58F77456911BA28DF44C892BBA2E0A6F
              8D3654FA04799B9D9A8FC7B43E1BDC271FFCCC405DB9DAB48240686FAD05E723
              BC3526F6EA4AF7CC78A7685666272490B529894FC225BB2B66732820B598629B
              5F297FB33274483B243AA08C40257FF70B50514B6D1EA90BB1B5CE7F7A407F85
              5981C687B6125F59ABF04C0C57B41B44B3323B7524B658A74C916B6684377162
              35D0DE745C2474B7DDE108EFB427FDB060400E752FDE57ADE43845A0C470592B
              B9806451267A8B285101E9CE15B3338E36A99B494DB6B508835F6ABDD4DF3E5D
              B194A8400124565381BA165FE3AB0AE0420B426231ABAB4451EAD4B5528AB360
              91A9298A667737D53341D36ADDA9F691838ECCF4818E58C00C4AA9E9B89271FB
              8A26905A0F189DC2DB595AA6F3E8370FEF16A996705885371FB247D83A573F34
              28A90DE6CDD83D97181A6AB4165511455B021F527452832390A8A01BCBBE9EC9
              954DE8A7FD1A24FC421A09FE445D98C2B0CDE67EB2F5500A9E381B4A8D172F2C
              552AC2A596261558BD10CD4A4137E657A735450BA90EDDB8B896F7BA3FB6EC2F
              2D6E8FF43313C26AB6ED95E6A0B7F72759A8755EC133C517FB54069DA1523440
              0A9ED8738944D6CC688A1652F6D870252626DEA8C5282A717AE5FC237D22FC54
              D40148A8C768574F076642ACCFB2BB4A2C5019E28B95024ABC612C2365AC62E9
              CBAAC7337E8A580B590DAD0158B6380B0B0C1F8ABAB106FF8CDDD2A40F865BF4
              A1D03AFF83222BB54FE7D6B8741EAD492E65A01EA2E65174AB368961566C3950
              A6327B457245C4E9099B0BA91756520BCDB7005DC656F9E64B5716263CD13460
              2435F6C7556C073EDA291B58C4C86ADA48FDFE4C85D99796D8A2501166999D36
              4F19CCB62D8838EBE25F5D4FD5CC9EA847493D55E7C744ED997D4D28AF06CF8C
              F12F8A717E32D47F094DC8A8268F5D5D15880F355E60EE8A4525C0A97F55D982
              D4488B85549D4EA82F054BB57F0B5D869CF828E8F26D2723C715341D2371EEED
              0F3D245CB47AB1D356572D6A9A1F974E55472989BB364022AB1E5FB0BE5E58B6
              389DF01A4D489A5CF5186207DBB7F094E3C5D017FA5C6B9203F74F8DF9C7AFC3
              EFB3C7168159033C7BE6350C752DDA95CAC04B3AD24533E5B18E6DE766E9AA56
              942C0AB6AD5495944226182AAF8644F8F5B4CED66FE1A198F9E15E5AFA59534B
              26761D40609E33493F17D9D0BAA55B3CCB3F74DCB6A21D7A8D436550897E0DB4
              319AAABAD577ED802B8B2034A7EAACCFE70F92E323CC22310087A72EAE09FFE2
              A297EA738D8A0813C18457859E2F0C85D9034A6F19AC231E34BB6BB9803C2CAF
              54B1882ABE968B927980D8BF4E03E8117676C166F3D15B23B43A7BC7AF61A26A
              4DBDAFB78F0A9F79D9E36C9E03C2F3CCABE1F16F744D01DB9CBCB6B51851196A
              5DE600A3AB0C1AABF686B5DCA3289C261EB838FE57A83E61E89D78FF730DDCB0
              747E663D94D8F96CB2C528696986FB46033ED13AF709D6737457AC8666565581
              3FEE452969A81ECACA73877AC1AFD130558285073F6AE896B13B7A9CAD876C6C
              1DBE85640B3EA88AA92A0D770F4F6D62629F911991557431D7D755FA71510646
              D5605315D5E5D65644EC2F1B6898B377C958D3C84D4BE7A7D7C7F5F68E57AFD0
              ECBC31BC44939C94D0A65E5AB0D0AAE104C19212CA54C80FCBB86A3DA025B363
              99CA06561C89C7A0EBEA4D6B63F6D789635F6EF4AEB1D74F66DEC4DC27313E3A
              6624A505F7B702A338C3ACF5E82CA5C63A799D03499A981F291234BBF72F60F7
              A437712543A0A116352E2C6A79EFD6AB89F5B624271452BC967AA985E6EE7598
              26DBF07F9D9BC7135A9F87D2158E4BCB67B9345EB23C8C3C7EEC043D8A75D76F
              5A58A997607AE3C2626DDEAA169156A3A8C92BA8DA5CB3251BAECCBDBC94AA4C
              48ED0885E7C41A5E715219CCA6527DB59ED56DAC952CB0C7A8FFFB8F1684E179
              B6202682EFB65E9998F0620437B2D6E76443755F8A3A036B8F3CF2520F5E2C5A
              777C2946B7CD1C2E5D2C5E677E38F68657C2C5EA6A40950D9DCAC3C5165B066F
              5C5E043D3CE50213D9E37C450D2598FE0A45AFC2ABD3CE3548838AF6CC868206
              636B5BF02A9D6CDF8FBC1F874E07E6D3316F466098A9D40570E9B4D5647B3A6B
              099F465A7B6A294D502EC7B4025A443763F75D4DD49E6BD0D862E47A5BEAA5C4
              3F3C1D312AA0A823F9DD0632677B92B63CDA50CE039DCC3A4355CC7982B5BCB7
              A13B91376341D0D5E962CA5C4410D2440BAFB369CA3862E69CCDF0F6BD9DAFEB
              2F4266DC551FCD954372ACBBA6B091953136AE4CA8835D06CF8726B5B9AB33EE
              6FC8B3A07B0F3CE9515C560CEBE2762DA327FA3A5315C53FE88079FDDD098CE5
              D5421D3B963A1E5DA98B2DAFF36E9C66D5C62962D2469659D8AD154C5CC88391
              1286D01A363142A673336819DA73BC1FEF17CFA092677C99879B9556C3634383
              AE0A9A211095508F3279F40EA0A419B3E7D9D645C92A2D3EE4F24F68A8229814
              7B0ABA54B3E8BEF3D986E3A67ADAC27505916607725B9E1B9F405E0BB52CDAE9
              8B2F942662E53A3CE2D299356CA8752AAA0E53E4A133DD80C2CFABA6B1054C8D
              A1C2ECEA6C71873A568ACBFEBACB9D11F3A0D89E7915224E60FDEDFDE2C72895
              74427C391501FC537AA88DC61A9A5F86688A87BDDA1A7E517A9B6E6F6D6FA458
              8DDED5A0DFEC793CF3EB18270D379A56537850D1F2DE8D1498504D5C9E543893
              21A1D213792A9D5ECBEA362A13C61B76D9722451AAD002D53A54D7E89D8DC7BF
              18DBB63E6BB7008ACBDE2AFFB1976E0E15B6E7FF9A6C8A10586CF352C666F1D0
              DCEDE0CBF80C6AFD0DADC1A971B13030B692EA006667B49399152F629B9DDC95
              E138BCD52ABF910038A6E3B7D35E81C57FC1F4D0DEEAD6C87D7198F6E46BC909
              814891CDD468E4679EC0AC0D8606F0735625016BF36C87E4543E0F64A0695533
              0B13357837AF6F30874A013D9B75D078592266058F03ECE7AFA535D09524C315
              0A979EFF2BC6E4F656771FB9491D94DABC559029022B145FA4EA93DD27871B00
              5FDF25C5E92C409232658D57EF061DBA2BC4AE32C402D34924165D4C11954D99
              4390AB1D5FF6AEAF1FB64E3C177E66438BB3C576CBE89BD741BFC41436961458
              4A2F2DD20954A4760FA7D2BB1EFBA8F7BA20DE51CD58C3AA2B9634CD5281BCC1
              1365BBA6CA41EB8D80CD30C73B5905D8E2A97DF7DE707DB0C77AAE004B44C69E
              D0D65EB3A7F4FF253A28B5E7FF0ACA9AB9B48059202ED2CFC25BDEBD87CD2123
              9F6B7C46B50BEF6225427B055BF44518EC888B17B179691B435ED06B9DD1957C
              2256632D9BFDCF208F6C7743B206153C39AA032ADE33BB4B2B8AEDABFFF5CB74
              506A8B5E825EDF4790B52C1FD6899B0C054D143C9184C05C2B111FC4DCD0222E
              062191E79C9A58C46CF6554BB99AA51256BD1252C8EE852ADCACF4D892D9C8CF
              69334F00748DFA3550617BA6F0BD161591A463EBEAA652DD9A5B97D3E802ADDA
              A5E1ABAE7575540125FF85F28CAEE4DAC82AA62CA4B2796E6098E586AFFB8656
              E8797AFA4B9724866B983FF7F831825CE8507F17593FA302B052A88B59A3487C
              2A83BA5945144A922B9E81F3A60AA9DF4CCEDAE75AF5386A5C50E184E14ABAFA
              EBC34260597F11F9BE9EF6F9EFB47535C87C4C5E7CA12BF1054DF7C796B35C52
              CA973D0C98CE5AEE0E8C0015A9A22B57CC4E86AB3D4AAA8450CACE1EFFBF57FE
              17B818DF37162CAE1B6EE759A34D5304CDAAF9661A6D4C29979880CB52452C42
              C81803C5DF6012A1CC455FF7FC9B673A93D616FAA34436B5913DE82602DC885A
              DE17050DAFC059DEA39F2420DE2442676C48D1130A44CB70498B44E3F1150A15
              CD1EAE8DAC04A23ED82FFD88324B61196C566E13B3ACC8DB338EB77A781BD0C5
              CF877AFCDD23B3626BD3CC35EC62B4C3A84558AC1E85010837408C71C1A82FD7
              48AB9A2D6C6625D67EB14DBE625E2B06BD7E66FF65FF2B58C074B1FE5A58CF25
              2358C73885A33A9259C557F25D387CDF8DC6A7322416A1F2715C89B49A99CC8A
              91885AC54B3BFB06D2669204FFBA1A26AEF489FF2B35642DCFF75E7DAE2CA9D8
              CD7C6F3C5F1DCA66CC29A0E78B4DF8DE1C9D5B8AE7F93243B5571A01FA3FBE5C
              CF4A053AC327832039BE3C3F814D70F16026B3A2EBAFE289EB6D63DB7F5490AC
              2D0B832CFBF70FF3077C96812F5FA3550C2C4E72F0348BF63BB0025C4C01988D
              7C739B26963ECDBF4A4513B76E640FA213770DE4CB1FDE3BFB7FC48602B23EF3
              D1C384D407EC9697A7B898C0785E25D70BD1335935E51E9E5FC697907DE95D18
              07D3A60F2E356B8D1C666144057125BED92BD2AFF95785B29671F14FFF33D608
              B4858ED59011154420BD8EBD3A5D121076CFE47673CFC41C2F99108F144B0917
              2FFD226DB2E029BE4C0AB3626E80891200735514ADFBB2EB9CF20E34E89D78B2
              2945DA9B6E79F9278391F53C3E93A5927AD30D68E67449998AB4C7CD504B9E09
              A26A59DD860719647B3A37982B79ED97B321CBB0B57F5A24B90AEE91A1EFF1BE
              677E135C2C79E1A535B9A55CA9637F6349B728E0D35B30BBAAE3E5286D4C31BF
              48B8E40D55263D82A6C883A9A314086B497FD74F962AB252ED35ADFB072D7F23
              5C634F14A41BCA205069D6AD9ECE4A1A7C525CEBA1D27CB5141A52F40B723D4A
              251700A2E5308B07C29CFAB50664956D23A5842FA6908BEBEDFB7E2B5C307775
              9B7C212CB057AC9E8102D2A8B82CEC3555BCD444F3400891FB309F85D7A31858
              7BB59481D9CA20B644929A4E4FDAF8DA1352C4C6D531CD7D097E335C79EFB6F8
              41709E31CE77EE038AD3798AA2634C274FA954F322362DFE67B800A1685D5C94
              2CCCA28A3DF3E2BE3236020BFEC560F0352F7D8F0FDBF4DBE14A7B7861E6FE40
              BDB9F359A4430AF8F45A542A37DF1CA9D1AB1C2C6B642B2D411B5B04D23A0742
              CC62C4D80A9E28CB0B47F92A95BD8398A498796517BA1F78FE37C4F5E283DD68
              698024B29EC769E3AFBF7B9267624B50C83319D54E538D0703619581F11E4BA6
              19434A0500B67B9648845063ECCB8883E11AF8F5DBF7C16F88EB81C53DF6B247
              B42405E970F963D8BD2823E738B6C03ABA46F24CE89B41CA2531AFE4A2F44A55
              44EEC5B56C073EA923E8DDDADAA33DD9C400C39546E282AE477E2B5CE7FFB4B2
              0DABA6334AD49D6B45FD5239C4EE499EC9406B2B494775512E95814F2059D912
              23AA22DA2A68264C62434B194F695EDC7052C2D5F7F85B93E137C4957279ED63
              E9F465CCC27A1D5B3781D6CA4BDDF3F978E8C03D539124219D4783798A84D2E7
              77D8ACF14C85055FA4A31BE65D00CE1B593FBC36F5B7C505ADB567405A98D7F3
              F8771DE9AA548D21599080B8675249B8EC457C1D919B14501A015B95835925F3
              07D2F63E8DD67D309B563211AEDEF94CE8BF252EAE880C57DB879F66561FEDA5
              75F152F7BC1A1FF34C2C3494F6F1226F78AAFD02E2EE8ABD93F9039E0A583565
              B357B08A25A567F3FFCCBE8FA2994E5CBA1D235ECF1A696BC7FFF8CE335C6B1F
              4317C668A3C3C595793C74C0EE695C9C0D35D632299E408198BCBCD32A83CE15
              EF20FB63FE405B258D80379E420BBD570E84176CFB0A58BC113DF05309576EED
              178ACE64B07F6347C08D9FBE0C829A72BEFE670462C2671377B2B8ADFF6B8A97
              F2B69F1F80CE6BDCD1330C97DDF2700906BD5AAD0B4CB46D97F1854ECD96625B
              FDCB26CDFEF5517E7720F9030B544AA6C60261A2C8BD836852008943C6951ADF
              D8DAC10C3623D2E6240E7B1771B150A7F8BD28E82E17A1F741086474E15BA637
              793BC03B0F753B4074D8F9EC530B49B5685B1E9B36B6952289F08D011AADB588
              5FD4D1920009174D3918AA2596E749272B69BBE5498BD92B7AED67069696CE70
              3DB40660B01EE093C6956AE6ABED2E885B7DDAE1E0B56C7C4165660B80F6CB20
              73F84B30E840FA11C2D5E5872D4390F74AB82BA2808FBC1527114314094CE63D
              3EBF6CF1B839A73001C596B040D8524519004F69F0C18245D662C2955E7709E0
              36EB8ECC38075727F37DE0B5C3C731EDAB833AF607362D98D16A0BCCFC5298D0
              87DCCFF256C398EA1DB07D53C83B70A872004A01DEE457A67E920F198E9F9011
              09976EFEDD99D83DC9C5D2FC2A9BF3B2A98A7406BEA406352FDAD1AC9AF22FB3
              23BE98DD89D7128A80D915A9A3C6CB14355A5A5AFF63278A7D5D947B7DBE6863
              FC90A33B01268F79155F6986CE132382B38AE323B2F07FA42CEBCC8D2FA6B4AC
              6AA5409079A2FA6FEA2D71B0879FBD1260D62CFCAEEFEFA473A3D0A692C6B26B
              2951597B8617AD4FBD5A8E31EFB50FE752884B3E29BED82C4D874B8D9990954D
              73A97D88CBE0D6B89828ED252C1C66751C0C3EB47CF925DEE3654AF922ED6D8B
              29CC3CFBE25A185909CD539F4A371F198077600AD3696718459A83FF6F68EDBD
              7CAFE329E50B79BB7A1C498CDFFB3C3D5E12FCAE31C8BB6330B869F5CF8E9651
              EB0FC3BD00FB3DEBEFE8764007A997A64C1EEAF5303A43AFC5BAA7F162F762AB
              6BD932431FB20913910A7131F52351D6711FA6F6195D6CEA535A776EAABC8246
              7410E257A2C08838BAF85018EDBECA305CDD048DB6A143FE5690982DCEF93DE3
              B2FE5448119FBDAE91F7DEE5F0665D670E78FCD0F4236DAE75F9C1B1967A0230
              EA5EB97B5A76F08139B00F8AC5B7848B2FB4618D19A03A8AD6FB32F962CC1B5D
              77EAC6ADECC5ED6B3FB55F435CBDDB6A6221BDF4C871F95DB300A424E2B8D8AB
              7BFEDBFCC61A18BA11DEFE5BC148BBBCB2686CFBD3BD2E7DC81EBE7E0ABE1127
              98E66D677F9AD7C1F5F7E46B837D261CECCB5B0C1987DA5CBB3D69837CFD9D66
              F7304267E22220BA282A314968A31DAC0E50259B154B4A580A1A6096972F2DCB
              6013D8A40C878938AEF44F81C2CB13508366951CEFF04E43237EFB98D36C11E2
              B88ACB634B5F84B15DA3D6F63413AA876DC7DF4B7136F046CFBC4F9AD15BB5DB
              FE0EF07EC9E2B7CEDC52A29B3F17A4BEE4CF6A3D8FDFC9D3DF3AFAC3E2601E3D
              112E433409D422918459DAB4A7D5444555685D076E83AEC7F8273C5E70FD2BFB
              350C10DFBEE63CD1872CE3FE37E87AC96EB807FAA8837AF63BCC6560D9C16663
              F8EACA7B54BB3AC2D9EE9756B353C91E35CC87F9908EBDD810F4AE59D067D6B2
              830C5A4F7AE78CA3BD462CDC0023BEA8BA052AAF3FF9A9E4D2334FC0C5742620
              B61E4A2AD168BC48FD2AAE8886C44249940A0DD5A9DCF827FEF55DCBB2F74AD7
              DB3DF194A524A6B0EFF181F9BFFFE7E3882BEFF057CBFE6FEA234034F9E17D61
              C7FD0DFD9D4F862E1B45582312D1275F0F79059DE4321444BF5AF01E7CE4DF78
              21B9A5F5E76D802162E67F3DCE6B7DFCFEBDFFFEED992D58D688028AAA956AA4
              513592A6B1BA0D0F32FCB8D8822A69DBEC99B68FAD902F77DA7847EAA998C28C
              8B03134E1510AE09FF94D1D48BABB9E39E8573DF0CBEFAF729E368A575186012
              2E1A91DFDF4E7A925CE0BE15718DD9DAA624EED294AF8EF9EF9CF9DAEE21E49A
              342C72E0655E5E8E22CFC470B1302BB19C041A7007BC98F3C9905101D2FB6640
              EBB3B69F332EE6DC72AA80C6E79E77BA7EDF30AEE619F0F5A9457F4342DBD83F
              9E2E0C7F90C4B598A405E1900570C1BF26F63B1C85D4A54AE7B8AACC0A5C6336
              6F1F095617A61D3C9E8829C24C4C2274B3CBC5EA362C7BE1A234797CBCFACD48
              6457DFC1DB025F3AF39FBDF6237144E7DCB21B9F0D8CDDB8F60154197AE573F8
              F0F5604CFBA0390B855B6A97C2F82FEEDC35922E6E5D8CC0F25E1A92ECBF2D1F
              AE4B1F42AD16717DCADE0CBDBE9D8A036207205C23BE482D335FDA35E15CE0F3
              87EE3830BE82A89BB647499E894F309336F27A146B4C1D0D46967A4AF5EA8F87
              49D6D5CE0AF6E2C4832DCE2371C8B84ADFDFF524BF0DF381B53314A0CC8187F1
              9FC622AEF42C56D05FEA5D04F0E4BCF117207C9B7B0FC81F0A87276EF3E3C240
              4A977AC9915D612F860A0EAEFFFE0BE9BCCF5A8DEC99A8DC91584EAB795506BD
              2C20FC1745C920AB7D482C1871CC58C2D430253A3FB345794CFB375A9C47958B
              CEE9F52FC295F0FCB8D352174EC1FC0FEBE929B4415CF684D6EFB2278B7C4B08
              D7902BF5DCBC1071C96745AD5CB90B07043A7BB6C1C2C5E93F9523AE91501E73
              E55846D579A688735602DB5BA365070EE9FC6E5ECFE4152B0A48CA5E626BDD6C
              0BDF8C256D6970A675AE7B1929F5C9E5882BA6307AD2F51FD231787A68DE871F
              486FDA08634782101F6AC162FE87F4F8D13B11D76D2DF8BCD2D85305846B9782
              23FF1078E8180B23A2A5C7E90B49D00F7C9DBC16DE7DB0DBB9925ED73A7F8697
              6DF3A23E20256A77E19DA9C2260D8442D3260C88CA2BD7A3D43E14198B88A900
              A08E72B36A9B6AEDE4F4D3F409D95FB2C17E01CD1A710DDB34A2A890708D930E
              6399F88FFD8F851E75D7574B61C3C3F740ECF82F7ADCBA969DBA513AAAEA43C4
              35FF9074CF44F79D2F88EF69F197C7ECADA568A337C3E54BFD9C12B0CC73C531
              A3BAD4CDA5179E5CD49BFAA306BDDECDCC8ACDF623047AACE53D97E4A5D1FAA4
              29585EE5E65544552D3B6DE42E138D13D89EF933468888EBB5A912AE5D7C29EF
              AA9DD3E1B1CE87C61758E4EEB9622ED19FBBA653EFC6EE1A6FFCAFEE3FFC9531
              311FC0CCE7E143E2FE873379B87C68BCFCBE8DF6A5B04203DA187AF9C93BFDB8
              46947F8F69CA03057715B048B363D23686CB5A23691A0A0C3D130B0391FAF575
              185C18F42CCF94444967AB52AE66E47AC871F518CE3E6D6ECEEF18AEB40E5B25
              5CBBFF46D7FB3483B7A3AF4C561672B2B4249F1B07E15398B86D7CFB4DFAFDA9
              CD2FB6B97E76D8E912B8EB7D988F7767FDD8176FB9702123F0CE3F45CDB417E4
              011CA0DE7C0AA8C0C07019D82C7AE9E4949DDF73810DDF42B8124924FE75A13C
              BCB5564AEB37544C400C97D949D5DD7856D6A1FC128EDC4A7AA8EEFD0D1BA5B5
              035844DFFB08305C53F8CCF9B43519EDC205F654FEC8ACC6B7BFFC92FD81CA4F
              9A9752549C6270FDF541BE3010DF88F150ABD0B78E29AD3AC66998E1FA570EE6
              CBDDE844B723A326DE328BAEDF76DFB273848B558035DE681F5B0BCAD668A8A3
              5C527D23DA5002BC2860F670C7A6F51F2AF2512EF18624AF2E7F1FCA70FDDFBD
              0A5CB9505F39EAF17D3788B8EEDD69EF3162B1449DB39DDF9D86A1CC8272DBBE
              E68FD1942DA599C77D5AC035662B95D14D0F2EE934FDC7D50CD7B62D907271D6
              3FD9AE139FDFACD08D7984BA0D0F323434C52CE3D26B9D54EE98B1842CB4CB1F
              C85CB3F7B46D5E7A1E712D990753DBE358FF2EB285F22F2C857B76B7825DFC59
              B7474A31B08C6C0DE6C2E548F33D9C5B11176AD807C617F7827A06E17A327106
              B1D99C372D45F2095E54E565137CAC46A336B2FA868A2A34ECA2A487146B506D
              67D2DB14CC67265241ADF3C9B60F6C3D8AB8E62D41EB47CF3CE3F1887A8761D4
              B0165B3C67A4A77FF9EAC1071F5D1CD13BD130BF80F46F4A60CCC90BB0BCFD10
              1C6375DB9FF0851CD84921FDD6D1EC36A91E401122F7C320D56D62CB89DCF9B2
              5F5B192D58210BC4BCD9F25E5F0A7B3B4D7FF71B68797EE8D96E3B5C88EBDF0F
              725CA03E1349EFE6BE39BEBCC362BFD34CE97DE93406BE91BCF3E597245CAFBE
              FF15FCFE4D40B250A7D75C46627EF74B0A7C2F76648B6BB867B2B06924397822
              5C2898A01208CB69629D48FD2E688326D225710FA49CE95FF7E5E295C531858B
              E6C3BB7FA60F181FC9DA570C86FAE73FB0D9CF79695DBB2C21468CA0A1614242
              EB5D25C81BAEE7371FCAFC16DA994FA69D8757B623CDA75C649552C60D447CAC
              86A6ABD3991C2E2AFBAA0C6471928A1A2D45667E24ACAD140C546FDC7E271958
              EED065FAD3D0A9FFEA27FF511E53A8051866A2C2D9D848CC04D3AF398EBF09D3
              657FF94AB317663FDBF83BD130ED90B7A6B2041E3C73F7BC87D60CDC098F6F39
              079D4A93CB91CCEE3884790A3BC8817B26C97658C068AAF6F1B8977B6AB6E1C1
              AFA22CCC9202FA577696E1808FD9F4F2D2F298AD54166CCDDCE1738DAB13766E
              EFD3AAAD2901951DD0A1626B24CC31B6DF025443DFECCFB6C3738F6C9F3A70C7
              CC572117A9376BD2C7C4A25DF20F0CA0DEFA3D13B1A1864F266B3D888B153210
              269D86C854D38878580904DF625E974B916FB7F8F32C883ED2075C4B283F7AF5
              EFD97B008A1FF9E9BD467A77EF4E1866DD192B38EDB434DFA2FE12D53780AA67
              C99B141D9ECEF8723B3263BBC70BC9BCA84575B4EF62D1E1A3AC3618E49902F2
              0A5CE3DB9A03FB1D9024352F3CC112E694DCBFB35B8EDEEE9A4725BF56F76E7A
              680D0CDC0879971AEAE058CD4EB8E7BAEA944F9C69E8D4EFF31278B45343B27E
              A1CD771449FDDEF6CF4ECDAC544419D47DB19C09B66BBD8B896BDB382A00C89E
              C9E271304DC34C05A9DFE8245C6856DCC26C15AE68B7DF371B5D3AE6C2665251
              579A0379F939D7BF29E5B5DD75FB5248BC75233E7C585D0FB4B1DD2B55AFC3DB
              7FDE3204CE89D753FEF0AF0198082CA8391EFE7D2FB4F984C58D6F6FDD97DEF3
              7BE0959D47FD3E9CF504C535CDC32A005C0FA5CABBFC111C97243BF9222FE3D7
              224712F57FB86B59FAE9C0971ECD7D824A814362A163BBA7B32EFFE941767541
              89B9485CC63CFC5AE98536ACACB1F777E3FE668B3BADE878A7F6A71F5DC41EDD
              05E96645D131435BAAE699777FD351DB2BF7DF015FFEC49E7639364A8CB886EE
              B8D841F44CCC8458C80B5A76FC21E10A52510AB312F94631A2FECD433384599E
              DA93CFB259AF09F87F4773DD5ECBA54E33430EF4F7B7B7B776683919869C564E
              78CD5E314C9D75646FBDEF827B405571A4E4EF1B63F1F14E16D6DE7688391CB9
              659EB870AB4BF44CACB75A0F7122CFC0089764500965B1954C6846174A581A01
              9DBE6AEB9DC25075FA0198CB7F64DB1D843B39660778CCEA70E0FAC7AB605777
              7A67F6C5A04511592760983A7FC0A94EC31F0C036957478BB363C797CE42AB3B
              645870C7FE81C214402763CEC662B97B6C7E8B64853D66192412BCD18C798A8B
              6A39DE6AB240BE2782AB280A999F62792521B32CD0B199AFBDC46BD2B6BBE46F
              1D64A178D3AC4854B4A99A8EE72AEFA0B98596A33F0D0A4CBAB9CEA20F9CF281
              CB54F9BDE2858E8090BA9F95D6364E802F87BEC11FFE71194B25A5D625FFC1F5
              183649876C063C1333215D1DB9B240DD46523C5BB14486E8F068BE134760F5D4
              BCD5FEB73EBE62B03CFD3AE40808EBB48729A61118223E10213FA79176A69BF6
              4423EF0248355D192BA182DCCDA21AB2CA06A735C6052A3631CA0E443514217B
              10890470E9B40E926A942B30E705DC6347FF7D725B3FA3E57EC61591B7CE038E
              57381B58C59F5A633DCEBCA9D8E8795A724333965DA134EA4CCA65FFF39C2F04
              354C893DB659DEE444C36E761210569C0F484865B0D738C563B148A82859632D
              2716D4D1F872C98949E32F2B22FB0ED2B0B4BA3661C061DF208A29E0E3AF2A5F
              69CEF8310DEA7B1B7F170C0820EF724C50C3696B1E5C2F27257A4B517C652D23
              7462436E4564422C4F8915F65C933FB097D0CCAB7075C612A6899D4E53CE7762
              70601D8010F77553CCC38A16158C2BAA952F92B705E690900D134CE7F9F793EB
              3AFC6E8D4B28A1C9613BEA16D7349DAE92E1629B1F2A25176671A0176733462A
              A24936041F8E64514CBB8ECEFDD0EA028CF22B56AAD233856DED12BF545E1890
              BCF37AE36F4B0B60CFF9828632FB7A0C7D5097FCE5F3D8AC501D7100AD479132
              15B64D4AB22A1FAD8FA2D93E125360B9039FC25581ADDAC19DF8C7C3C889A5A5
              177D634B1BF7C7EC4047531ACFC1DA29C30D7C4F9F2F5BEF6AF46D0135B4251F
              FBFBCEAF4B5AA5B67B8DA5C92BF999352ACAA7783594AF142573C28B44FD186F
              A88C502D2DC7F341B4CFC966F868EF62B3723240FE46141869F8B3893BAF40F4
              FECC80A36E6CBD5EEEE9F36170ED84AC46D7E874F29BDEDCC599C39D7B5A5C99
              3C4B1217CBA39A95B34E07E209B68A869FF61D5F24F321D91A66C84E10278CD8
              08683DB414E74C5B1677DE311A9E6E79119EF6A7190DAF934A19796E0BE4B65C
              ADBC9AEBDC051820350C4B50C3813BB2F7667926DEF8F438A55DC4F152E333FA
              D43D3DCB1A5940C1BD99CA605657F16BA0AD952BA61866319DC4BF488B44FD57
              12FCF396D07F7F46C09D3638F9DDFF0A8A2AEDD115E777DF29A2A52EDF75B561
              D30CB03C1A74C0CD0CDDF153AA54AC00E202D05707792602AB66E7EA07652A7A
              76626CA0DCC84760F3307FD4D1EE82E0C26636F02B5629D127A3302C89835761
              C49C25B4A42387F0A518CE42CBAE178F41432D4BF6DC18430526AB304BBE87FD
              5E4350F7D08434961B6669262CBE9CED9332551B354E90D6BCC96196109D901A
              27AE1A1918B5A13B02CC91DD0003A4DCFA359F30EA78E5382BB4ED5D881DE655
              D1099F3588AB5B6027739763FE3223BA64145798EED94B88E9025BDDA86E83B7
              90EC043694246BA971F18BB632A4D3336D64E79C721104E668481187C67F09B9
              E85ADE75982459CFFE3105ED770BC9B2C1D51F013544E725A7CACC25FBBB17E3
              7071A9B1EEB182B5D6232D45445C1A2D3F2D806DD1E15E1CC32C8C80D9D5405A
              96B060EA4CEE60EF4267F267FF7EA28614714CD5779032B0F85AED6D6F669DA7
              A3269B1F49CB3A321A3E389F52D5F0D9870135CCC16F9346F48E435B687191DA
              E0C0EE91B108EB5168DD864EEBB1B27098CF2F735BB3561210C18B33DF8C398D
              832FEE00CBEE5B9926DE7108B6E406628E861411DA599389306FF7964B7E2E21
              F13C6A5156CA91EB0D3A88801A226B6C1B0A4C13737F7EA963AAFF16163CA940
              AF03372FF37A41572BE561322EA3DA8928E420436E26B6B19E7B3B6A2F3F414E
              ECF115302707DDD937F26D8D2C07EAA66D8EFF568ED8C7D4EB472D40EBADD6E3
              0DBF4750C387D6CC59F9F130C0380EC7F3C0D8406C4752402CA8940219B27920
              53B54E2BCC2F3315A5ECC5E76CC6D774BB914EE511C04C40F3013FCB73CB8E35
              33960CDC23BFADD1A5F4DDE8A89CE1499B4A6C536BCE6F8968E97D400DBB1C5B
              3E2F6F702E7BBC761A42C0FF78F7F475D83D769C489DB42E16583CA1A6832A44
              5C54CB91CC4A59FBA519772785C79B09D89CBA3570E0B600D547B084B95B455C
              735A359B6DB95EDAA8AC4054C3B98B69B6356FD8307C7C6000C6EE4C7F02DDA3
              7EA19591AA05CA3640BF9FA22293136277B904A24697C7A546198BA4CD7929D0
              96721FDD97B70604D639929E56B4A13F17234125AAE11F976D7BB8C05CEB79FF
              029C6793D2D25249940F483B4E28D727B0823AEA58BD975823C07B3413A68E0A
              F6CDF2448B43DAAE8992F30BECD7DFD3E157C3DB0ECD7ACBE712798F4698774F
              285AB0A050CCB6186F903F30D4B29975765123CF8E092E8D4216AD8B26A879D1
              18D64ECE7B4B7A299264A5492D101B0EFFE4C10FB90561A21B551BE81E0948CC
              3F2C6552D5823B6C868BA8D0C1200B6448F236D482D9E5125C3B5F8C49FF99D7
              0FCDF41F8E1841B2D2A4E657431497674D74A5CE5AC236F90BCC4BBD457542E1
              099E8984C17AAB890DF006098878CF2749CDE240C7CDD6640A6851656919302A
              A575CA32BFC0B21BCFA69AD4FC294AC77C69EE8E0719B48148EF6066AF8B7262
              8725D6F0374C5FF02A2D5611EA366857A88D487FF1C26E68B23DCCD5DC3EA906
              C2968FB1B06BE2DB018135B6A2B569CDAF86E8933FB9477A8C92215A46FF24D8
              91C4F2464B51BC20355EB7497488BFF8A517926986962DBFB417854422DA8734
              0181FDBACCE1678D9C2FB68E96374DA2FEA001C9862037B5876619DC2E05C7D1
              E615764EA0402C240B3436D43491348222688C34D186270504F6AB3287425C7F
              A871297AC2C30B5D548DF04328CCE38A3781DE12B48F8379717775B0D498803C
              54A412D2EEB2FD43FC02FB3599C3CF1A4886EB830ABA7C62817212C15B493AAA
              73C7DD900D82E279A0E433A64C671096381189201BB2FDA46C4828C32674E210
              0802BB79E6C80D2974C8ACC1C8907A8206A50650091242FD21129043075EFBA5
              D041D8C7A1924529D228ADD97330630BA251C686D210E46996F9F3CBE0982325
              128BEB54DBA5EA5CF08D0A7181B402234AA98D7A2F6586646CC202572ADBA03A
              61D6A877F971B99953673974804524256013B7EC025BBB8280256E15828E10E6
              E8D2676F3D46974BC591C46AF0441D0B648CE1C4F54EE0F850E407AA53DB4AC5
              5F78916A687291937454CF86C05A89B87804C5CC8A0111C6850684FF5C9318A3
              D8B92740DF3CA9E764394A0C618E9411AF41F8B6E20264C018F4A9BDBF89CD08
              C92EFDACF1C765DFF495A374D09968AB06F547E03D52321410EA9F60F5447C5A
              0F9DEBA80A088832153AD851EFE527B9E9EBD037079388ADD454C3CEAC03EDFF
              0DF5D77E4399A33F6627C5F51EEF46ADF5176DCF055F93497EEEE2392B292C10
              ED80F881F6A7684CB5ACCF7ADA5A43751BD1E3821E30E4423E14C062A6125DE7
              E25B72142380ECA3D779AB0525E0A29DB164E467FC79986C0533D0F9EB1B80F5
              4D6CE8BA2F595CB6649A34A1E041B47A0BE5C654B516D910150FE942A377084A
              E5E3FB536C1A87F8CB533EAE8D46AF5F6F9115D9D14C01D1A245C63BAA2985FE
              A63E8141BBD41D6787D50B6BDBF4D44F43D845AE5EDFB19F48030544A61CED14
              7F8D93348520F8BBC756E661F784884A5AE7E05312B8CA4B52435A17CD8A9321
              1D2D2BFE58FDB63B67F115102154FFFC738875C89A815D2DADA11F1A531080BE
              714B694E6B91F2A85F595C481A87D7487B19826919BD179D0510D43D941ACB9B
              F574BC1E48EB6D7C9CF96D65A2D3A6994E41096CC534FF4EDF212AC1CFDFF89D
              B35260CF97B183983AE9C15EC076830EEC2ABE9CBF63F059B2AD594EC51266C9
              BA6C93962D9FE7BF48DFC98EA5716B24674A9683B42C764F6FA4B228723D939A
              7F1D1142A7E44AB4523E9D8401B4E49BFDDF41B8E4EFD09C6E235387D2C21617
              2A0E986A47CC2EB664FEA6592D67871157C7FCB573855FA941085AB6E6582043
              1A76F24C75207A26243E06D627D43788364562D1E95468A5A4CDA66AC5775858
              201CD83B20471D8A4A62FB91111D9C35EBF041E199E4BB163DF95D0FFAF11A2D
              CF4978B4C38E72157FEB2B0ABC219E0987DD52C5D7A504185CE5A5081839D1EC
              56088871A3B4F0123F85FE0A8C99373857E2C4545D20E8C8DB373418178AF31A
              9C0A3A8574D601E13C3429D4C8DD3CEBD9AEFC4028219C2066C0A718A48AE8A4
              828DBF7716273BD28BD56DB8BE52AD8A748B4640AB88C5A4F3CE857A8FFC952A
              2A99E6F9BDB3401D4F1ECC0AC275949FEDBD78B6E2EA7F168CF61F1C266961AB
              9863DCB882DC0D8A4FEB0AEE1E92081D10607228BAC7CE17A5D3F645B75BCC14
              4FE333BB03EA279BAEF23BA4C17A7F945CD60E50C7AC6FD3DF00B13DF32627AF
              9F1215973BD68CF357C43969D8BAEDD8368A3D576BA8006F544BE54CBF8028A4
              92F72EF346C622768F9D2FCA7E9E53B8C6CF06470189772694D177E0FB85F504
              322E63B95CAF0F68E28B2FA428979CC8B8B23F57E23AEF07CAB51061ED1E2EC6
              EEB4AC4934F0043A4F2E789CED4566230E418D57220816F7220CDA2C5513552B
              7C9CE40F6C65E27704EB28AB818069DFAD7E60529898776E7F102E48E2E4F2C1
              DD41B87A0EE52E4CD2C28EF9DFF5508EBD5E5357073C4C0F5CA46A9B2FE09B25
              C805B2845401DE5016BAF1B1C9C004247E0785C0387646B5F82384FA9AED7766
              1E9380492636F7D0D7C1B836CEA6A18CF9FCB94DB4E246BE3A687FAF1ECC10D9
              DA22367BB27B08E76A8D9444F0789D85E9424F628AE24A827D33768FBC972EAA
              5AE0795E6AE2E41E1048853240D379A4BA8D68A5B6377247662C96803113CB3B
              79148270B59BFFD6B962B077ECF6495D9BEBFE55E79071166E4F23D7CC03289A
              14DA32954D3C221588EAC7C274EC9E53AFBCA83021DE981905785EAFAE669AA6
              10504C11DD15A40412FBF89580A2DFB9DB8EF9813DB3A1B23C08574A1CD4166A
              C13DEA1FA0884C105787EA092F72E3B2F5FA64F00E60D92448BF0C22A805F013
              79C48BB6EA3A0F3BB05211D0B394CC60F1893510398296B6630674545402A396
              0EB20828018BEA737F3AB6724FEE5448CD6EB69A8E07531204F6FBFB7B8F41E6
              137843405AF0CCC7A87D5DCAEEE94CDBDE2CCF76CD282C9470614FE85C10A3D9
              59ABEC9E682C12E21AE1001B00693F91B2B0AD37D6D17E1593432C37FA9500AA
              94172525E0D94A6ECA8401C9B414B29CFDBA6F6A1F45E4D7E9EC73977F8061CF
              4157B75032C83B4856D5B93A86BEBAF99CA7F68047C6C59B14D107BA7743C7CE
              E951D89ACFC54E03D4067E955EE5C7A510108554E208F895406156B21298C7BC
              CDCE54B775FBA84782FF6CAE5E4314A17A9AE6EC3043CEE35D2B15D1F1BC9D6C
              46889FC4BAEB777B689244111A4AB8741E5DB5A27B0AABE7319068F5EC3C071E
              1D2B0414EDA002AA515B65A8567C077BA39FA864253899CECF8AB78DDB1AF503
              483FCC69FB9332B2003AF23D38475BBC9CC6941D3F9899D59E0602713D261A38
              E731939834524F587EA8BFA15616A9445C8C74420424A89FF01D4C0F4D0EB174
              407630E46DF90CFC77D9A1635C60F787ECC70E6DED2FFBC5F5422C3BC41F713D
              5B12EC374304248FB3686CDCEA91EB710854F2FA792E208BC7A1981BAA60B894
              DF116CA5408544FFD9FE230A0EC902CBEEDDE8FE95E73F39298BABEF44BE3D89
              DB17B2A1427F2C55EC2C803AAD589A96C8D1E6AA1586994A34AA002EBF8014AE
              9E195D906FA65F95A55F4EF439FD3A2AE05AB898CE7A62024B1AD7E8D9AAB3DE
              2D97C495BDB20708B8906B192EBD5BFCE16ECC8E14DE8A391AEC9E280BA3B908
              3328F95C11A9211558B14B090EB7302CB26FD68B3F7AAE281D08B8E0D575910B
              6CD13BE765714DCC982FE2925692A0A689BED956D18CC52C370CCAD02194FA83
              70F1869AA648E0B86F8EAE54985502066894E991FF9FB14458423AE29C2C305B
              DBE68A646B61F559C5F3BC966BAF49E2EAFBB05C031DFE89B0600DA9C01AB281
              1865A98CA89814A26BDD62098DC71B310A6201FB0D7D08587289A1CC824A80DF
              11A8B651EFBD3BF64B02EBE5117FDB6C61FAECE1A502B0BC96AB4A2471657FE7
              FF3E052E8D01EAA882DDACD2A3F84E5375704782BAC771A18014210B6F31656A
              51DE3A3DA5A23A776CA52035242A94F747B9022E78F51F54E8607B553B3BFBB5
              90D3C6E7736F8798F6FEDF641ADB6713FF2D073AB3F405B53F6956E0E20D354D
              2C6CF88128A9C0C0AA9B6AFF3E0E92173728BE9D54C0C58EAA53361C028566B0
              5CBB1696BC292CAC9E7AEA807C5C61528B22F7547AD47D023B372EA9DDAD76AA
              E8B7BAB135961FCB4B5A98DE261073DDB11F838A1A107E8A12F42E7EA85A5D6C
              89A27BE6D08364E4EEA9C4FA06CFC30223C0506AD42EC560A9A47D134278F2E1
              48E87A4C58EDFEDCF7DFE543F67FA577518804815F384A8A66DB990AA44095A4
              953E33B00335BBEC04FCF1DF4E08B57A642A05108D4FCF6622E22B45A5343998
              36DA95EB88588D49C9ADD19561A4463A1A508203B7C1A84D1428C917869D36E6
              4366413134DA92628F41FAE8BFC94F53872E6D770196CFE3A7AD5BBC222DA313
              0A632CD19561A44687F488EB8834849C0EE7146E31D6F2FD01BA6A116D944BF8
              38A479DA4AD52DF08B61C34EDF724032B1069B2DEE5476510056F6D533B4B851
              0A7CD17643091C8C962A118851CBD245FF0C9F3CEC6C1D914BB4184CA6435335
              0CA215E362AC55B19F8460CCF2516E263F7F2DCD22CF783FF76D41557EA312B3
              75FA22539F23C392F297A13B24E2C0E8220C2DD36F0F855C44B352C48FBA5AC4
              85778A31075858B8AF362A940021F8423E0EDD266A339A977FF74860A5CC207D
              41155435FC937C1D0E64D47591978DCA3383D3D6C01FC50CC7E67188C193D43D
              C9CC03C3AED4511FC715EA98827CB3944D271428D01DB09852A9E00BC2EE115A
              942C216BB9DFEE6840649DCDAAA2CC3289095BFA1784E57EC61571F7FED15DE8
              B9B1C6AB0F47CB0A207CCA32606CBE405DD4E450488DCB8B3B2D41403CACCE7B
              EC4CFB7DCE3900AB6A4F8E1B06E2FE30E856E147F6ECE5B305F1F5FC00454C87
              F2C42B634CCF07A1025AF90F73A06CDA91E9004B4CFDFE9BF6DABF493226F029
              2CE806DBEBA5D7895C1D20F440DD0693CE30DC4A3BC484A7C6DA7DD6333B3B4F
              E3CF32E2D47B0AE9F8A4AE414BAB67EF93EDECC1019B8FFD90142AB3985B6B6B
              46A5FEC850A5D64027719639F767FAB8A2841C6FA9749AE5EA5377DD523B2054
              A9D8812FA2D4DC2CF1888172A11EC5E95DAF152725D17B05A2AE9367AE4D88E5
              0F73BCCEB4E28AC3D0FD1BA88CCEECB93AE40BD3EAFC427B5C53FA954361679D
              E3AEC68C7074641161D77E4B01EE522E0AC8AD2D48FA3F0BDC76147A5AED674C
              EA3DFC72D986A4B44CAF22E08BAEF584523FEAA856B15E948B324C02073F17FE
              784D12523F28CD1F231DEA3225BF263FE3E3B610B6A5255F0F40EBD32B93294C
              923321D1917867D2BAADF42C9B2FB31C5315727CE285D1F9597E25B87B53461C
              ECE38F8B2BDECFBE33E866A34AA5A0821870221F9A3522CBEBB56A7A6AF4044C
              F5FC8DBDF48B0A30EDDA551BCA08066DCF301EA5AF33BF03D360F5AA33E1179A
              0FD805DD061CAF903572D08AD370E0625BB0AA5828986A2A8D3272A3EA64D407
              EF55999D361D72AAA27800D9BD3A7F08B24B4F2BBC7DE12952CD55FD9B751475
              52E30E9105CD2F87737E4E8958F29247B0D30F739A6F7C609DFCEA84F5D38EA7
              D5E4E767B4BB76B4E7EB5D3FF85D585CCDA53D5EDDAAC3BC28D439D2F45165C1
              D3CCFF372EE3D4A3AB33DA1522B29EDD564F124EDDEBDE41751CB17DF7E9D580
              33E0419DC6E0F57F15CD2FF3AD008A121A3F585B0295D12EFAC7A38AAFCDDD9C
              B307FAEDEF7D988FE6E9B03FC237E5BB8896F2CE362E0EA61D38D389346250FC
              3B6862F0C8EA51C16B57EED61350053420130A50BF2FB08E28D88BBFFF795B3A
              217494FA3FA19D79647546962CBE711BE0D905E1E4D5F8162F9296FB426690B8
              BA8D7E01C6F8BF3477F3B437C2BC6FC26534B825170609BF9267D4D6BAE48A9C
              3FEEB5F89424BFDB4AA29ABCBEF7E1301F0A538EE4F341EC5917BD0765170E58
              D6B017A0D19666B9FDB560712DC0F7659C52CBB0322C61BB0053D01250681541
              2C62A9F09F1318682AAF94893EB2926CEA52F84F04A67D2A35E3C369AFABBDBE
              70C0B2861D6C74915B9AE6E139C2565B595AAAC129AB736249645E1FE7A8B0AD
              67CAD53D0033DE12AB65D22EAF205C09456CA3F3FBFD63A19FED3FD0401B74FF
              A449559BA19F91E2A0EAEE616C2CEBC4A2B98DC0EAE6EAB19E1D3125B4339D00
              470CBCFDF7F43BD8302C061BFF29AE0CB56F55B0FFA2F67CD41CC8F8BEBECF9A
              A43E1567FA18C6A3E98EBA267DE94FC9F0C18120BA8F82B99B1A5E46DACD55DA
              6D476F05C7CFEE3B4E56C1CCF4F7B0DB03931B5A89847101F4538FAC0BF96DAB
              70B89EA70308FB1D0CF3313DD34EB5A89095EBEECD6C60A94D38617FB5EBAAC1
              0A074DF973C30263B0F214B1CA851DD34F3CE41710C21A854A33C0EA2C85CE70
              269C517800592577F34BCFD1192921B8346274C260C1840F14EF9784A468088C
              399629E7F74DB8F497BAC1A291A5D55159E0B686368776739D1DFE8972E11731
              C6EE4141B0026D80159CA59D619D70A9CF3EEA28018BA910232A19579C3F2C46
              5843603B045CA14248C1C09015338FE4E8C9C8F6F6850F36ED6C466BCEE3E420
              E30E4BBD5C8FB072BE50C0BA706C5CC6EB8F661F97E4829F37AA1E131F7D053A
              7B997E8EDB40E1564FFD9E97B82A1AB595022EA945EB4BE0FDD1E83B70A42872
              09272445431BDBF1973D522087369E0F85F1992D2EF4811DD22A525BDAE57AD6
              C386C09A6D7D0176DCD1AC7B3507D673E1E0F59F6C8486DA68CB7A0C1D9962A1
              9D7DCC3C59B4D7198ACB5CEDCDEB381D6FCC3C02B71FBEBBA2519A861EB326C1
              E53612AC7EFBB70F46767A736741D28ECCB8DE6C8B73EEB9F0DB0DD334084BA0
              8CD9D6983919AFB76A4B1E84807D1ED775FDB26F1BF9F6C19F43CFAF38114C58
              BFEA7B31F808E68D57A7E5D41EA63869FFA4751041EB11BD27637B2B3662FDF6
              E3D3B55D6149F902C8BDDAF7B5CC9E9B50B9A7EF0E072CED3CE4940A47042E88
              9903FD1672CB22601F0EC9CFA96A0C1600060DD9C08C000D6DB5705C1CAFDB04
              1A19D7E71426F53B38E55F91E082FB309ED91135083BE3F89ECABCFB2D5D2163
              4CC552E874D7991D031DDFC0A2CBA18B27D3CE3FA2DEEB969DC06CEBA67C38D1
              CD7F1075F76AC8877E2DDF6DFCCBB38EC2C477545944A053FE092F096C4FF1A1
              BC9C19B9E8D01C122B061359C7BA47FA4322E3474ECAE87A82946752811B5577
              3C85371F9C5C804A58B97FF06D1FC57709069672B9D570B7CCEF0BBA8C03D8D1
              B14DE0E58BEFCF69CCB4A436600F2A60D6B72CD6CB3CB2A47720A4F2B1F55172
              F6F2EA344A52275DFD02A536684784B8481781DE876D50FCCF84EC1AC6A419F3
              4FEEDB95D24CDDA2CBBE206003E0F4AD7AC69303FA7559980F19AFDF660ABCFA
              393A8C487490B507D60DDA3E612311089DCF2868A2B8FE90B470F27B282E1FD2
              466A44E625B5BBEF9D04A39E1884E170F61B536E2083DEA7BAB2875E5832EC3D
              D3C6BAA838311F4E035BE22654BE895B295D801D432E09FEFCF3351B60FDFBFF
              89F48B91393C93D7D31F4A77E1FB3E72F02EAEB7F12D9FCE6A0A87C66FC8D91F
              A179498DAC2CC39061FCBE961241770B84D6239D4383550F9719DFF921106465
              3D720DBAC038F6B85FCB8706091FD3B3AE2642CB92DB94F57D3ABF4E72C3C713
              DF59E5FF9979515E1F8C622B5ABB1F99F4CEA82D91AB216F3D6E238391D3A649
              EA9FC9D460BC560217DAFA396DCA956D70E1CF27F261DA3711AA206F0FACCB9C
              3599BB32A28ECD6CB8120A455C796DE6C0EFD7A175ED9AF48E6ACAD5266FA4B9
              9BE629FD91308B53E210DC7D1ED0FEA42E0EFCFE4B86DD1BFB9FC115C1D1DE8D
              E38FA2A9B58B5805791BFD9F41DBB3BE65CCC8A8E322393163B588CB2F2EC8DE
              F77B68921A4A6DFC7514CE8ED5D7852E133893E8E0476384E70D09D12FB4CEDE
              C78A284DFECEDE873D2CDA629C98BD870B0CE8BC4A09178A8B727B1417F487FD
              777FDCE46FA0D6C344E5B0C98EA68DFAC5FF47AEA19FB3491A28B5ACA37D80A6
              7146F32C940B4C8C37900C29D023B7D5BF59B3A6B0A1A2494C98539511D9474C
              C98F66F7B7F035812D8436FA3F13AEB228935147B61CFF06702D9FCE0A0939A8
              339D539BDD8C1ACA6DFCB5BC49F8675A4571C5E1066FEC69B55B896DD6AF496A
              BA02FA07467D91E11A40C38361E2134A5CE75B3071317AF7DD6E6D221B06B7FB
              AA92583CD12F363A3C38845455C64AB8D3AE45DF9CA4A4F6C0BA47F88189441D
              3D2BF3AFA42870BD3A8D898BD9D5DD85876EFA6B4468DFEF618F32E24039556A
              02694221A7E32F0405A488399C960650C520F3080F3A645CBBFB04C405591069
              6CD848EBD11E297E4FD89772BCADDCFFBD19A20869BDDD526F4960E8C30EDEC9
              7169E9DA91CE01716100F7ABEE1FEFD11EB48A0B6EF87510F136B8549602717D
              9F7DA7E8DCA3D8FF0F48F11DE99EFF78B30000000049454E44AE426082}
            Background.Fit = True
            Caption = ''
            Color = 9121556
          end
          object paImg2: TUniPanel
            Left = 372
            Top = 2
            Width = 224
            Height = 193
            Hint = ''
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -19
            TabOrder = 2
            Background.Picture.Data = {
              0954506E67496D61676589504E470D0A1A0A0000000D49484452000000D70000
              00D70803000000BEA3348700000300504C5445FFE3DACE74721B75BBF6CDC5F8
              D3CAAC593C723D2DFFFFFFC06342C7EEF9BAE5F16CA9BA14639CFB9D92BB6040
              0C4A6D804430FEDFD7FCDCD38F4B34995037ECB6B0B15B3DAF5A3CF3C7C08546
              32C1E9F5F1C3BBA8573B7B412FFCDED5B35C3DB0DCE9FCBFB8B5E1EDBE6141BD
              E6F2B65E3FFAD8CFD88A86E7ABA6A3543AFEE2D99D5238A5D5E23D281CF9D5CD
              71ADBDDA8F8C8EC2D1DE97937A473882BAC999CBD9763F2EDF9E9A94C6D5B85F
              3FFBD9D1F9D6CDB89E96F7D0C8F5CDC4753E2D936254DBCECAD6ADA29ECFDDD5
              8582964E36D07977934C358B4833DCB9AEEEBCB5176BA97DB5C5F4DEDAC3EBF6
              E4A49FABD8E576B1C188BECE186FB1F1C1B9874732FDF7F77E6443D17D797FB7
              C7D17A78D37F7DB95F40A1533979402EE2A09B15649D0C4E74E0A8A61A72B7F6
              F3F2ECB9B3D5827ED78885844F40DA9695BFE8F31567A3125E93105989C6EDF8
              EE948A75ACBCE5A9A3795F3FFBA59BB5887BE8AFA9DE877F956658956D61A686
              7BE9B2ACE9C2C1835547DCE9EDF6E5E4F8EDEC844531FBA196FCB8AF0E537EEF
              C0B9E6C2B76C5439A3BDC6725A3CA1776BE6B9B8DB918DECCBCAAF9289CAB6B0
              F6D8CFA0584F70ACBD85BAC9C1AAA397B4C1CCA499CD7B75EFD5D1C3998ED88E
              8BFFF2EDFFE8E1FECFC67AB4C460A0B8B890834690B9EFF4F6B0847CE3D8D465
              4D33FDC0B6E4DAD77EB1C02C80BAFDC7BE8C5A4BA16F63EFC9C05D402F8C6154
              BAC8CBFBAAA02A607E856A479C6A5DB76A63AC625BFFEDE74288ACFCAEA587B3
              C0FED5CCFCB3A9D2C2BD5596AF3D6E8AA2876BD8D3D1EED0C5C7DEE5568198A6
              7B6D9D92912E78A5EDDBD6579CBAC4D0D5EDE6E3E7C9B997CAD8DFB1A0B1C9D4
              BE9185D1E0E53988BA678DA366A4B8AC7E71E4EEF2E3B0AFBE7B79E88E85AFC1
              C6136298F5F9FA1B5677C57052789AAC2E6C8AD2C8C5C5BCB74A3425A7A7AE51
              39278A9BA7855B47A3C9D3D39684796551F4CAC285A4B68E4E42BBB3AF875147
              C5716D92867E8E7C6EB5D4DCCBA1A490B7C2C68584C68981AA9D9DA95F46BED9
              E02376B1F2F1F0BE888B244F6D54596EC3C3C4BB344AE6000028184944415478
              DAC59D095C94D5FAC79F011BD9714660580453941095455374C40D02C354D4EC
              2AB8DC30F16A96FFC85DDB4D51AF5B9669D2D5D2124DD3B49B1608881A88198A
              840B88920A3280A083027A1DF89F73DE7536E67D8701CFE7A333F332EF3BF37D
              CF737ECF739EB38CA4239859DEDD105C7B5BE798B42122C3E9A179D7932A9ACA
              A867DDEEDF83BEB6FE7BCCFD66B848CCE55ABD2CB854AD73CCEB568F92E0AB4F
              5AF37DA8A27141646B5F79065C494BF5B1C0A9D6A9CEDCEA3240B6AF31BEBDB9
              4ECF2D1899A57B30E4BCC2B7C112D5458ACBC37AD8B0B09DB952A640B3B5CE31
              AF5B109EE9F8C84258A838A8CDAF32F3B8069C03B0D23DA82887D87D5D6F9B73
              3D23C5E9497DDFA9CBDA8FEB741840E75A9D83A8BAA6EC0F3F29E07429F7D4B5
              ACE5B7A22A33CF16CDE24ADCE858A74780AA6BFC11B76A13A77A0D3E5D8E1FE5
              36D2D0A3029A6237C78B0BAACC507C73B8929676FE9F5A57F7507541ECD54B2D
              9F19524E41C9BBDCB96E2B4C609C3AAA56168B073387AB4F417378A62E57C879
              F02B6E5135BC9E122845AF219B1D4C552BAF48ADEADFAD160D6606D78073E127
              EDF5FC94730D4464F8DE347AD624CAFE460C59ED68AD06310581ADFCA0EDB9A6
              5F28E87A5B8F0B9BA1BBCAC6986D4D4AAB21541EFB1CD5D6A63EC100D8828D6D
              CE35E09CE323E973BA5CDEA5A0A8B46B6C91CAAFACDEEE91682A0A6CE01F6DCC
              45AA4B1A9AA5C385D4704496E1184A6A435C8262F0113037C8727AFEE23171D1
              A2682E5C5D20F52ED60EA3B0198E3FD26CA03268B500E7DE397652830D4BAA78
              D2C0738632B01DAAE7015C2A175788D20EB15CA4BA40EA55A2ED97A50D48E5F7
              59E9BF7FD27EEA312203450FFAADCFCBADA4D6E0E7C86C3D2BF93EDB412DAE89
              89E522D5853024C15AAE0A35AF1E257A21085B593D1EAA82CBF5B55D2A2BD7FF
              047933D84AC1A550271671550DC96E43AE45EB3AA9B1D9D9D76B4582A87939EB
              B96AECD328AC01FB0CD820AD266C91D94A5D0A8D3A6B8D64F1BFDB8E0B851AA4
              52343ABE8A782FDDE6A5A06B432151757EA4FB8599AA24456EE359682AFC1891
              21265214C9953285FAF21A67B5566CA101B0AFD7F65EEC179F7252A56FA14CBB
              C350DDB996A4E1DEA11B6779FFDD3744B87488E3DAF5BAA28A3C71AA95D0CF48
              C1B2A17500613DA4AD6CCAAD1CBB269DEF484B3F2EB2A883E45B97FAD5400795
              D6BB826F3F71E38591F675229C9838AE7737D0D6E75DBA62352F76D7970D3E96
              E3FFB4B1F826F8E20574939A9E6BA8A75E2AEAD8BFD047C02EB4504DCE4715F6
              57DB704DBF604D77F3A50D23B27886885A925F315F36B03FA3FEE29BA3130CF3
              A93C3B9439B9AA712D0DCE8FCC54F4DBA7F54E856317AB4BDE1709DB8DDBB8C2
              D608EE648AE25ABF80FD8E1AF485394544B2119EC917129E646807575A723139
              B7F629AA96C16E998A22F6209245155FE3A54EBD73D19B3A77BA899CB3604914
              C545893CFDC579A9275C3B5A72C8C7E2B72D2D8725AF7142563778E4EF27B943
              4E2A83B2482AB5B343A3EA1BA1E90E315CBB5EE7EEBD77292FF784FD145F0E19
              BF85422B3E56C80DBEC372C6556537E00A4F2BE40EC6D3024E4FEA83EFAA0407
              1D62B8DEDDD0B384798E1470FC91E1A7E9CF448AA1CCF9C741EE6FF45757F352
              C2DA6ED80F55C0609B4295CE47A00667F4E35D242A10AC1C62B8FA14F03C9406
              29E0E0ECC939651407EAA43C9A7C1450080BC0E8226A827C57CD8ABBA2B1F9ED
              D530587A4565E0433C6B8D3A68A93203842A8708AEA4A5FC5C0D49D384A7A3F0
              9B70F8152F5FA5FD76D4DBC20F76B64F244815089F57958DAB671E62426570E5
              75239F236B344A665FF7EE268B737DF23E3FDB445C164C6694393C33E67213FB
              4DA754582313EBFB129C283070A1BE9F15EFF9245CD1AC32F649F2EE170CFFC1
              FB6F98212CE610CE357DB756088F8DCFA9CEEE1185E1B14FEFFD7DDFBA9F08B0
              EA4C4CE7F31CDD4CE7DE9A1F8EA3279BBCA60D2E7C60FCD35EAC34D8D06CEA05
              F62F8573252DD576B028945384B33889FE00D6852C4062EF94E32D5F6E5397A9
              A0F0BF62B4CE4824A2571CD449CB2DCCA56D8694088E3F429ECE9CF64186D0CB
              70657B32BA0B8A7AF7071C9B7333F767F7EA06FD76A691EC8BB52C978E1912AE
              1E257DA7258A0762CA265BF9B496FE3ED8D6E5A0EEB126905896EB97D13A996B
              C41591F195F92354A464FDE558C8D39699CE2F3E7C4CD9C018B7F39B6070A16E
              5755764F58B75930171BCA735CC83FAD6D4575992CD1E9C84DE8F4B387670AEB
              5D0AE65AB48E84B95227A69169901C6684B52116E29A72B45E2737D7AD449870
              08E53A1D46751BBD071DA15A338A7563F7A50D6F4BAE551FDB3D0A6FCC5154F0
              82168D44986716CAC57451BC3B58513162C8F91159896BDB120B19C794149C45
              007E0B6812D65711CAC5C4BCDEA5EE4C2620B020E2B8B093CDE602ACFB1119C0
              F39C02055128D7A27554082B6D884DC14FBC6EF9157FF78FB6C582FE05C49FE1
              5431DBDD91DD13D40713CAD54C8F274B1BC6A7E14E9873CD8AD59BE6B531D792
              4DBE24E4ECF15065E77A9BE11224F402B9D84414684664218BF42EED5132737B
              1B6321AE9E547E00F5BB99E92202931C02B994BF335ED9B926F66AAD0AF72AB7
              CC696BAEDDB39C98D078FC111ACC412D28DB26906BFD02C68D28CA4764D939A8
              1495AD0AA184955DFF7254A30E9EA486076659AE01E718AD9DB41FECEB15CD0D
              75797DDA1A0BC2CFC4FCF4FC6D3ADD43835996EBDD0D6C8F5E83AD5DD13DE7F7
              016DCE951569D79132449C43187F44F1E08985B91237B25C8A720C062BD7D608
              3AB355450A1E4C2766525A0DC96E59962B650A9BB2C12306A8431976A156D099
              AD2A4B36692525EDEBC34F6A24820244815CCDDC742892A28EDDF7E18AB6C742
              8238F900F7CABBC137A76791B000513C1749E64AC0FF92A0135B57C2CF68E51E
              BCA425C18F8A05E5460573710611721EA6ECFFEEB3DFDB816BD312EDC127189A
              157CD192EDAB19B8F17F64887EC5CA4BED201B003F4CD3190475558165B978D9
              0DE71AA7BABC61EDC2B5355167944923B124179E70C875829C6A2332E6FFA71D
              E4101BA24EB608C5BD16E452FEAE5061A7C870D9D7B78BCCA37260AACE94C66E
              2516E5EAFC841BEE42A16FFBC83C6043D41973D7482CCBF5C8FF223DA8E7750B
              05BDF94FDB870BF72DB594C3D25CB52ECC74B590F3CEEA1F57B487FBC2656BA2
              F640AE4BA585B9604406A54DCE2850DBB2A73DDC172EF27FECE45A36E0785ED0
              C883082E45930A6BA2B40194397B37B51B576865013F39EAA0B6601E80707949
              DD72109853ED88AC952B42DB8D4B1D960DBC352396E702E7A85B393D9F94A2A0
              3722AD7B9190F32C507CCAC3B215BC14E2F04C8B7379974EB99513F3130AA2CE
              8053BB841BA8C8EAC2B27B76C964C12C9A67A3B8F08A060476561591D6CE5C45
              23B280F632B27B16CC8B525CB88782C0E0C709D0DE5C30228B967B0B7391FE17
              EE5222B0BD53DA9F8B9D9C6FD13C36E22266E05D8A27D634C133E002F73A5261
              161D77405CD4B08373CD33E3EAE1568E53D94D961C27425C947923A7FCACB820
              DCED80A5C7BFA6EF06A066E579974AE0197141F8F532C4256CEA97E0FE32331E
              AAB8FBCCB87A3CBD2DB4FB25828BC9A03421AFDCAE5C875F255C938F2AD40E65
              02D3A282B93A77505115E674BFBDB9DED932FC247AC4D3F6AB9E080CE70573D9
              3954522BAE3592F6E77254535C60F1F91B7D0AAC64F748AACDB778FE66F4D06E
              71AF1E97B0A9B082C71DAC34CA1C9C42199EB9E52D74A0DDFA290C97273500E1
              AAB2E83C22C4250DCDC2A3D7AEAA0F3F6C5FAE3F4231D7F3D4F8B285E747256E
              ECAA6A187FC44E2AAD24CDAB3DB9869DC15351292EEFBF2D3B9F6DF5B2669F5B
              78C8B0A83EEC940E97B52BFA6F2C3D8579E8CF50A5D13E37A1EB7B3A57933F5F
              AA2D3B72294027FAF9B42FD07F4FD8BFCBD5C3CEE0D99B1497D07043F8386CB3
              35FABAA81B44551704D0F928F99CEA64FDB7C75EEEF860E8CFE4CBC9DDAE85E4
              E9FC39E1EBA0A64BD42DE90436A13B0C7CE0C006E603B4B85C2A05CE3417CCD5
              B304C5BC109EB9924E8892FCA1DCAD5F4A4BA7CDCE85801458A95B5F10970241
              80FFD442A1D1E5EA7D715352182EA16E59F83C07A787641183E4BB388ECB3D66
              878073F5AA0BE0D3F7059C179B779570A1AE5F33B36C4AE8343D31F33770E70B
              DC554D2C97FF3521A78E3B6DC085273C4A11706AD0AD1AF0BBC1E712EA9685CF
              23EA5C4B96318C3F42E906384A7CF2F1A3DF20AF9D38727445CD4F89DBFE59F4
              EFC5BDEC8903730D5ECF7A3207E687FED9F745FF1D4306FF1B3E32CA35DF2D0D
              3DC6EED70CC985B0ECC9FB682E9B7A812B540473055F228BE99CEA36FD1F3930
              3800D9A09F7F6E9591135C6955B4AE30FC776B39F568341E937BBBA4E1351398
              0B05BE149750F725980B396632B0ECAC266114B844EC8DACEE7E58C0991A23C7
              052C3CEFD9251DA253E1623F14F8122E69A3D0052AC2E71F365BE306E6579C17
              8C5E2AA58A3FEF57093AD318D750210D6554858BD34F2490B2A5826E4BAFE358
              BFA067094E4729A87823F0B6AC44D88946B93A340B39BB77A5A743DC7C147010
              2E974AA13B3B08E05A726717C0CF131D1F51331C30974B350CAC1606A63C6DEC
              0FB9424EF72A079700EC980997837A1D9E6C36C7D5E4045CD35C51F66449EE73
              768DD4B2573AE008FD9D674813B2461730E3DB48D98E81356BA31263038032AD
              09E4B48AD07AC896D02B7500FBE290D0132EFB3AC205931FA5B69A6BE67608A9
              4721D44E2BB21640E5DE4473F9502B635C3BD9B828CEEB9ED5B5A9A6BE98BCCF
              68330A2C44FF8D7AAE537E03CF2DA058E4BC7F36735B42B36578816C50812FB5
              DE57762F7F0280DD0598B3B3B55C4B3F816578C1D699F0666B5C612EF758C7EC
              D3E737BDB753F7DD3A2C6BF4D92222982F5C3676E580CE438FE543DC15BD9D99
              460354E12B2B0B6B70B80144E80917EA24E1306E79127CB0A6955C0B57C7FE8A
              7DCCAE7FE1CC289E0AC0051CCB7FF4A76AA37328603B2CAA212F9B61C86B352F
              AF4575F1A8EF8FB78C5ED93D061A73FB1C962BFF26EB1691FDDECF66ED509913
              70B947B186E25AF5BEA39A703501F162F2975396AF6F2557F0B920BC8218A2D3
              F14CD890F32C57779B4B2830A7DF1551173F0ED6F7A39A73AC55D38C297E776C
              7F1978A74C63F4C2EEA1372FC1B0872F6E7ADC0890834FABF85D026381C41FEF
              6E83D01DC84EE42E37D0813F4297AFC25C4EF7E939C5C1F9032FB6926BE6F617
              70F8494F55C21B39D05C8E0B6EE7C240DC49D97EABC31A507D69559946FDE5F8
              46B79EEEE1312F4A966A5ABE76A06D3FDF15F7EFEDB6EAF91179FDCB66B72E63
              A70D75A6260E8FCB8599FF75C4AA39EC8CA202C7F31A09BD12C1FF9AA9066692
              6B683AC5859A2A9E82E8FC98E172AAA16A2B42493EAB72ABD58331DE2407767C
              4148976EE14849AD06BCD7D2A503DD5E7D0720A3E29A551C9D3B0BF0728BF741
              6DDA3E359DBC9E95DC813CA2C8177339A8E90531FED7224E438BC524D784FD88
              4B3EF4285479E289148A071C17B88F4B9EDCEF3CB5AEA9FCF89DEB7B5443F1D3
              253F7B0DE93C0A3F5B58996CFCCA09891FE1538BCE5FEB13583687E672795381
              9F2CAD4406176B9F0C14D7DE69934FA9702F655D22E9BDF85F9B6C2284136087
              A8FF147A0E19E2629C180DB9C2B62F327833807124D37BC0DCBC9A8FD0B35F16
              81D7121FEAE8C930A3A6F8A90DDD43FD108EFDF1B01F7E169BEFD56FA81F7534
              6AD841D4659651FB20AC7ADFC90AE7DAEE1D1E0380EE73BF0BADB6C399DB916E
              486253D6CDEB8485436AC57031198E6377DE268F45DF57974DFD0BF1FC0C5E2E
              69B4D78AF9C1E8853F60620654D395FD4644C32F7B03BE676F48CCEBA3F103CD
              F54728D94CCB55757FEB6232B92EBFD55C5377A1EBFC2B373F64791CC9D0DB30
              5CC00512C95E774E1C81A2C55E653015BE07AFB231B3C8777B499240BE9CE129
              62C7BEA12C18563FAEC627027CEF55B660283EAFCB68FA3D722A28C129296B2C
              F34D498B8342BFD64820FEFB56722D5C0D56BDE11FEF4766CC22C2B1F4E77C3D
              2EBA64FD1A451EF31E74C1574E60FFD0C1482C95DC7C0230DB35DBB580839790
              D08D63BB9425F0DE4173E114873592F9BEF91A58F943655513B4DA7F45FD1766
              FD580371298AE457B17034D1F121127AC133F5020B4D08BEF233F250AFB74C6E
              081D1CCFDA893E5B2351BAFC18BB17E4AF7E0D634C0488A6E3C327A42B1F7334
              3A600B160E8ECBF396A9539922B3B337339DCF701D7E15453B0EEABC6FD78F43
              158C644C6AE24421716FC20E9CAF71E97B060B07C7256248C5DABDDEBC69981D
              E8C777B60C3F8DA2F9F9C547151500B3935B1FF7C2CA256085CC48326EE0C7C1
              97504F1CCFDE2045C4908ADC5665D67CC500E62386E109E7B27B618E47516FD4
              BA09D69A4AD499E65AB2127B0C089EF4515041D7DB1A0995DF0071297A2F30AB
              C264CC363EFBE250F72FF06284F4EF8B24BFF7BEA98EA580FEF284FDD81063CE
              ABC2B2DDAA795C20A20A2A439E3767A0C287DD3666D62F5558E65FC1FA393BD9
              54B421880B79306488CB7756BF8384A35B0919FE12CBD541E17BCA0C2E39DBA7
              0ECBB6C24D3BDE7535364353DE4B10D7E637B121BA57493E4BEC5CEBA00E63BF
              A070A1475C5026F8CD5C519ED3E15216556033FCF21D0B70C558614374AF18D2
              F18C369770A107E5DFD060C688F41036B7135480B8667EEDD8B1029B61D3110B
              7061435454C86B8638A52BAA644C1A0044097DE03DE82A669B3FE63436896045
              74E3C3F5B5C8E3083043415C28E4C0AE7948AE155871E1A128A11F7AC32C2EC6
              7D41643A99389D1B5E8B9DB2A960432017EA5B820CA7501017BFBE4408BDBBB5
              3976C8CA3CE5BFBA95FC3816E4B560AA4F29980BC5BEB392411E9A6ED7C8E712
              2E883EC8B19BA11B1C1796629C9DFF13A7544CC5BC82B9967E02B3BF027930D2
              0D2D2EBFCB024EC60599E10537F15C9CCC1F2631B74DFD872BFEB5C3648E4D30
              17049F432E4C16A2CB2558E8BD00CCF1CB7E3798675680FB48BEC55F6D2A0053
              A928115CC8852D5B4DB8ECEBC8F40DAA081544A4869AC766C451ACCC7F462DE6
              D048BE7F5F88F312CC8562A9A08B01A391910FCDE2FC97602EA41A9DCD59CFC2
              CAE1AAF7C974556963E2FD1DA66328115C241BB010710DCFE47109147A545D60
              2DDC87EB73ED4B2AA066753629B384382FE15CAB1621D7BC6493EFCDE199B9DC
              3A7361422FB303A8D00879A7EE898C1CFE114AEF422B99F995303314CA853A2B
              B3927F98D66CEB5DFC3D6F228F20A147B1A1594E9993C3BDD3A8457BDD4AD625
              C26B266328115CF004C5BE52B0E9AD2E5EC79B40214410B1EFD254407282E9B7
              1AE18A4CA7E7AADAD71D1EB37DBEA07345707D15197CC9BBA17266F54FA2B8AC
              DD51433C0DC7469B7EAB4E61E4F0623F6AAA2AF2CB1A938943915C43D307CA51
              8CE65DAACC4FE086AE050822AE2E14432583F8FA62A2DEBDD3BAD2938832DEB2
              34D7CCED411E84CBBE7E15B70F8B004144D535DA6F43C5B132F15CB41CEE8BA3
              B7AE925D8CB8DB665C111987C6B3474D0B2212C3A0A7CFEF0033B81839FC8C5E
              9B6D5FB7654E5C4A618845B982CFCDBE958EE71239ABD71DE2C4CDA4200E2905
              C58590BCD6C8C63B5BC88A1B32A827319D8912C7B57209BC4CB87A94CCFC9153
              0B93912F12F9313B12844C7BD32B4C12202C9BACF9B1AFDB34AF4DB836E2114B
              0DC4EEEBC3C54426051171BD789499FC15FAB863B1F05E1897C3C66BB490184E
              4BB43C17EA82F555EEB47982F7C3CAEFCB1E36298838D8786731CCFE1ACB62E0
              139B49EF81D0C2445156648B00DFE2AF67E01CC0BF852D7417CA15F55F507C3E
              D5AD5A511E9EC96B60A605517E3524A84B329E71271888BE23B46C7CFC3109A2
              5C556119788283801C8018AE9803302E0A099377E994FDE5BD58EB0B1010A6FB
              B99774714E4B3828320FC0C8C6B03364CDEADF782A80800107915CB0654E42AF
              25C178A72F89DD0B7F725F5A5097597963C1627AF85D70616483E2EA56921186
              E76D08EA548AE1420D6C99FF2CA787CE35F6F59BB9184D700EF1D3CBBF8AAB30
              4636869DB1EB5C869759CCC16628B07909E78AB1DA0F777D14557883F6C36BD9
              06263C871808E2BA968C6C202ED7DB20BB17711C6109494589E3822545FBC1B9
              BE6BE87EA7BA75656C88D866EB1ED8CE179E3EEF5326BB77682CC0643FA13B64
              8AD81F1BF52DAB3CDDD40D886B3777EBDB6A1F0EB6F385B93C551497502B14B7
              4FFBD2DBD1539D1E6A10D7316E7B6511830FA20A9B8BDA1767F7087C1EA8BFCF
              78EC2D20C16606175EF6E0E47C2B22635DE2AB6C1FACAD16B8B1391B327DDED3
              AE44DC6F9B89E35ABDCCE9E5FDF6F5F9010359A56FA3056E5CAA5719B0D3F73A
              78DE15F12323A2B952A6347B6A2A61F5A238EEE76A4C3730E54CDBCE708EBADD
              3F4DDF73E9055994C973B8546FA2D7E2E127C1B34925EA17C04471252D0DBE77
              CB59BDF28309FB394334D1C052CF3EA0A2F93D8F511574FD3507669637AB9D3D
              67B5FC515CAA37A9D744BC9E684496A81FCA12F93B23BE9DCEDBD7AF59367517
              67882D35B0D4DAABBA63047B123DE0FF10D44265CDA2167C3ADBBC94A761C5BA
              9E45E0F9E561313F6C26862B69A9A2CAA973C9E27FC3E637394334ECC1E4EFBE
              975A7BCE44BF6B76BF8639866F0B37609EB87EFBA3A58A0A90A905CDB737872B
              71A35B47A486785FC5A1E9D16C5C6D3844F4FA60F836F2A421983C5C24EB6C66
              AA86019CF201784C0ECEDDA89A67B0AD7166E85BF4EF157D0A500BB38E1416C9
              8BE7EA53D218723E76DF99A1B89B19C2BA66238628FFE773E4F13131A91DB16B
              93B6C12B4EB61DC80973E9ECCB01233F78C90EC0BAA826371D19700E2F0C582B
              28D16B0657CAEC870ABB12B2FF05EAB628987DD38C8652DFE349A08766532F26
              3E6D083EF5D1803DD4E6B89BA6938745467C12A7F281170A43F0B60B6E2ADB21
              627E6B41941D6EB0760ECEA4B6F7E42B87D1BECA7EA41AB30FD12F76644FDEB6
              F3C05CFC34BE797D8B589C1922D5C0A378891B7B16D9662ADB886BC079D08C3F
              42B991A59F44363241FD40A3C9F7D41C04E6BC8B7E150FD4B36DAF51AF3719D3
              7A765A14BC72940C9F0C383732A3EDB8C233F13473FA87592EF4165061E0B303
              31ECB9B48B77685B2E55597BEC8C7A67D629BB04CA5F5843B81CD5D6BFB715D7
              E644CC452F988B8998B390E9ADB4E4C2B02DC2ECC873042D7EF023AA61C142C9
              D746BD175B5D4A693A35468EB81C546DC6157314342B56333FA4B36425B04147
              4BD900E5C713F58E2D547ED8C2C0115B5D498BE9D113146FBF7CB0CDB8E0726F
              E7C02C7641EAAA45914E3458CBC1AFF2FFE4D9FCB0E3C083CF5A1A0E63AB2BF0
              02D38F5CBD6CF20178FF93B6E20ACE57687C27B1E35F5377B1DA6132CD917ACB
              967AD20026224336B1F1CA51B61F497E0C64535BF92FD2C0C2C339710E3E1777
              9B06133C95C36461ACF0EDCDEC0494D361783A409BC55100137E5294BFF1948D
              3F9176306016CB73302E1961B129EBF50B46664169D7B6E38ADA1C754BF13CB7
              423FA6263DE2090536D09C1164FD1220A3AC30713D7023428BD6B9558B6B5E62
              7F47356A7348C3943B1CC2D26BFBE31E53E2216236620B858E341016379F61FD
              024515140688BA8ED8DFF35D3AD7CFF6EFD7B8C87A49763AA38A96C8E0D08D4B
              0B4BA92E70AB2E7C474C346FCEEF9B2F95A647F04C22CF2A2092DAA338E069AB
              B5836E5CDA58BF83E323718DCB2C2EED927608563900157984D6B6128CC6EA7F
              4E6B52CD22D988A3C2136C96E1CA193A32AFB6D209DEF91CBF6A656E8A76C8A8
              B684CC306C4BAEB4683F15B241044675335B954CA4A530F08288B46EDB70A545
              A3DAC24FAE3E0F210ED9AD03A3B050A80BB7D4FD9E29178B0550E4039423331B
              8CC5DA1AE3074955EB9E1D57EE10164B22B9FA465AABC0029E62C735BEE35EB8
              1353E3DC74BDEF9ED6FDEC8CF95C7903592CF02FFAF8AC3A8D7264E6B931E28F
              13F3D3D62DBE33BA08645E9793A25B056636575E726615432091C063187F3F3D
              CE73939960184B397631D255CD1D3F3C83D8C3F18D45CF82EBAFE3FFA9BBCBBC
              F02F82C21EA07CE892467203A24D91B42D6483119D7E02CD992867B25770D5F1
              C867C01550E4CAFE4CA8872A2AF5214E16A2AFE6A7C8160D46B0900D929B82B8
              D09525CDF0F2DD0BA2AE6211AED21EDDB8ED52FC8B9A7B26904E9F525514579B
              2A120C63291F9F8B0C22418BE6DBB9AEAA51A9CD1054D09AA150F3B8D2A2FBE6
              B32F640F461DF72F3A16415EA04E2E76D122C030D678751AB6419AABDB43DF6C
              FCFB1F5FCE6E67AEBCE45BBC5F42549E1D94ADA8CAEB4DBD8A7A42027CC12115
              8E09518831AE96EEFC6C1DF6E228C0575754BDDB0A27660ED75FE77FC8E5695E
              C473E855EFB0091134E6C30B10525EDDBD83A020D8A71C64216971A9F4F5029E
              4AF3EDA0B9F9997095BECC492116791C232AAADE63279A45C9F6A2AE8BA06E8B
              5C8DD57D6047BAB206DEBF1C3CFD830032E2DADE5C7972BE6600F4B91C790EDD
              EDE8DF06B2734694B2A380DA8BC946869A166A8F1152BACB187A195DE79E4FAF
              42687FAEB4B259407F305D229EFBEDA534D44E5CD77D718D1DB572712E02BF07
              4E2D3732997744615A64EFCFE9974EEEA8820F4F63A298F6E45A1C306BF53745
              7EFC195CC80CAF612E1895F6DE321F6F7641A42C281DFC7C735A883D3ABCD290
              06E372E9E126525990F4297B714555CDA7E68389E15AFCDFA2D52995DDCE6A99
              A1EFCD6E3766915D51820ABE9B1050C1ED769558BE17E2525D8DB4B20E4804B1
              BED0545788CD267D1AC0CE6690915F0CF4EB685E002C82ABB4078CCAAB84C082
              667E86327AF83226631991F9CB08E093C9E44510777DACFE14D1C0315DE740A4
              2D53570177A89698F429FF9645381638C4D9CF37CF1A857355798CFA153FAEF9
              8F56ABF17B6329C325EBD7A3FF74F42D2BBAB0751455816A25B6247027375B54
              2EED347C07409CDB9FB408D2750563DF5AFC80FFF3F4BD7B1E01E87EB38DB976
              BC89E4028F11C514F3654322E97B89CD307B388EC46088AC17DBCE94FD8F91FB
              309B3E42364B8DBBE24E6B60F7C63ABA09E6A8B7E7DFE57FA29FD535CCF57B68
              9B72E50C6D6E261B2B49B46463545AB71B5CE69C01435FBF9384430B4D97A7B3
              6744FEEDFF1C3D0C1370C79DADD9937737946B898C4432280773C15DD736E43A
              7563DD55883C81CF08E04F54EA735951C11B11E0C090594A7AF1B602640627F3
              9836D558EDCE9394C359592A6DEDF47FFDB30ACCD5EB4A92B3F840510057EE99
              613767FC19849A34E6EA7E3392BFDB5C50413378F296F0F2C1081BB8E8DFEEAA
              6A07071E53005CFE6249379DED1415557D718AEBD4705708E93A517457CC04D7
              6245D018F2E4621FA4821497AB5EE3E6EBA387E3F50C912D4276AC748D966290
              CBCC27DB37051634816CD06F7D232ED90A5ACF26842BD7AB00EF8DB2B0B2AEEA
              F8CE79A8778EB9069F55F05BB71E1748C233BF43A70508CEFDCA8FA75CCFD019
              DC4258AB2A282EFC71A36E5EDF764CF6F63EE1BF136F9C6B83F70CF4FF8CBA3A
              B2FE34FBD3748A0BDFC016B990DC67BEB70C7C840EAF6CD32CE175E618AC999F
              51FBE30616F4D094E0467D25156FCD36E7B147716BD621EE18FDA03F4C74B8C1
              76B3BEFEB210C8B680A6B97007FAD017F7EE0BABB09377D774D3DD1E92AE2DCF
              B2C813312FC17CD2A0FB5C2E784C0D1545F878589BB9BFE89D1E001397F9F38E
              D8121594E8735D416A3C4B777739E5D984FC32213DCBB1EBFB8DD4B541841580
              EBC47374324892522A836E90C497474066F588607A86DCF6070F5B4633C4B578
              E4049858795CEB18CBA5ED9611170CCA79294DF7121E41A979834CE7DB725392
              03F4A6B77A38DA6225EC4465A506E574BF49794C994F812AF6E7844A779A6DE0
              6B2DA4F10D70E53AF4873FFCB58FED7D63108E7ABCCA75B9FC8BB6CCF7F3D6E3
              C21AB6F6B79F5BA6DA3341A15F59E896A8913FEE3489D880F22C728F2FFF4647
              A40AE791E347E0B98D87FCA9DDB58D8FBBE873EDE83463E2A130EDDA425C44DD
              E3BFD1E5427E39F4A89FA1A527CAEAA51E235AA0CA39F9690F17FD41698F7736
              56BE7E87B951BDE722B58F4A633E00DDADF7A8D59DEE24C884815D8DA8883ED7
              89310B4B0F4ED86D904B765F9FAB19DDCF5EE5066C0E3588BC178CD6D59D4FC1
              4FA57F9647B72B93B8D62A91640D430F3197D9B6AA3CBB9D71FB814FFAA5C0FF
              B60FABBEBC4000D7A9A889EAC3F39ABFE41F9BE03E3592782D24F43157B52A07
              73219FD643D7AFD25FE290D3604354271F4F845ED5864E91346B5FDDB512F0F5
              B918C76F0ABB1C77E46EAF66B2AFEEE90B7A81961ED70F33A67F09337CB9CD28
              2634BA1E840393880A22A18FB9FE97FE27478D5C3EC8D03C078F801E7317EAB5
              B2C37613C1EFC15D305964AEBEA46BE4AEE22CBDCFE513F856953E77A306FBD7
              890E75F6F5870E67EA766674B93E5A33F15BC4E2F42D0F0A159A0B0962D2773A
              5CDD7052C33DF4E8A8B386F4CFB7E73F9E4EE71F3899A34A8E525F1134361154
              40AA0B1962E3AF1CEB4721D6A524B8434C2468887F7EFDEEF33A60BA5CA4BA00
              3EC6F5155F4141F1B8BCCA25DA012ACD4502836EFADB2F63756E48608531A7A2
              71168C6A32F43E034551E547FFD2C2A9E15C1FDD7F370E3C16AA1ED6711B71CC
              DBAD0BA6C385AACB0ACF147CF3EEE168160A95235FFCCA706985BDE8B3692E88
              1A3B5F2F1EA23EE285E1C37722B23D0EC8FE7A35D6081D46A283A997CEDF478A
              C8DD4D89E4AF8D75D6BBB4DF8BC0EE6BB5311DAEE313487545A36773BFE51D3F
              B2845241D97DA35CE01EFCDBC8CB065B8DE405A26723CBFE27188A740CF0CC72
              E4F391D74C4AE16E59EF2F0C4C449CB7FBF06D3E983657EE709884EE44BC06D5
              717416EF0F0C57E409895618C5E7427D9884E57AE1834760997733DC96785D12
              2014BCE26B7D1DBADDC0B11456AB35BB39EFE27BF33F717A6F476DEC422FA35C
              5742666C450F137E1B7E1CFDC7FBC396CF29414AF8DA309727B53EC1DDB968E4
              5FDCB8D818EC89246E6048D0C9D5C0E8B6C5FE4547A52FF7ED47995BFC37A7DE
              E0459B2FC7CC8CDEF459A3B629469F81D461C6B80AFB4FC38B14661C445CF1FB
              797F6866EA4112A0E59619AEE684A7DF90D7839D5203CA18631B55F1D088E1C9
              6CEE261C1C0F1D8C7079C8AFFCBAF3D021DA48D0DD8C4AE3DDCE3E3B7F2AD9AD
              77CEBCDDA7B91D6AB4B92891C735F54F84C76B60930E308ED1AB932E17CEAE00
              C964DB9553551655CC3472995496BC2447370494747F0EAEA11AD60F97E9A2AC
              FECEE11387E617E731305EE5499BB84A9748B20D6CEA802A8CF7C3DA5A5C27C6
              50AA910593766B71A546326A11FF877603923DE8CB06DF907010A345D91E1DF5
              2BCD820294C1CEAF6C933831A4AEDEB7AEC0B80254C7AFB75059E9FDE6222BBB
              A064BAE69127D66CE41973EF370DCDA5FDE7A14C2EB8E173ED980F2F219F400C
              70F22EBE70A4463AD3F6241BA8E37CAC08179BBA89EC925A0E83E3E633C69870
              0C91BAF93A773C4ABF21CAE66AD7D416A8506FE4F3FE5475EC7D830D9F24811A
              DEFD1C956640399021F29483CFB561C542EC8E89608C3ACC170EC62D1B281417
              BFCB8C6BAD7BCF1B9A120E4CB774322AF77D9E7CF7E74CE6852DABAEF1A76CF9
              76829443FFD4B9DF1D8E36C875620CE97611FBD316C403EF1782916245C5043A
              6D25B2CBA9D9BB6B282B2259472DAA49C664D0B7676A7A29A98A685707C58D1F
              58AEC8BF82F93DA7A0D9B390590DD7EE4CC51F842DAC0BE371F1CD9008871DFB
              A7235B8F839162054438F46B20F2AF1F68C94838789F3DEA1975C7985A80A24F
              E651DBBDE8F106BD56E729E70D2581FC58C643F59F03BF419E4EE7F7E3F55C03
              E371E58C246A48352B2C1C1CD7966D4617A35A01604BF434B8BDA14723DDCAE8
              90ECC5E78DEFB38FA83E1F19CCBC9AD85DF5B0EA24C7157F4A2B2C8D98F4163A
              56AFEDC2DEDCC335301ED71F43891AD23288848313C4E66E467FDCC6EA204C8A
              2ABEA19FBB1157682A840370D3868E68B9F6059137B4BE8172F3868310DFB44D
              EB1AFC06C6E32AEC8F7BFF8C3B46C2C17271326F806BEBCFAFD5BF3DAEE15C6B
              662DF751647EDE7FB9CD619DC3B6BC40DA432B0C933D488B8278D8AAF576D4C0
              580FC671D166C8A8056A603CAE66A38B0DACB62269DAD97FD0A83CA3E8268A4C
              DE33756B88A1ED93B2DF322A57D1F36220FEE1B7DA073F5ECF86521CD71F4349
              6CC87AADC9BB58AE16641EFC1289E45EF8F3EDA8D25A33D024BD9F5CA735500C
              97EFCDD70EBEBE679AB621BEB9671593EAF87F32F2F79AB7E641FF0000000049
              454E44AE426082}
            Background.Fit = True
            Caption = ''
            Color = clMaroon
          end
          object paImg3: TUniPanel
            Left = 372
            Top = 2
            Width = 224
            Height = 193
            Hint = ''
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -19
            TabOrder = 3
            Background.Picture.Data = {
              0954506E67496D61676589504E470D0A1A0A0000000D49484452000000D70000
              00D70803000000BEA3348700000300504C5445B4AEA4666666C7653CE8AF9251
              5151FFFFFF393939424242F0C1A8EAB397333333EC383E2222223D3D3DE4A587
              4040403A3A3A3C3C3C3F3F3FEBB69BD17C57EEBEA3EDBBA1DB9372E5AA8D2A2A
              2A3636362C2C2CEDBA9F3232323737373D281C3030304141415B5B5B3B3B3BEC
              B89DDF99792E2E2E525252262626D78A67565656E8AF93272726D88D6A343434
              464542C96941595959EFC0A6494949CF7852D68763282828242424C96A42EFBF
              A5E1A080C277565549435F5F5F62626261605FD4815DCB6E47DF9C7CB88E794C
              4C4CE7AE91E3A48554463E4F4F4FCD734DE5A98BF1C6AF6B6863E09E7F464646
              F5F5F52323235A5A598F8B83F2D8CEABA69C866B5CEAB59A646464EAB3987370
              6BFCF5F2BD8970C46F4AD58561BF8063A39E95E3A486DA906FC56942F2CBB7BC
              99864F4D4A473E39CE7650DC9574FBFBFBEEBCA2F5D7C72E2B29DEA98F98938B
              434242E5E4E3F2F1F1F3D0BDD4D4D45454543B3A3A897165B6A497BD8E76FEFB
              F9E9B195A19C93FAEDE67B787253514FCC7049B7A090B89B8AB6AA9E70573A81
              6543644C32F1C8B23D3C3A5E5E5E5856529C968E4B3425745B3D6B68647D7973
              605E59BB927D7A61416C5539FCF2ED535353F6DDCF939393F8E2D7F3D4C46363
              63E7AC8F87827B343332938F87D1A088D9D7D56D584DC17B5CB9978379615578
              5E3E717171F0696EA8A8A8BDBDBDDFDFDED6AC96E4B79F837F794B4A48A07B6A
              CFCAC7F9E8DFC8C8C7EDC1AAF59B9EFDF7F4A28575705E54E6AA8D3B3430EAC4
              B7C59882A38E74CFCFCF927363957B6DC9A28DE4A689AB8572BF84697B695A43
              302559432DED444AEBEAEA61524A8B8780DEA0866049315F3724F37F83FACDCE
              9D9D9D7A7A7AFCE6E6B2B2B2B8B3A9F0C2A9F4E2DACA6E48E3B29D9D5435C5BF
              B7EDCEC2685236EE5056F6A7AA878787FBD9DAEC5D62E7BCAA875B42B65F3B43
              2C1EAA9881523B2D724730825839EE8F92D4D1CBD78966DDDBD9BDB8AFE1AA92
              998D836A3F2D91867FB47B61CD99808F6B5ADF8588828282CA6D459D9186B2A3
              92623925D8BDB1857871D8957898938CAFA89E197750F2000024784944415478
              DACD9D095C94D5FAF81F986118061881611754C4D8DC000B5C10F5BAA682A662
              EE68A9FF9B987ACD7BED5EAF6659D732F722FB49E58296A55DD3CC5CAF8AE602
              A2A6026A222E88B2AFB22FFF73DEFD9DED3DC38CD8F97C60DEEDBCF37EDFF36C
              E739E77DC70A5A5B566F7B60D2F1CA669B67CCA2B7F52376AB6789BC06EFEC78
              9B3EC8B908061E6AF535F1C5AAD535D7AFB0AA6F7565158B18748FE20295633E
              B34759B9F1F07F5F20177CB5C6B406D30BC6B41780A6A69AD9651790E93FFAA3
              17C7B57E854D75EB6B2BEAA80FDF7C17A6A1021FD4B2FB3C54E503BF7B615CB0
              7A738919B59556D45DE9FCAC80D9E0F584DFE95EBAECC9E636E5DAB0DD9F95FE
              057BE505A6561714EF322C8B1A47569A956AC1D9541EB966D90F93B97ADA5ACD
              2976F9D57A1F982B8900F655884E99C3AEB246915E71285F9EB6AF0DB9CA15F5
              751D32E8151F78526BEA098405197CCF12DEAC2A9D4B05A7EB983739A90DB96A
              F29D9B9F322BF66E4EB7CD020385CCCE96D72B6DB0E54BDB8EABA0C4DEB5AA88
              59F3ADF5B963962822E1ABCF11AC7A69B5582ACCCC698D01319D4B790D29BB22
              8F5955A9D415C56681815D8D70CDBD8ABF4FCAC04CE766E72E9169A6FB6993B9
              E67C87F541A129686436D8B63EEAD05B021FF160768D8EC510545FFEF7C5CF9D
              6BF469DA91AAEA344DB434FA1699A762DAC5A394BF532E95EA22F0F4CC34D9E6
              9BCC95F43767D6CD28654AA0D02CDC6476EA7C765153E18A25DEADDCD4C8CA64
              AE09471C855186C25A86FE3759B6C5B82018944D21D7F0A77CD8A5810DA67833
              D3E3A8D51FC92C4BA1A7D8016B4B7A5A5DA53E3D9B5EE9638AD1379D6BF2CF6A
              330D2041E18260974A46C66D97FFC3941398CEB56C53BB22932B995CDC0BC45C
              DEDD4CB31CAD88E7E77C67401055609E8B161656125D220FD35C4593DD4DB11C
              26732DCBB2FDD9D94018EF5E6139CD0BA4636017CD1D7ADD3BF4C4B23DBE8EA4
              DD3252AE71605BE995FAF6A2AE2D8F4BBB55188876C5E19D7945432B71686E21
              B3C1B309C0BA27A934127225157DE453EE08B9AE38E2758DB8F644FF610ACD13
              B2F34917851C0BB5AA818EF6BDCB9D71AA27710E697562391C5D98570576D594
              06B995CB6BF41FA5723323E7212E4ADCF49A16CE597A17C93AFE4E5C9B5CBFD6
              AFE87C1B85028DAEB750E7DD60BF4B0394FC78E7119F9745902EDE2DCB2CDF5E
              48C58E51ADA47086A7419DD304B65E210CA3028B3098025C4D215381D53382C3
              941E71A436D1147BB87E2BDD4ACA66995368262F708182EE3B78D75A2130EFD2
              6AFB66136C887D95CA8A004DB39034E630C9CE6F58CBB692B2E33DEF7CF6BA15
              8EC200C45E5D8F5695A8697D4B491A81B91D38056CDF682D712FFC861176324D
              E29A306233D73476812D7FB06ED85DE4CF54ED30189D1FD47FA5F60D0036EDB4
              0495CD94AAAC70CFCE00A0661461CAC334BFBCEC9B5A2EA450AA2A9DCB68CD12
              3798F7636FC503C17536E95C23939FF705743F6CB8DE80D2F5117F888381A6F6
              1B4FA66126C61BAC8A51C5A3A1B25D0B15BF89030DFBAAA062451E720ADC16DF
              02ADE651494928D5A5D36327BD16FECD725C0BEEA136A1730C730E0B835E9543
              23951A557A88DC96EA99A7F2493DB21DE2D3203AAEA3260586B9BCCB74E34D95
              92CCF313712D536B16C1C6EB5865376C7956A547F43D205FB08689E48D563A60
              341D50DA28331E23632E558B1EEFEFF70E910F2394C309FDB63867E088BAD74D
              17DF2C3DDD7EB124626BE80ACF5C4A5B1DE0232E74123D5A462888C4FAF57FFF
              70F6C8F09F3F1F146A9FDB7AEEA328F1C758438776AD06435C483F7D73757678
              BCF54F8B72C18677154EF6B9A88BD2221F96AED351F12EF2137A67467FEC9B85
              36CE342EEA0CBA0DA66C1A4192E720E79AF0CA0A7AC1AEDAD5457547BBC97C8A
              3B88C07C2820554B735DEBB86CAAA8CFF63AE1584F1F922C2921D7FAAC542865
              6C03BE91DEA1994FC45A86222127A128B246C3165A0116541F749839AD8E20BB
              8691F4C1C8B83E59058ED02E97EE0BE1D11D9C1FCA2C10B5195207EF72C15570
              D6D05666AA92750A7977E63D66592737E93E9F244624E31A075DD7880868B24B
              568238039B8AA05B82F371A3FE2A8D494A16A4CC3C3872F64176CC461BCCC399
              A41746AC5F7376728BF6B4E883A7B5C37DEFDA7246F8BC1FA37FAEAE39FC65D0
              0392B8F8022199DCBDC1F97EE8AA57E1F4244EB1ECC4FED22E20D5925CBE0213
              E8C34FBFB076CF7494A3D35400D38512912938DDF2B43144E6695DE0DE402D39
              DB438B55C6BEA6F168F9F0545E14C460AA862A0B724DB8CCC42F4A5903C885D6
              57B576FB3596578ED72BCA41EECCC03183E3E8EA3D1FB718493BCAA9FFEE0DE5
              30EF95E9783179F795A7DC5EB1B5B75941902125CE47A531EDA5D432F04156CB
              66C034C8E9356E09B72DE45BC4D85C5BD1522B985A23EF5E5E69D3FCD4E037E0
              A69FF9FA9319CCEA7F17DDE7F789C06CDE20E88391724D3EC7CAA13862F5FE62
              9C9EA3771E9BB2023762C823DB26E7BBECD6761D32C047FDB8B451B782DCC729
              13A68CA99ECE6DF9F5DD27827B2014458B728D7EC87A5D518369768F3458651A
              B800D388B801F932E42EF28560C3DE289F67CEF701A64C6F7C55547DC1EE42C1
              9A00CCA25C3D1F70380263D0F0D578C2FA1427BAFA230003FFA3053A7364CBB3
              19BAC7CF382454481ECCA25CAB3FE1B83887EBE9F99E09587A395199FAAA81FD
              3BFF5D2BD4460ECCA25C0E5C2654D9CCC60F9AE9664DF5912C3FBE734FB8CA86
              8A96E5A267D630F964AAB8258D23ACDCDAB2205998375139E7599C6BDC31EC3A
              05F321D1CAB0A1D3C92AB7BEFCF74D2118DD1B53055C22A8691297D0C6BB8E1B
              FF2A595D334AF2A61CA151A442453B3B920C07693F6505C525B0F19DD7996333
              88C18E9FBE2F58C5B6C3A25CA34FD3211C1719BAF95D6E032C6414530E7101B0
              2D95F3D7C81F5A902B9D1EAF611BCC3562CA0CB29AE69683E398110CB687E93E
              8224E54BC8B5610DCDC55A8E80E00B6D30784EE124EDBC770B70278EC9AD5A94
              AB6701E6F22E62420DF91B564DDFB40D976BF1968F3937A6B26A746D5CF48E85
              B9EC9BD90E7D40F02187CAB6E29A3D6A166FED7D8B5444539A49B98A8A04CE0B
              35D7576DC5F5C636E87B891B244496DEE5B30916E42A291074EB0396BC052D6D
              83058EA8771C5DC6F459B00373892389DE4CE0C2935629410CBAF7DF316DCA95
              B8C0FB3EE064240E7D43C7934C283285CB9E890DDD4625439B72A106C3B3BFE8
              A15A17A20115422E07E702BEDF15F69FD16DC71586FBDDBB67A869B7625FADC4
              9D504B727158DE459B13A407E62C56F015CEDE460922351AF13551FC66427BB1
              319426269960C0D1A25C107DBD98C602BB051F58988BED278F7C7B749B738DCE
              BAC3988DC00E4453A44CE0628243B935B2866DCD756821E2D2E009D2EE335759
              906BF5179C1CBA9537419B73F5ADA2A6C3FA16D5BABF4234999ED4CE9717B359
              8D80F6292F802B9F9A8688C38D3E16E52AA96033D28A2D73DB9EEBC04C6CE771
              B7D2A51FD1B46C72BFCC74BD5C2B0E8C6E7BAEBEB70AF170751EA95B3625DEA0
              F54B6E1D79FE057181CAFA198492646D4CE2A21DB35B3936872F48BF9082D990
              8C121173CD39932F6B60B8B0397C415CBEB96059AED1E9B50CC88BE14A5C4F71
              B5CFB338575D95886BCC4F6DCA05329C3AC47194A5B9948F455C6D16CF0BB9B0
              9DB72C57D2BA1C66DADD0BE452614F6359AE71C71A987ECA0BE2DA3FAE91CECF
              5B9C8B99DD20B79EF5555B7285D183F2D1671BE9F4BC65B9F038114D12748FF2
              CB109CC9EEF2C75DA3579849151169A0C916571DAAD9A3753275486685788335
              7FA35E3D82FE3573FB1DABC45C89B32DCB25AF61E279C52F23A80D749E4DDD6E
              8A9E7E43C45DBF871169D4C5A9AD0AA32F6AED1EFA8BCB5F0ED2B7A4059AC6EB
              CBDFF6F23B28E23A35BE90E29A914AF6CC03F138EC67C58C8285763CC471A9AD
              FC8C4E7E99F32374498519DAED05A1A9E002789791C2A0335CA3CFD35C7684CF
              72108F9B73816FA77FBDC572398D214995EB3417C0A49D04F52272CA81CA8B3E
              4FAE4FBE7EC0CCF772FD262F017D688AA05D2149CDAEF915BA1B8716924C7272
              B1AE00573A877D24E10E353B65F803CB72E181222676EADC1E1B0E4D7D3335C4
              12FEACB112F3B9850014E21927F6E8CFF10C57B1D70DBDE7F377E4C1C2D19F03
              9EDBE805504B85EB91A5853ED7D167446536C3850344CCF5C15DB2070348B9D6
              6FCD611388011E982BAA33FA82F0BA42436D863971C92CD3BFDFDF83FE3C63A0
              3E0C687F03A1B9CB69AEC4838729395C9045F6641BF1FCA8630DF44C3C866B50
              CD991E4E5748825F1B03DB1BA4ABBA861F85DEF473BE38E0C05C2DC32CCB050E
              56F58C8261AE28796DA615917A19E45AFC0941E5484599FB596A69FA91A7949D
              7F62612EAF9A1A46C10290DF8D7C1CF6236145435C63F792D41E3FEB139B7378
              013966CC45988E22E15A796F17FAFF49F26D66A2A8A209069D427DA11CE9AAA8
              2C5D6F60870F49FD20F535EACB00B6CCA3B8E6CC477ADB67E84AF3B9DE7FB01D
              7F94742F60144CC104BE44820471863A6A612496DEAB88BDC0D1BFDFC75C275D
              B13D9AD9F13DB3B9FA5D80E82C80B4C81266C6F2C1D7A8ED0EE07E4B74E00071
              A6A8A488B93243278E4592ECE62CAE5323B6445E458E6C98BBFBED42AA5B89DC
              48700AF4F9CD5CAEA59F823F0E0CA79DCB617AFF835268AE4AC7395C8BD9075C
              D1A939C027FB1212A4AB86CE1C366B7993EE0BA8063CBDC37D75D937C071F5BD
              85B93E5E8E5DA46F36FC5D425824B9DE5D13710F070CC9B31AE899D89EC13497
              63058415DAD24D3625EBDB7FEEA8B402D441F2EC37DFAA6EEB6B8970E8D5E177
              2BFCFF30380C1D9BE238786BB4F75EA8D9605BB915E60F82F60D0A17AB49DE37
              EB906F5EBA21E63C6E69355B1F39663C4AD40D4F8751774EFDC7C76672ED98E5
              42DFB2D9BB6A280593FFDF5C6A5D43095858D83E7567D9A1E97BE78FF7D83368
              2AB567DF911101AE00D7BB767D6A74705DDDF99B0FF702AE38AB1FB561AEED00
              5431A3717CA52FDBCAAEDC5400FF3B28DE5076A7A6F938946C8B3793ABDF05B7
              726AE1E587F99482C947D11EA43DFBACCFA4FC2FBB00FCE09E8EEE3A55E65B29
              BAE01CE36FBDDDCB8C9DDA21A52514558CDCC755F4CAE9F4066AAB031AAE7FE6
              F358C4E53E991A346F5728A560925CD3BE65B8167C57402918CBC566DA7CDB27
              A2ABC35C65AB3E4A642E6FE05FF0C26F238D756E9DFED74257BCFCBFCEDE9F8B
              2A5EDF58CA74BFF8E75364F588ABE3972369AE29BBCCE47A633BE2527B6440E6
              A0124AC1DC82A8FE329B691BDAA99872B00971E965DDFFA0B8F6DDCE99EF4EED
              0C2A34D2600E03A86B9F3FA1F9AED397949ECEED98E3398FDA179B594CB7D8D8
              03ECE1D1A71097CBA999B8F7D2AE70A6C4741F023944FDA7EEE9000F86E6500F
              6BB05C74C7FD2F1BBB3207FEEF6A7D0DA527F3BD20F2E6446A5B9C628FC113C7
              BE399A5EF89B4F7D1D2588DF9EEAC4568438CDF715E2EBA3B86CB23A02BACFBD
              53CC96C37E1790DDA88F4875F11A908C67FF55735CA148B7D5EF2D620F4CE85C
              6F834C22345B395630CD05B06483C113AF5B24A8087D8F41C7FB8E157F776477
              EF6FC68461D7B8E33197227E4F097E48DFA1C46CAE19BBD079E27F2C89BE147D
              A9066B55009B96A1331CF354F798406FEBE1481BBCC9B1A19A4D796C6E363C47
              6BEACB8DCCDBAE121E3315E10A33FD3C6ECAA34327F18223AFA0D1A7EC6A3D82
              D34B5CC69FCBAE8769123D6E02FF05C15D41B5B3C7EDD117F1DC942A8E4BC344
              1283FF5F5E2EED256F3A6402847C5DFA39D35805BB8D9F7B4F1CB3405584E877
              E98A9F95FC7692D9C19B79C46505EEFF898719D5299A2C30DB7FBDFF3E8CBA54
              01A1A923EA6E15E1B1731D2E54FC0B6FCD0916470071138FDF3F2975F2A93110
              27DE123B77F198AFF8C48116974BE284886BA08EFC05DE930810A5E3436BAA2B
              FF5246EF5EC771046E17789DD9211E5209735E993C4FC63CAB3AB76225644B9E
              1917F5CB0F0E573FA4FDD77AC7BB5FD48AC364C16388982BF4D3815DFF006CC6
              9A25CE4B12F72E472DE154E09F3BFDFB5AFCF85513B323E6A0CEB1B17488D55C
              21795651F1A75B458F4F88FD99E7BA54A39A7A2603BBFAA5ABCC8F7B61EA7710
              8CEE7D7DD7BB5B97A18843D1C2729998CABEFCB269B0DA9737FD646EE0E27519
              0A741BB260F26EF28A06CACA0FB0C70087F0B3BB17E2C9294D1C17F9D44A1F14
              730D96D436DD2230F320F3C875FDECBD2755D82BC38A956673A188030BE24B9F
              BD9AB80C772B6C38AE59C4537CFD5183AF209AD7242E02331F75C1A3A869F306
              F8038BA154B441C4853C181244DFCA72D88FA3599BCD09CC0E0DF194EC23D38A
              60AA94E8E829027358E065E53C22B9CFA347580CA5BC1711D7CE9958109D34F7
              60CB22E4996D229978837C8CD9A740DD3A2E3E9A877C6F2BAFE573A36E946131
              DC2E39799F80EB83FB58109DCAECAB8FBC7D1BA0E7BB53991D7A0CA2FEB2F873
              75D1E0C02F4CE71298F9DBC31E87AC19E1202BC362D8698505B8B020BA97A92B
              ECAB67EF430AE612C565F0480DE2E625ADE4125CDDBDA1D6F766E159E04E0504
              6248C485420EEC9AD1CDC31EAC233D9E820BA94154C0C89F06C72C223B585004
              E6B0FFF661F57E29F81B9153960A3608B950DF125CA9918DD1BF15837B480ABB
              DD91CCFFAA6BA1A16570A7AF4DE662C688709914B2D1B1FB2124214853A5FA94
              C45C28F61D751C73F54521A2661C7781840611DD93D67109CCA1BDA72A939ADD
              3EF417C99897986BE9A7306707951A7A33B9D6AE911E38076283686543714987
              C1DA4560367AA70DF9EB6BB88F1E9F24996323E6821DB3900BC34E72CBBF8A05
              869E70D20DE2F2CD9EAA349D8B4F020C3AA282CFDF423732761F48A5A24CE042
              2ECCFF11E6DAFDF1EFE097389ADD4E663810D7DA05ADE012988DF8AD2AF86504
              E222725EC45C289672A90AC9C213D9ADEA5D3F9ECB6E26331C9B97B48E4B6036
              22535480C4BF7D6E7C92740C650217950DC0C74E3FF6446010DBE79254465C0D
              2DF3EA4CE612988DC0EBB9B352F0E06F1189F322E7DAB818B966DC193A9490E3
              11CB593632C3B1FF7570CF6D05176F36FA9FE8E1310D49C9ACEA9D646248CA85
              3A2BA38EE3682D71814D4B2317D193451CA8CBA4AC9817104577C0C6764E2274
              E7BCD998B4C36552DC0880D0AA0C5829194399C005D628F6A57A0D4810798348
              6238EC572F41BD527E3D2C03BE9F43E2F8049D14FB92F8BDC87BC51C74282171
              CA26725182B1F5A39C50078E4BD233AB3FA4DE54217CF70E6A3E98BF1E248B9A
              BF677530A229059B29E9C4A1895CD3BE452122BE8347475A39F091AF9482F917
              D19374B4B93CFE724E32AFC3AB974F36F8E752FD078B7351695F50773B0D29F3
              6AF9B7034B79E6A5F974A6F3FC06F04717E4B99BE10285AC5CEA2B79F58AC406
              D8BFA463E6F3E28A7D980A25C39EF4E6E71A185730A782DE37A905E52217D423
              B0BD7D92E51AF3ABD43C428157EE8D27AF44743888278C9D8EB628D78E592842
              84DE2911C55B639C055CC63DB3538103BD307FFD604FF08FC5161145C151A169
              9E8F2E82F1C2AB57FF1311D77C35A978FE58BD7426CA34AEA9DFE1FBECD0E57E
              199C7843F0966AE39ED93F8B69AF8371DC55EE7FBDA105C21ABC8E4B7C239F03
              E89281747BD2ADBB55CF8DABF7AD3280A2976E7B70DB2514CC212BFE52DFD4AE
              97E1FB0F9891552B9BA852B4D8EDA6D437F2EA35F028EA25C1D0CAE7D15EA80B
              36E1204CC2C359857DDC0432645CC1620B3AED99D471954B3D0B36F6304C4E8A
              BEA876933287BCF71A7404CB2EA8238FE31CC07AB26E3729D7FBEF033758FC47
              C7DEFCE405290F865387B1574BEBE1E0B42208AB78040352610041C2870F0EBB
              647033337DB3497200A6707DB01270C69F2ADDD3A3F9877AC842C449E90F00BE
              7FB484BA34A2C27B2F5A0C996F961C7030910B39E6E56C37D5A9A087E0D59464
              4929DFF3FEF8E3E0318240832A9C7A3162888BBA732A51A7D2142EA460FEF484
              6C3C883E7707B7833029F552EAA21FBD9A0DCFBED12ABC7A4DDA1191D34283A1
              B626542F72AE0FEE6FA7C0FCADF16F7FB9F0D247D607C3F743E14B4A25542FCA
              29F7AACEA6B008A35E53DE9BBAF2E1767671CAB730F81CBB429CF535A970035F
              FD4FC03F0AD86F9ED961A5C5B970DF922A7D86BD37ED5B81208692B70271C139
              07BA44A66C8BFFE036F32A11522934EDBDDF4B9FA0B8DA5BB9127BE901BC0B23
              CC8E9A54F8D446E075DC415E6A9587BEDB8B68C6A3C95C02C24F61C85976E579
              3CBAC705513ED9C42A65012E14060B5C18FF088EB1A26E5701119708DB96B3F2
              5DAF10064E96E1DA3953603948D3F4D6504674A0400C91F322C9EE5A8C0BB9E9
              AEDCFB352D2F889C18764B2775C416E212590E324134A1706218789D301EB414
              D7D2C2EDBCA937C722AAF5D4E5C4307E6BEBAC8619BF7B3B6317DF60FA5C73EC
              6936A8B36E09C69D2D0F3AE0756A69023F4F3BBEC6505D5BC2C5BCBDCF907B2C
              0B712153CFF756745C736C4131FDBAD726FEE1B55E0F2A00F5C5E895E587CB2A
              9B2BC0BFD851D9778756652EB31176B1B5CD65C6EF14F7BB109EC12EEBC6886A
              EB579EB20F34C8A8FF6393229E3D29897E1C7630360546FC0A74D2D8ABD7111D
              23C9C5865DAFB4B6B9CCE0423D4DAEC18806C262AFB6874292DE176B35CC682E
              737E575AD860968CA5B84454D72B64630C16E6420DC699444BBE2E80B51A3ED9
              8439500B73894CA2E55EAFC7F628A30AAF4BCEEE7A3E5CC824C6B3F3AD2D1773
              B03D2FFB12C2D4AEC5B97052910BEBC927B7192FAC76A1403E8068A4EB3970A1
              2871F8696671CC1DA260CA09095A9091546F48006D0CCD934273B95034C585BF
              4613894E6EF8E1B01280E1695E8E0F8D1CC9FAAE8147CD914273B9707F85B389
              464D474817466DC61CB736721C6B3422251F6878BE5C38FDC67A67E3099C9082
              BE886CCC6537A3D910C66874C9304BB92CC0858C7D0FE6495CF28C9BC1C2F4BB
              E2B792279E9E179710CCDCA883E99F5800CB025C4230F3BC735847CA16865D34
              219FF61CB90460634E9A01C69896FE05D7CDC7B2081772633D9ED1BA1573B7F5
              29013A2E8CDF6A81D6B21057BF0BC09AFBD683D136A35B3A98E7B82CCBD503AE
              3309C5D682D10E19CF68685DC2F0F97085BB349C19DE78AEF560545818253F3A
              FCE89F880BC5BFB6835A8E0E6F3ADB5A300AAB3FBE3727FF645C10D590C2745B
              4C07A3B0E22F6259AEFBF370DDD8BD067121CDB7BF1EEE7CAE156094C9401603
              DB1EC4B559F3E7E02ACA8FBF82B9A0BFEC680F158EFF4CF363182BACDDD10136
              588CEB60CFA90FCD07B300D7ED6E1097C78CAE74C9805E4EE74C020B79504DD5
              8BA6DF8B5277B11FA4F4F91370DDF8F76180B849AFD36B48F707E4621F4D1A2B
              E22803D91CD6B1C34F78B2F76377B2CACF936B1B353B7B49DD167A35AA2C1D28
              C3D85E4DA2648E830F0C2A6C60F41295F50BF0FFD9F3BABF68AE1B5F304F3FBC
              CD8041FF2B25946124B11E48B5265DBDDE238C4DFFD058005B67BD68AE82F6EC
              52EC6176095D6AB8CB59692543AA35A8E00A4FD57E123B86377B0B9857CCE61A
              C3D1C0E6C5EC12BA5ACA7E185732C741A5654804DD4FB1580BB913C0BE312F96
              0B1943BE6C5EC7CD19F4F139D3232CF79CAAA36159742D46EDCA6720E1FB3D82
              374AED7AFD85724D183557B8BA7E130786EDC7804E7B0CCA6298AFCB83A3B453
              A0CB14F7B582DDB39F76EBF4E68BE18A8F79D069FADC44D13601180C4A2D0164
              F3F537996B40CB19708938C56D78CB76ADE880463B6464FF58F429D1DBCB2DC6
              B5A6F26687240065A95C6B07E7C8704141046AB31A179D54B08F95FD75187E57
              90E719A99DCC4A1F1B704A530690BCF9ED9FB507FE9E0FD7A58D2FE15BAB0C2F
              BE06DFEA0CE42C2910FE84A34FBB2BD0C3E6D3389130FA5BCBAE4378B980AAFD
              DA38EDF3FC3A14FDF30BF81FBE7109779561243F06D37AAE359D771F451FB6BD
              CE0335E1FFF75EBAC76C5C225CC3DE0C8677CC66F3F84E6E7D5143BB0408D388
              228BC194AD6F501FCEB5D170AA05C125A4AEF9C2847633856B8DEC21BAA4A6FE
              79AE67C18EE64A5CA8E7B8F559DB84AB830A1DCEE057C4522BF849FC019DF24F
              090FD8F0B69E93246F99F2578A2BF01A3242050EF7EAD0B66B0F49D188B92828
              65781E33D18CE1BAFA8ABE6397F4D1B2D2FD4B5D8F328BE1DD1F9F15EDD32383
              B86C5A10F313C7459D23DFE1869C188D8C6BCD55F72468EAE4C15F11C3050B13
              F556D8B83AEA80784B143D40A69DC556BDD3E335BD67F07D189025E2A24E627F
              A90E96B410A011704D08AED08212705D89D05F69A96A43BBF09F8D9F78CCE55A
              F73773D7EADDB76F3CE8E1E2D07A48FD069824577CFD01B08DAC3EABB5D9A9CE
              939AC630B6F9B0FE7A4BEABE8090DEC74A0DFC66FB98E37675BE99534317EBDF
              0D692F833F7EB19E57D9CBDA5F0D7ECE4FCA1222F718F56C125CF1F7D340E999
              A5BB83BD8FC1CB0D0ED92FBD4A3D7818A2EF07C069BBBFCE4063012CD884FEE1
              191EAC5C6895C129F284DC06236446B9BE7EB0161ABB5ED3B78BE3AADD6D308D
              B9A4C2E823E62B1C171BDC97869FD019FF83412EE43AAE97C12B9D0C2A9A11AE
              098569D0E87747FF4E85CC97DA2383CD0B0D9F62A9CAF04B52362C305C6F1FF5
              5B58FD528C70417F456619BC63E8C78A0C732DAF4D34488504E17CDF9334172C
              34F67B779B0FE97F0A76A3CF6B862B8D3C2863B8426F2B3DEF04D4B6F7FE411F
              D9B32C98D3437F746C886BCD85A3107C45FFBE894F1F29B3651457FFF3480D62
              0D980EAAEC7FA0E75566F354462781EEA47F28B8430EE6A2BB701BBF7638A77B
              60D4CD3A5875419F9A19E05ABE0E9A22CEE9DB1355357823FAE899A52C451FD1
              781438D9F86C9FFDBF6AA9D9548979D594D1A0B9021EF1AF3F82801957759A2D
              20479E10A4A7C9F4727DED345DE9A4E7F5BA13F3AAAA99895B3DB36CF13CB4D5
              FFC62B0B257E7971FFAF8267B225DA8A93420014700C3E1F2C7A7F798046E766
              0FCE2C1BAED6B11FFAB8261F70EA7154777354B140DB86A4500AED47FDB66E87
              EEC6241197259199B405793368B1C4A190CAC666C83187670DD13E754CB19643
              8B0A4F82CFB49B4C0F57BC7BA26D776D67F8E5914CF1143B056087194ABF85FD
              4EA0D4C5A268D83A3B2097606EF53EEE770111170AE74FE81CB171FD2B22790C
              BE0FC9DA3F26A8876B057296B6A2C98E13D3C66DD43ECAA11E3BB060A60993A5
              27D4C54DD6DC0F8A943C6CE40DEEE79551C06123D7C385C9045A128A1FDA1AA3
              F5A3B1BA5C97060DB9992B1FC2C7765F7EB258CFC0A85D533492D57758DE1FA5
              02B65BF9B8A398D455EA2D6DDB05F3CA9B90FB0A34F05EFE86A57FA597FADF2D
              1B529A9E502056311DAE097EBBBB9CF5AB2DE3BA0795FA4F2C9361372063573B
              EC363A7A7AE7C21C7AE178B1F11FB14F15767CC6A73D757232E842BB0750D218
              7302B5C1E0F34BC411800ED7BAE53890407E039B71882E3474DA9127F0111C17
              EC9869F862E3264FE25792FA04183E32799A70AD5FE17DE51B1B0D1E4CB55954
              3A650C6CE4A74432AECDF5F5DB3450CC09D46086A90006E24C40B460129361DB
              7149DD53B4BEC76093ED9A2A5AED67A365E6754A8CE26E162559A1B7137284FE
              599BEBC7E9BD280F11953E64D4A63BC64E890DA2900BD20C74C568CD12967B73
              F5FB855DFF14FF247B876E27FA9E36CA05FE9535B4898B39B14A18D868714D3E
              D097F1A0CEB5F5C6CFE85D1478CD4F741DBBA6EB39EC72C61C9D6D19777FF95C
              CFA19C43E6B8CA6AE7191643AAF4CCA2E36F6C3E560A725662AE097E9BD89F93
              08782421028E75D147C55CB07B9ACE51F33FD433949524D31CD2CD1F8C9CA8FD
              884DCC51182ED1E79669BA30AE36F8BED07488B906A4F9B2B217953E27D1F819
              65437E0E15DB4ADDB8236174931E65DA336E64976EA95F8937EA62211D76523E
              04A3C5A1A61EBEA42DBE73AD20EA1071C5EFA58D060A04CF8153B3F1A9C83842
              1C8B5D62131F88ECF84104367BD5CF3F1DCEEAA953F5FCCB30DB5676577C136E
              6333195373B1A6DB20D75FA105B742C023A5930497B7DD9D89FD4F52B3DCFD9E
              0A1A4CC4B56E7927BACB1FDCE471363CDBF81B3250848822A9A8AA3AEFD21CA8
              85BE0DF0EAB66C11D86C55136AF24BFD759B0BFF9F6FDD2C54B24D5437D3DFF3
              299536503EEB2FCF77703ED137CFA8ED42D6CB330729C387D4FB751532BEC184
              5CF17B1B69ED1AFB338ACD02F26A8C9FD2BBC8F6199B9E7772CA82D5DB50C309
              7ACF23BBD0179EDB595C2FE325067BBC40C936B1BDE798DF730539FFBE8F241E
              FC707F32F15A36F853C9B2D0DBC3F7EBE39A7C80D6AEA80BE8DF87DF3F9018F9
              B6A76E82025465A0EC7A6EE20DFACE72607C7B5C148522BFAF6093D6B3559C92
              A58773FB17A55D94C11038AA6AA917BF17475F1978A594B25D8BD6E135E7DA38
              369A12722DDC4BD9167C035068F9C3658993F68C3A07BFC3900B0D807C43741C
              1B43322170CAB3CF58918C9B2F746019FFE292F1B307A6565360A230C3DFDD3E
              05824BD1E50E2994FAF1A89ED085BA5ADC07C5FAC885BF02AE7D33E8609789D1
              FBDC24998231F04E51A34F0E080D3E05B6D3EA0C67EFC4ED0529BDF9E504196E
              D4642DFF8065D176E94E09D5A2B8DC06FE9B5EEA8B9BC46BEAA7BA5C2BD65211
              092585A874F795EA2CE2EB4A82216567BFFC43E43D917FDEB48057B48BDA11F1
              59412497724F3E4D2B7A426591EB7B32A790D304DF9F3298F96A2A3B1C9EB573
              823617633526F66704CADFEF84F479ED1B501B473FD552EE2B37E221E025E6B6
              DCEAA15D2949E0A8F68DEFF09F7FE9DAF27E8F9E3AF520F87E597BAE2EB689BC
              A9E7B996AFA3F24FBC442DDA287DDE2179777B9DA31552BB303DB2CB7D7577DD
              E423FA72B5BED3066439D70E21101748B0E12E72231E6DB291339683E75A9884
              235EC1350610C837EAAE34D5839F3EE77999EE49EDD00D0F05017DC2E77ACFDA
              CF2E4541F43B9543046D8A4D47781613FDFE7F957B4B9B6C9F67CA0000000049
              454E44AE426082}
            Background.Fit = True
            Caption = ''
            Color = clMaroon
          end
        end
      end
    end
    object rcBlock180: TUniContainerPanel
      Tag = 4
      Left = 19
      Top = 1283
      Width = 729
      Height = 43
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 21
      object UniLabel79: TUniLabel
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
        Caption = 'Features Tiles'
        Align = alClient
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock182: TUniContainerPanel
      Tag = 1
      Left = 17
      Top = 1337
      Width = 222
      Height = 110
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-6 lg-3 xl-3 |'#13#10'hr:110 mobile-v-92 mobile' +
        '-h-92'#13#10']]'
      ParentColor = False
      TabOrder = 22
      object UniLabel80: TUniLabel
        Left = 0
        Top = 0
        Width = 222
        Height = 110
        Hint = '[['#13#10'rcfeature:fa-filter title:rcFeature Sample |'#13#10']]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'RC-Feature Tile can bu used to describe anything you want.'
        Align = alClient
        ParentFont = False
        Font.Height = -12
        Font.Style = [fsBold]
        TabOrder = 1
      end
    end
    object rcBlock183: TUniContainerPanel
      Tag = 1
      Left = 266
      Top = 1332
      Width = 220
      Height = 110
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-6 lg-3 xl-3 |'#13#10'hr:110 mobile-v-90 mobile' +
        '-h-90'#13#10']]'
      ParentColor = False
      TabOrder = 23
      object UniLabel81: TUniLabel
        Left = 0
        Top = 0
        Width = 220
        Height = 110
        Hint = '[['#13#10'rcfeature:fa-print title:rcFeature Sample'#13#10']]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'RC-Feature Tile can bu used to describe anything you want.'
        Align = alClient
        ParentFont = False
        Font.Height = -12
        Font.Style = [fsBold]
        TabOrder = 1
      end
    end
    object rcBlock184: TUniContainerPanel
      Tag = 1
      Left = 499
      Top = 1332
      Width = 220
      Height = 110
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-6 lg-3 xl-3 |'#13#10'hr:110 mobile-v-90 mobile' +
        '-h-90'#13#10']]'
      ParentColor = False
      TabOrder = 24
      object UniLabel82: TUniLabel
        Left = 0
        Top = 0
        Width = 220
        Height = 110
        Hint = '[['#13#10'rcfeature:fa-cogs title:rcFeature Sample'#13#10']]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'RC-Feature Tile can bu used to describe anything you want.'
        Align = alClient
        ParentFont = False
        Font.Height = -12
        Font.Style = [fsBold]
        TabOrder = 1
      end
    end
    object rcBlock185: TUniContainerPanel
      Tag = 1
      Left = 727
      Top = 1330
      Width = 220
      Height = 110
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-6 lg-3 xl-3 |'#13#10'hr:110 mobile-v-90 mobile' +
        '-h-90'#13#10' ]]'
      ParentColor = False
      TabOrder = 25
      object UniLabel83: TUniLabel
        Left = 0
        Top = 0
        Width = 220
        Height = 110
        Hint = '[['#13#10'rcfeature:fa-download title:rcFeature Sample'#13#10']]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'RC-Feature Tile can bu used to describe anything you want.'
        Align = alClient
        ParentFont = False
        Font.Height = -12
        Font.Style = [fsBold]
        TabOrder = 1
      end
    end
    object rcBlock187: TUniContainerPanel
      Tag = 4
      Left = 21
      Top = 1457
      Width = 729
      Height = 43
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 26
      object UniLabel84: TUniLabel
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
        Caption = 'ToolTips - Text Hints'
        Align = alClient
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock188: TUniContainerPanel
      Tag = 1
      Left = 18
      Top = 1509
      Width = 140
      Height = 56
      Hint = 
        '[['#13#10'cols:2 |'#13#10'round:no | '#13#10'cls:card-info-box-white rc-dashed-blo' +
        'ck '#13#10']]'
      ParentColor = False
      TabOrder = 27
      DesignSize = (
        140
        56)
      object UniLabel85: TUniLabel
        Left = 0
        Top = 4
        Width = 140
        Height = 23
        Cursor = crHandPoint
        Hint = '[['#13#10'center:parent xy |'#13#10'hint:Default Hint Text t:Default'#13#10']]'
        Alignment = taCenter
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Default'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -13
        Font.Style = [fsBold]
        TabOrder = 1
      end
    end
    object rcBlock189: TUniContainerPanel
      Tag = 1
      Left = 164
      Top = 1504
      Width = 140
      Height = 56
      Hint = 
        '[['#13#10'cols:2 |'#13#10'round:no | '#13#10'cls:card-info-box-white rc-dashed-blo' +
        'ck '#13#10']]'
      ParentColor = False
      TabOrder = 28
      DesignSize = (
        140
        56)
      object UniLabel86: TUniLabel
        Left = 0
        Top = 4
        Width = 140
        Height = 23
        Cursor = crHandPoint
        Hint = 
          '[['#13#10'center:parent xy |'#13#10'hint:hint with delay 10s and width 200px' +
          ' t:gray hint c:gray w:200 d:10000 |'#13#10']]'#13#10
        Alignment = taCenter
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'gray border'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -13
        Font.Style = [fsBold]
        TabOrder = 1
      end
    end
    object rcBlock192: TUniContainerPanel
      Tag = 1
      Left = 471
      Top = 1504
      Width = 140
      Height = 56
      Hint = 
        '[['#13#10'cols:2 |'#13#10'round:no | '#13#10'cls:card-info-box-white rc-dashed-blo' +
        'ck '#13#10']]'
      ParentColor = False
      TabOrder = 29
      DesignSize = (
        140
        56)
      object UniLabel87: TUniLabel
        Left = 0
        Top = 4
        Width = 140
        Height = 23
        Cursor = crHandPoint
        Hint = 
          '[['#13#10'hint:hint with delay 10s and width 200px t:success hint c:su' +
          'ccess w:200 d:10000 '#13#10']]'
        Alignment = taCenter
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'success'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -13
        Font.Style = [fsBold]
        TabOrder = 1
      end
      object UniLabel92: TUniLabel
        Left = 0
        Top = 33
        Width = 140
        Height = 23
        Cursor = crHandPoint
        Hint = 
          '[['#13#10'hint:hint with delay 10s and width 200px t:success-light c:s' +
          'uccess-light w:200 d:10000'#13#10']]'
        Alignment = taCenter
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'success light'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -13
        Font.Style = [fsBold]
        TabOrder = 2
      end
    end
    object rcBlock194: TUniContainerPanel
      Tag = 1
      Left = 795
      Top = 1502
      Width = 140
      Height = 56
      Hint = 
        '[['#13#10'cols:2 |'#13#10'round:no | '#13#10'cls:card-info-box-white rc-dashed-blo' +
        'ck '#13#10']]'
      ParentColor = False
      TabOrder = 30
      DesignSize = (
        140
        56)
      object UniLabel88: TUniLabel
        Left = 0
        Top = 4
        Width = 140
        Height = 23
        Cursor = crHandPoint
        Hint = 
          '[['#13#10'hint:hint with delay 10s and width 200px t:warning hint c:wa' +
          'rning w:200 d:10000 '#13#10']]'
        Alignment = taCenter
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'warning'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -13
        Font.Style = [fsBold]
        TabOrder = 1
      end
      object UniLabel94: TUniLabel
        Left = 0
        Top = 33
        Width = 140
        Height = 23
        Cursor = crHandPoint
        Hint = 
          '[['#13#10'hint:hint with delay 10s and width 200px t:warning-light hin' +
          't c:warning-light w:200 d:10000 '#13#10']]'
        Alignment = taCenter
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'warning light'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -13
        Font.Style = [fsBold]
        TabOrder = 2
      end
    end
    object rcBlock190: TUniContainerPanel
      Tag = 1
      Left = 315
      Top = 1509
      Width = 140
      Height = 56
      Hint = 
        '[['#13#10'cols:2 |'#13#10'round:no | '#13#10'cls:card-info-box-white rc-dashed-blo' +
        'ck '#13#10']]'
      ParentColor = False
      TabOrder = 31
      DesignSize = (
        140
        56)
      object UniLabel89: TUniLabel
        Left = 0
        Top = 4
        Width = 140
        Height = 23
        Cursor = crHandPoint
        Hint = 
          '[['#13#10'hint:hint with delay 10s and width 200px t:info hint c:info ' +
          'w:200 d:10000 '#13#10']]'
        Alignment = taCenter
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'info'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -13
        Font.Style = [fsBold]
        TabOrder = 1
      end
      object UniLabel91: TUniLabel
        Left = -1
        Top = 33
        Width = 140
        Height = 23
        Cursor = crHandPoint
        Hint = 
          '[['#13#10'hint:hint with delay 10s and width 200px t:info-light c:info' +
          '-light w:200 d:10000 '#13#10']]'
        Alignment = taCenter
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'info light'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -13
        Font.Style = [fsBold]
        TabOrder = 2
      end
    end
    object rcBlock193: TUniContainerPanel
      Tag = 1
      Left = 626
      Top = 1502
      Width = 140
      Height = 56
      Hint = 
        '[['#13#10'cols:2 |'#13#10'round:no | '#13#10'cls:card-info-box-white rc-dashed-blo' +
        'ck '#13#10']]'
      ParentColor = False
      TabOrder = 32
      DesignSize = (
        140
        56)
      object UniLabel90: TUniLabel
        Left = 0
        Top = 3
        Width = 140
        Height = 23
        Cursor = crHandPoint
        Hint = 
          '[['#13#10'hint:hint with delay 10s and width 200px t:danger hint c:dan' +
          'ger w:200 d:10000 '#13#10']]'#13#10
        Alignment = taCenter
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'danger'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -13
        Font.Style = [fsBold]
        TabOrder = 1
      end
      object UniLabel93: TUniLabel
        Left = 0
        Top = 33
        Width = 140
        Height = 23
        Cursor = crHandPoint
        Hint = 
          '[['#13#10'hint:hint with delay 10s and width 200px t:danger-light hint' +
          ' c:danger-light w:200 d:10000 '#13#10']]'
        Alignment = taCenter
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'danger light'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -13
        Font.Style = [fsBold]
        TabOrder = 2
      end
    end
    object rcBlock195: TUniContainerPanel
      Tag = 4
      Left = 23
      Top = 1573
      Width = 729
      Height = 43
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 33
      object UniLabel95: TUniLabel
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
        Caption = 'QR Code'
        Align = alClient
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock196: TUniContainerPanel
      Tag = 1
      Left = 64
      Top = 1635
      Width = 667
      Height = 198
      Hint = '[['#13#10'cols:12 |'#13#10'round:no | '#13#10'cls:card-info-box-white '#13#10']]'
      ParentColor = False
      TabOrder = 34
      object rcBlock198: TUniContainerPanel
        Left = 5
        Top = 5
        Width = 450
        Height = 189
        Hint = 
          '[['#13#10'cols:12 |'#13#10'center:parent xy |'#13#10'max-width:450 mobile-v-300'#13#10']' +
          ']'#13#10#13#10#13#10
        ParentColor = False
        TabOrder = 1
        DesignSize = (
          450
          189)
        object btnQrCode: TUniButton
          Left = 314
          Top = 148
          Width = 125
          Height = 29
          Hint = ''
          Caption = 'Generate Qr CODE'
          Anchors = [akTop, akRight]
          TabOrder = 1
          OnClick = btnQrCodeClick
        end
        object edQrCodeLink: TUniEdit
          Left = 9
          Top = 148
          Width = 299
          Height = 29
          Hint = ''
          Text = 'https://www.radcore.pro.br'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
        end
        object paQrCode: TUniContainerPanel
          Left = 9
          Top = 10
          Width = 128
          Height = 128
          Hint = 
            '[['#13#10'cls:rc-dashed-block |'#13#10'qrcode:https://www.radcore.pro.br'#13#10']]' +
            #13#10
          ParentColor = False
          TabOrder = 3
        end
        object UniContainerPanel25: TUniContainerPanel
          Left = 312
          Top = 10
          Width = 128
          Height = 128
          Hint = '[['#13#10'cls:rc-dashed-block '#13#10']]'#13#10
          ParentColor = False
          Anchors = [akTop, akRight]
          TabOrder = 4
          object imgQrCode: TUniImage
            Left = 1
            Top = 1
            Width = 126
            Height = 126
            Hint = '[['#13#10'cls:rc-dashed-block'#13#10']]'
            Stretch = True
            Proportional = True
          end
        end
      end
    end
    object rcBlock19: TUniContainerPanel
      Tag = 2
      AlignWithMargins = True
      Left = 15
      Top = -713
      Width = 278
      Height = 230
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-6 | '#13#10'hr-childs:xs-exp sm-exp md-fix | '#13 +
        #10'cls:card-info-box-white |'#13#10'round:no | '#13#10']]'#13#10
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      AutoScroll = True
      TabOrder = 35
      ScrollHeight = 230
      ScrollWidth = 278
      object rcBlock20: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 251
        Height = 42
        Hint = 
          '[['#13#10'cols:12 | '#13#10'noborder-top | '#13#10'noborder-left | '#13#10'scale:parent ' +
          'w:100% | '#13#10'round:t | '#13#10'cls:card-light'#13#10']]'
        ParentColor = False
        Color = 14802398
        TabOrder = 1
        DesignSize = (
          251
          42)
        object UniLabel1: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 0
          Width = 245
          Height = 42
          Hint = '[['#13#10'bsh5: | '#13#10'cls:left-center'#13#10']]'#13#10
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = False
          Caption = 'Buttons Default'
          Align = alClient
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object labRcCollapse24: TUniLabel
          Left = 228
          Top = 10
          Width = 15
          Height = 25
          Hint = '[['#13#10'collapse:rcBlock19 off-42 collapsed:mobile'#13#10']]'#13#10
          TextConversion = txtHTML
          Caption = '^'
          Anchors = [akTop, akRight]
          ParentFont = False
          Font.Height = -21
          ParentColor = False
          Color = clBlack
          TabOrder = 2
        end
      end
      object rcBlock21: TUniContainerPanel
        Left = 24
        Top = 50
        Width = 75
        Height = 36
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 2
        DesignSize = (
          75
          36)
        object btnClose: TUniBitBtn
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 73
          Height = 34
          Hint = '[[cls:ButtonDark ]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Close '
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
          OnClick = btnCloseClick
        end
      end
      object rcBlock22: TUniContainerPanel
        Left = 103
        Top = 50
        Width = 75
        Height = 36
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 3
        DesignSize = (
          75
          36)
        object btnRed: TUniBitBtn
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 73
          Height = 34
          Hint = '[[cls:ButtonRed ]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Red'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object rcBlock23: TUniContainerPanel
        Left = 187
        Top = 52
        Width = 75
        Height = 36
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 4
        DesignSize = (
          75
          36)
        object btnGreen: TUniBitBtn
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 73
          Height = 34
          Hint = '[[cls:ButtonGreen]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Green'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object rcBlock27: TUniContainerPanel
        Left = 19
        Top = 130
        Width = 75
        Height = 36
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 5
        DesignSize = (
          75
          36)
        object btnGray: TUniBitBtn
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 73
          Height = 34
          Hint = '[[cls:ButtonGray]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Gray'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object rcBlock28: TUniContainerPanel
        Left = 105
        Top = 130
        Width = 75
        Height = 36
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 6
        DesignSize = (
          75
          36)
        object btnSilver: TUniBitBtn
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 73
          Height = 34
          Hint = '[[cls:ButtonSilver btn-font-black]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Silver'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object rcBlock29: TUniContainerPanel
        Left = 185
        Top = 130
        Width = 75
        Height = 36
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 7
        DesignSize = (
          75
          36)
        object btnCrud: TUniBitBtn
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 73
          Height = 34
          Hint = '[[cls:ButtonThemeCrud]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Themed'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object rcBlock24: TUniContainerPanel
        Left = 19
        Top = 90
        Width = 75
        Height = 36
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 8
        DesignSize = (
          75
          36)
        object btnOrange: TUniBitBtn
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 73
          Height = 34
          Hint = '[[cls:ButtonOrange ]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Orange'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object rcBlock25: TUniContainerPanel
        Left = 105
        Top = 90
        Width = 75
        Height = 36
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 9
        DesignSize = (
          75
          36)
        object btnBlue: TUniBitBtn
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 73
          Height = 34
          Hint = '[[cls:ButtonBlue]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Blue'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object rcBlock26: TUniContainerPanel
        Left = 185
        Top = 90
        Width = 75
        Height = 36
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 10
        DesignSize = (
          75
          36)
        object btnDark: TUniBitBtn
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 73
          Height = 34
          Hint = '[[cls:ButtonBlueDark ]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'BlueDark'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
    end
    object rcBlock40: TUniContainerPanel
      Tag = 1
      AlignWithMargins = True
      Left = 15
      Top = -470
      Width = 235
      Height = 284
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-3| '#13#10'round:no | '#13#10'cls:card-info-box-whit' +
        'e'#13#10']]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 36
      DesignSize = (
        235
        284)
      object UniContainerPanel22: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 235
        Height = 42
        Hint = '[[round:t | cls:card-light]]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel32: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 0
          Width = 229
          Height = 42
          Hint = '[[bsh5:|cls:left-center]]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = False
          Caption = 'Input Icons'
          Align = alClient
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object edUserName: TUniEdit
        Left = 16
        Top = 75
        Width = 203
        Height = 40
        Hint = '[['#13#10'inputico:fas-envelope |'#13#10'focus-color:off |'#13#10']]'#13#10
        CharCase = ecLowerCase
        Text = ''
        ParentFont = False
        Font.Height = -17
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        EmptyText = 'User Email'
        FieldLabelWidth = 20
        FieldLabelSeparator = ' '
        FieldLabelFont.Name = 'Calibri'
      end
      object labRepitaNova: TUniLabel
        Left = 17
        Top = 54
        Width = 59
        Height = 15
        Hint = ''
        Caption = 'User Email'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 3
      end
      object UniLabel2: TUniLabel
        Left = 16
        Top = 129
        Width = 82
        Height = 15
        Hint = ''
        Caption = 'User Password'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 4
      end
      object edPassword: TUniEdit
        Left = 17
        Top = 148
        Width = 203
        Height = 40
        Hint = '[['#13#10'inputico:fas-unlock |'#13#10'focus-color:off |'#13#10']]'#13#10
        PasswordChar = '*'
        Text = ''
        ParentFont = False
        Font.Height = -17
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 5
        EmptyText = 'Senha de Acesso'
        FieldLabelWidth = 20
        FieldLabelSeparator = ' '
        FieldLabelFont.Name = 'Calibri'
      end
      object btnLink: TUniBitBtn
        AlignWithMargins = True
        Left = 17
        Top = 205
        Width = 202
        Height = 66
        Hint = 
          '[['#13#10'ico:fas-link 2x | '#13#10'ico-pos:up |'#13#10'cls:ButtonOutline ButtonOu' +
          'tlineGreen | '#13#10'align:edPassword r:-w b:10 | '#13#10'link:https://radco' +
          're.pro.br/web/atualizacoes/ |'#13#10'append'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Open Link'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 6
      end
    end
    object rcBlock42: TUniContainerPanel
      Tag = 1
      AlignWithMargins = True
      Left = 261
      Top = -470
      Width = 280
      Height = 284
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-4 | '#13#10'round:no | '#13#10'cls:card-info-box-whi' +
        'te'#13#10']]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 37
      object rcBlock43: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 280
        Height = 42
        Hint = '[['#13#10'cols:12 |'#13#10'noborder-all|'#13#10'round:t | cls:card-light'#13#10']]'
        ParentColor = False
        Color = clSilver
        TabOrder = 1
        object UniLabel17: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 0
          Width = 274
          Height = 42
          Hint = '[[bsh5:|cls:left-center]]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = False
          Caption = 'Forms'
          Align = alClient
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object btnSave: TUniBitBtn
        AlignWithMargins = True
        Left = 149
        Top = 231
        Width = 130
        Height = 36
        Hint = 
          '[['#13#10'ico:far-copy | '#13#10'cls:ButtonGreen | '#13#10'align:rcBlock45 r:-w b:' +
          '10 | '#13#10'append'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Copy ClipBoard'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
        OnClick = btnSaveClick
      end
      object btnCancel: TUniBitBtn
        AlignWithMargins = True
        Left = 23
        Top = 212
        Width = 119
        Height = 36
        Hint = 
          '[['#13#10'ico:far-paste | '#13#10'cls:ButtonRed | '#13#10'align:btnsave t:0 l:-w-1' +
          '0 | '#13#10'append '#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Paste'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 3
        OnClick = btnCancelClick
      end
      object rcBlock44: TUniContainerPanel
        Left = 28
        Top = 55
        Width = 122
        Height = 36
        Hint = '[[cols:xs-12 sm-12 md-12 ]]'
        ParentColor = False
        TabOrder = 4
        DesignSize = (
          122
          36)
        object UniEdit1: TUniEdit
          Left = 0
          Top = 6
          Width = 122
          Height = 29
          Hint = 
            '[['#13#10'form-label:top-in Label |'#13#10'form-label-color:#7e7e7e |'#13#10'form-' +
            'label-bg:#ffffff |'#13#10'focus-color:off |'#13#10']]'
          Text = ''
          ParentFont = False
          Font.Height = -16
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
      end
      object rcBlock45: TUniContainerPanel
        Left = 23
        Top = 114
        Width = 205
        Height = 81
        Hint = '[[cols:xs-12 sm-12 md-12 ]]'
        ParentColor = False
        TabOrder = 5
        DesignSize = (
          205
          81)
        object memo: TUniMemo
          Left = 2
          Top = 16
          Width = 201
          Height = 63
          Hint = 
            '[['#13#10'form-label:top Memo |'#13#10'form-label-bg:#ffffff |'#13#10'form-label-c' +
            'olor:#7e7e7e |'#13#10'focus-color:off |'#13#10']]'
          ParentFont = False
          Font.Height = -16
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          LayoutConfig.Cls = 'toupper'
        end
      end
    end
    object rcBlock72: TUniContainerPanel
      Tag = 1
      AlignWithMargins = True
      Left = 15
      Top = -176
      Width = 184
      Height = 246
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-4| '#13#10'round:no | '#13#10'cls:card-info-box-whit' +
        'e'#13#10']]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 38
      object UniContainerPanel14: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 184
        Height = 42
        Hint = '[[round:t | cls:card-light]]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel18: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 0
          Width = 178
          Height = 42
          Hint = '[[bsh5:|cls:left-center]]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = False
          Caption = 'bsswt  / bschk'
          Align = alClient
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object UniScrollBox2: TUniScrollBox
        Left = 0
        Top = 42
        Width = 184
        Height = 204
        Hint = ''
        Align = alClient
        TabOrder = 2
        DesignSize = (
          182
          202)
        object UniContainerPanel21: TUniContainerPanel
          Left = 20
          Top = 12
          Width = 147
          Height = 177
          Hint = ''
          ParentColor = False
          Anchors = []
          TabOrder = 0
          OnClick = UniContainerPanel21Click
          object UniLabel22: TUniLabel
            Left = 81
            Top = 15
            Width = 33
            Height = 20
            Hint = '[[bsswt:1]]'
            TextConversion = txtHTML
            AutoSize = False
            Caption = 'Opt1'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsUnderline]
            ParentColor = False
            Color = clBtnFace
            TabOrder = 1
          end
          object UniLabel23: TUniLabel
            Left = 10
            Top = 18
            Width = 48
            Height = 15
            Hint = ''
            Caption = 'Option 1'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 2
          end
          object UniLabel25: TUniLabel
            Left = 81
            Top = 38
            Width = 33
            Height = 20
            Hint = '[[bsswt:0]]'
            TextConversion = txtHTML
            AutoSize = False
            Caption = 'Opt2'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsUnderline]
            ParentColor = False
            Color = clBtnFace
            TabOrder = 3
          end
          object UniLabel26: TUniLabel
            Left = 10
            Top = 43
            Width = 48
            Height = 15
            Hint = ''
            Caption = 'Option 2'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 4
          end
          object UniLabel27: TUniLabel
            Left = 81
            Top = 66
            Width = 33
            Height = 20
            Hint = '[[bsswt:0 *]]'
            TextConversion = txtHTML
            AutoSize = False
            Caption = 'Opt3'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsUnderline]
            ParentColor = False
            Color = clBtnFace
            TabOrder = 5
          end
          object UniLabel28: TUniLabel
            Left = 12
            Top = 71
            Width = 48
            Height = 15
            Hint = ''
            Caption = 'Option 3'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 6
          end
          object UniLabel38: TUniLabel
            Left = 10
            Top = 120
            Width = 20
            Height = 20
            Hint = '[[bschk:1]]'
            TextConversion = txtHTML
            AutoSize = False
            Caption = 'Active'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsUnderline]
            ParentColor = False
            Color = clBtnFace
            TabOrder = 7
          end
          object UniLabel39: TUniLabel
            Left = 36
            Top = 123
            Width = 34
            Height = 15
            Hint = ''
            Caption = 'Active'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 8
          end
          object UniLabel53: TUniLabel
            Left = 10
            Top = 142
            Width = 20
            Height = 20
            Hint = '[[bschk:0]]'
            TextConversion = txtHTML
            AutoSize = False
            Caption = 'Active'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsUnderline]
            ParentColor = False
            Color = clBtnFace
            TabOrder = 9
          end
          object UniLabel55: TUniLabel
            Left = 36
            Top = 145
            Width = 42
            Height = 15
            Hint = ''
            Caption = 'Inactive'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 10
          end
        end
      end
    end
    object rcBlock70: TUniContainerPanel
      Tag = 1
      AlignWithMargins = True
      Left = 207
      Top = -176
      Width = 184
      Height = 246
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-4| '#13#10'round:no | '#13#10'cls:card-info-box-whit' +
        'e'#13#10']]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      ParentAlignmentControl = False
      TabOrder = 39
      DesignSize = (
        184
        246)
      object UniContainerPanel29: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 184
        Height = 42
        Hint = '[[round:t | cls:card-light]]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel29: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 0
          Width = 178
          Height = 42
          Hint = '[[bsh5:|cls:left-center]]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = False
          Caption = 'bsrgp'
          Align = alClient
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object UniContainerPanel36: TUniContainerPanel
        Left = 6
        Top = 64
        Width = 174
        Height = 171
        Hint = ''
        ParentColor = False
        Anchors = []
        TabOrder = 2
        DesignSize = (
          174
          171)
        object bsrgpTipo01_M: TUniLabel
          Tag = 1
          Left = 11
          Top = 11
          Width = 20
          Height = 20
          Hint = ''
          TextConversion = txtHTML
          AutoSize = False
          Caption = 'Opt1'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsUnderline]
          ParentColor = False
          Color = clBtnFace
          TabOrder = 1
        end
        object UniLabel31: TUniLabel
          Left = 37
          Top = 14
          Width = 105
          Height = 15
          Hint = ''
          Caption = 'Option 1( value M )'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 2
        end
        object bsrgpTipo02_E: TUniLabel
          Left = 11
          Top = 34
          Width = 20
          Height = 20
          Hint = ''
          TextConversion = txtHTML
          AutoSize = False
          Caption = 'Opt2'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsUnderline]
          ParentColor = False
          Color = clBtnFace
          TabOrder = 3
        end
        object UniLabel34: TUniLabel
          Left = 37
          Top = 37
          Width = 100
          Height = 15
          Hint = ''
          Caption = 'Option 2( value E )'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 4
        end
        object bsrgpTipo03_F: TUniLabel
          Left = 11
          Top = 59
          Width = 20
          Height = 20
          Hint = ''
          TextConversion = txtHTML
          AutoSize = False
          Caption = 'Opt3'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsUnderline]
          ParentColor = False
          Color = clBtnFace
          TabOrder = 5
        end
        object UniLabel47: TUniLabel
          Left = 37
          Top = 62
          Width = 100
          Height = 15
          Hint = ''
          Caption = 'Option 3( value F )'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 6
        end
        object btnGetIndex: TUniBitBtn
          AlignWithMargins = True
          Left = 5
          Top = 123
          Width = 75
          Height = 36
          Hint = '[['#13#10'cls:ButtonThemeCrud | '#13#10'pos-l:10 | '#13#10'pos-b:46'#13#10']]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Get Index'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 7
          OnClick = btnGetIndexClick
        end
        object btnGetValue: TUniBitBtn
          AlignWithMargins = True
          Left = 85
          Top = 127
          Width = 75
          Height = 36
          Hint = '[['#13#10'cls:ButtonThemeCrud | '#13#10'align:btnGetIndex t:0 r:10'#13#10']]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Get Value'
          Anchors = []
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 8
          OnClick = btnGetValueClick
        end
      end
    end
    object rcBlock10: TUniContainerPanel
      Tag = 4
      Left = 25
      Top = -769
      Width = 729
      Height = 43
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 40
      object UniLabel35: TUniLabel
        AlignWithMargins = True
        Left = 6
        Top = 6
        Width = 717
        Height = 31
        Hint = '[[bsh5:left-center]]'
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        AutoSize = False
        Caption = 'Forms and Elements'
        Align = alClient
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock30: TUniContainerPanel
      Tag = 2
      AlignWithMargins = True
      Left = 307
      Top = -714
      Width = 340
      Height = 230
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-6 | '#13#10'round:no | '#13#10'cls:card-info-box-whi' +
        'te |'#13#10']]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 41
      object UniContainerPanel11: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 340
        Height = 42
        Hint = '[['#13#10'round:t | '#13#10'cls:card-light'#13#10']]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel42: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 0
          Width = 334
          Height = 42
          Hint = '[['#13#10'bsh5: |'#13#10'cls:left-center'#13#10']]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = False
          Caption = 'Buttons Outline / Rounded'
          Align = alClient
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object UniScrollBox3: TUniScrollBox
        AlignWithMargins = True
        Left = 0
        Top = 45
        Width = 340
        Height = 182
        Hint = ''
        Margins.Left = 0
        Margins.Right = 0
        Align = alClient
        TabOrder = 2
        ScrollHeight = 171
        ScrollWidth = 291
        object btnRedOutL: TUniBitBtn
          AlignWithMargins = True
          Left = 12
          Top = 15
          Width = 90
          Height = 36
          Hint = 
            '[['#13#10'cls:ButtonOutline ButtonOutlineRed btn-font-red| '#13#10'scale:par' +
            'ent w:32% | '#13#10'pos-l:2%'#13#10']]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Red OL'
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 0
        end
        object btnGreenOutL: TUniBitBtn
          AlignWithMargins = True
          Left = 107
          Top = 15
          Width = 90
          Height = 36
          Hint = 
            '[[cls:ButtonOutline ButtonOutlineGreen btn-font-green| align:btn' +
            'RedOutL t:0 r:5 | scale:parent w:32%]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Green OL'
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object btnBlueOutL: TUniBitBtn
          AlignWithMargins = True
          Left = 201
          Top = 15
          Width = 90
          Height = 36
          Hint = 
            '[['#13#10'cls:ButtonOutline ButtonOutlineBlue btn-font-blue| '#13#10'align:b' +
            'tnGreenOutL t:0 r:5 | '#13#10'scale:parent w:31%'#13#10']]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Blue OL'
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 2
        end
        object btnRedRound: TUniBitBtn
          AlignWithMargins = True
          Left = 12
          Top = 95
          Width = 90
          Height = 36
          Hint = 
            '[[cls:ButtonOutline ButtonOutlineRed ButtonRound | scale:parent ' +
            'w:32% | pos-l:2%]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Red'
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 3
        end
        object btnGreenRound: TUniBitBtn
          AlignWithMargins = True
          Left = 107
          Top = 95
          Width = 90
          Height = 36
          Hint = 
            '[[cls:ButtonOutline ButtonOutlineGreen ButtonRound | align:btnRe' +
            'dRound t:0 r:5 | scale:parent w:32%]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Green'
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 4
        end
        object btnRound: TUniBitBtn
          AlignWithMargins = True
          Left = 201
          Top = 95
          Width = 90
          Height = 36
          Hint = 
            '[['#13#10'cls:ButtonOutline ButtonOutlineBlue ButtonRound | align:btnG' +
            'reenRound t:0 r:5 | '#13#10'scale:parent w:31%'#13#10']]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Blue'
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 5
        end
        object btnOrangeOutL: TUniBitBtn
          AlignWithMargins = True
          Left = 12
          Top = 55
          Width = 90
          Height = 36
          Hint = 
            '[[cls:ButtonOutline ButtonOutlineOrange btn-font-orange| scale:p' +
            'arent w:32% | pos-l:2%]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Orange OL'
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 6
        end
        object btnGrayOutL: TUniBitBtn
          AlignWithMargins = True
          Left = 106
          Top = 55
          Width = 90
          Height = 36
          Hint = 
            '[[cls:ButtonOutline ButtonOutlineGray btn-font-gray| align:btnOr' +
            'angeOutL t:0 r:5 | scale:parent w:32%]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Gray OL'
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 7
        end
        object btnOrangeRound: TUniBitBtn
          AlignWithMargins = True
          Left = 12
          Top = 135
          Width = 90
          Height = 36
          Hint = 
            '[[cls:ButtonOutline ButtonOutlineOrange ButtonRound | scale:pare' +
            'nt w:32% | pos-l:2%]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Orange'
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 8
        end
        object btnSilverOutL: TUniBitBtn
          AlignWithMargins = True
          Left = 201
          Top = 55
          Width = 90
          Height = 36
          Hint = 
            '[[cls:ButtonOutline ButtonOutlineSilver btn-font-silver| align:b' +
            'tnGrayOutL t:0 r:5 | scale:parent w:31%]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Silver OL'
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 9
        end
        object btnGrayRound: TUniBitBtn
          AlignWithMargins = True
          Left = 106
          Top = 135
          Width = 90
          Height = 36
          Hint = 
            '[[cls:ButtonOutline ButtonOutlineGray ButtonRound | align:btnOra' +
            'ngeRound t:0 r:5 | scale:parent w:32%]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Gray'
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 10
        end
        object btnSilverRound: TUniBitBtn
          AlignWithMargins = True
          Left = 201
          Top = 135
          Width = 90
          Height = 36
          Hint = 
            '[[cls:ButtonOutline ButtonOutlineSilver ButtonRound | align:btnG' +
            'rayRound t:0 r:5 | scale:parent w:31%]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Silver'
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 11
        end
      end
    end
    object rcBlock76: TUniContainerPanel
      Tag = 1
      AlignWithMargins = True
      Left = 405
      Top = -176
      Width = 310
      Height = 246
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-4 | '#13#10'round:no | '#13#10'cls:card-info-box-whi' +
        'te'#13#10']]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 42
      object UniContainerPanel16: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 310
        Height = 42
        Hint = '[[round:t | cls:card-light]]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel69: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 0
          Width = 304
          Height = 42
          Hint = '[[bsh5:|cls:left-center]]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = False
          Caption = 'Open Form Dynamically'
          Align = alClient
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object btnInsertNew: TUniBitBtn
        AlignWithMargins = True
        Left = 170
        Top = 134
        Width = 82
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineRed | '#13#10'center:parent x:90 y:' +
          '60'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Insert New'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
        OnClick = btnInsertNewClick
      end
      object btnShowFishFact: TUniBitBtn
        AlignWithMargins = True
        Left = 34
        Top = 53
        Width = 82
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineGreen | '#13#10'center:parent x:-90' +
          ' y:-30'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'FISHFACTS'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 3
        OnClick = btnShowFishFactClick
      end
      object btnShowCustomer: TUniBitBtn
        AlignWithMargins = True
        Left = 155
        Top = 54
        Width = 82
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineBlue | '#13#10'center:parent x:90 y' +
          ':-30'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Show "569"'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 4
        OnClick = btnShowCustomerClick
      end
      object btnEditCustomer: TUniBitBtn
        AlignWithMargins = True
        Left = 44
        Top = 139
        Width = 82
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineOrange | '#13#10'center:parent x:-9' +
          '0 y:60'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Edit "569"'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 5
        OnClick = btnEditCustomerClick
      end
      object btnInsideBlock: TUniBitBtn
        AlignWithMargins = True
        Left = 44
        Top = 183
        Width = 172
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineOrange | '#13#10'align:btnEditCusto' +
          'mer t:h+9 l:0 |'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'FISHFACTS inside a BLOCK'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 6
        OnClick = btnInsideBlockClick
      end
    end
    object rcBlock46: TUniContainerPanel
      Tag = 1
      AlignWithMargins = True
      Left = 556
      Top = -473
      Width = 349
      Height = 284
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-5 | '#13#10'hr-childs:xs-exp sm-exp md-fix(mob' +
        'ile-exp) | '#13#10'round:no | '#13#10'cls:card-info-box-white'#13#10']]'#13#10
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 43
      object rcBlock48: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 349
        Height = 42
        Hint = 
          '[['#13#10'cols:12 |'#13#10'noborder-top | '#13#10'noborder-left | '#13#10'round:t | '#13#10'cl' +
          's:card-light'#13#10']]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel70: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 0
          Width = 343
          Height = 42
          Hint = '[['#13#10'bsh5:|cls:left-center'#13#10']]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = False
          Caption = '"In Line" Form Responsive'
          Align = alClient
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object rcBlock50: TUniContainerPanel
        Tag = 1
        Left = 12
        Top = 51
        Width = 91
        Height = 32
        Hint = 
          '[['#13#10'cols:xs-12 sm-12 md-2 |'#13#10'noborder-bottom |'#13#10'noborder-top:mob' +
          'ile |'#13#10']]'
        ParentColor = False
        TabOrder = 2
        DesignSize = (
          91
          32)
        object rcLabel3600: TUniLabel
          Left = 1
          Top = 13
          Width = 30
          Height = 14
          Hint = 
            '[['#13#10'scale:parent w:100% off:4 mobile-off |'#13#10'alignment:right mobi' +
            'le-left '#13#10']]'#13#10
          AutoSize = False
          Caption = 'Date'
          Anchors = [akLeft, akBottom]
          ParentFont = False
          Font.Height = -12
          TabOrder = 1
        end
      end
      object rcBlock52: TUniContainerPanel
        Tag = 1
        Left = 114
        Top = 51
        Width = 111
        Height = 32
        Hint = '[['#13#10'cols:xs-12 sm-12 md-10 |'#13#10'noborder-top |'#13#10']]'
        ParentColor = False
        TabOrder = 3
        DesignSize = (
          111
          32)
        object UniDateTimePicker1: TUniDateTimePicker
          Left = 0
          Top = 1
          Width = 110
          Height = 30
          Hint = '[['#13#10'mask:date'#13#10']]'
          DateTime = 44599.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
      end
      object rcBlock58: TUniContainerPanel
        Tag = 1
        Left = 14
        Top = 139
        Width = 91
        Height = 32
        Hint = 
          '[['#13#10'cols:xs-12 sm-12 md-2 |'#13#10'noborder-bottom |'#13#10'noborder-top:mob' +
          'ile |'#13#10']]'
        ParentColor = False
        TabOrder = 4
        DesignSize = (
          91
          32)
        object UniLabel71: TUniLabel
          Left = 1
          Top = 13
          Width = 30
          Height = 14
          Hint = 
            '[['#13#10'scale:parent w:100% off:4 mobile-off |'#13#10'alignment:right mobi' +
            'le-left '#13#10']]'#13#10
          AutoSize = False
          Caption = 'Id'
          Anchors = [akLeft, akBottom]
          ParentFont = False
          Font.Height = -12
          TabOrder = 1
        end
      end
      object rcBlock60: TUniContainerPanel
        Tag = 1
        Left = 116
        Top = 139
        Width = 111
        Height = 32
        Hint = '[['#13#10'cols:xs-12 sm-12 md-10 |'#13#10'noborder-top |'#13#10']]'
        ParentColor = False
        TabOrder = 5
        DesignSize = (
          111
          32)
        object edID: TUniEdit
          Left = 0
          Top = 1
          Width = 110
          Height = 30
          Hint = '[['#13#10'mask:99.99 |'#13#10'valid:min-4|'#13#10']]'#13#10
          CharCase = ecUpperCase
          Text = ''
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
      end
      object rcBlock65: TUniContainerPanel
        Tag = 1
        Left = 14
        Top = 223
        Width = 91
        Height = 32
        Hint = 
          '[['#13#10'cols:xs-0 sm-0 md-2 |'#13#10'hr:xs-0 sm-0 md-2 |'#13#10'hide:mobile |'#13#10']' +
          ']'#13#10#13#10#13#10
        ParentColor = False
        TabOrder = 6
      end
      object rcBlock67: TUniContainerPanel
        Tag = 1
        Left = 116
        Top = 223
        Width = 111
        Height = 32
        Hint = '[['#13#10'cols:xs-6 sm-6 md-5 |'#13#10']]'
        ParentColor = False
        TabOrder = 7
        DesignSize = (
          111
          32)
        object btnCancelForm: TUniBitBtn
          AlignWithMargins = True
          Left = 0
          Top = 1
          Width = 110
          Height = 30
          Hint = '[['#13#10'ico:fas-times | '#13#10'cls:ButtonRed | '#13#10'append '#13#10']]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Remove Mask'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
          OnClick = btnCancelFormClick
        end
      end
      object rcBlock69: TUniContainerPanel
        Tag = 1
        Left = 233
        Top = 223
        Width = 111
        Height = 32
        Hint = '[['#13#10'cols:xs-6 sm-6 md-5 |'#13#10']]'
        ParentColor = False
        TabOrder = 8
        DesignSize = (
          111
          32)
        object btnSaveFormValidate: TUniBitBtn
          AlignWithMargins = True
          Left = 0
          Top = 1
          Width = 110
          Height = 30
          Hint = '[['#13#10'ico:fas-save | '#13#10'cls:ButtonGreen | '#13#10'append'#13#10']]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Save'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
          ClientEvents.UniEvents.Strings = (
            'ajaxRequest=function ajaxRequest(sender, url, data)'#13#10'{'#13#10#13#10'}')
          OnClick = btnSaveFormValidateClick
        end
      end
      object rcBlock54: TUniContainerPanel
        Tag = 1
        Left = 12
        Top = 93
        Width = 91
        Height = 32
        Hint = 
          '[['#13#10'cols:xs-12 sm-12 md-2 |'#13#10'noborder-bottom |'#13#10'noborder-top:mob' +
          'ile |'#13#10']]'
        ParentColor = False
        TabOrder = 9
        DesignSize = (
          91
          32)
        object UniLabel72: TUniLabel
          Left = 1
          Top = 13
          Width = 30
          Height = 14
          Hint = 
            '[['#13#10'scale:parent w:100% off:4 mobile-off |'#13#10'alignment:right mobi' +
            'le-left '#13#10']]'#13#10
          AutoSize = False
          Caption = 'Phone'
          Anchors = [akLeft, akBottom]
          ParentFont = False
          Font.Height = -12
          TabOrder = 1
        end
      end
      object rcBlock56: TUniContainerPanel
        Tag = 1
        Left = 114
        Top = 93
        Width = 111
        Height = 32
        Hint = '[['#13#10'cols:xs-12 sm-12 md-10 |'#13#10'noborder-top |'#13#10']]'
        ParentColor = False
        TabOrder = 10
        DesignSize = (
          111
          32)
        object UniEdit3: TUniEdit
          Left = 0
          Top = 1
          Width = 110
          Height = 30
          Hint = '[['#13#10'mask:phoneddd |'#13#10'dial:'#13#10']]'#13#10
          CharCase = ecUpperCase
          Text = ''
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
      end
      object rcBlock63: TUniContainerPanel
        Tag = 1
        Left = 14
        Top = 181
        Width = 91
        Height = 32
        Hint = 
          '[['#13#10'cols:xs-12 sm-12 md-2 |'#13#10'noborder-bottom |'#13#10'noborder-top:mob' +
          'ile |'#13#10']]'
        ParentColor = False
        TabOrder = 11
        DesignSize = (
          91
          32)
        object UniLabel73: TUniLabel
          Left = 1
          Top = 13
          Width = 30
          Height = 14
          Hint = 
            '[['#13#10'scale:parent w:100% off:4 mobile-off |'#13#10'alignment:right mobi' +
            'le-left '#13#10']]'#13#10
          AutoSize = False
          Caption = 'Site'
          Anchors = [akLeft, akBottom]
          ParentFont = False
          Font.Height = -12
          TabOrder = 1
        end
      end
      object rcBlock64: TUniContainerPanel
        Tag = 1
        Left = 116
        Top = 181
        Width = 111
        Height = 32
        Hint = '[['#13#10'cols:xs-12 sm-12 md-10 |'#13#10'noborder-top |'#13#10']]'
        ParentColor = False
        TabOrder = 12
        DesignSize = (
          111
          32)
        object edSite: TUniEdit
          Left = 0
          Top = 1
          Width = 110
          Height = 30
          Hint = 
            '[['#13#10'valid:blank=Site |'#13#10'valid-required:bottom-in |'#13#10'link: |'#13#10']]'#13 +
            #10#13#10
          Text = ''
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          OnExit = edSiteExit
        end
      end
    end
    object rcBlock128: TUniContainerPanel
      Tag = 1
      AlignWithMargins = True
      Left = 741
      Top = 141
      Width = 230
      Height = 151
      Hint = 
        '[[cols:xs-12 sm-12 md-6 lg-3 xl-3 | round:no | cls:card-info-box' +
        '-white]]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 45
      object UniContainerPanel33: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 230
        Height = 42
        Hint = '[[round:t | cls:card-light]]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel51: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 0
          Width = 224
          Height = 42
          Hint = '[[bsh5:|cls:left-center]]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = False
          Caption = 'rc_ShowInputBox / YesNo'
          Align = alClient
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object btnQuestionInput: TUniBitBtn
        AlignWithMargins = True
        Left = 17
        Top = 81
        Width = 70
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineBlue | '#13#10'center:parent x:-74 ' +
          'y:42'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Question'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
        OnClick = btnQuestionInputClick
      end
      object btnInputShow: TUniBitBtn
        AlignWithMargins = True
        Left = 93
        Top = 91
        Width = 70
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineBlue | '#13#10'center:parent x:74 y' +
          ':42'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Input'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 3
        OnClick = btnInputShowClick
      end
      object chkPassword: TUniLabel
        Left = 12
        Top = 124
        Width = 20
        Height = 20
        Hint = '[[bschk:0]]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Password'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsUnderline]
        ParentColor = False
        Color = clBtnFace
        TabOrder = 4
      end
      object UniLabel54: TUniLabel
        Left = 38
        Top = 127
        Width = 52
        Height = 15
        Hint = ''
        Caption = 'Password'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        TabOrder = 5
      end
    end
    object rcBlock126: TUniContainerPanel
      Tag = 1
      AlignWithMargins = True
      Left = 494
      Top = 141
      Width = 230
      Height = 151
      Hint = 
        '[[cols:xs-12 sm-12 md-6 lg-3 xl-3 | round:no | cls:card-info-box' +
        '-white]]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 46
      object UniContainerPanel32: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 230
        Height = 42
        Hint = '[[round:t | cls:card-light]]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel50: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 0
          Width = 224
          Height = 42
          Hint = '[[bsh5:|cls:left-center]]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = False
          Caption = 'rc_ShowToaster'
          Align = alClient
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object btnToastSucces: TUniBitBtn
        AlignWithMargins = True
        Left = 27
        Top = 67
        Width = 70
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineGreen | '#13#10'pos-l:4 | '#13#10'pos-t:5' +
          '2'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Success'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
        OnClick = btnToastSuccesClick
      end
      object btnToastWarning: TUniBitBtn
        AlignWithMargins = True
        Left = 6
        Top = 96
        Width = 70
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineBlue | '#13#10'pos-l:4 | '#13#10'pos-b:40' +
          #13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Warning'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 3
        OnClick = btnToastWarningClick
      end
      object btnToastError: TUniBitBtn
        AlignWithMargins = True
        Left = 121
        Top = 107
        Width = 70
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineRed | '#13#10'pos-r:74 | '#13#10'pos-b:40' +
          #13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Error'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 4
        OnClick = btnToastErrorClick
      end
      object btnToastInfo: TUniBitBtn
        AlignWithMargins = True
        Left = 141
        Top = 54
        Width = 70
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineBlue | '#13#10'pos-r:74 | '#13#10'pos-t:5' +
          '2'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Info'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 5
        OnClick = btnToastInfoClick
      end
      object chkSound: TUniLabel
        Left = 174
        Top = 88
        Width = 20
        Height = 20
        Hint = '[[bschk:0 | center:parent x:-25 y:42]]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Sound'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsUnderline]
        ParentColor = False
        Color = clBtnFace
        TabOrder = 6
      end
      object UniLabel52: TUniLabel
        Left = 200
        Top = 91
        Width = 34
        Height = 15
        Hint = '[[center:parent x:25 y:42]]'
        Caption = 'Sound'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        TabOrder = 7
      end
    end
    object rcBlock124: TUniContainerPanel
      Tag = 1
      AlignWithMargins = True
      Left = 252
      Top = 143
      Width = 230
      Height = 151
      Hint = 
        '[[cols:xs-12 sm-12 md-6 lg-3 xl-3 | round:no | cls:card-info-box' +
        '-white]]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 47
      object paSweetHeader: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 230
        Height = 42
        Hint = '[[round:t | cls:card-light]]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel49: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 0
          Width = 224
          Height = 42
          Hint = '[[bsh5:|cls:left-center]]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = False
          Caption = 'rc_ShowSweetAlert'
          Align = alClient
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object btnSweetSuccess: TUniBitBtn
        AlignWithMargins = True
        Left = 13
        Top = 59
        Width = 70
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineGreen | '#13#10'scale:parent w:45% ' +
          '| '#13#10'pos-l:5%'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Success'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
        OnClick = btnSweetSuccessClick
      end
      object btnSweetWarning: TUniBitBtn
        AlignWithMargins = True
        Left = 26
        Top = 99
        Width = 70
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineOrange | '#13#10'align:btnSweetSucc' +
          'ess t:h+5 l:0 | '#13#10'scale:parent w:45%'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Warning'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 3
        OnClick = btnSweetWarningClick
      end
      object btnSweetError: TUniBitBtn
        AlignWithMargins = True
        Left = 157
        Top = 107
        Width = 70
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineRed | '#13#10'align:btnSweetWarning' +
          ' t:0 r:5 | '#13#10'scale:parent w:45%'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Error'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 4
        OnClick = btnSweetErrorClick
      end
      object btnSweetInfo: TUniBitBtn
        AlignWithMargins = True
        Left = 148
        Top = 49
        Width = 70
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineBlue | align:btnSweetSuccess ' +
          't:0 r:5 | '#13#10'scale:parent w:45%'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Info'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 5
        OnClick = btnSweetInfoClick
      end
    end
    object rcBlock122: TUniContainerPanel
      Tag = 1
      AlignWithMargins = True
      Left = 9
      Top = 143
      Width = 230
      Height = 151
      Hint = 
        '[[cols:xs-12 sm-12 md-6 lg-3 xl-3 | round:no | cls:card-info-box' +
        '-white]]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 48
      object UniContainerPanel26: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 230
        Height = 42
        Hint = '[[round:t | cls:card-light]]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel48: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 0
          Width = 224
          Height = 42
          Hint = '[[bsh5:|cls:left-center]]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = False
          Caption = 'rc_ShowMessage'
          Align = alClient
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object UniBitBtn12: TUniBitBtn
        AlignWithMargins = True
        Left = 88
        Top = 94
        Width = 70
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineRed | '#13#10'center:parent x:74 y:' +
          '90'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Error'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
        OnClick = UniBitBtn12Click
      end
      object btnSuccess1: TUniBitBtn
        AlignWithMargins = True
        Left = 6
        Top = 52
        Width = 70
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineGreen | '#13#10'center:parent x:-74' +
          ' y:8'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Success'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 3
        OnClick = btnSuccess1Click
      end
      object btnShowMsgInfo: TUniBitBtn
        AlignWithMargins = True
        Left = 88
        Top = 50
        Width = 70
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineBlue | '#13#10'center:parent x:74 y' +
          ':8'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Info'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 4
        OnClick = btnShowMsgInfoClick
      end
      object btnShowWarning: TUniBitBtn
        AlignWithMargins = True
        Left = 6
        Top = 96
        Width = 70
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineOrange | '#13#10'center:parent x:-7' +
          '4 y:90'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Warning'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 5
        OnClick = btnShowWarningClick
      end
    end
    object rcBlock130: TUniContainerPanel
      Tag = 4
      Left = 11
      Top = 303
      Width = 729
      Height = 43
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 49
      object UniLabel36: TUniLabel
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
        Caption = 'Panels '
        Align = alClient
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock131: TUniContainerPanel
      Tag = 4
      AlignWithMargins = True
      Left = 37
      Top = 355
      Width = 680
      Height = 200
      Hint = '[[cols:12 | round:no | cls:card-info-box-white]]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 50
      object UniContainerPanel23: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 680
        Height = 42
        Hint = '[[round:t | cls:card-light]]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel33: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 0
          Width = 674
          Height = 42
          Hint = '[[bsh5:|cls:left-center]]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = False
          Caption = 'Rounded Panels with scroll'
          Align = alClient
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object UniScrollBox4: TUniScrollBox
        AlignWithMargins = True
        Left = 2
        Top = 44
        Width = 676
        Height = 154
        Hint = ''
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Align = alClient
        TabOrder = 2
        ScrollHeight = 129
        ScrollWidth = 578
        object UniContainerPanel1: TUniContainerPanel
          Left = 12
          Top = 16
          Width = 163
          Height = 55
          Hint = '[[round:all]]'
          ParentColor = False
          Color = 13078040
          TabOrder = 0
          DesignSize = (
            163
            55)
          object UniLabel9: TUniLabel
            Left = 6
            Top = 22
            Width = 150
            Height = 15
            Hint = ''
            Alignment = taCenter
            AutoSize = False
            Caption = 'All Rounded'
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
        object UniContainerPanel4: TUniContainerPanel
          Left = 334
          Top = 16
          Width = 120
          Height = 55
          Hint = '[[ round:t l ]]'
          ParentColor = False
          Color = 8421440
          TabOrder = 1
          object UniLabel3: TUniLabel
            Left = 6
            Top = 5
            Width = 113
            Height = 38
            Hint = ''
            AutoSize = False
            Caption = 'top left'
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
        object UniContainerPanel6: TUniContainerPanel
          Left = 334
          Top = 74
          Width = 120
          Height = 55
          Hint = '[[ round:b l ]]'
          ParentColor = False
          Color = 8421440
          TabOrder = 2
          object UniLabel4: TUniLabel
            Left = 2
            Top = 34
            Width = 113
            Height = 15
            Hint = ''
            AutoSize = False
            Caption = 'bottom left'
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
        object UniContainerPanel2: TUniContainerPanel
          Left = 12
          Top = 74
          Width = 80
          Height = 55
          Hint = '[[round:l]]'
          ParentColor = False
          Color = 4539862
          TabOrder = 3
          object UniLabel8: TUniLabel
            Left = 3
            Top = 34
            Width = 71
            Height = 17
            Hint = ''
            AutoSize = False
            Caption = 'left '
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
        object UniContainerPanel3: TUniContainerPanel
          Left = 95
          Top = 74
          Width = 80
          Height = 55
          Hint = '[[round:r]]'
          ParentColor = False
          Color = 4539862
          TabOrder = 4
          object UniLabel7: TUniLabel
            Left = 4
            Top = 34
            Width = 68
            Height = 17
            Hint = ''
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'right'
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
        object UniContainerPanel7: TUniContainerPanel
          Left = 458
          Top = 74
          Width = 120
          Height = 55
          Hint = '[[ round:b r ]]'
          ParentColor = False
          Color = 8421440
          TabOrder = 5
          object UniLabel5: TUniLabel
            Left = 2
            Top = 34
            Width = 113
            Height = 15
            Hint = ''
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'bottom left'
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
        object UniContainerPanel5: TUniContainerPanel
          Left = 458
          Top = 16
          Width = 120
          Height = 55
          Hint = '[[ round:t r ]]'
          ParentColor = False
          Color = 8421440
          TabOrder = 6
          object UniLabel6: TUniLabel
            Left = 2
            Top = 5
            Width = 113
            Height = 38
            Hint = ''
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'top right'
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
        object UniContainerPanel8: TUniContainerPanel
          Left = 186
          Top = 16
          Width = 138
          Height = 55
          Hint = '[[round:t]]'
          ParentColor = False
          Color = 6727914
          TabOrder = 7
          DesignSize = (
            138
            55)
          object UniLabel45: TUniLabel
            Left = 6
            Top = 5
            Width = 125
            Height = 15
            Hint = ''
            Alignment = taCenter
            AutoSize = False
            Caption = 'Top'
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
        object UniContainerPanel10: TUniContainerPanel
          Left = 186
          Top = 74
          Width = 138
          Height = 55
          Hint = '[[ round:b ]]'
          ParentColor = False
          Color = 6727914
          TabOrder = 8
          DesignSize = (
            138
            55)
          object UniLabel46: TUniLabel
            Left = 6
            Top = 34
            Width = 125
            Height = 15
            Hint = ''
            Alignment = taCenter
            AutoSize = False
            Caption = 'Bottom'
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
      end
    end
    object rcBlock120: TUniContainerPanel
      Tag = 4
      Left = 14
      Top = 79
      Width = 729
      Height = 43
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 44
      object UniLabel30: TUniLabel
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
        Caption = 'Messages and Dinamic Objects Alignment'
        Align = alClient
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock1000: TUniContainerPanel
      Tag = 4
      Left = 33
      Top = 5726
      Width = 729
      Height = 43
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 51
    end
    object rcBlock151: TUniContainerPanel
      Left = 661
      Top = 601
      Width = 321
      Height = 150
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-12 |'#13#10'round:no | '#13#10'cls:card-info-box-whi' +
        'te |'#13#10'hr:198 mobile-v-150 mobile-h-150 |'#13#10']]'
      ParentColor = False
      Color = clInfoBk
      TabOrder = 52
      object rcBlock157: TUniContainerPanel
        Left = 64
        Top = 0
        Width = 253
        Height = 150
        Hint = '[['#13#10'cols:xs-10 sm-10 md-12 |'#13#10'noborder-all'#13#10']]'
        ParentColor = False
        TabOrder = 1
      end
      object rcBlock152: TUniContainerPanel
        Left = 8
        Top = 0
        Width = 44
        Height = 150
        Hint = 
          '[['#13#10'cols:xs-2 sm-2 md-12 |'#13#10'noborder-all |'#13#10'hr:48 mobile-v-150 m' +
          'obile-h-150 |'#13#10'width:mobile-50  |'#13#10']]'#13#10#13#10
        ParentColor = False
        Color = 5354999
        TabOrder = 2
        object rcBlock154: TUniContainerPanel
          Left = 5
          Top = 19
          Width = 30
          Height = 30
          Hint = 
            '[['#13#10'cols:xs-12 sm-12 md-2 |'#13#10'hr:32 mobile-v-36 mobile-h-36 |'#13#10'wi' +
            'dth:36 mobile-36 |'#13#10'noborder-top:mobile|'#13#10'noborder-left |'#13#10'cente' +
            'r:parent y-mobile-x |'#13#10']]'#13#10#13#10
          ParentColor = False
          TabOrder = 1
          object UUUniBitBtn1Clone170: TUniBitBtn
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 30
            Height = 30
            Hint = 
              '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-plus | '#13#10'cls-ico:font-black |'#13#10'ce' +
              'nter:parent xy'#13#10']]'
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = '+'
            ParentFont = False
            Font.Height = -19
            Font.Name = 'Calibri'
            TabOrder = 1
            ScaleButton = False
          end
        end
        object rcBlock155: TUniContainerPanel
          Left = 5
          Top = 60
          Width = 30
          Height = 30
          Hint = 
            '[['#13#10'cols:xs-12 sm-12 md-2 |'#13#10'hr:32 mobile-v-36 mobile-h-36 |'#13#10'wi' +
            'dth:36 mobile-36 |'#13#10'noborder-top:mobile |'#13#10'noborder-left |'#13#10'cent' +
            'er:parent y-mobile-x |'#13#10']]'#13#10
          ParentColor = False
          TabOrder = 2
          object UUUniBitBtn2Clone190: TUniBitBtn
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 30
            Height = 30
            Hint = 
              '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-pencil-alt | '#13#10'cls-ico:font-black' +
              '|'#13#10'center:parent xy'#13#10']]'
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = '!'
            ParentFont = False
            Font.Height = -19
            Font.Name = 'Calibri'
            TabOrder = 1
            ScaleButton = False
          end
        end
        object rcBlock156: TUniContainerPanel
          Left = 5
          Top = 100
          Width = 30
          Height = 30
          Hint = 
            '[['#13#10'cols:xs-12 sm-12 md-2 |'#13#10'hr:32 mobile-v-36 mobile-h-36 |'#13#10'wi' +
            'dth:36 mobile-36 |'#13#10'noborder-top:mobile |'#13#10'noborder-left |'#13#10'cent' +
            'er:parent y-mobile-x |'#13#10']]'#13#10
          ParentColor = False
          TabOrder = 3
          object UUUniBitBtn3Clone210: TUniBitBtn
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 30
            Height = 30
            Hint = 
              '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-trash-alt | '#13#10'cls-ico:font-black' +
              '|'#13#10'center:parent xy'#13#10']]'
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 0
            Caption = '#'
            ParentFont = False
            Font.Height = -19
            Font.Name = 'Calibri'
            TabOrder = 1
            ScaleButton = False
          end
        end
        object rcBlock153: TUniContainerPanel
          Left = 8
          Top = 7
          Width = 32
          Height = 7
          Hint = '[['#13#10'cols:xs-12 sm-12 md-2 |'#13#10'noborder-all |'#13#10'width:6'#13#10']]'#13#10
          ParentColor = False
          TabOrder = 4
        end
      end
    end
    object rcBlock144: TUniContainerPanel
      Left = 334
      Top = 601
      Width = 321
      Height = 150
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-12 |'#13#10'round:no | '#13#10'cls:card-info-box-whi' +
        'te |'#13#10'hr:150 mobile-v-198 mobile-h-198 |'#13#10']]'
      ParentColor = False
      Color = clInfoBk
      TabOrder = 53
      object rcBlock150: TUniContainerPanel
        Left = 65
        Top = 0
        Width = 253
        Height = 150
        Hint = '[['#13#10'cols:xs-12 sm-12 md-11 |'#13#10'noborder-all'#13#10']]'
        ParentColor = False
        TabOrder = 1
      end
      object rcBlock145: TUniContainerPanel
        Left = 8
        Top = 0
        Width = 44
        Height = 150
        Hint = 
          '[['#13#10'cols:xs-12 sm-12 md-1 |'#13#10'noborder-all |'#13#10'hr:150 mobile-v-48 ' +
          'mobile-h-48 |'#13#10'width:50  |'#13#10']]'
        ParentColor = False
        Color = 5354999
        TabOrder = 2
        object rcBlock147: TUniContainerPanel
          Left = 5
          Top = 19
          Width = 30
          Height = 30
          Hint = 
            '[['#13#10'cols:xs-2 sm-2 md-12 |'#13#10'hr:36 mobile-v-32 mobile-h-32 |'#13#10'wid' +
            'th:36 mobile-36 |'#13#10'noborder-top |'#13#10'noborder-left |'#13#10'center:paren' +
            't x-mobile-y |'#13#10']]'#13#10#13#10
          ParentColor = False
          TabOrder = 1
          object UUUniBitBtn1: TUniBitBtn
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 30
            Height = 30
            Hint = 
              '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-plus | '#13#10'cls-ico:font-black |'#13#10'ce' +
              'nter:parent xy'#13#10']]'
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = '+'
            ParentFont = False
            Font.Height = -19
            Font.Name = 'Calibri'
            TabOrder = 1
            ScaleButton = False
          end
        end
        object rcBlock148: TUniContainerPanel
          Left = 5
          Top = 60
          Width = 30
          Height = 30
          Hint = 
            '[['#13#10'cols:xs-2 sm-2 md-12 |'#13#10'hr:36 mobile-v-32 mobile-h-32 |'#13#10'wid' +
            'th:36 mobile-36 |'#13#10'noborder-top |'#13#10'noborder-left |'#13#10'center:paren' +
            't x-mobile-y'#13#10']]'#13#10
          ParentColor = False
          TabOrder = 2
          object UUUniBitBtn2: TUniBitBtn
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 30
            Height = 30
            Hint = 
              '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-pencil-alt | '#13#10'cls-ico:font-black' +
              '|'#13#10'center:parent xy'#13#10']]'
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = '!'
            ParentFont = False
            Font.Height = -19
            Font.Name = 'Calibri'
            TabOrder = 1
            ScaleButton = False
          end
        end
        object rcBlock149: TUniContainerPanel
          Left = 5
          Top = 100
          Width = 30
          Height = 30
          Hint = 
            '[['#13#10'cols:xs-2 sm-2 md-12 |'#13#10'hr:36 mobile-v-32 mobile-h-32 |'#13#10'wid' +
            'th:36 mobile-36 |'#13#10'noborder-top |'#13#10'noborder-left |'#13#10'center:paren' +
            't x-mobile-y'#13#10']]'
          ParentColor = False
          TabOrder = 3
          object UUUniBitBtn3: TUniBitBtn
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 30
            Height = 30
            Hint = 
              '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-trash-alt | '#13#10'cls-ico:font-black' +
              '|'#13#10'center:parent xy'#13#10']]'
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 0
            Caption = '#'
            ParentFont = False
            Font.Height = -19
            Font.Name = 'Calibri'
            TabOrder = 1
            ScaleButton = False
          end
        end
        object rcBlock146: TUniContainerPanel
          Left = 11
          Top = 7
          Width = 32
          Height = 7
          Hint = '[['#13#10'cols:xs-1 sm-1 md-12 |'#13#10'noborder-all |'#13#10'width:mobile-6'#13#10']]'#13#10
          ParentColor = False
          TabOrder = 4
        end
      end
    end
    object rcBlock132: TUniContainerPanel
      Left = 7
      Top = 601
      Width = 321
      Height = 150
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-12 |'#13#10'round:no | '#13#10'cls:card-info-box-whi' +
        'te |'#13#10'hr:150 mobile-v-198 mobile-h-198 |'#13#10']]'
      ParentColor = False
      Color = clInfoBk
      TabOrder = 54
      object rcBlock133: TUniContainerPanel
        Left = 3
        Top = 0
        Width = 253
        Height = 150
        Hint = '[['#13#10'cols:xs-12 sm-12 md-11 |'#13#10'noborder-all'#13#10']]'
        ParentColor = False
        TabOrder = 1
        object rcBlock134: TUniContainerPanel
          Tag = 1
          Left = 14
          Top = 16
          Width = 70
          Height = 48
          Hint = '[[cols:xs-6 sm-6 md-2 ]]'
          ParentColor = False
          TabOrder = 1
          DesignSize = (
            70
            48)
          object UUUniDBEdit1: TUniDBEdit
            Left = 0
            Top = 18
            Width = 70
            Height = 29
            Hint = ''
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Color = clWhite
            Font.Style = [fsBold]
            TabOrder = 1
            Color = clGray
            ReadOnly = True
          end
          object UUUniLabel5: TUniLabel
            Left = 0
            Top = 0
            Width = 13
            Height = 13
            Hint = ''
            Caption = 'ID'
            ParentFont = False
            Font.Style = [fsBold]
            TabOrder = 2
          end
        end
        object rcBlock135: TUniContainerPanel
          Tag = 1
          Left = 97
          Top = 16
          Width = 70
          Height = 48
          Hint = '[[cols:xs-6 sm-6 md-2 ]]'#13#10
          ParentColor = False
          TabOrder = 2
          DesignSize = (
            70
            48)
          object UUUniLabel6: TUniLabel
            Left = 0
            Top = 0
            Width = 36
            Height = 13
            Hint = ''
            Caption = 'Field 1'
            ParentFont = False
            Font.Style = [fsBold]
            TabOrder = 1
          end
          object UUUniDBDateTimePicker1: TUniDBDateTimePicker
            Left = 0
            Top = 18
            Width = 70
            Height = 29
            Hint = ''
            DateTime = 43596.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
          end
        end
        object rcBlock136: TUniContainerPanel
          Tag = 1
          Left = 171
          Top = 15
          Width = 70
          Height = 48
          Hint = '[['#13#10'cols:xs-0 sm-0 md-8 |'#13#10']]'
          ParentColor = False
          TabOrder = 3
        end
        object rcBlock137: TUniContainerPanel
          Tag = 1
          Left = 15
          Top = 84
          Width = 70
          Height = 48
          Hint = '[[cols:xs-12 sm-12 md-6 ]]'
          ParentColor = False
          TabOrder = 4
          DesignSize = (
            70
            48)
          object UUUniLabel7: TUniLabel
            Left = 0
            Top = 0
            Width = 36
            Height = 13
            Hint = ''
            Caption = 'Field 4'
            ParentFont = False
            Font.Style = [fsBold]
            TabOrder = 1
          end
          object UUUniDBEdit2: TUniDBEdit
            Left = 0
            Top = 18
            Width = 70
            Height = 29
            Hint = ''
            CharCase = ecUpperCase
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
            InputMask.Mask = '99.999.999/9999-99'
          end
        end
      end
      object rcBlock138: TUniContainerPanel
        Left = 270
        Top = 0
        Width = 44
        Height = 150
        Hint = 
          '[['#13#10'cols:xs-12 sm-12 md-1 |'#13#10'noborder-all |'#13#10'hr:150 mobile-v-48 ' +
          'mobile-h-48 |'#13#10'width:50  |'#13#10']]'
        ParentColor = False
        Color = 5354999
        TabOrder = 2
        object rcBlock140: TUniContainerPanel
          Left = 5
          Top = 25
          Width = 32
          Height = 32
          Hint = 
            '[['#13#10'cols:xs-2 sm-2 md-12 |'#13#10'hr:36 mobile-v-32 mobile-h-32 |'#13#10'wid' +
            'th:36 mobile-36 |'#13#10'noborder-top |'#13#10'noborder-left|'#13#10'center:parent' +
            ' x-mobile-y |'#13#10']]'
          ParentColor = False
          TabOrder = 1
          object bbbtnNewReg: TUniBitBtn
            AlignWithMargins = True
            Left = 0
            Top = 2
            Width = 30
            Height = 30
            Hint = 
              '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-plus | '#13#10'cls-ico:font-black |'#13#10'ce' +
              'nter:parent xy'#13#10']]'
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = '+'
            ParentFont = False
            Font.Height = -19
            Font.Name = 'Calibri'
            TabOrder = 1
            ScaleButton = False
          end
        end
        object rcBlock141: TUniContainerPanel
          Left = 5
          Top = 64
          Width = 32
          Height = 32
          Hint = 
            '[['#13#10'cols:xs-2 sm-2 md-12 |'#13#10'hr:36 mobile-v-32 mobile-h-32 |'#13#10'wid' +
            'th:36 mobile-36 |'#13#10'noborder-top |'#13#10'noborder-left:mobile |'#13#10'cente' +
            'r:parent x-mobile-y'#13#10']]'
          ParentColor = False
          TabOrder = 2
          object bbbtnEditReg: TUniBitBtn
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 30
            Height = 30
            Hint = 
              '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-pencil-alt | '#13#10'cls-ico:font-black' +
              '|'#13#10'center:parent xy'#13#10']]'
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = '!'
            ParentFont = False
            Font.Height = -19
            Font.Name = 'Calibri'
            TabOrder = 1
            ScaleButton = False
          end
        end
        object rcBlock142: TUniContainerPanel
          Left = 5
          Top = 104
          Width = 32
          Height = 32
          Hint = 
            '[['#13#10'cols:xs-2 sm-2 md-12 |'#13#10'hr:36 mobile-v-32 mobile-h-32 |'#13#10'wid' +
            'th:36 mobile-36 |'#13#10'noborder-top |'#13#10'noborder-left:mobile |'#13#10'cente' +
            'r:parent x-mobile-y'#13#10']]'
          ParentColor = False
          TabOrder = 3
          object bbbtnDeleteReg: TUniBitBtn
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 30
            Height = 30
            Hint = 
              '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-trash-alt | '#13#10'cls-ico:font-black' +
              '|'#13#10'center:parent xy'#13#10']]'
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 0
            Caption = '#'
            ParentFont = False
            Font.Height = -19
            Font.Name = 'Calibri'
            TabOrder = 1
            ScaleButton = False
          end
        end
        object rcBlock139: TUniContainerPanel
          Left = 9
          Top = 5
          Width = 32
          Height = 7
          Hint = '[['#13#10'cols:xs-1 sm-1 md-12 |'#13#10'noborder-all |'#13#10'width:mobile-6'#13#10']]'#13#10
          ParentColor = False
          TabOrder = 4
        end
      end
    end
    object rcBlock158: TUniContainerPanel
      Left = 18
      Top = 761
      Width = 321
      Height = 150
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-12 |'#13#10'round:no | '#13#10'cls:card-info-box-whi' +
        'te |'#13#10'hr:198 mobile-v-150 mobile-h-150 |'#13#10']]'
      ParentColor = False
      Color = clInfoBk
      TabOrder = 55
      object rcBlock164: TUniContainerPanel
        Left = 65
        Top = 0
        Width = 253
        Height = 150
        Hint = '[['#13#10'cols:xs-10 sm-10 md-12 |'#13#10'noborder-all'#13#10']]'
        ParentColor = False
        TabOrder = 1
      end
      object rcBlock159: TUniContainerPanel
        Left = 8
        Top = 0
        Width = 44
        Height = 150
        Hint = 
          '[['#13#10'cols:xs-2 sm-2 md-12 |'#13#10'noborder-all |'#13#10'hr:48 mobile-v-150 m' +
          'obile-h-150 |'#13#10'width:mobile-50  |'#13#10']]'#13#10#13#10
        ParentColor = False
        Color = 4737096
        TabOrder = 2
        object rcBlock161: TUniContainerPanel
          Left = 5
          Top = 19
          Width = 30
          Height = 30
          Hint = 
            '[['#13#10'cols:xs-12 sm-12 md-2 |'#13#10'hr:32 mobile-v-36 mobile-h-36 |'#13#10'wi' +
            'dth:90 mobile-32 |'#13#10'noborder-top:mobile|'#13#10'noborder-left |'#13#10'cente' +
            'r:parent y-mobile-x |'#13#10']]'#13#10#13#10
          ParentColor = False
          TabOrder = 1
          DesignSize = (
            30
            30)
          object UUUUniBitBtn1Clone170: TUniBitBtn
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 30
            Height = 30
            Hint = 
              '[['#13#10'cls:ButtonBlue |'#13#10'ico:fas-plus | '#13#10'append |'#13#10'center:parent x' +
              'y |'#13#10'caption-hide:mobile'#13#10']]'
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'New'
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Height = -16
            Font.Name = 'Calibri'
            TabOrder = 1
            ScaleButton = False
          end
        end
        object rcBlock162: TUniContainerPanel
          Left = 5
          Top = 60
          Width = 30
          Height = 30
          Hint = 
            '[['#13#10'cols:xs-12 sm-12 md-2 |'#13#10'hr:32 mobile-v-36 mobile-h-36 |'#13#10'wi' +
            'dth:90 mobile-32 |'#13#10'noborder-top:mobile |'#13#10'center:parent y-mobil' +
            'e-x |'#13#10']]'#13#10
          ParentColor = False
          TabOrder = 2
          DesignSize = (
            30
            30)
          object UUUUniBitBtn2Clone190: TUniBitBtn
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 30
            Height = 30
            Hint = 
              '[['#13#10'cls:ButtonBlue|'#13#10'ico:fas-pencil-alt |'#13#10'append | '#13#10'center:par' +
              'ent xy |'#13#10'caption-hide:mobile'#13#10']]'
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'Edit'
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Height = -16
            Font.Name = 'Calibri'
            TabOrder = 1
            ScaleButton = False
          end
        end
        object rcBlock163: TUniContainerPanel
          Left = 5
          Top = 100
          Width = 30
          Height = 30
          Hint = 
            '[['#13#10'cols:xs-12 sm-12 md-2 |'#13#10'hr:32 mobile-v-36 mobile-h-36 |'#13#10'wi' +
            'dth:90 mobile-32 |'#13#10'noborder-top:mobile |'#13#10'center:parent y-mobil' +
            'e-x |'#13#10']]'#13#10
          ParentColor = False
          TabOrder = 3
          DesignSize = (
            30
            30)
          object UUUUniBitBtn3Clone210: TUniBitBtn
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 30
            Height = 30
            Hint = 
              '[['#13#10'cls:ButtonBlue | '#13#10'ico:fas-trash-alt | '#13#10'append |'#13#10'center:pa' +
              'rent xy |'#13#10'caption-hide:mobile'#13#10']]'
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 0
            Caption = 'Cancel'
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Height = -16
            Font.Name = 'Calibri'
            TabOrder = 1
            ScaleButton = False
          end
        end
        object rcBlock160: TUniContainerPanel
          Left = 8
          Top = 7
          Width = 32
          Height = 7
          Hint = '[['#13#10'cols:xs-12 sm-12 md-2 |'#13#10'noborder-all |'#13#10'width:12 |'#13#10']]'
          ParentColor = False
          TabOrder = 4
        end
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
