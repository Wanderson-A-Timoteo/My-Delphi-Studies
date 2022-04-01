unit Memento.Model.Interfaces;

interface

type

  iMemento<t> = interface
    ['{5E32A07F-4BBD-41C4-B717-D8C241B34CC1}']
    function Save(Key : String) : iMemento<t>;
    function Restore(Key : String) : t;
  end;

  iMementoZelador<t> = interface
    ['{C821E48B-CA8E-432E-9872-70D05DC13C97}']
    function SaveState(Key : String; Value : t) : iMementoZelador<t>;
    function Restore(Key : String) : t;
  end;

  iCliente = interface
    function GetNome : String;
    procedure SetNome(const Value : String);
    property Nome : String read GetNome write SetNome;
    function Memento : iMemento<iCliente>;
  end;

implementation

end.
