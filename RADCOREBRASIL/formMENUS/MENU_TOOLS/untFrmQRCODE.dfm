inherited frmQRCODE: TfrmQRCODE
  Hint = '[['#13#10'width:fix|'#13#10'height:fix|'#13#10'modal:]]'
  Caption = 'frmQRCODE'
  DesignSize = (
    360
    360)
  PixelsPerInch = 96
  TextHeight = 13
  object paBackground: TUniContainerPanel [0]
    AlignWithMargins = True
    Left = 4
    Top = 41
    Width = 355
    Height = 320
    Hint = ''
    Margins.Left = 4
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    ParentColor = False
    Color = 15987699
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoScroll = True
    TabOrder = 0
    DesignSize = (
      355
      320)
    ScrollHeight = 320
    ScrollWidth = 355
    object paCamera: TUniContainerPanel
      AlignWithMargins = True
      Left = 18
      Top = 18
      Width = 320
      Height = 240
      Hint = '[[round:no | cls:card-info-box-white]]'
      Margins.Left = 12
      Margins.Top = 12
      Margins.Right = 12
      Margins.Bottom = 12
      ParentColor = False
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      object htmlWEBCAM: TUniHTMLFrame
        Left = 0
        Top = 0
        Width = 320
        Height = 240
        Hint = ''
        Align = alClient
        OnAjaxEvent = htmlWEBCAMAjaxEvent
      end
    end
    object btnCamPower: TUniButton
      Tag = 1
      Left = 18
      Top = 273
      Width = 75
      Height = 31
      Hint = '[[cls:ButtonRed]]'
      Caption = 'READ OFF'
      TabOrder = 2
      OnClick = btnCamPowerClick
    end
    object btnSelPhoto: TUniButton
      Left = 245
      Top = 273
      Width = 93
      Height = 31
      Hint = '[[cls:ButtonBlue]]'
      Visible = False
      Caption = 'SELECIONAR'
      Anchors = [akTop, akRight]
      TabOrder = 3
      OnClick = btnSelPhotoClick
    end
    object btnCamShot: TUniButton
      Left = 153
      Top = 273
      Width = 86
      Height = 31
      Hint = '[[cls:ButtonOrange]]'
      Visible = False
      Caption = 'CAM PHOTO'
      TabOrder = 4
      OnClick = btnCamShotClick
    end
    object paPhoto: TUniContainerPanel
      AlignWithMargins = True
      Left = 12
      Top = 188
      Width = 75
      Height = 63
      Hint = 'bsRound_no_card-info-box-white'
      Margins.Left = 12
      Margins.Top = 12
      Margins.Right = 12
      Margins.Bottom = 12
      Visible = False
      ParentColor = False
      TabOrder = 5
      object imgCap: TUniImage
        Left = 0
        Top = 0
        Width = 75
        Height = 63
        Hint = ''
        Visible = False
        Center = True
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
        Align = alClient
      end
    end
    object btnCamSwitch: TUniButton
      Left = 99
      Top = 273
      Width = 46
      Height = 31
      Hint = 
        '[['#13#10'cls:ButtonGreen |'#13#10'ico:fas-exchange-alt |'#13#10'hint:Switch cams ' +
        'c:info-light w:200 d:10000 |'#13#10']]'
      Visible = False
      Caption = '@'
      TabOrder = 6
      OnClick = btnCamSwitchClick
    end
  end
  object paBaseTopTitle: TUniContainerPanel [1]
    AlignWithMargins = True
    Left = 4
    Top = 4
    Width = 356
    Height = 36
    Hint = '[['#13#10'round:t'#13#10']]'
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 0
    Margins.Bottom = 0
    ParentColor = False
    Color = 2763306
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    object labTitleForm: TUniLabel
      AlignWithMargins = True
      Left = 54
      Top = 3
      Width = 200
      Height = 29
      Hint = 'bsLabel_fa-camera'
      Margins.Left = 10
      Margins.Bottom = 8
      TextConversion = txtHTML
      AutoSize = False
      Caption = 'QR Code Reader'
      ParentFont = False
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Calibri Light'
      ParentColor = False
      Color = clSilver
      TabOrder = 1
    end
    object labExit: TUniLabel
      AlignWithMargins = True
      Left = 8
      Top = 3
      Width = 33
      Height = 25
      Cursor = crHandPoint
      Hint = '[[ico:fas-sign-out-alt rc-mirror-h]]'
      Margins.Left = 8
      Margins.Bottom = 8
      Alignment = taCenter
      TextConversion = txtHTML
      AutoSize = False
      Caption = '<'
      Align = alLeft
      ParentFont = False
      Font.Color = clWhite
      Font.Height = -21
      Font.Name = 'Calibri Light'
      ParentColor = False
      Color = clSilver
      TabOrder = 2
      OnClick = labExitClick
    end
  end
  inherited timerClose: TUniTimer
    OnTimer = timerCloseTimer
  end
end
