unit untFrmWIZARD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniDBEdit, uniCheckBox, uniDBCheckBox, uniButton,
  uniBitBtn, uniSpeedButton, uniEdit, uniMultiItem, uniComboBox, uniDBComboBox,
  uniDateTimePicker, uniDBDateTimePicker, uniLabel, uniPanel, uniScrollBox,
  uniPageControl, uniGUIBaseClasses, uniBasicGrid, uniDBGrid, uniListBox,
  Vcl.Imaging.pngimage, Vcl.Imaging.jpeg, uniImage;

type
  TfrmWIZARD = class(TUniFrame)
    rcWizard: TUniContainerPanel;
    rcBlock15: TUniContainerPanel;
    rcBlock500: TUniContainerPanel;
    paPrior: TUniContainerPanel;
    btnPrior: TUniBitBtn;
    paNExt: TUniContainerPanel;
    btnNext: TUniBitBtn;
    paEnd: TUniContainerPanel;
    UniBitBtn2: TUniBitBtn;
    paWizard1: TUniContainerPanel;
    rcBlock100: TUniContainerPanel;
    rcBlock90: TUniContainerPanel;
    UniLabel3: TUniLabel;
    UniDBEdit9: TUniDBEdit;
    rcBlock80: TUniContainerPanel;
    UniLabel2: TUniLabel;
    UniDBEdit8: TUniDBEdit;
    paWizard2: TUniContainerPanel;
    rcBlock150: TUniContainerPanel;
    UniLabel6: TUniLabel;
    UniDBDateTimePicker1: TUniDBDateTimePicker;
    rcBlock160: TUniContainerPanel;
    UniLabel7: TUniLabel;
    UniDBDateTimePicker2: TUniDBDateTimePicker;
    rcBlock210: TUniContainerPanel;
    paWizard3: TUniContainerPanel;
    rcBlock260: TUniContainerPanel;
    UniLabel4: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    rcBlock300: TUniContainerPanel;
    UniLabel20: TUniLabel;
    UniDBEdit4: TUniDBEdit;
    rcBlock310: TUniContainerPanel;
    UniLabel13: TUniLabel;
    UniDBEdit5: TUniDBEdit;
    rcBlock290: TUniContainerPanel;
    UniLabel8: TUniLabel;
    edCep: TUniDBEdit;
    rcBlock270: TUniContainerPanel;
    UniLabel12: TUniLabel;
    edRazSoc: TUniDBEdit;
    rcBlock280: TUniContainerPanel;
    UniLabel10: TUniLabel;
    UniDBEdit2: TUniDBEdit;
    rcBlock340: TUniContainerPanel;
    paWizard4: TUniContainerPanel;
    rcBlock390: TUniContainerPanel;
    UniLabel18: TUniLabel;
    UniDBEdit3: TUniDBEdit;
    UniDBEdit6: TUniDBEdit;
    UniLabel23: TUniLabel;
    UniDBEdit7: TUniDBEdit;
    UniLabel24: TUniLabel;
    rcBlock420: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    imgLogo: TUniImage;
    rcBlock40: TUniContainerPanel;
    UniLabel1: TUniLabel;
    rcBlock50: TUniContainerPanel;
    UniLabel5: TUniLabel;
    labPhone: TUniLabel;
    procedure UniFrameCreate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnPriorClick(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
    procedure UniBitBtn4Click(Sender: TObject);
    procedure labPhoneClick(Sender: TObject);
    procedure UniFrameReady(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iWizard,
    iWizardCount : integer;
  end;

implementation

{$R *.dfm}

uses untdm_rc, MainModule, Main, mkm_anim, mkm_layout;

procedure TfrmWIZARD.btnCancelClick(Sender: TObject);
begin
     if mm.oPgGeneral <> nil then
        mm.oPgGeneral.ActivePage.Close;
end;

procedure TfrmWIZARD.btnNextClick(Sender: TObject);
begin
     //pgPadrao.ActivePageIndex := 1;
     if iWizard < iWizardCount then
     begin
        paWizard1.Visible := false;
        paWizard2.Visible := false;
        paWizard3.Visible := false;
        paWizard4.Visible := false;
        if iWizard + 1 <= iWizardCount then
           TUniControl( FindComponent( 'paWizard' + ( iwizard + 1 ).ToString ) ).Visible := true;
        if iWizard > 0 then
        begin
           rc_jQueryAnimate(
             TUniControl( Self.FindComponent( 'paWizard' + iWizard.ToString ) ) ,
               'left'  ,
               IntToStr( ( TUniControl( Self.FindComponent( 'paWizard' + iWizard.ToString ) ).Width + 3 ) * (-1) ) ,
               '350' );
        end;

        Inc( iWizard );

        rc_jQueryAnimate(
          TUniControl( Self.FindComponent( 'paWizard' + ( iWizard ).ToString ) ) ,
            'left'  ,
            '3' ,
            '350');
     end;

     //pgPadrao.ActivePageIndex := iWizard;

     paEnd.Visible := ( iWizard = iWizardCount );


end;

procedure TfrmWIZARD.UniBitBtn1Click(Sender: TObject);
begin
     //pgPadrao.ActivePageIndex := 1;
end;

procedure TfrmWIZARD.btnPriorClick(Sender: TObject);
begin
     ////pgPadrao.ActivePageIndex := 0;

     if iWizard >= 2 then
     begin
        paWizard1.Visible := false;
        paWizard2.Visible := false;
        paWizard3.Visible := false;
        paWizard4.Visible := false;

        TUniControl( FindComponent( 'paWizard' + ( iwizard - 1 ).ToString ) ).Visible := true;

        rc_jQueryAnimate(
          TUniControl( Self.FindComponent(
            'paWizard' + iWizard.ToString ) ) ,
            'left'  ,
            IntToStr( ( TUniControl( Self.FindComponent( 'paWizard' + iWizard.ToString ) ).Width + 3 )  ) ,
            '350' );

        Dec( iWizard );

        rc_jQueryAnimate(
          TUniControl( Self.FindComponent(
            'paWizard' + ( iWizard ).ToString ) ) ,
            'left'  ,
            '3' ,
            '350');
     end;

     //pgPadrao.ActivePageIndex := iWizard;
     paEnd.Visible := ( iWizard = iWizardCount );
end;

procedure TfrmWIZARD.UniBitBtn4Click(Sender: TObject);
begin
     //pgPadrao.ActivePageIndex := 3;
end;

procedure TfrmWIZARD.UniFrameCreate(Sender: TObject);
begin

  //pgPadrao.ActivePageIndex := 0;

  Self.Color             := StringToColor( mm.CONFIG_LAYOUT_BG_COLOR );

  //paWizard2.Parent := tab1;
  //paWizard3.Parent := tab1;
  //paWizard4.Parent := tab1;

  iWizardCount   := 4;
  iWizard        := 0;
  //paWizard1.Hint := '[[center:parent y | pos-l:0]]' ;
  //paWizard2.Hint := '[[center:parent y | pos-l:' + IntToStr( paWizard2.Parent.Width + 10 ) + ']]' ;
  //paWizard3.Hint := '[[center:parent y | pos-l:' + IntToStr( paWizard3.Parent.Width + 10 ) + ']]' ;
  //paWizard4.Hint := '[[center:parent y | pos-l:' + IntToStr( paWizard4.Parent.Width + 10 ) + ']]' ;

  // para frames, não precisa efetuar o ResizeBlocks
  rc_RenderLayout( Self, false, false );
end;

procedure TfrmWIZARD.UniFrameReady(Sender: TObject);
begin
     dm_rc.rc_ApplyEditMasks( Self );
     dm_rc.rc_ResizeBlocks( Self, true, true );

     paWizard1.Visible := false;
     paWizard2.Visible := false;
     paWizard3.Visible := false;
     paWizard4.Visible := false;

     btnNextClick( btnNext );
end;

procedure TfrmWIZARD.labPhoneClick(Sender: TObject);
begin
  // forum unigui: http://forums.unigui.com/index.php?/topic/14517-call-phone/
  UniSession.AddJS( 'window.location.href="tel://' + labPhone.Text + '"');
end;

initialization

  RegisterClass( TfrmWIZARD );

end.
