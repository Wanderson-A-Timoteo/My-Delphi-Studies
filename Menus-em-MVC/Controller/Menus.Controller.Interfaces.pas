unit Menus.Controller.Interfaces;

interface

uses
  System.Classes, FMX.Types;

type
  iControllerListBoxItensFactory = interface
    ['{52D7D579-2ED0-4F85-BAAE-11967DCFD6A7}']
  end;

  iControllerListBoxFactory = interface
    ['{1F812D6A-1597-440E-8E50-126621DE2415}']
  end;

  iControllerListBoxItensDefault = interface
    ['{DEEBAF33-1C6E-4473-9045-42CF185AEF04}']
    function Name(Value : String) : iControllerListBoxItensDefault;
    function Text(Value : String) : iControllerListBoxItensDefault;
    function StyleLookup(Value : String) : iControllerListBoxItensDefault;
    function onClick(Value : TNotifyEvent) : iControllerListBoxItensDefault;
    function Item : TFMXObject;
  end;

  iControllerListBoxDefault = interface
    ['{9DB4EB45-778A-47E5-A613-41FCAAB094E2}']
    function Name(Value : String) : iControllerListBoxDefault;
    function Align(Value : TAlignLayout) : iControllerListBoxDefault;
    function ItemHeight(Value : Integer) : iControllerListBoxDefault;
    function AddItem(Value : TFmxObject) : iControllerListBoxDefault;
    function Lista : TFmxObject;

  end;

implementation

end.
