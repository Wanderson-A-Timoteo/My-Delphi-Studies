object sm: Tsm
  OldCreateOrder = False
  OnCreate = UniGUIServerModuleCreate
  OnDestroy = UniGUIServerModuleDestroy
  TempFolder = 'temp\'
  Port = 8075
  Title = 'New Application'
  BGColorLogin = 1315860
  Favicon.Data = {
    0000010001001010000001002000680400001600000028000000100000002000
    0000010020000000000000040000C11E0000C11E000000000000000000000000
    000000000000000000000000000000000000547E9200597987524590B3EC4095
    BDF14095BEF2498BAACD636D721D636E74000000000000000000000000000000
    000000000000000000000000000000000000557E9000597A894A389DCDF72EA9
    E3FF2EA9E3FF3B9BC8EC5C7581335B7784000000000000000000000000000000
    0000000000000000000000000000000000005D7580005E737D2E3C9AC6EA2EA9
    E2FF2FA9E2FF389ECFF9577B8C4F538096000000000000000000000000000000
    000000000000000000000000000000000000666B6D006868691F4293B9E02FA8
    E2FF2FA8E2FF35A2D5FF5182996C3F96BF000000000000000000000000000000
    00000000000000000000000000000000000068686800745B4E0D4490B3C12FA8
    E0FF2FA8E1FF32A4DAFF4E86A08E00FFFF006868680000000000000000000000
    0000000000000000000000000000000000006A666400D50000024A8AA8A731A6
    DDFF2FA8E1FF31A6DEFF4A8AA9ACB01700036868680000000000000000000000
    00005B7682005F727B125D747F305D747F305D747F30616F762F4B88A6A731A6
    DDFF2FA8E1FF30A7E0FF478DAEB28B411E066868680000000000000000000000
    00002FA8E1005182996F3E97C1EC3B9AC7EB3B9AC7EB3B9AC6EB36A0D1F62FA8
    E1FF30A7E0FF3A9CCAF65281976C06D6FF006868680000000000000000000000
    00003E97C1005182996D34A2D7FF2EAAE4FF2EA9E3FF2EA9E3FF2EA9E3FF2FA8
    E2FF32A5DBFF4490B5EB557D8F5300FFFF006F60590000000000000000000000
    0000567C8F0059788740458FB2DA4194BCE34194BBE34194BBE23F97C0E932A4
    DAFD2FA8E1FF2FA8E0FF3F96BFD860717A265D74800000000000000000000000
    00006A6664006A6663056868681C6768691F6768691F6868671D626E743E3F96
    BEE52FA8E2FF2FA9E2FF36A0D2FE547E92614A8AA80000000000000000000000
    000000000000000000000000000000000000000000006A66630075594C0E4490
    B4C22FA8E0FF2FA8E1FF33A4D9FF4D86A18210CBFF0000000000000000000000
    0000686868007E4F39015D75803D587A8B5E577A8B5C577A8B5C577B8B644293
    B9D22FA8E1FF2FA8E1FF31A5DCFF4B89A69300FFFF0000000000000000000000
    0000686868009F2B00034D87A2AC389DCDFF379ECFFF389ECFFF379FD1FF31A5
    DCFF2FA8E1FF2FA8E2FF32A4DAFF4D86A18409D2FF0000000000000000000000
    00006868680000FFFF004C87A39031A5DCFF2EA9E3FF2EA9E3FF2EA9E2FF2FA8
    E1FF2FA8E1FF30A7DEFF3E97C1EA587A8A3F5281980000000000000000000000
    0000000000004293B800547F93614392B7EE4095BDF04095BDF04095BCEE4194
    BBE94392B7DF488CACC3577C8D5E795544046B6561000000000000000000FC0F
    0000FC0F0000FC0F0000FC0F0000FC0F0000FC070000C0070000C00F0000C00F
    0000C0070000C0070000FE070000C0070000C0070000E0070000E0070000}
  AjaxTimeout = 60000
  SuppressErrors = []
  Bindings = <>
  MainFormDisplayMode = mfPage
  ServerMessages.ExceptionTemplate.Strings = (
    '<html>'
    '<body bgcolor="#dfe8f6">'
    
      '<p style="text-align:center;color:#A05050">Ocorreu um problema n' +
      'a aplica'#231#227'o:</p>'
    '<p style="text-align:center;color:#0000A0">[###message###]</p>'
    
      '<p style="text-align:center;color:#A05050"><a href="[###url###]"' +
      '>Reiniciar Aplica'#231#227'o</a></p>'
    '</body>'
    '</html>')
  ServerMessages.TerminateTemplate.Strings = (
    '<!DOCTYPE html>'
    '<html lang="en">'
    ''
    '<head>'
    '    <meta charset="utf-8">'
    '    <meta http-equiv="x-ua-compatible" content="ie=edge">'
    
      '    <meta name="viewport" content="width=device-width, initial-s' +
      'cale=1, shrink-to-fit=no">'
    '    <title>RadCORE - Sess'#227'o finalizada</title>'
    '    <style>'
    '        html {'
    '            overflow-y: scroll;'
    '            color: #000;'
    
      '            font: 400 62.5%/1.4 "Helvetica Neue", Helvetica, Ari' +
      'al, sans-serif;'
    '            -webkit-text-size-adjust: 100%;'
    '            -ms-text-size-adjust: 100%;'
    '            -webkit-tap-highlight-color: transparent'
    '        }'
    '        '
    '        body,'
    '        html {'
    '            height: 100%;'
    '            min-height: 100%'
    '        }'
    '        '
    '        body {'
    '            margin: 0;'
    '            font-size: 1.3rem;'
    '            background: #fff;'
    '            color: #000'
    '        }'
    '        '
    '        a {'
    '            cursor: pointer;'
    '            text-decoration: none;'
    '            color: #2498e3;'
    '            background-color: transparent'
    '        }'
    '        '
    '        a:active,'
    '        a:hover {'
    '            text-decoration: underline;'
    '            color: #188dd9;'
    '            outline: 0'
    '        }'
    '        '
    '        h1,'
    '        h2 {'
    '            margin: 0 0 .5rem;'
    '            color: #444;'
    '            font-weight: 400;'
    '            line-height: 1'
    '        }'
    '        '
    '        h1 {'
    '            font-size: 2.4rem'
    '        }'
    '        '
    '        h2 {'
    '            font-size: 3.6rem'
    '        }'
    '        '
    '        .error-code {'
    '            color: #f47755;'
    '            font-size: 8rem;'
    '            line-height: 1'
    '        }'
    '        '
    '        p {'
    '            margin: 1.2rem 0'
    '        }'
    '        '
    '        p.lead {'
    '            font-size: 1.6rem;'
    '            color: #4f5a64'
    '        }'
    '        '
    '        hr {'
    '            box-sizing: content-box;'
    '            height: 0;'
    '            margin: 2.4rem 0;'
    '            border: 0;'
    '            border-top: 1px solid #ddd'
    '        }'
    '        '
    '        .page {'
    '            display: -webkit-box;'
    '            display: -ms-flexbox;'
    '            display: flex;'
    '            min-height: 100vh'
    '        }'
    '        '
    '        .page:before {'
    '            display: block;'
    '            content: '#39#39';'
    '            -webkit-box-flex: 0;'
    '            -ms-flex: 0 1 474px;'
    '            flex: 0 1 474px;'
    '            background: #38444f no-repeat;/*50% 6em */'
    
      '            background-image: url('#39'files/images/RadCore_Terminat' +
      'eTemplate.jpg'#39');'
    '            background-size: 100% auto'
    '        }'
    '        '
    '        .main {'
    '            -webkit-box-flex: 1;'
    '            -ms-flex: 1 1 70%;'
    '            flex: 1 1 70%;'
    '            box-sizing: border-box;'
    '            padding: 10rem 5rem 5rem;'
    '            min-height: 100vh'
    '        }'
    '        '
    '        .help-actions a {'
    '            display: inline-block;'
    '            border: 2px solid #23a7de;'
    '            margin: 0 .5rem .5rem 0;'
    '            padding: .5rem 1rem;'
    '            text-decoration: none;'
    '            -webkit-transition: .25s ease;'
    '            transition: .25s ease'
    '        }'
    '        '
    '        .help-actions a:hover {'
    '            text-decoration: none;'
    '            background: #23a7de;'
    '            color: #fff'
    '        }'
    '        '
    '        @media(max-width:959px) {'
    '            .page:before {'
    '                -ms-flex-preferred-size: 400px;'
    '                flex-basis: 400px;'
    '                background-position: 50% 4rem'
    '            }'
    '            .main {'
    '                padding: 5rem'
    '            }'
    '        }'
    '        '
    '        @media(max-width:769px) {'
    '            .page {'
    '                -webkit-box-orient: vertical;'
    '                -webkit-box-direction: normal;'
    '                -ms-flex-direction: column;'
    '                flex-direction: column'
    '            }'
    '            .page:before {'
    '                -ms-flex-preferred-size: 250px;'
    '                flex-basis: 250px;'
    '                background-position: 5rem -4.8rem;'
    '                background-size: 166px auto'
    '            }'
    '            .main {'
    '                min-height: 0;'
    '                -webkit-box-flex: 0;'
    '                -ms-flex: none;'
    '                flex: none'
    '            }'
    '        }'
    '        '
    '        @media(max-width:479px) {'
    '            h2 {'
    '                font-size: 3rem'
    '            }'
    '            .main {'
    '                padding: 3rem'
    '            }'
    '        }'
    '    </style>'
    '</head>'
    ''
    '<body>'
    '    <div class="page">'
    '        <div class="main">'
    '            <h1></h1>'
    '            <div class="error-code">Sess'#227'o Finalizada</div>'
    '            <h2></h2>'
    '            <div class="error-description">'
    '                <p class="lead"></p>'
    '                <hr/>'
    '            </div>'
    '            <p>O que voc'#234' deseja fazer ?</p>'
    '            <div class="help-actions">'
    
      '                <a href="javascript:location.reload();">Reinicia' +
      'r o Sistema</a>'
    
      '                <a href="javascript:history.back();">Ir para p'#225'g' +
      'ina anterior</a>'
    
      '                <a href="https://www.radcore.pro.br">Ir para p'#225'g' +
      'ina do RadCORE</a>'
    '            </div>'
    '        </div>'
    '    </div>'
    '</body>'
    ''
    '</html>')
  ServerLimits.SessionRestrict = srOnePerPC
  SSL.SSLOptions.RootCertFile = 'root.pem'
  SSL.SSLOptions.CertFile = 'cert.pem'
  SSL.SSLOptions.KeyFile = 'key.pem'
  SSL.SSLOptions.Method = sslvTLSv1_1
  SSL.SSLOptions.SSLVersions = [sslvTLSv1_1]
  SSL.SSLOptions.Mode = sslmUnassigned
  SSL.SSLOptions.VerifyMode = []
  SSL.SSLOptions.VerifyDepth = 0
  Options = [soAutoPlatformSwitch, soRestartSessionOnTimeout, soWipeShadowSessions]
  ConnectionFailureRecovery.ErrorMessage = 'Connection Error'
  ConnectionFailureRecovery.RetryMessage = 'Retrying...'
  OnBeforeInit = UniGUIServerModuleBeforeInit
  OnException = UniGUIServerModuleException
  OnControlPanelLogin = UniGUIServerModuleControlPanelLogin
  OnHTTPCommand = UniGUIServerModuleHTTPCommand
  OnBeforeShutdown = UniGUIServerModuleBeforeShutdown
  Height = 490
  Width = 639
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Console'
    ScreenCursor = gcrNone
    Left = 64
    Top = 304
  end
  object FDPhysFBDriverLink: TFDPhysFBDriverLink
    Left = 64
    Top = 248
  end
  object FDPhysPgDriverLink: TFDPhysPgDriverLink
    Left = 66
    Top = 152
  end
  object FDPhysMySQLDriverLink: TFDPhysMySQLDriverLink
    Left = 65
    Top = 196
  end
  object FDMetaInfoQuery: TFDMetaInfoQuery
    MetaInfoKind = mkTableFields
    Left = 66
    Top = 100
  end
  object FDManager: TFDManager
    WaitCursor = gcrNone
    FetchOptions.AssignedValues = [evMode, evItems, evRowsetSize, evRecordCountMode]
    FetchOptions.RowsetSize = 25
    FormatOptions.AssignedValues = [fvMapRules, fvStrsTrim, fvFmtDisplayDateTime, fvFmtDisplayDate, fvFmtDisplayTime, fvFmtDisplayNumeric, fvFmtEditNumeric, fvStrsTrim2Len]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <>
    FormatOptions.StrsTrim = False
    FormatOptions.StrsTrim2Len = True
    FormatOptions.FmtDisplayTime = 'hh:mm'
    ResourceOptions.AssignedValues = [rvBackup, rvBackupFolder]
    ResourceOptions.Backup = True
    ResourceOptions.BackupFolder = 'C:\inetpub\wwwroot\nautiluserp\files\database\bkp'
    Active = True
    Left = 66
    Top = 28
  end
end
