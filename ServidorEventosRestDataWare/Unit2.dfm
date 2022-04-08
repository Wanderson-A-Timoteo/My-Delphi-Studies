object DataModule2: TDataModule2
  OldCreateOrder = False
  Encoding = esUtf8
  QueuedRequest = False
  Height = 459
  Width = 673
  object DWServerEvents1: TDWServerEvents
    IgnoreInvalidParams = False
    Events = <
      item
        Routes = [crAll]
        NeedAuthorization = True
        DWParams = <
          item
            TypeObject = toParam
            ObjectDirection = odOUT
            ObjectValue = ovString
            ParamName = 'result'
            Encoded = False
          end>
        JsonMode = jmPureJSON
        Name = 'teste'
        EventName = 'teste'
        OnlyPreDefinedParams = False
        OnReplyEvent = DWServerEvents1EventstesteReplyEvent
      end>
    Left = 224
    Top = 200
  end
end
