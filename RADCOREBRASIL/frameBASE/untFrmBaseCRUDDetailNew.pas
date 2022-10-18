unit untFrmBaseCRUDDetailNew; // v. 3.5.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, // v. 3.5.0.0
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniDateTimePicker, uniDBDateTimePicker,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniBasicGrid,
  uniDBGrid, uniEdit, uniLabel,
  TypInfo, uniDBLookUpComboBox, uniDBComboBox, uniDBCheckBox, uniDBRadioGroup, uniDBMemo, uniDBImage, uniDBText, uniListBox,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniButton, uniBitBtn, uniMemo, uniDBEdit, uniSpeedButton,  str_func, System.StrUtils,
  uniScrollBox, uniPageControl, Vcl.Menus, uniMainMenu, uniTimer, uniCheckBox, uniMultiItem, uniComboBox, uniSweetAlert;

type
  TfrmBaseCRUDDetail = class(TUniForm)
    sqlMaster: TFDQuery;
    dsMaster: TDataSource;
    sqlSearchMaster: TFDQuery;
    dsSearchMaster: TDataSource;
    popMenuOptions: TUniPopupMenu;
    paBaseBackGround: TUniContainerPanel;
    paBaseTop: TUniContainerPanel;
    pgBaseCadControl: TUniPageControl;
    tabRegisterDetail: TUniTabSheet;
    paBaseCrudDetail: TUniContainerPanel;
    paDataDetail: TUniPanel;
    sboxGridBlockTab1: TUniScrollBox;
    paTitleRegDetail: TUniContainerPanel;
    paTotalizerDetail: TUniContainerPanel;
    tabSearchDetail: TUniTabSheet;
    UniScrollBox2: TUniScrollBox;
    dbgSearchCRUD: TUniDBGrid;
    mem_MASTER: TFDMemTable;
    ds_memMASTER: TDataSource;
    uniScrollBox1: TUniScrollBox;
    timerClose: TUniTimer;
    paBaseTopTitle: TUniContainerPanel;
    labTitleFrm: TUniLabel;
    paBaseButtons: TUniContainerPanel;
    labState: TUniLabel;
    ed_OldPKValue: TUniEdit;
    ed_Table_Status_OLD: TUniEdit;
    ed_FieldMasks: TUniEdit;
    ed_PK: TUniEdit;
    ed_CodMaster: TUniEdit;
    ed_Where_Search: TUniEdit;
    ed_Order_Search: TUniEdit;
    ed_Table_Status: TUniEdit;
    ed_FormOrigin_Tab: TUniEdit;
    ed_FormOrigin: TUniEdit;
    ed_Table_ItemSel: TUniEdit;
    ed_AskNewRec_AfterPost: TUniEdit;
    ed_GenNextID_OnNew: TUniEdit;
    dbgExport: TUniDBGrid;
    ExportarDados1: TUniMenuItem;
    Excel1: TUniMenuItem;
    Html1: TUniMenuItem;
    Xml1: TUniMenuItem;
    Xml2: TUniMenuItem;
    labExit: TUniLabel;
    paNotFound_dbgSearchCRUD: TUniContainerPanel;
    imgNoRecords_dbgSearchCRUD: TUniLabel;
    labNotFound_dbgSearchCRUD: TUniLabel;
    labOptions: TUniLabel;
    labCancel: TUniLabel;
    labSave: TUniLabel;
    edQuickSearch: TUniEdit;
    labEdit: TUniLabel;
    labDelete: TUniLabel;
    btnQuickSearch: TUniBitBtn;
    labNew: TUniLabel;
    paOF: TUniContainerPanel;
    btnCloseForm: TUniBitBtn;
    btnOptions: TUniBitBtn;
    paNAE: TUniContainerPanel;
    btnNewReg: TUniBitBtn;
    btnEditReg: TUniBitBtn;
    btnDeleteReg: TUniBitBtn;
    paGC: TUniContainerPanel;
    btnSaveReg: TUniBitBtn;
    btnCancelReg: TUniBitBtn;
    procedure UniFormShow(Sender: TObject);
    procedure UniFormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure UniFormDestroy(Sender: TObject);
    procedure dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure dsMasterStateChange(Sender: TObject);
    procedure btnCloseFormClick(Sender: TObject);
    procedure btnOptionsClick(Sender: TObject);
    procedure btnNewRegClick(Sender: TObject);
    procedure btnEditRegClick(Sender: TObject);
    procedure btnSaveRegClick(Sender: TObject);
    procedure btnDeleteRegClick(Sender: TObject);
    procedure btnCancelRegClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure dbgSearchCRUDDblClick(Sender: TObject);
    procedure timerCloseTimer(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure dbgSearchCRUDColumnSort(Column: TUniDBGridColumn;
      Direction: Boolean);
    procedure Excel1Click(Sender: TObject);
    procedure Html1Click(Sender: TObject);
    procedure Xml1Click(Sender: TObject);
    procedure Xml2Click(Sender: TObject);
    procedure dsMasterDataChange(Sender: TObject; Field: TField);
    procedure pgBaseCadControlChangeValue(Sender: TObject);
    procedure dsSearchMasterStateChange(Sender: TObject);
    procedure sqlMasterError(ASender, AInitiator: TObject; var AException: Exception);
    procedure sqlSearchMasterError(ASender, AInitiator: TObject; var AException: Exception);
    procedure UniFormBeforeShow(Sender: TObject);
  // v. 3.3.0.1
  private
    { Private declarations }
    iFirstShow : integer;
    // v. 3.5.0.0
    bActions,
    bModelCrud1,
    bModelCrud2,
    bModelCrud3,
    bPaged     : boolean;
    cTemp, cTemp2: String;
    // v. 3.5.0.0
    // translate messages
    cBTN_SEARCH_CAPTION,
    cBTN_NEW_CAPTION,
    cBTN_EDIT_CAPTION,
    cBTN_DEL_CAPTION,
    cBTN_SAVE_CAPTION,
    cBTN_CANCEL_CAPTION,
    cBTN_OPTIONS_CAPTION : string;
  public
    { Public declarations }
    procedure rc_CloseQuerys;
    procedure rc_UpdateLayout; // v. 3.5.0.0
  end;

function frmBaseCRUDDetail: TfrmBaseCRUDDetail;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untdm_rc, Main,
  mkm_func_web,
  uconsts,
  ServerModule, untFrmLookUp_Lite, mkm_gridblock, mkm_layout, mkm_validate,
  mkm_translate, mkm_anim, mkm_dbfuncs, mkm_dbcombobox;

function frmBaseCRUDDetail: TfrmBaseCRUDDetail;
begin
  Result := TfrmBaseCRUDDetail(mm.GetFormInstance(TfrmBaseCRUDDetail));
end;

// v. 3.5.0.0
procedure TfrmBaseCRUDDetail.rc_UpdateLayout;
var
   cBtnCls : string;
begin

   case mm.varLT_Lang of

        ltpt_BR : begin
                    labNotFound_dbgSearchCRUD.Caption   := 'Pesquisa Não Encontrada';
                    cBTN_SEARCH_CAPTION                 := 'Pesquisa';
                    cBTN_NEW_CAPTION                    := 'Novo';
                    cBTN_EDIT_CAPTION                   := 'Edita';
                    cBTN_DEL_CAPTION                    := 'Exclui';
                    cBTN_SAVE_CAPTION                   := 'Salva';
                    cBTN_CANCEL_CAPTION                 := 'Cancela';
                    cBTN_OPTIONS_CAPTION                := 'Opções';
                  end;
        lten_US, lten_GB   : begin
                    labNotFound_dbgSearchCRUD.Caption   := 'No records found';
                    cBTN_SEARCH_CAPTION                 := 'Search';
                    cBTN_NEW_CAPTION                    := 'New';
                    cBTN_EDIT_CAPTION                   := 'Edit';
                    cBTN_DEL_CAPTION                    := 'Delete';
                    cBTN_SAVE_CAPTION                   := 'Saves';
                    cBTN_CANCEL_CAPTION                 := 'Cancel';
                    cBTN_OPTIONS_CAPTION                := 'Options';
                  end;
        ltes_ES   : begin
                     labNotFound_dbgSearchCRUD.Caption   := 'Búsqueda no encontrada';;
                     cBTN_SEARCH_CAPTION                 := 'Buscar';
                     cBTN_NEW_CAPTION                    := 'Nuevo';
                     cBTN_EDIT_CAPTION                   := 'Editar';
                     cBTN_DEL_CAPTION                    := 'Elimina';
                     cBTN_SAVE_CAPTION                   := 'Guardar';
                     cBTN_CANCEL_CAPTION                 := 'Cancelar';
                     cBTN_OPTIONS_CAPTION                := 'Opciones';
                  end;
        ltfr_FR   : begin
                     labNotFound_dbgSearchCRUD.Caption   := 'No records found';
                     cBTN_SEARCH_CAPTION                 := 'Search';
                     cBTN_NEW_CAPTION                    := 'New';
                     cBTN_EDIT_CAPTION                   := 'Edit';
                     cBTN_DEL_CAPTION                    := 'Delete';
                     cBTN_SAVE_CAPTION                   := 'Saves';
                     cBTN_CANCEL_CAPTION                 := 'Cancel';
                     cBTN_OPTIONS_CAPTION                := 'Options';
                  end;
        ltde_DE   : begin
                     labNotFound_dbgSearchCRUD.Caption   := 'No records found';
                     cBTN_SEARCH_CAPTION                 := 'Search';
                     cBTN_NEW_CAPTION                    := 'New';
                     cBTN_EDIT_CAPTION                   := 'Edit';
                     cBTN_DEL_CAPTION                    := 'Delete';
                     cBTN_SAVE_CAPTION                   := 'Saves';
                     cBTN_CANCEL_CAPTION                 := 'Cancel';
                     cBTN_OPTIONS_CAPTION                := 'Options';
                  end;
        ltit_IT   : begin
                     labNotFound_dbgSearchCRUD.Caption   := 'No records found';
                     cBTN_SEARCH_CAPTION                 := 'Search';
                     cBTN_NEW_CAPTION                    := 'New';
                     cBTN_EDIT_CAPTION                   := 'Edit';
                     cBTN_DEL_CAPTION                    := 'Delete';
                     cBTN_SAVE_CAPTION                   := 'Saves';
                     cBTN_CANCEL_CAPTION                 := 'Cancel';
                     cBTN_OPTIONS_CAPTION                := 'Options';
                  end;
        lttr_TR    : begin
                     labNotFound_dbgSearchCRUD.Caption   := 'No records found';
                     cBTN_SEARCH_CAPTION                 := 'Search';
                     cBTN_NEW_CAPTION                    := 'New';
                     cBTN_EDIT_CAPTION                   := 'Edit';
                     cBTN_DEL_CAPTION                    := 'Delete';
                     cBTN_SAVE_CAPTION                   := 'Saves';
                     cBTN_CANCEL_CAPTION                 := 'Cancel';
                     cBTN_OPTIONS_CAPTION                := 'Options';
                  end;
        ltru_RU    : begin
                     labNotFound_dbgSearchCRUD.Caption   := 'No records found';
                     cBTN_SEARCH_CAPTION                 := 'Search';
                     cBTN_NEW_CAPTION                    := 'New';
                     cBTN_EDIT_CAPTION                   := 'Edit';
                     cBTN_DEL_CAPTION                    := 'Delete';
                     cBTN_SAVE_CAPTION                   := 'Saves';
                     cBTN_CANCEL_CAPTION                 := 'Cancel';
                     cBTN_OPTIONS_CAPTION                := 'Options';
                  end;
        ltzn_CH : begin
                     labNotFound_dbgSearchCRUD.Caption   := 'No records found';
                     cBTN_SEARCH_CAPTION                 := 'Search';
                     cBTN_NEW_CAPTION                    := 'New';
                     cBTN_EDIT_CAPTION                   := 'Edit';
                     cBTN_DEL_CAPTION                    := 'Delete';
                     cBTN_SAVE_CAPTION                   := 'Saves';
                     cBTN_CANCEL_CAPTION                 := 'Cancel';
                     cBTN_OPTIONS_CAPTION                := 'Options';
                  end;
        ltin_ID : begin
                     labNotFound_dbgSearchCRUD.Caption   := 'No records found';
                     cBTN_SEARCH_CAPTION                 := 'Search';
                     cBTN_NEW_CAPTION                    := 'New';
                     cBTN_EDIT_CAPTION                   := 'Edit';
                     cBTN_DEL_CAPTION                    := 'Delete';
                     cBTN_SAVE_CAPTION                   := 'Saves';
                     cBTN_CANCEL_CAPTION                 := 'Cancel';
                     cBTN_OPTIONS_CAPTION                := 'Options';
                  end;
        ltth_TH : begin
                     labNotFound_dbgSearchCRUD.Caption   := 'No records found';
                     cBTN_SEARCH_CAPTION                 := 'Search';
                     cBTN_NEW_CAPTION                    := 'New';
                     cBTN_EDIT_CAPTION                   := 'Edit';
                     cBTN_DEL_CAPTION                    := 'Delete';
                     cBTN_SAVE_CAPTION                   := 'Saves';
                     cBTN_CANCEL_CAPTION                 := 'Cancel';
                     cBTN_OPTIONS_CAPTION                := 'Options';
                  end;
        lthi_IN : begin
                     labNotFound_dbgSearchCRUD.Caption   := 'No records found';
                     cBTN_SEARCH_CAPTION                 := 'Search';
                     cBTN_NEW_CAPTION                    := 'New';
                     cBTN_EDIT_CAPTION                   := 'Edit';
                     cBTN_DEL_CAPTION                    := 'Delete';
                     cBTN_SAVE_CAPTION                   := 'Saves';
                     cBTN_CANCEL_CAPTION                 := 'Cancel';
                     cBTN_OPTIONS_CAPTION                := 'Options';
                  end;
        ltar_SA : begin // v. 3.3.0.0
                     labNotFound_dbgSearchCRUD.Caption   := 'لا توجد سجلات';
                     cBTN_SEARCH_CAPTION                 := 'Search';
                     cBTN_NEW_CAPTION                    := 'New';
                     cBTN_EDIT_CAPTION                   := 'Edit';
                     cBTN_DEL_CAPTION                    := 'Delete';
                     cBTN_SAVE_CAPTION                   := 'Saves';
                     cBTN_CANCEL_CAPTION                 := 'Cancel';
                     cBTN_OPTIONS_CAPTION                := 'Options';
                  end;
   end;

   bModelCrud1 := Pos( 'model-crud:1', dbgSearchCRUD.Hint ) > 0;
   bModelCrud2 := Pos( 'model-crud:2', dbgSearchCRUD.Hint ) > 0;
   bModelCrud3 := Pos( 'model-crud:3', dbgSearchCRUD.Hint ) > 0;
   bActions    := bModelCrud3;

   if Pos( 'btns-cls:', dbgSearchCRUD.Hint ) > 0 then
   begin
      cBtnCls := Copy( dbgSearchCRUD.Hint, Pos( 'btns-cls:', dbgSearchCRUD.Hint ) + 9 );
      cBtnCls := Copy( cBtnCls, 1, Pos( ')', cBtnCls ) -1 );
   end
   else
      cBtnCls := '';
   //
   Self.Color             := StringToColor( mm.CONFIG_LAYOUT_BG_COLOR );
   paBaseTop.Color        := clWhite;
   paBaseButtons.Color    := clWhite;
   paBaseBackGround.Color := clWhite;
   // v. 3.5.0.0
   paBaseTop.AlignWithMargins        := ( not bModelCrud2 ) and ( not bModelCrud3 );
   pgBaseCadControl.AlignWithMargins := ( not bModelCrud2 ) and ( not bModelCrud3 );
   if ( not bModelCrud2 ) and ( mm.varB_Mobile_Screen ) and ( not bActions ) then
   begin
      paBaseButtons.Align := alTop;

//      paP.Height          := 36;
//      paP.top             := 0;
//      paP.Left            := 0;
//      paP.Width           := 36;

      paNAE.Height        := 36;
      paNAE.top           := 0;
      paNAE.Left          := 0;//paP.left + paP.Width + 15;
      paNAE.width         := 120;
        btnNewReg.Left    := 2;
        btnNewReg.Top     := 2;
        btnEditReg.Left   := btnNewReg.Left + btnNewReg.Width + 2;
        btnEditReg.Top    := 2;
        btnDeleteReg.Left := btnEditReg.Left + btnEditReg.Width + 2;
        btnDeleteReg.Top  := 2;

      paGC.Height         := 36;
      paGC.top            := 0;
      paGC.Left           := paNAE.left + paNAE.Width + 15;
      paGC.width          := 80;
        btnSaveReg.Left   := 2;
        btnSaveReg.Top    := 2;
        btnCancelReg.Left := btnSaveReg.Left + btnSaveReg.Width + 2;
        btnCancelReg.Top  := 2;

      paOF.Height         := 36;
      paOF.top            := 0;
      paOF.Left           := paGC.left + paGC.Width + 15;
      paOF.width          := 36;
        btnOptions.Left   := 2;
        btnOptions.Top    := 2;
   end
   else
   if ( bModelCrud2 ) then //and ( not mm.varB_Mobile_Screen ) then
   begin
      paBaseButtons.Parent := paBaseTopTitle;
      paBaseButtons.Height := 37;
      paBaseButtons.Align  := alBottom;
      paBaseButtons.Margins.Left   := 8;
      paBaseButtons.Margins.Bottom := 8;
      paBaseButtons.Top    := labTitleFrm.Top + 50;// edQuickSearch.Top;
      Self.Color           := StringToColor( mm.CONFIG_LAYOUT_BG_COLOR );
      paBaseTop.Color      := clWhite;
      paBaseButtons.Color  := paBaseTopTitle.Color;
      paBaseButtons.Width  := paBaseTopTitle.Width;
      //paBaseButtons.Align := alTop;
//      paP.Height          := 37;
//      paP.AlignWithMargins := true;
//      paP.Align           := alLeft;
//      paP.top             := 0;
//      paP.Left            := 0;
//      paP.Width           := 105;
//      paP.Hint :=
//          '[['+
//          'width:105 mobile-v-46|'+
//          ']]';
//        btnSearch.Align     := alLeft;
//        btnSearch.Caption   := cBTN_SEARCH_CAPTION;
//        btnSearch.Width     := 95;
//        btnSearch.Height    := 36;
//        btnSearch.Font.Size := 10;
//        btnSearch.Hint :=
//            '[['+
//            'cls:' + varIIF( cBtnCls = '', 'ButtonBlue', cBtnCls ) + ' |'+
//            //'cls:ButtonBlue |'+
//            'ico:fas-search |'+
//            'caption-hide:mobile-v|'+
//            'width:95 mobile-v-32|'+
//            'append |' +
//            //'cls-ico:font-black |'+
//            //'hint:show / hide search dialog t:search w:200 d:10000 c:info-light'+
//            ']]';

      paNAE.AlignWithMargins := true;
      paNAE.Height        := 36;
      paNAE.Align         := alLeft;
      paNAE.top           := 0;
      paNAE.Left          := 0;//paP.left + paP.Width + 21 ;
      paNAE.width         := 220;
      paNAE.Hint :=
          '[['+
          'width:220 mobile-v-115|'+
          ']]';
        //btnNewReg.AlignWithMargins  := false;
        btnNewReg.Align     := alLeft;
        btnNewReg.Left      := 2;
        btnNewReg.Top       := 2;
        btnNewReg.Caption   := cBTN_NEW_CAPTION;
        btnNewReg.Width     := 70;
        btnNewReg.Font.Size := 10;
        btnNewReg.Hint :=
            '[['+
            //'cls:ButtonThemeCrud |'+
            'cls:' + varIIF( cBtnCls = '', 'ButtonBlue', cBtnCls ) + ' |'+
            'ico:fas-plus |'+
            'caption-hide:mobile-v|'+
            'width:70 mobile-v-32|'+
            'append |' +
            //'cls-ico:font-black |'+
            //'hint:show / hide search dialog t:search w:200 d:10000 c:info-light'+
            ']]';

        btnEditReg.Align     := alLeft;
        btnEditReg.Left      := btnNewReg.Left + btnNewReg.Width + 2 ;
        btnEditReg.Top       := 2;
        btnEditReg.Caption   := cBTN_EDIT_CAPTION;
        btnEditReg.Width     := 70;
        btnEditReg.Font.Size := 10;
        btnEditReg.Hint :=
            '[['+
            //'cls:ButtonThemeCrud |'+
            'cls:' + varIIF( cBtnCls = '', 'ButtonOrange', cBtnCls ) + ' |'+
            'ico:fas-pencil-alt|'+
            'caption-hide:mobile-v|'+
            'width:70 mobile-v-32|'+
            'append |' +
            //'cls-ico:font-black |'+
            //'hint:show / hide search dialog t:search w:200 d:10000 c:info-light'+
            ']]';

        btnDeleteReg.Align     := alLeft;
        btnDeleteReg.Left      := btnEditReg.Left + btnEditReg.Width + 2 ;
        btnDeleteReg.Top       := 2;
        btnDeleteReg.Caption   := cBTN_DEL_CAPTION;
        btnDeleteReg.Width     := 70;
        btnDeleteReg.Font.Size := 10;
        btnDeleteReg.Hint :=
            '[['+
            //'cls:ButtonThemeCrud |'+
            'cls:' + varIIF( cBtnCls = '', 'ButtonRed', cBtnCls ) + ' |'+
            'ico:fas-trash-alt |'+
            'caption-hide:mobile-v|'+
            'width:70 mobile-v-32|'+
            'append |' +
            //'cls-ico:font-black |'+
            //'hint:show / hide search dialog t:search w:200 d:10000 c:info-light'+
            ']]';

      paGC.AlignWithMargins := true;
      paGC.Height         := 36;
      paGC.Align          := alLeft;
      paGC.top            := 0;
      paGC.Left           := paNAE.left + paNAE.Width + 21 ;
      paGC.width          := 160;
      paGC.Hint :=
          '[['+
          'width:160 mobile-v-82|'+
          ']]';
        btnSaveReg.Align  := alLeft;
        btnSaveReg.Left   := 2;
        btnSaveReg.Top    := 2;
        btnSaveReg.Caption   := cBTN_SAVE_CAPTION;
        btnSaveReg.Width     := varIIF( mm.varB_Mobile_Screen_Portrait, 32, 75 );
        btnSaveReg.Font.Size := 10;
        btnSaveReg.Hint :=
            '[['+
            //'cls:ButtonThemeCrud |'+
            'cls:' + varIIF( cBtnCls = '', 'ButtonGreen', cBtnCls ) + ' |'+
            'ico:fas-check |'+
            'caption-hide:mobile-v|'+
            'width:75 mobile-v-32|'+
            'append |' +
            //'cls-ico:font-black |'+
            //'hint:show / hide search dialog t:search w:200 d:10000 c:info-light'+
            ']]';
        btnCancelReg.Align     := alLeft;
        btnCancelReg.Left      := btnSaveReg.Left + btnSaveReg.Width + 2;
        btnCancelReg.Top       := 2;
        btnCancelReg.Caption   := cBTN_CANCEL_CAPTION;
        btnCancelReg.Width     := varIIF( mm.varB_Mobile_Screen_Portrait, 32, 75 );
        btnCancelReg.Font.Size := 10;
        btnCancelReg.Hint :=
            '[['+
            //'cls:ButtonThemeCrud |'+
            'cls:' + varIIF( cBtnCls = '', 'ButtonRed', cBtnCls ) + ' |'+
            'ico:fas-times |'+
            'caption-hide:mobile-v|'+
            'width:75 mobile-v-32|'+
            'append |' +
            //'cls-ico:font-black |'+
            //'hint:show / hide search dialog t:search w:200 d:10000 c:info-light'+
            ']]';

      paOF.AlignWithMargins := true;
      paOF.Height         := 36;
      paOF.Align           := alLeft;
      paOF.top            := 0;
      paOF.Left           := paGC.left + paGC.Width + 21;
      paOF.width          := 80;
      paOF.Hint :=
          '[['+
          'width:80 mobile-v-36|'+
          ']]';
        btnOptions.Align  := alLeft;
        btnOptions.Left   := 2;
        btnOptions.Top    := 2;
        btnOptions.Caption   := cBTN_OPTIONS_CAPTION;
        btnOptions.Width     := 75;
        btnOptions.Font.Size := 10;
        btnOptions.Hint :=
            '[['+
            //'cls:ButtonThemeCrud |'+
            'cls:' + varIIF( cBtnCls = '', 'ButtonGray', cBtnCls ) + ' |'+
            'ico:fas-bars |'+
            'caption-hide:mobile-v|'+
            'width:75 mobile-v-32|'+
            'append |' +
            //'cls-ico:font-black |'+
            //'hint:show / hide search dialog t:search w:200 d:10000 c:info-light'+
            ']]';
   end
   else
   if ( bModelCrud3 ) then //and ( not mm.varB_Mobile_Screen ) then
   begin
//      rc_BringToFront( edQuickSearch );
//      rc_BringToFront( btnQuickSearch );
      paBaseButtons.Parent := paBaseTopTitle;
      paBaseButtons.Height := 37;
      paBaseButtons.Align  := alBottom;
      paBaseButtons.Margins.Left   := 8;
      paBaseButtons.Margins.Bottom := 8;
//      paBaseButtons.Top    := edQuickSearch.Top;
      Self.Color           := StringToColor( mm.CONFIG_LAYOUT_BG_COLOR );
      paBaseTop.Color      := clWhite;
      paBaseButtons.Color  := paBaseTopTitle.Color;
      paBaseButtons.Width  := paBaseTopTitle.Width;
      //paBaseButtons.Align := alTop;
//      paP.Visible         := false;
//      paP.Height          := 37;
//      paP.AlignWithMargins := true;
//      paP.Align           := alRight;
//      paP.top             := 0;
//      paP.Left            := 0;
//      paP.Width           := 0;
//      paP.Hint :=
//          '[['+
//          'width:0 mobile-v-0|'+
//          ']]';
//        btnSearch.Align     := alLeft;
//        btnSearch.Caption   := cBTN_SEARCH_CAPTION;
//        btnSearch.Width     := 95;
//        btnSearch.Height    := 36;
//        btnSearch.Font.Size := 10;
//        btnSearch.Hint :=
//            '[['+
//            'cls:' + varIIF( cBtnCls = '', 'ButtonBlue', cBtnCls ) + ' |'+
//            //'cls:ButtonBlue |'+
//            'ico:fas-search |'+
//            'caption-hide:mobile-v|'+
//            'width:95 mobile-v-32|'+
//            'append |' +
//            //'cls-ico:font-black |'+
//            //'hint:show / hide search dialog t:search w:200 d:10000 c:info-light'+
//            ']]';

      paNAE.AlignWithMargins := true;
      paNAE.Height        := 36;
      paNAE.Align         := alRight;
      paNAE.top           := 0;
      paNAE.Left          := 0;//paP.left + paP.Width + 21 ;
      paNAE.width         := 72;
      paNAE.Hint :=
          '[['+
          'width:72 mobile-v-34|'+
          ']]';
        //btnNewReg.AlignWithMargins  := false;
        btnNewReg.Align     := alRight;
        btnNewReg.Left      := 2;
        btnNewReg.Top       := 2;
        btnNewReg.Caption   := cBTN_NEW_CAPTION;
        btnNewReg.Width     := 70;
        btnNewReg.Font.Size := 10;
        btnNewReg.Hint :=
            '[['+
            //'cls:ButtonThemeCrud |'+
            'cls:' + varIIF( cBtnCls = '', 'ButtonBlue', cBtnCls ) + ' |'+
            'ico:fas-plus |'+
            'caption-hide:mobile-v|'+
            'width:70 mobile-v-32|'+
            'append |' +
            //'cls-ico:font-black |'+
            //'hint:show / hide search dialog t:search w:200 d:10000 c:info-light'+
            ']]';
        //btnEditReg.Visible   := false;
        btnEditReg.Align     := alLeft;
        btnEditReg.Left      := btnNewReg.Left + btnNewReg.Width + 2 ;
        btnEditReg.Top       := 2;
        btnEditReg.Caption   := cBTN_EDIT_CAPTION;
        btnEditReg.Width     := 70;
        btnEditReg.Font.Size := 10;
//        btnEditReg.Hint :=
//            '[['+
//            //'cls:ButtonThemeCrud |'+
//            'cls:' + varIIF( cBtnCls = '', 'ButtonOrange', cBtnCls ) + ' |'+
//            'ico:fas-pencil-alt|'+
//            'caption-hide:mobile-v|'+
//            'width:70 mobile-v-32|'+
//            'append |' +
//            //'cls-ico:font-black |'+
//            //'hint:show / hide search dialog t:search w:200 d:10000 c:info-light'+
//            ']]';
        //btnDeleteReg.Visible   := false;
        btnDeleteReg.Align     := alLeft;
        btnDeleteReg.Left      := btnEditReg.Left + btnEditReg.Width + 2 ;
        btnDeleteReg.Top       := 2;
        btnDeleteReg.Caption   := cBTN_DEL_CAPTION;
        btnDeleteReg.Width     := 70;
        btnDeleteReg.Font.Size := 10;
//        btnDeleteReg.Hint :=
//            '[['+
//            //'cls:ButtonThemeCrud |'+
//            'cls:' + varIIF( cBtnCls = '', 'ButtonRed', cBtnCls ) + ' |'+
//            'ico:fas-trash-alt |'+
//            'caption-hide:mobile-v|'+
//            'width:70 mobile-v-32|'+
//            'append |' +
//            //'cls-ico:font-black |'+
//            //'hint:show / hide search dialog t:search w:200 d:10000 c:info-light'+
//            ']]';

      paGC.AlignWithMargins := true;
      paGC.Height         := 36;
      paGC.Align          := alRight;
      paGC.top            := 0;
     // paGC.Left           := paNAE.left + paNAE.Width + 21 ;
      paGC.width          := varIIF( mm.varB_Mobile_Screen_Portrait, 75, 160 );
      paGC.Hint :=
          '[['+
          'width:160 mobile-v-75|'+
          ']]';
        btnSaveReg.Visible   := true;
        btnSaveReg.Align  := alLeft;
        btnSaveReg.Left   := 2;
        btnSaveReg.Top    := 2;
        btnSaveReg.Caption   := cBTN_SAVE_CAPTION;
        btnSaveReg.Width     := varIIF( mm.varB_Mobile_Screen_Portrait, 32, 75 );
        btnSaveReg.Font.Size := 10;
        btnSaveReg.Hint :=
            '[['+
            //'cls:ButtonThemeCrud |'+
            'cls:' + varIIF( cBtnCls = '', 'ButtonGreen', cBtnCls ) + ' |'+
            'ico:fas-check |'+
            'caption-hide:mobile-v|'+
            'width:75 mobile-v-32|'+
            'append |' +
            //'cls-ico:font-black |'+
            //'hint:show / hide search dialog t:search w:200 d:10000 c:info-light'+
            ']]';
        btnCancelReg.Visible   := true;
        btnCancelReg.Align     := alLeft;
        btnCancelReg.Left      := btnSaveReg.Left + btnSaveReg.Width + 2;
        btnCancelReg.Top       := 2;
        btnCancelReg.Caption   := cBTN_CANCEL_CAPTION;
        btnCancelReg.Width     := varIIF( mm.varB_Mobile_Screen_Portrait, 32, 75 );
        btnCancelReg.Font.Size := 10;
        btnCancelReg.Hint :=
            '[['+
            //'cls:ButtonThemeCrud |'+
            'cls:' + varIIF( cBtnCls = '', 'ButtonRed', cBtnCls ) + ' |'+
            'ico:fas-times |'+
            'caption-hide:mobile-v|'+
            'width:75 mobile-v-32|'+
            'append |' +
            //'cls-ico:font-black |'+
            //'hint:show / hide search dialog t:search w:200 d:10000 c:info-light'+
            ']]';
      //paOF.Visible          := false;
      paOF.AlignWithMargins := true;
      paOF.Height           := 36;
      paOF.Align            := alRight;
      paOF.top              := 0;
      //paOF.Left             := paGC.left + paGC.Width + 21;
      paOF.width            := 0;
//      paOF.Hint :=
//          '[['+
//          'width:0 mobile-v-0|'+
//          ']]';
        btnOptions.Align  := alLeft;
        btnOptions.Left   := 2;
        btnOptions.Top    := 2;
        btnOptions.Caption   := cBTN_OPTIONS_CAPTION;
        btnOptions.Width     := 75;
        btnOptions.Font.Size := 10;
        btnOptions.Hint :=
            '[['+
            //'cls:ButtonThemeCrud |'+
            'cls:' + varIIF( cBtnCls = '', 'ButtonGray', cBtnCls ) + ' |'+
            'ico:fas-bars |'+
            'caption-hide:mobile-v|'+
            'width:75 mobile-v-32|'+
            'append |' +
            //'cls-ico:font-black |'+
            //'hint:show / hide search dialog t:search w:200 d:10000 c:info-light'+
            ']]';
   end
   else
   begin
      paBaseButtons.Align := alLeft;
//      paP.Align           := alTop;
//      paP.Margins.Left    := 0;
//      paP.AlignWithMargins:= true;
      paNAE.Align         := alTop;
      paNAE.Margins.Left    := 0;
      paNAE.Margins.Top    := 6;
      paNAE.AlignWithMargins:= true;
      paGC.Align          := alTop;
      paGC.Margins.Left    := 0;
      paGC.Margins.Top    := 6;
      paGC.AlignWithMargins:= true;
      paOF.Margins.Left    := 0;
      paOF.Margins.Top    := 6;
      paOF.Align          := alTop;
      paOF.AlignWithMargins:= true;
      //
      //paBaseTop.AlignWithMargins        := ( not bModelCrud2 );
      //pgBaseCadControl.AlignWithMargins := ( not bModelCrud2 );
      paBaseButtons.Parent              := paBaseBackGround;
      paBaseButtons.Margins.Left        := 4;
      paBaseButtons.Margins.Bottom      := 3;
      //
//      Self.Color             := StringToColor( mm.CONFIG_LAYOUT_BG_COLOR );
//      paBaseTop.Color        := clWhite;
//      paBaseButtons.Color    := clWhite;
//      paBaseBackGround.Color := clWhite;
//      paP.Width              := 37;
//      paP.Height             := 40;
      //paP.AlignWithMargins   := false;
      //paP.Align              := alNone;
//        btnSearch.Caption      := '';
//        btnSearch.Width        := 33;
//        btnSearch.Height       := 36;
//        btnSearch.Font.Size    := 14;
//        btnSearch.Hint :=
//            '[['+
//            'cls:ButtonWhite |'+
//            'ico:fas-search |'+
//            'cls-ico:font-black |'+
//            //'hint:show / hide search dialog t:search w:200 d:10000 c:info-light'+
//            ']]';
      //paNAE.Align         := alNone;
      //paNAE.AlignWithMargins := false;
      paNAE.Width         := 37;
      paNAE.Height        := 110;
        btnNewReg.Align     := alTop; // alNone;
        btnNewReg.Caption   := '';
        btnNewReg.Width     := 33;
        btnNewReg.Height    := 36;//btnSearch.Height;
        btnNewReg.Font.Size := 14;
        btnNewReg.Hint :=
            '[['+
            'cls:ButtonWhite |'+
            'ico:fas-plus |'+
            'cls-ico:font-black |'+
            //'hint:show / hide search dialog t:search w:200 d:10000 c:info-light'+
            ']]';
        btnEditReg.Align     := alTop; // alNone;
        btnEditReg.Caption   := '';
        btnEditReg.Width     := 33;
        btnEditReg.Font.Size := 14;
        btnEditReg.Height    := btnNewReg.Height;//btnSearch.Height;
        btnEditReg.Hint :=
            '[['+
            'cls:ButtonWhite |'+
            'ico:fas-pencil-alt |'+
            'cls-ico:font-black |'+
            //'hint:show / hide search dialog t:search w:200 d:10000 c:info-light'+
            ']]';
        btnDeleteReg.Align     := alTop; // alNone;
        btnDeleteReg.Caption   := '';
        btnDeleteReg.Width     := 33;
        btnDeleteReg.Height    := btnNewReg.Height;//btnSearch.Height;
        btnDeleteReg.Font.Size := 14;
        btnDeleteReg.Hint :=
            '[['+
            'cls:ButtonWhite |'+
            'ico:fas-trash-alt |'+
            'cls-ico:font-black |'+
            //'hint:show / hide search dialog t:search w:200 d:10000 c:info-light'+
            ']]';
      //paGC.Align           := alNone;
      //paGC.AlignWithMargins := false;
      paGC.Width           := 37;
      paGC.Height          := 73;
        btnSaveReg.Align     := alNone;
        btnSaveReg.Caption   := '';
        btnSaveReg.Width     := 33;
        btnSaveReg.Height    := btnNewReg.Height;//btnSearch.Height;
        btnSaveReg.Font.Size := 14;
        btnSaveReg.Hint :=
            '[['+
            'cls:ButtonWhite |'+
            'ico:fas-check |'+
            'cls-ico:font-black |'+
            //'hint:show / hide search dialog t:search w:200 d:10000 c:info-light'+
            ']]';
        btnCancelReg.Align     := alNone;
        btnCancelReg.Caption   := '';
        btnCancelReg.Width     := 33;
        btnCancelReg.Height    := btnNewReg.Height;//btnSearch.Height;
        btnCancelReg.Font.Size := 14;
        btnCancelReg.Hint :=
            '[['+
            'cls:ButtonWhite |'+
            'ico:fas-times |'+
            'cls-ico:font-black |'+
            //'hint:show / hide search dialog t:search w:200 d:10000 c:info-light'+
            ']]';
      //paOF.Align           := alNone;
      //paOF.AlignWithMargins := false;
      paOF.Width           := 37;
      paOf.Height          := 40;
        btnOptions.Caption   := '';
        btnOptions.Width     := 33;
        btnOptions.Height    := btnNewReg.Height;//btnSearch.Height;
        btnOptions.Font.Size := 14;
        btnOptions.Hint :=
            '[['+
            'cls:ButtonWhite |'+
            'ico:fas-bars |'+
            'cls-ico:font-black |'+
            //'hint:show / hide search dialog t:search w:200 d:10000 c:info-light'+
            ']]';

   end;
end;

procedure TfrmBaseCRUDDetail.btnEditRegClick(Sender: TObject);
var
   i : integer;
begin
  if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;

  // verifica licenca de uso
  if mm.varC_Locked = 'S' then
  begin
       dm_rc.rc_ShowSweetAlert( mm.MSG_INFO, mm.MSG_APP_LOCKED, 'warning' ); // v. 3.3.1.0
       Abort;
  end;

  // verifica restricao do usuário - ALTERACAO
  If not dm_rc.rc_PermissionVerify( ed_FormOrigin_Tab.Text ,
                                    Trim( ed_Table_ItemSel.Text ) ,
                                    PT_EDIT ) then
  begin
     Abort;
  end;

  ed_Table_Status.Text := '';
  ed_Table_Status_OLD.Text := '';
  // v. 3.2.0.5
  if not dsSearchMaster.DataSet.IsEmpty then
  begin
     pgBaseCadControl.ActivePage := tabRegisterDetail;

     if Self.FindComponent('pgComplementData' ) <> nil then
        if TUniPageControl( Self.FindComponent('pgComplementData' ) ).Pages[0].TabVisible then
           TUniPageControl( Self.FindComponent('pgComplementData' ) ).ActivePageIndex := 0;

     sqlMaster.Cancel;
     sqlMaster.close;

     // percorrer todos os parametros da query
     for i := 0 to sqlMaster.ParamCount - 1 do
     begin
          if DataTypeIsNumber( dsSearchMaster.DataSet.FieldByName( sqlMaster.Params[ i ].Name ).DataType ) then
             sqlMaster.ParamByName( sqlMaster.Params[ i ].Name ).AsInteger  := dsSearchMaster.DataSet.FieldByName( sqlMaster.Params[ i ].Name ).AsInteger
          else
          if DataTypeIsString( dsSearchMaster.DataSet.FieldByName( sqlMaster.Params[ i ].Name ).DataType ) then
             sqlMaster.ParamByName( sqlMaster.Params[ i ].Name ).AsString   := dsSearchMaster.DataSet.FieldByName( sqlMaster.Params[ i ].Name ).AsString
          else
          if DataTypeIsDateTime( dsSearchMaster.DataSet.FieldByName( sqlMaster.Params[ i ].Name ).DataType ) then
             sqlMaster.ParamByName( sqlMaster.Params[ i ].Name ).AsDateTime := dsSearchMaster.DataSet.FieldByName( sqlMaster.Params[ i ].Name ).AsDateTime;
     end;

     // em vez de capturar parametro definido no on create do form,
     // vamos percorrer a lista de PK´s e criar dinamicamente...
     dm_rc.rc_OpenQuery( sqlMaster );

     sqlMaster.Edit; // v. 3.2.0.0 // feedback JOSAURO

     // atualizar todos os LOOKUPs dinamicamente
     dm_rc.rc_LookUpUpdateData(  self  );

     //sqlMaster.Edit; // v. 3.2.0.0 // feedback JOSAURO

  end;
end;

procedure TfrmBaseCRUDDetail.btnCancelRegClick(Sender: TObject);
var
   I : integer;
begin

  inherited;

  if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;

  ed_Table_Status.Text := '';
  ed_Table_Status_OLD.Text := '';

  // fechar todas as querys abertas
  try
     for I := 0 to Self.ComponentCount - 1 do
     begin
       // to clean "valid:" red borders
       // para limpar as bordas vermelhas do "valid:"
       If GetPropInfo( Self.Components[I].ClassInfo, 'Hint') <> nil then
       begin
          if Pos( 'invalid:true', TUniControl( Self.Components[I] ).Hint ) > 0 then
          begin
             rc_RemoveCssClass( TUniControl( Self.Components[I] ), 'rc-invalid' );
             rc_SetHintProperty( 'false' , 'invalid:', TUniControl( Self.Components[I] ).Hint ); //para limpar ao cancelar o cadastro
          end;
       end;

       if Self.Components[I] is TFDQuery then
       begin
          if TFDQuery( Self.Components[I] ).Name <> 'sqlSearchMaster' then
          begin
             TFDQuery( Self.Components[I] ).Cancel;
          end;
       end
       else
       if Self.Components[I] is TDataSource then
       begin
          if ( TDataSource( Self.Components[I] ).DataSet.Name <> 'sqlSearchMaster' ) and
             ( TDataSource( Self.Components[I] ).DataSet.IsLinkedTo( TDataSource( Self.Components[I] ) ) ) then
          begin
             TDataSource( Self.Components[I] ).DataSet.Cancel;
          end;
       end;

     end;
     except on e:exception do
            begin
               dm_rc.rc_ShowError( mm.MSG_BUGERROR_CLOSE_QUERY );
            end;
  end;

  pgBaseCadControl.ActivePage := tabSearchDetail;
end;

procedure TfrmBaseCRUDDetail.btnDeleteRegClick(Sender: TObject);
begin

  if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;

  // verifica restricao do usuário - EXCLUSAO
  If not dm_rc.rc_PermissionVerify( ed_FormOrigin_Tab.Text ,
                                    Trim( ed_Table_ItemSel.Text ) ,
                                    PT_DELETE ) then
  begin
     Abort;
  end;

  // cancela a alteracao pra poder EXCLUIR
  // ( aproveitar informacoes q estao na tela pra fazer alguma critica )
  sqlMaster.Cancel;

  ed_Table_Status.Text := '';


  ed_Table_Status_OLD.Text := '';
  ed_OldPKValue.Text := dsSearchMaster.DataSet.FieldByName( Self.ed_PK.Text ).AsString;

  mm.varB_OperationProcessed := False;
  // v. 3.2.0.5
  if not dsSearchMaster.DataSet.IsEmpty then
  begin
     mm.varB_OperationProcessed := True;

     sqlMaster.close;

     // ajuste para confirmação via SWEETALERT
     mm.varB_Yes := False;                                                                                       // +--> 1 indica TEM registro
                                                                                                                 // |
     mm.varB_OperationProcessed := dm_rc.rc_DeleteActiveRecord( ed_Table_ItemSel.Text, sqlMaster, sqlSearchMaster , 1 );

     if mm.varB_OperationProcessed then
        pgBaseCadControl.ActivePage := tabSearchDetail;
  end;
end;

procedure TfrmBaseCRUDDetail.btnCloseFormClick(Sender: TObject);
begin
  if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;

  if pgBaseCadControl.ActivePage = tabRegisterDetail then
  begin
     pgBaseCadControl.ActivePage := tabSearchDetail;
  end
  else
  begin
     ed_Table_Status.Text := '';

     ed_Table_Status_OLD.Text := '';

     timerClose.Enabled := true;
     rc_MoveAnimationForm( self,
                           self.left,
                           self.left,
                           self.top,
                           -self.Height,
                           400,
                           0 ) ;
  end;
end;

procedure TfrmBaseCRUDDetail.btnSaveRegClick(Sender: TObject);
var
   i : integer;
begin
  if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;

  if not rc_FormValidate( Self ) then
     Abort;

  // verifica licenca de uso
  if mm.varC_Locked = 'S' then
  begin
       dm_rc.rc_ShowSweetAlert( mm.MSG_INFO, mm.MSG_APP_LOCKED, 'warning' ); // v. 3.3.1.0
       Abort;
  end;
  // v. 3.3.0.3
  // se sua PK é INTEGER , STRING ou DATE e/ou AUTOINC ou a PK não deve ser sequencializada
  // if your PK is INTEGER , STRING or DATE and/or AUTOINC or the PK must not be sequential
  if ( sqlMaster.FieldByName( Self.ed_PK.Text ).DataType <> ftAutoInc ) and
     ( not AnsiMatchStr( lowercase( ed_Table_ItemSel.Text ) , ARRAY_PK_NO_INC ) ) then
  begin
     if sqlMaster.FieldByName( Self.ed_PK.Text ).AsString = '-1' then
     begin
          i := dm_rc.rc_GetNextID( mm.varB_Use_FireDac , ed_Table_ItemSel.Text , Self.ed_PK.Text , '' );

          if i = 0 then
          begin
               dm_rc.rc_ShowMessage( mm.MSG_BUGERROR_PK_SEQUENCE );
               Abort;
          end;

          if DataTypeIsNumber( sqlMaster.FieldByName( Self.ed_PK.Text ).DataType ) then
             sqlMaster.FieldByName( Self.ed_PK.Text ).AsInteger := i
          else
             // Aqui vc pode adicionar ZEROS a esquerda...Config. em uConst  mas fora de ARRAY_PK_NO_ZERO( tab. q nao terao ZEROS )
             if not AnsiMatchStr( ed_Table_ItemSel.Text , ARRAY_PK_NO_ZERO ) then
                sqlMaster.FieldByName( Self.ed_PK.Text ).AsString := varIIF( TABLE_PK_WITH_LEFT_ZEROS = 0, I.ToString, Zeros( I.ToString, sqlMaster.FieldByName( Self.ed_PK.Text ).Size ) )
             else
                sqlMaster.FieldByName( Self.ed_PK.Text ).AsString := I.ToString;
     end;
  end
  else
  begin
        if not AnsiMatchStr( lowercase( ed_Table_ItemSel.Text ) , ARRAY_PK_NO_INC ) then
        begin
           if ( sqlMaster.FieldByName( Self.ed_PK.Text ).AsString = '-1' ) or
              ( Trim( sqlMaster.FieldByName( Self.ed_PK.Text ).AsString ) = '' ) then
              begin

                   dm_rc.rc_ShowMessage( mm.MSG_BUGERROR_INVALID_CONTENT );
                   Abort;

              end;

             if DataTypeIsNumber( sqlMaster.FieldByName( Self.ed_PK.Text ).DataType ) then
                sqlMaster.FieldByName( Self.ed_PK.Text ).AsInteger := StrToIntDef( Self.ed_CodMaster.Text , 0 )
             else
                // Aqui vc pode adicionar ZEROS a esquerda...Config. em uConst
                sqlMaster.FieldByName( Self.ed_PK.Text ).AsString := varIIF( TABLE_PK_WITH_LEFT_ZEROS = 0, Self.ed_CodMaster.Text, Zeros( mm.varC_Code_ID, TABLE_PK_WITH_LEFT_ZEROS ) ) ;
        end;
  end;

  if ( dsMaster.State in [ dsEdit ] ) then
  begin
       if sqlMaster.FieldList.IndexOf ( 'date_update' ) >= 0 then
          sqlMaster.FieldByName('date_update').AsDateTime := now;

       ed_Table_Status_OLD.Text := 'E';
  end
  else
  if ( dsMaster.State in [ dsInsert ] ) then
  begin
       ed_Table_Status_OLD.Text := 'I';

       // as TABELAS do RADCORE podem ser MULTIEMPRESAS, nesse caso,
       // por padrão utilizo o CAMPO: CODIEMP em todas que precisam
       //
       // se a tabela tem CODIEMP, vincula...
       //
       // O Campo DATE_CHANGE vai servir pra uma possível SINCRONIZAÇAO DE DADOS COM MOBILE...
       // Já os campos DATE_ACCESS e HOUR_ACCESS para controle de LOG de usuario por exemplo...
       //
       //se a tabela tem CODIEMP, DATE_CHANGE.etc.. vincula...
       if sqlMaster.FieldList.IndexOf ( 'codiemp' ) >= 0 then
          sqlMaster.FieldByName('codiemp').AsInteger := mm.varI_Code_Company;   // codicompany

       if sqlMaster.FieldList.IndexOf ( 'date_update' ) >= 0 then               // date_change
          sqlMaster.FieldByName('date_update').AsDateTime := now;

       if sqlMaster.FieldList.IndexOf ( 'date_access' ) >= 0 then               // date_access
          sqlMaster.FieldByName('date_access').AsDateTime := date;

       if sqlMaster.FieldList.IndexOf ( 'hour_access' ) >= 0 then               // hour_access
          sqlMaster.FieldByName('hour_access').AsDateTime := time;
  end;

  //REMOVER AS MÁSCARAS APENAS de campos que TEM MÁSCARA DEFINIDA...
  for I := 0 to Self.ComponentCount - 1 do
  begin
    if Self.Components[I] is TUniDBEdit then
    begin
         // v. 3.1.0.61
         if TUniDBEdit( Self.Components[I] ).DataSource <> nil then
            if ( TUniDBEdit( Self.Components[I] ).tag = 9999 ) and
               ( TUniDBEdit( Self.Components[I] ).DataSource.State in [ dsEdit, dsInsert ] ) then
               TFDQuery( TUniDBEdit( Self.Components[I] ).DataSource.DataSet ).FieldByName( TUniDBEdit( Self.Components[I] ).DataField ).AsString := StrTokenClear( TUniDBEdit( Self.Components[I] ).Text );
    end;
  end;

  rc_UpdateDBComboBox( self, false );

  sqlMaster.Post;

  mm.SQLConn.StartTransaction;
  mm.varI_ApplyUpdateErrors := sqlMaster.ApplyUpdates(-1);
  if mm.varI_ApplyUpdateErrors > 0 then
  begin
     dm_rc.rc_ApplyUpdatesError( sqlMaster, mm.varI_ApplyUpdateErrors, mm.MSG_BUGERROR_POST );
     mm.SQLConn.Rollback;
  end
  else
  begin
     mm.SQLConn.Commit;
  end;
  //mm.varI_ApplyUpdateErrors := sqlMaster.ApplyUpdates(-1);
  //if mm.varI_ApplyUpdateErrors > 0 then
  //begin
  //   dm_rc.rc_ApplyUpdatesError( sqlMaster, mm.varI_ApplyUpdateErrors, mm.MSG_BUGERROR_POST );
  //end;

  dm_rc.rc_ShowToaster( 'success' , mm.MSG_SUCCESS_POST ,false , 'slideLeftRightFade' );

  dm_rc.rc_OpenQuery( sqlSearchMaster );

  // para manter em cadastro
  pgBaseCadControl.ActivePage := tabSearchDetail;
end;

procedure TfrmBaseCRUDDetail.btnNewRegClick(Sender: TObject);
var
   i : integer;
begin
  if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;

  // verifica licenca de uso
  if mm.varC_Locked = 'S' then
  begin
     dm_rc.rc_ShowSweetAlert( mm.MSG_INFO, mm.MSG_APP_LOCKED, 'warning' ); // v. 3.3.1.0
     Abort;
  end;

  // verifica restricao do usuário - CADASTRO
  If not dm_rc.rc_PermissionVerify( ed_FormOrigin_Tab.Text ,
                                    Trim( ed_Table_ItemSel.Text ) ,
                                    PT_INSERT ) then
  begin
     Abort;
  end;

  ed_Table_Status.Text := '';
  ed_Table_Status_OLD.Text := '';

  pgBaseCadControl.ActivePage := tabRegisterDetail;

  if Self.FindComponent('pgComplementData' ) <> nil then
     if TUniPageControl( Self.FindComponent('pgComplementData' ) ).Pages[0].TabVisible then
        TUniPageControl( Self.FindComponent('pgComplementData' ) ).ActivePageIndex := 0;

  sqlMaster.Cancel;
  sqlMaster.Close;

  // apenas pra dar o select dos campos
  //
  // se sua PK é 'INTEGER' ou STRING
  //
  // percorrer todos os parametros da query
  for i := 0 to sqlMaster.ParamCount - 1 do
  begin
       if DataTypeIsNumber( dsSearchMaster.DataSet.FieldByName( sqlMaster.Params[ i ].Name ).DataType ) then
          sqlMaster.ParamByName( sqlMaster.Params[ i ].Name ).AsInteger  := -123456789
       else
       if DataTypeIsString( dsSearchMaster.DataSet.FieldByName( sqlMaster.Params[ i ].Name ).DataType ) then
          sqlMaster.ParamByName( sqlMaster.Params[ i ].Name ).AsString   := '-9'
       else
       if DataTypeIsDateTime( dsSearchMaster.DataSet.FieldByName( sqlMaster.Params[ i ].Name ).DataType ) then
          sqlMaster.ParamByName( sqlMaster.Params[ i ].Name ).AsDateTime := 1;
  end;

  dm_rc.rc_OpenQuery( sqlMaster );

  // inicializar possíveis "bsRgp"
  dm_rc.rc_RgpInitialize( self );

  sqlMaster.Insert;

  // atualizar todos os LOOKUPs dinamicamente
  dm_rc.rc_LookUpUpdateData(  self  );

  // se sua PK é 'INTEGER' ou STRING
  if not AnsiMatchStr( lowercase( ed_Table_ItemSel.Text ) , ARRAY_PK_NO_INC ) then
     if DataTypeIsNumber( sqlMaster.FieldByName( Self.ed_PK.Text ).DataType ) then
        sqlMaster.FieldByName( Self.ed_PK.Text ).AsInteger := -1
     else
     if DataTypeIsDateTime( sqlMaster.FieldByName( Self.ed_PK.Text ).DataType ) then
        sqlMaster.FieldByName( Self.ed_PK.Text ).AsDateTime := now
     else
        sqlMaster.FieldByName( Self.ed_PK.Text ).AsString := '-1';

  //codigo do FORM MESTRE ( ed_CodMaster )
  if Self.ed_CodMaster.Hint <> '' then
     sqlMaster.FieldByName( Self.ed_CodMaster.Hint ).AsInteger := StrToIntDef( mm.varC_Code_ID , 0 );

  // colocar no evento btnNewReg do FORM DESTINO, o vinculo ao CODIMESTRE caso a PK seja diferente da FK, ou seja,
  // se a PK em sua tabela for diferente do campo que vincula a tabela MESTRE, caso a PK seja exatamente o campo
  // de vinculo, esta informação é adicionada dinamicamente
  // ( Veja as tabelas de relacionamento: VEICULOS e CLIENTES_REVISOES )
  //
  // EXEMPLO para contas a pagar:
  //
  // codigo do FORM MESTRE
  //
  // sqlMaster.FieldByName( 'codipagar' ).AsInteger := StrToIntDef( mm.varC_Code_ID , 0 );
end;

procedure TfrmBaseCRUDDetail.btnOptionsClick(Sender: TObject);
begin
     if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;

     popMenuOptions.PopupBy( TUniButton( sender ) );
end;

procedure TfrmBaseCRUDDetail.dbgSearchCRUDColumnSort(Column: TUniDBGridColumn;
  Direction: Boolean);
begin
     dm_rc.rc_GridSortColumn( TUniDBGrid( Column.Grid ), Column.FieldName, Direction );
end;

procedure TfrmBaseCRUDDetail.dbgSearchCRUDDblClick(Sender: TObject);
var
   i : integer;
begin
  ed_Table_Status.Text := '';
  ed_Table_Status_OLD.Text := '';
  // v. 3.2.0.5
  if not dsSearchMaster.DataSet.IsEmpty then
  begin
     pgBaseCadControl.ActivePage := tabRegisterDetail;

     if Self.FindComponent('pgComplementData' ) <> nil then
        if TUniPageControl( Self.FindComponent('pgComplementData' ) ).Pages[0].TabVisible then
           TUniPageControl( Self.FindComponent('pgComplementData' ) ).ActivePageIndex := 0;

     sqlMaster.Cancel;
     sqlMaster.close;

     // percorrer todos os parametros da query
     // o mesmo numero de parametros é o de PK´s
     dm_rc.memPK.Filtered := false;
     dm_rc.memPK.Filter := 'table=' + quotedStr(lowercase(Self.ed_Table_ItemSel.Text ));
     dm_rc.memPK.Filtered := true;
     dm_rc.memPK.First;

     for i := 0 to sqlMaster.ParamCount - 1 do
     begin
          if DataTypeStrIsNumber( dm_rc.memPK.FieldByName( 'type' ).AsString ) then
             sqlMaster.ParamByName( sqlMaster.Params[ i ].Name ).AsInteger  := dsSearchMaster.DataSet.FieldByName( sqlMaster.Params[ i ].Name ).AsInteger
          else
          if DataTypeStrIsString( dm_rc.memPK.FieldByName( 'type' ).AsString ) then
             sqlMaster.ParamByName( sqlMaster.Params[ i ].Name ).AsString   := dsSearchMaster.DataSet.FieldByName( sqlMaster.Params[ i ].Name ).AsString
          else
          if DataTypeStrIsDateTime( dm_rc.memPK.FieldByName( 'type' ).AsString ) then
             sqlMaster.ParamByName( sqlMaster.Params[ i ].Name ).AsDateTime := dsSearchMaster.DataSet.FieldByName( sqlMaster.Params[ i ].Name ).AsDateTime;

          dm_rc.memPK.next;

     end;

     dm_rc.memPK.Filtered := false;

     dm_rc.rc_OpenQuery( sqlMaster );

     // atualizar todos os LOOKUPs dinamicamente
     dm_rc.rc_LookUpUpdateData(  self  );
  end;
end;

procedure TfrmBaseCRUDDetail.dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
     dm_rc.rc_GridDrawCell( dbgSearchCRUD , ACol, ARow, Column, Attribs ) ;
end;

procedure TfrmBaseCRUDDetail.dsMasterDataChange(Sender: TObject; Field: TField);
begin
  rc_UpdateDBComboBox( self, true );
end;

procedure TfrmBaseCRUDDetail.dsMasterStateChange(Sender: TObject);
begin
  if TDataSource( sender ).State in [ dsInsert, dsEdit, dsBrowse ] then
     rc_DSReactiveCheck( self , TDataSource( sender ) ); // v. 3.3.0.0
  // caso utilize algum 'componente BS_COMPONENTS' utilize as instruções abaixo
  // para renderização correta de CRUDS
  if dsMaster.State <> dsInactive then
     dm_rc.rc_BootStrapRender( self, True );

  // a IDEIA é manter varA_Tabela_Situacao com o ULTIMO ESTADO operacional
  // pra poder CRITICAR alguma operacao PÓS GRAVAÇÃO no FORM( FRAME ) herdado
  // como por exemplo, a geracao do plano de contas apos cadastrar uma EMPRESA
  if dsMaster.State in [ dsEdit ] then
  begin
     labState.Caption      := mm.LAB_STATE_E;
     ed_Table_Status.Text := 'E';
  end
  else
  if dsMaster.State in [ dsInsert ] then
  begin
     labState.Caption      := mm.LAB_STATE_I;
     ed_Table_Status.Text := 'I';
  end
  else
  begin
     // v. 3.2.0.5
     if sqlSearchMaster.Active then
        labState.Caption      := mm.LAB_STATE_B;

     ed_Table_Status.Text := 'P';
  end;

  if dsMaster.State in [ dsInsert, dsEdit ] then
  begin
     ed_OldPKValue.Text := '';
     ed_Table_Status_OLD.Text := '';
  end;

  // isso é feito para q os panels q contem os botoes nao troquem de ordem
  // ao ficarem visiveis
  //
//  labTitleFrm.Visible := False;
  // v. 3.5.0.0
  //dm_rc.rc_ObjectEnabled( Self, btnSearch   , not ( dsMaster.State in [ dsEdit, dsInsert ] ) );
  dm_rc.rc_ObjectEnabled( Self, btnNewReg   , not ( dsMaster.State in [ dsEdit, dsInsert ] ) );
  dm_rc.rc_ObjectEnabled( Self, btnEditReg  , btnNewReg.Enabled );
  dm_rc.rc_ObjectEnabled( Self, btnDeleteReg, btnNewReg.Enabled );
  dm_rc.rc_ObjectEnabled( Self, btnSaveReg  , not btnNewReg.Enabled );
  dm_rc.rc_ObjectEnabled( Self, btnCancelReg, not btnNewReg.Enabled );
  dm_rc.rc_ObjectEnabled( Self, btnOptions  , ( btnNewReg.Enabled ) and ( popMenuOptions.Items.Count > 0 ) );
  // v. 3.5.0.0
  if bModelCrud3 then
  begin
     //btnSearch.Visible    := btnNewReg.Enabled;
     btnNewReg.Visible    := btnNewReg.Enabled ;
     paNAE.Visible        := false;
     paGC.Visible         := false;
     paNAE.Visible        := btnNewReg.Enabled ;
     paGC.Visible         := not btnNewReg.Enabled ;
     btnEditReg.Width     := 0;
     btnDeleteReg.width   := 0;
     btnSaveReg.Visible   := not btnNewReg.Enabled ;
     btnCancelReg.Visible := not btnNewReg.Enabled ;
     btnOptions.Visible   := false ;
  end;
//  paOF.Visible      := false;
//  paGC.Visible      := false;
//  paNAE.Visible     := false;
//  paP.Visible       := false;
//  paP.Visible       := not ( dsMaster.State in [ dsEdit, dsInsert ] );
//  paNAE.Visible     := paP.Visible;
//  paGC.Visible      := not paP.Visible;
//  btnOptions.Visible := ( popMenuOptions.Items.Count > 0 );
//  paOF.Visible      := paP.Visible;
  // v. 3.5.0.0
  labNew.Visible     := ( btnNewReg.Enabled ) and ( bModelCrud1 );//and ( bActions or bModelCrud1 );
  labEdit.Visible    := ( labNew.Visible ) and ( bModelCrud1 );
  labDelete.Visible  := ( labNew.Visible ) and ( bModelCrud1 );
  labOptions.Visible := ( labNew.Visible ) and ( bModelCrud1 );
  labCancel.Visible  := ( not bActions ) and ( not labNew.Visible );
  labSave.Visible    := ( not bActions ) and ( not labNew.Visible );
  edQuickSearch.Enabled := btnNewReg.Enabled;
  dm_rc.rc_ObjectEnabled( Self, btnQuickSearch, edQuickSearch.Enabled );//labNew.Visible );

  labExit.Enabled   := not ( dsMaster.State in [ dsEdit, dsInsert ] );//( paOF.Visible ) or ( bModelCrud3 ); // v. 3.5.0.0
  labExit.font.Color := varIIF( labExit.Enabled, clBlack, clSilver );
  labState.Visible   := not mm.varB_Mobile_Screen_Portrait ;
//  paOF.Visible      := false;
//  paGC.Visible      := false;
//  paNAE.Visible     := false;
//  paNAE.Visible     := not ( dsMaster.State in [ dsEdit, dsInsert ] );
//  paGC.Visible      := not paNAE.Visible;
//  btnOptions.Visible := ( popMenuOptions.Items.Count > 0 );
//  paOF.Visible      := paNAE.Visible;

  //ajustar mascaras de data
  dm_rc.rc_ApplyEditMasks( Self );
end;

procedure TfrmBaseCRUDDetail.dsSearchMasterStateChange(Sender: TObject);
begin
  if TDataSource( sender ).State in [ dsInsert, dsEdit, dsBrowse ] then
     rc_DSReactiveCheck( self , TDataSource( sender ) ); // v. 3.3.0.0
end;

procedure TfrmBaseCRUDDetail.Excel1Click(Sender: TObject);
begin
     dm_rc.rc_DBGridExport( dbgExport, etExcel );
end;

procedure TfrmBaseCRUDDetail.Html1Click(Sender: TObject);
begin
     dm_rc.rc_DBGridExport( dbgExport, etHTML );
end;

procedure TfrmBaseCRUDDetail.pgBaseCadControlChangeValue(Sender: TObject);
begin
     if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;
end;

procedure TfrmBaseCRUDDetail.rc_CloseQuerys;
var
   I : integer;
begin
     for I := 0 to Self.ComponentCount - 1 do
     begin
       if Self.Components[I] is TFDQuery then
       begin
          if TFDQuery( Self.Components[I] ).Name <> 'sqlSearchMaster' then
          begin
             TFDQuery(Self.Components[I]).Cancel;
             TFDQuery(Self.Components[I]).Close;
          end;
       end
       else
       if Self.Components[I] is TFDMemTable then
       begin
          TFDMemTable(Self.Components[I]).Close;
       end
       else
       if Self.Components[I] is TDataSource then
       begin
          if TDataSource( Self.Components[I] ).DataSet <> nil then
             if TDataSource( Self.Components[I] ).DataSet.Name <> 'sqlSearchMaster' then
             begin
                TDataSource(Self.Components[I]).DataSet.Cancel;
                TDataSource(Self.Components[I]).DataSet.Close;
             end;
       end;
     end;
end;
// v. 3.3.3.2
procedure TfrmBaseCRUDDetail.sqlMasterError(ASender, AInitiator: TObject; var AException: Exception);
begin
     dm_rc.rc_ShowError( AException.Message );
end;
// v. 3.3.3.2
procedure TfrmBaseCRUDDetail.sqlSearchMasterError(ASender, AInitiator: TObject; var AException: Exception);
begin
     dm_rc.rc_ShowError( AException.Message );
end;

procedure TfrmBaseCRUDDetail.timerCloseTimer(Sender: TObject);
begin
     timerClose.Enabled := false;
     close;
end;
// v. 3.5.0.0
procedure TfrmBaseCRUDDetail.UniFormBeforeShow(Sender: TObject);
begin
   labState.Left      := labState.Parent.Left + labState.Parent.Width - labState.Width - 10; // v. 3.5.0.0
   rc_RenderLayout( Self, true, true, true );
end;
 // v. 3.5.0.0
procedure TfrmBaseCRUDDetail.UniFormCreate(Sender: TObject);
var
   iPos, iPos2, iWidth, iHeight,
   I, F : integer;

   cActions, cCaption,
   cTemp, cTemp3,
   cCls, cIco, cBtn,cBtnCls, // v. 3.5.0.0
   WhereAnd, sql: string;

   AllPKs, cSql,
   cPk,
   cAllParams: string;
begin
  inherited;
    case mm.varLT_Lang of

         ltpt_BR : begin
                     labNotFound_dbgSearchCRUD.Caption               := 'Pesquisa Não Encontrada';
                   end;
         lten_US, lten_GB   : begin
                     labNotFound_dbgSearchCRUD.Caption               := 'No records found';
                   end;
         ltes_ES   : begin
                     labNotFound_dbgSearchCRUD.Caption               := 'No records found';
                   end;
         ltfr_FR   : begin
                      labNotFound_dbgSearchCRUD.Caption               := 'No records found';
                   end;
         ltde_DE   : begin
                     labNotFound_dbgSearchCRUD.Caption               := 'No records found';
                   end;
         ltit_IT   : begin
                     labNotFound_dbgSearchCRUD.Caption               := 'No records found';
                   end;
         lttr_TR    : begin
                     labNotFound_dbgSearchCRUD.Caption               := 'No records found';
                   end;
         ltru_RU    : begin
                      labNotFound_dbgSearchCRUD.Caption               := 'No records found';
                   end;
         ltzn_CH : begin
                      labNotFound_dbgSearchCRUD.Caption               := 'No records found';
                   end;
         ltin_ID : begin
                      labNotFound_dbgSearchCRUD.Caption               := 'No records found';
                   end;
         ltth_TH : begin
                      labNotFound_dbgSearchCRUD.Caption               := 'No records found';
                   end;
         lthi_IN : begin
                      labNotFound_dbgSearchCRUD.Caption               := 'No records found';
                   end;
         ltar_SA : begin // v. 3.3.0.0
                      labNotFound_dbgSearchCRUD.Caption               := 'لا توجد سجلات';
                   end;
    end;

    dbgExport.Top := -50;

    // v. 3.5.0.0
    //Self.Color             := StringToColor( mm.CONFIG_LAYOUT_BG_COLOR );
    //paBaseTop.Color        := clWhite;
    //paBaseButtons.Color    := clWhite;
    //paBaseBackGround.Color := clWhite;

    if mm.CONFIG_LAYOUT_ROUND_FORM = 'ON' then
       rc_AddCssClass( Self, 'form-rounded' );

    mm.varC_Form_Detail := Self;

    dm_rc.rc_DBGridHidePaginationBar( dbgSearchCRUD );

    // sort
    dbgSearchCRUD.ClientEvents.UniEvents.Add(
         'store.afterCreate=function store.afterCreate(sender)' +
         '{ sender.setRemoteSort(false);﻿ }'
    );

    // from uniGUI forum: http://forums.unigui.com/index.php?/topic/9634-autofill-how-to-turn-off/
    UniSession.AddJS('$("input").attr("autocomplete", "off");');
    // v. 3.5.0.0
    // isso é feito para q os panels q contem os botoes nao troquem de ordem
    // ao ficarem visiveis
//    paOF.Visible       := false;
//    paGC.Visible       := false;
//    paNAE.Visible      := false;
//    paNAE.Visible      := not ( dsMaster.State in [ dsEdit, dsInsert ] );
//    paGC.Visible       := not paNAE.Visible;
//    btnOptions.Visible := ( popMenuOptions.Items.Count > 0 );
//    paOF.Visible       := paNAE.Visible;

    rc_AddCssClass( labTitleFrm, 'rc-font-light' );

    labTitleFrm.Font.Name  := mm.CONFIG_LAYOUT_APP_FONT;
    labTitleFrm.Font.Color := $002a2a2a ;//clBlack;
    labTitleFrm.Font.Size  := 16;
    labTitleFrm.Font.Style := [];

    //rtl // v. 3.5.0.0
    labState.Alignment  := varIIF( ( mm.RTL ) and ( labState.Visible ), taLeftJustify, taRightJustify );

    if ( mm.varB_Mobile_Screen ) and ( mm.varB_Screen_LandScape ) then
    begin
         TUniFORM( mm.varC_Form_Detail ).Align := alNone;
         TUniFORM( mm.varC_Form_Detail ).Height := 740;
    end;

    Self.Left := ( UniSession.UniApplication.ScreenWidth div 2 ) - (  Self.Width div 2 );
    Self.Top  := 0;

    rc_MoveAnimationForm( self,
                          self.left,
                          self.left,
                          self.top,
                          ( UniSession.UniApplication.ScreenHeight  div 2 ) - ( self.Height div 2  ),
                          400,
                          1 ) ;

    // para criticar cada coluna no ondrawcell
    mm.varC_GridColName           := '';

    pgBaseCadControl.ActivePage   := tabSearchDetail;

    Self.ed_Table_ItemSel.Text    := Trim( mm.varC_Table_Detail ) ;
    Self.ed_FormOrigin.Text       := Self.Name;
    Self.ed_CodMaster.Text        := mm.varC_Code_ID;
    Self.ed_CodMaster.Hint        := Trim( lowercase( mm.varC_Code_ID_Field ) );

    Self.ed_FormOrigin_Tab.Text   := mm.varC_Selected_FormFrame_Detail ;
    Self.ed_Table_Status.Text     := mm.varC_StatusSearch_Detail ;
    Self.ed_Table_Status_OLD.Text := '';
    // v. 3.5.0.0
    if ( Pos( 'fieldmasks:' , dbgSearchCRUD.Hint ) = 0 ) then
        dbgSearchCRUD.Hint := '[[' +
                              'fieldmasks:' +
                              'grid-resize|' +
                              varIIF( ( mm.CONFIG_LAYOUT_GRID_RC_PAGINATOR = 'ON' ) and
                                      ( ( pos( 'nopaged|', dbgSearchCRUD.Hint ) = 0 ) and ( dbgSearchCRUD.WebOptions.Paged ) ) and
                                      ( pos( 'grid-paginator', dbgSearchCRUD.Hint ) = 0 ), 'grid-paginator|', '' ) +
                              ']]';
    dbgSearchCRUD.Hint   := rc_AddHintProperty( '|state-visible:empty-false ds:dsSearchMaster', dbgSearchCRUD.Hint, false ); // v. 3.3.3.0
    // v. 3.3.2.0
    if Pos( '[[pk-show]]' , sqlMaster.Sql.Text ) > 0 then
    begin
       sqlMaster.Sql.Text := StringReplace( sqlMaster.Sql.Text, '[[pk-show]]', '[[pk]]', [rfReplaceAll] );
       dbgSearchCRUD.Hint := rc_AddHintProperty( '|showpk', dbgSearchCRUD.Hint, false ); // v. 3.3.3.0
    end;

    if ( Pos( 'fieldmasks:' , dbgSearchCRUD.Hint ) > 0 ) and ( Pos( 'fieldmasks:table-' , dbgSearchCRUD.Hint ) = 0 ) then
    begin
         iPos := Pos( 'fieldmasks:' , dbgSearchCRUD.Hint ) + 11;
         cTemp := dbgSearchCRUD.Hint;
         Insert( 'table-' + lowercase( ed_Table_ItemSel.Text ) + ';', cTemp , iPos );
         dbgSearchCRUD.Hint := cTemp;
    end;

    mm.varC_FieldMasks := '';

    // Senão tiver sido definido a query no ON CREATE da nova tela herdada...
    if ( trim(sqlMaster.Sql.Text) = EmptyStr ) or ( Pos ( '[grid]' , trim(sqlMaster.Sql.Text) ) = 0  ) then
    begin
        sqlMaster.close;

        sqlMaster.SQL.Text := ' SELECT [[fields]]  ' +
                              '   FROM [[table]] tab ';
    end;
    if Pos ( '[grid]' , trim(sqlMaster.Sql.Text) ) = 0 then
    begin
        sqlMaster.SQL.Text := sqlMaster.SQL.Text +
                              '[grid]' +

                              ' SELECT [[fields]] ' +

                              ' FROM [[table]] tab ';
    end;

    // novo controle captura chave dinamica
    mm.varC_PK_DetailTable     := dm_rc.rc_GetPrimaryKey( lowercase(Self.ed_Table_ItemSel.Text ) );

    Self.ed_PK.Text              := mm.varC_PK_DetailTable;
    Self.tag                     := StrToIntDef( mm.varC_Code_ID, 0 );

    Self.labTitleFrm.Caption     := Self.ed_FormOrigin_Tab.Text;
    Self.Caption                 := Self.ed_FormOrigin_Tab.Text;
    // v. 3.5.0.0
    // configurar lookups...mascaras...etc.. preparar query [[fields]]...
    // adjust the lookup tables according to the query name
    //dm_rc.rc_RenderLookUpControls( Self );

    // adionar filtro do frmBaseCRUDDetail ao frmBaseCRUD que o chamou
    if Self.ed_CodMaster.Hint <> '' then
    begin
       if ( Self.ed_Where_Search.Text <> '' ) and ( lowercase( Copy( Self.ed_Where_Search.Text , 1, 6 ) ) <> ' WHERE ' ) then
          Self.ed_Where_Search.Text := ' WHERE ' + Self.ed_Where_Search.Text;


          Self.ed_Where_Search.Text := Self.ed_Where_Search.Text +
                                       varIIF( Self.ed_Where_Search.Text = '', ' WHERE ', ' AND ' ) +  'tab.' + Self.ed_CodMaster.Hint + ' = ' + Self.ed_CodMaster.Text ;
    end;

    // associar a TABELA ATUAL ao SCRIPT do FORM/FRAME atual
    if Pos( '[[table]]' , sqlMaster.Sql.Text ) > 0 then
       sqlMaster.Sql.Text := StringReplace( sqlMaster.Sql.Text , '[[table]]' , Self.ed_Table_ItemSel.Text, [rfReplaceAll] );
    // v. 3.3.1.0
    // tab.codigo por tab.[[pk]]
    // associar a PK ATUAL ao SCRIPT do FORM/FRAME atual
    if Pos( '[[pk]]' , sqlMaster.Sql.Text ) > 0 then
    begin
       if ( pos( 'tab.[[pk]] as ', sqlMaster.Sql.Text ) > 0 ) and ( pos( '[[allpks]]', sqlMaster.Sql.Text ) = 0 ) then
          dm_rc.rc_ShowError( 'Your SQL sentence do not have [[allpks]] statement.<br>When [[pk]] has an ALIAS it must have [[allpks]].' );
       sqlMaster.Sql.Text := StringReplace( sqlMaster.Sql.Text , '[[pk]]' , Self.ed_PK.Text, [rfReplaceAll] );
    end;

    // pega o SQL de pesquisa( GRID )
    sqlSearchMaster.close;
    sqlSearchMaster.sql.Text := RemoveLineBreaks( Copy( sqlMaster.Sql.Text, Pos( '[grid]' , sqlMaster.Sql.Text ) + 6, 5000 ) );

    // paged...firstshow...[[firstshow:20 no-paged]]
    iFirstShow := 0 ;
    bPaged     := true;
    // v. 3.3.0.0
//    if ( Pos( '[[firstshow:', sqlSearchMaster.sql.Text ) > 0 ) or
//       ( Pos( 'no-paged]]', sqlSearchMaster.sql.Text ) > 0 ) then
//    begin
//       cTemp := Copy( sqlSearchMaster.sql.Text, Pos( '[[firstshow:', sqlSearchMaster.sql.Text ) , 100 );
//       cTemp := Copy( cTemp, 1, Pos( ']]', cTemp ) + 2 );
//
//       if cTemp <> '' then
//          sqlSearchMaster.sql.Text := StringReplace( sqlSearchMaster.sql.Text, cTemp, '', [rfReplaceAll] );
//
//       iFirstShow := StrToIntDef( ReturnNumbers( cTemp ), 0 ); // 20
//       bPaged     := ( Pos( 'no-paged', cTemp ) = 0 );
//    end;

    // pega o SQL de cadastro( antes de GRID )
    sqlMaster.Close;
    sqlMaster.SQL.Text := Copy( sqlMaster.Sql.Text, 1, Pos( '[grid]' , sqlMaster.Sql.Text ) -1 );
    sqlMaster.SQL.Text := RemoveLineBreaks( sqlMaster.SQL.Text );

    //montar query com possiveis chaves compostas
    mm.varC_PK_DetailTable := dm_rc.rc_GetPrimaryKey( lowercase(Self.ed_Table_ItemSel.Text ) );

    dm_rc.memPK.tag := 0;

    sqlMaster.SQL.Text := sqlMaster.SQL.Text + ' WHERE 1 = 1 ';

    AllPKs := '';
    cAllParams := '';

    dm_rc.memPK.Filtered := false;
    dm_rc.memPK.Filter   := 'table=' + quotedStr(lowercase(trim(Self.ed_Table_ItemSel.Text )));
    dm_rc.memPK.Filtered := true;
    dm_rc.memPK.First;

    cSql := lowercase( sqlSearchMaster.sql.Text );
    cSql :=  Copy( cSql, 1, Pos( ' from ' , cSql ) );

    while not dm_rc.memPK.eof do
    begin
         cPk := trim(lowercase( dm_rc.memPK.FieldByName( 'pk' ).AsString ));

         AllPKs     := AllPKs + 'tab.' + cPk ;
         cAllParams := cAllParams + ' and tab.' + cPK + ' = :' + cPk;

         // Append data
         dm_rc.memGridPK.Open;

         if not dm_rc.memGridPK.Locate( 'field' , cPk , [] ) then
            dm_rc.memGridPK.AppendRecord( [ cPk ] );

         dm_rc.memPK.tag := 1;

         dm_rc.memPK.Next;

         if ( not dm_rc.memPK.eof ) and ( AllPKs <> '' ) then
            AllPKs := AllPKs + ', ';
    end;

    dm_rc.memPK.Filtered := false;

    // [[allpks]]
    // inserir no grid todas as PK´s da tabela dinamicamente
    dbgSearchCRUD.Tag := 0; // se nao tem ALLPKS...nao critica a exibicao das colunas
    if Pos( '[[allpks]]' , sqlSearchMaster.Sql.Text ) > 0 then
    begin
       sqlSearchMaster.Sql.Text := StringReplace( sqlSearchMaster.Sql.Text , '[[allpks]]' , AllPKs, [rfReplaceAll] );
       dbgSearchCRUD.Tag := 1;
    end;

    // v. 3.5.0.0
    // grid-btns -> Actions
    if Pos( '[[grid-btn:edo]]' , sqlSearchMaster.Sql.Text ) > 0 then
    begin
       sqlSearchMaster.Sql.Text := StringReplace( sqlSearchMaster.Sql.Text ,
                                                  '[[grid-btn:edo]]' ,
//                                                  '( ''[[grid-btn:(edit)   ]] '' ) as rcAction_Edit, ' +
//                                                  '( ''[[grid-btn:(delete) ]] '' ) as rcAction_Delete, ' +
//                                                  '( ''[[grid-btn:(options) ]] '' ) as rcAction_Options ' ,
                                                  '[[grid-btn:(edit)   ]] ' +
                                                  '[[grid-btn:(delete) ]] ' +
                                                  '[[grid-btn:(options) ]] ' ,
                                                  [rfReplaceAll] );
    end
    else
    begin
       if Pos( '[[grid-btn:edit]]' , sqlSearchMaster.Sql.Text ) > 0 then
       begin
//          sqlSearchMaster.Sql.Text := StringReplace( sqlSearchMaster.Sql.Text ,
//                                                     '[[grid-btn:edit]]' ,
//                                                     '( ''[[grid-btn:(edit)]]'' ) as rcAction_Edit '  ,
//                                                     [rfReplaceAll] );
       end;

       if Pos( '[[grid-btn:delete]]' , sqlSearchMaster.Sql.Text ) > 0 then
       begin
//          sqlSearchMaster.Sql.Text := StringReplace( sqlSearchMaster.Sql.Text ,
//                                                     '[[grid-btn:delete]]' ,
//                                                     '( ''[[grid-btn:(delete)]]'' ) as rcAction_Delete '  ,
//                                                     [rfReplaceAll] );
       end;

       if Pos( '[[grid-btn:options]]' , sqlSearchMaster.Sql.Text ) > 0 then
       begin
//          sqlSearchMaster.Sql.Text := StringReplace( sqlSearchMaster.Sql.Text ,
//                                                     '[[grid-btn:options]]' ,
//                                                     '( ''[[grid-btn:(options)]]'' ) as rcAction_Options '  ,
//                                                     [rfReplaceAll] );
       end;
    end;
    // em desenvolvimento  /  in development
    // action buttons
    cTemp := '';
    cActions := '';
    iPos := Pos( '[[grid-btn:' , sqlSearchMaster.Sql.Text );
    iPos2 := iPos;
    i := 0;
    While iPos > 0 do
    begin
       cTemp  := sqlSearchMaster.Sql.Text;
       cTemp  := Copy( cTemp , iPos, 2000 );
       cTemp  := Copy( cTemp , 3, Pos( ']]', cTemp ) - 3 );
       cTemp2 := Copy( cTemp , 10, 2000 );
       cActions := cTemp2;
       iPos2 := Pos( '|', cActions );

       if iPos2 > 0 then
          cCaption := Trim( Copy( cActions, 1, iPos2 - 1 ) )
       else
          cCaption := Trim( cActions );

       cCls := rc_GetHintProperty( 'cls:' , cActions );
       cIco := rc_GetHintProperty( 'ico:' , cActions );

       //event name
       cTemp3 := StringReplace( cCaption, '(', '', [rfReplaceAll] );
       cTemp3 := StringReplace( cTemp3, ')', '', [rfReplaceAll] );

       bActions := False;
       // v. 3.5.0.0
       if ( cCaption = 'new' ) and ( cCls = '' ) then
       begin
            cBtn := btnNewReg.Name; // v. 3.5.0.0
            cCls := 'btn ButtonBlue btn-sm rc-btn-action-padding'; //btn-primary

            if cIco = '' then
               cIco := 'fas-plus';

            cCaption := '';

            bActions := True;
       end;
       // v. 3.5.0.0
       if ( cCaption = 'edit' ) then
       begin
            cBtn := btnEditReg.Name; // v. 3.5.0.0
            cCls := 'btn ButtonGreen btn-sm rc-btn-action-padding'; //btn-success

            if cIco = '' then
               cIco := 'fas-pencil-alt';

            cCaption := '';
            bActions := True;
       end;
       // v. 3.5.0.0
       if( cCaption = 'delete' ) then
       begin
            cBtn := btnDeleteReg.Name; // v. 3.5.0.0
            cCls := 'btn ButtonRed btn-sm rc-btn-action-padding'; //

            if cIco = '' then
               cIco := 'fas-trash-alt';

            cCaption := '';
            bActions := True;
       end;

       if( cCaption = 'options' ) then
       begin
            cBtn := popMenuOptions.Name; // v. 3.5.0.0
            cCls := 'btn ButtonGray btn-sm rc-btn-action-padding'; //

            if cIco = '' then
               cIco := 'fas-bars';

            cCaption := '';
            bActions := True;
       end;

       iWidth  := StrToIntDef( rc_GetHintProperty( 'w:' , cActions ), 22 );
       iHeight := StrToIntDef( rc_GetHintProperty( 'h:' , cActions ), 22 );

       if cIco <> '' then
          cIco := Copy( cIco, 1, Pos( '-', cIco ) - 1 ) + ' fa-' + Copy( cIco, Pos( '-', cIco ) + 1 , 20 );

       // listar 2 colunas
       //
       // rc_action contendo a lista de botoes
       // rc_action_mob contendo um botao só..mas q ao clicar lista os botoes de rc_action
       Inc( i );
       // v. 3.5.0.0
//       if ( mm.varB_Mobile_Screen )  then
//          cTemp2 := '<div>' +
//                    ' <button ' +
//                    '     id="rc-action-' + dbgSearchCRUD.Name + i.ToString + '" type="button" ' +
//                    '     class="' + cCls + ' ' + cIco + '">' + cCaption +
//                    ' </button>' +
//                    '</div>'
//       else
//          cTemp2 := ' <div style="text-align:center; margin: -2px">' +
//                    ' <button ' +
//                    '     id="rc-action-' + dbgSearchCRUD.Name + i.ToString + '" type="button" ' +
//                    '     class="' + cCls + ' ' + cIco + '">' + cCaption +
//                    ' </button>' +
//                    '</div>' ;
       cTemp2 := '   <button onclick="ajaxRequest( MainForm.htmlFrame, ''''_actionCol'''' ,  ' +
                             '[''''btn=' + cBtn + ''''','+
                              '''''form=' + Self.Name + ''''' '+
                              '] );"' +
                 '     id="rc-action-' + dbgSearchCRUD.Name + i.ToString + '" type="button" ' +
                 '     class="' + cCls + ' ' + cIco + '">' + cCaption +
                 '   </button>' ;
       // v. 3.5.0.0
       f := iPos;
       if i = 1 then
          cTemp2 := '( ''<div style="min-width:99px;text-align:right; margin-bottom: 4px;padding-right:8px;"> ' + cTemp2;

       sqlSearchMaster.Sql.Text := StringReplace( sqlSearchMaster.Sql.Text , '[[' + cTemp + ']]' , cTemp2, [rfReplaceAll] );
       iPos := Pos( '[[grid-btn:' , sqlSearchMaster.Sql.Text );
       // v. 3.5.0.0
       if iPos = 0 then
       begin
            sqlSearchMaster.Sql.Text := StringReplace( sqlSearchMaster.Sql.Text , cTemp2, cTemp2 + ' </div>'' ) as rcAction_Actions ', [rfReplaceAll] );
       end;

    end;
    if ( i > 0 ) and ( bActions ) then
       sqlSearchMaster.Sql.Text := StringReplace( sqlSearchMaster.Sql.Text , 'min-width:99px;', 'min-width:' + ( i*33).ToString + 'px;', [rfReplaceAll] );

    // v. 3.5.0.0
    //bModelCrud1 := Pos( 'model-crud:1', dbgSearchCRUD.Hint ) > 0;
    // v. 3.5.0.0
    paBaseTop.Height       := varIIF( bActions or bModelCrud1 or bModelCrud2, 90, 46 );
    paBaseButtons.Width    := varIIF( bActions or bModelCrud1, 0, 37 );
    labState.Width         := varIIF( bActions or bModelCrud1, 120, 164 );
    labNew.Visible         := bModelCrud1; //bActions or bModelCrud1;
    labEdit.Visible        := bModelCrud1;
    labDelete.Visible      := bModelCrud1;
    labOptions.Visible     := bModelCrud1;
    labCancel.Visible      := ( not bActions ) and ( not labNew.Visible ) and ( not bModelCrud2 ) ;
    labSave.Visible        := ( not bActions ) and ( not labNew.Visible ) and ( not bModelCrud2 ) ;
    edQuickSearch.Enabled  := ( bModelCrud1 ) or ( bModelCrud3 ) ;
    edQuickSearch.Visible  := edQuickSearch.Enabled;//( btnNewReg.Enabled );//( not bModelCrud2 ) ;
    btnQuickSearch.Visible := edQuickSearch.Visible ;
    dm_rc.rc_ObjectEnabled( Self, btnQuickSearch, btnQuickSearch.Visible );//labNew.Visible );
    btnCloseForm.Visible   := False;


    // Senão tiver sido definido a query no ON CREATE da nova tela herdada...
    if trim(sqlMaster.Sql.Text) = EmptyStr  then
    begin
        dm_rc.rc_ShowError( Format( mm.MSG_BUGERROR_DEFAULT_SQL_STATMENT, [ 'sqlMaster' ] ) );
        Abort;
    end;

    if trim(sqlSearchMaster.Sql.Text) = EmptyStr  then
    begin
        dm_rc.rc_ShowError( Format( mm.MSG_BUGERROR_DEFAULT_SQL_STATMENT, [ 'sqlSearchMaster' ] ) );
        Abort;
    end;

    sqlMaster.Sql.Text := sqlMaster.Sql.Text + cAllParams;

    Sql := trim ( sqlSearchMaster.Sql.Text );

    // form FILHO diferente do PAI, vem com um WHERE PADRAO, ref. ao vinculo PADRAO com o PAI
    if Pos( 'where ' , lowercasE( trim( ed_Where_Search.Text ) ) ) > 0 then
       WhereAnd := ''
    else
    if ed_Where_Search.Text <> '' then
       WhereAnd := ' AND ';

    sql := RemoveLineBreaks( sql );
    // tem um WHERE no FORM que chamou ?
    if ed_Where_Search.Text <> '' then
       Sql := Sql + WhereAnd + ed_Where_Search.Text ;

    // acionado ao clicar uma opcao no menu princopal
    if ed_Order_Search.Text <> '' then
       Sql := Sql + ' ORDER BY ' + trim( ed_Order_Search.Text )
    else
    begin
       Sql := Sql + ' ORDER BY tab.' + Self.ed_PK.Text + ' ' ;
       Sql := Sql + ' DESC ';
    end;

    Sql := RemoveLineBreaks( Sql );

    sqlSearchMaster.close;
    sqlSearchMaster.Sql.Text := Sql;

    if not dm_rc.rc_OpenQuery( sqlSearchMaster ) then
    begin
       sqlSearchMaster.close;
       Abort;
    end;

    if UniApplication.FindComponent('MainForm' ) <> nil then
    begin
       // para formulários, deve-se efetuar o ResizeBlocks
       //rc_RenderLayout( Self, true, true, true, true ); // v. 3.5.0.0
    end;
    // v. 3.3.0.0
    for f := 0 to ComponentCount - 1 do
    begin
         if Components[f] is TUniDBGrid then
         begin
            TUniDBGrid( Components[f] ).EnableLocking    := ( Pos( 'locked|', TUniDBGrid( Components[f] ).Hint ) > 0 ) ;
            //v. 3.5.0.0
            //bPaged := ( Pos( 'no-paged|', TUniDBGrid( Components[f] ).Hint ) = 0 ) or ( TUniDBGrid( Components[f] ).WebOptions.Paged ) ; // v. 3.3.0.0
            bPaged := ( ( Pos( 'fieldmasks:', TUniDBGrid( Components[f] ).Hint ) > 0 ) and ( Pos( 'no-paged|', TUniDBGrid( Components[f] ).Hint ) = 0 ) )  ; // v. 3.3.0.0
            // v. 3.5.0.0
            if TUniDBGrid( Components[f] ).WebOptions.Paged <> bPaged then
               TUniDBGrid( Components[f] ).WebOptions.Paged := bPaged;

            if ( Pos( 'firstshow:', TUniDBGrid( Components[f] ).Hint ) > 0 ) then
            begin
               cTemp := Copy( TUniDBGrid( Components[f] ).Hint, Pos( 'firstshow:', TUniDBGrid( Components[f] ).Hint ) , 100 );
               cTemp := Copy( cTemp, 1, Pos( '|', cTemp ) - 1 );

               iFirstShow := StrToIntDef( ReturnNumbers( cTemp ), 0 );
            end;
            // v. 3.5.0.0
            if ( Pos( 'fieldmasks:' , TUniDBGrid( Components[f] ).Hint ) = 0 ) then
               TUniDBGrid( Components[f] ).Hint := '[[' +
                                                   'fieldmasks:' +
                                                   'grid-resize|' +
                                                   varIIF( ( mm.CONFIG_LAYOUT_GRID_RC_PAGINATOR = 'ON' ) and
                                                           ( ( pos( 'nopaged|', TUniDBGrid( Components[f] ).Hint ) = 0 ) and ( TUniDBGrid( Components[f] ).WebOptions.Paged ) ) and
                                                           ( pos( 'grid-paginator', TUniDBGrid( Components[f] ).Hint ) = 0 ), 'grid-paginator|', '' ) + // v. 3.5.0.0
                                                   ']]' ;
            //paPagePagBtns.visible := bPaged;
            //paPageBar.visible := bPaged;
         end;
    end;
//    for f := 0 to ComponentCount - 1 do
//    begin
//         if Components[f] is TUniDBGrid then
//         begin
//            TUniDBGrid( Components[f] ).EnableLocking    := ( Pos( 'locked|', TUniDBGrid( Components[f] ).Hint ) > 0 ) ;
//            bPaged := ( Pos( 'no-paged|', TUniDBGrid( Components[f] ).Hint ) = 0 ) or ( TUniDBGrid( Components[f] ).WebOptions.Paged ) ; // v. 3.3.0.0
//            TUniDBGrid( Components[f] ).WebOptions.Paged := bPaged;
//
//            if ( Pos( 'fieldmasks:' , TUniDBGrid( Components[f] ).Hint ) = 0 ) then
//               TUniDBGrid( Components[f] ).Hint := '[[' +
//                                                   'fieldmasks:' +
//                                                   'grid-resize|' +
//                                                   ']]' ;
//            //paPagePagBtns.visible := bPaged;
//            //paPageBar.visible := bPaged;
//         end;
//    end;

    // v. 3.2.0.5
    labState.Caption      := mm.LAB_STATE_B;

    // Carrega definicoes anteriores caso o cliente tenha mexido em alguma coluna...
    //dbgDados.Columns.Clear;

    if FileExists( mm.APP_PATH_CONTROL + 'delete_dbGridDetail_' + Trim( ed_Table_ItemSel.Text ) + '.cfg' ) then
    begin
       DeleteFile( mm.APP_PATH_CONTROL + 'delete_dbGridDetail_' + Trim( ed_Table_ItemSel.Text ) + '.cfg' );
       DeleteFile( mm.APP_PATH_CONTROL + 'dbGridDetail_' + Trim( ed_Table_ItemSel.Text ) + '.cfg' );
    end;

    // transf. pra memPAI( FDMEMTABLE ) o registro ATUAL( MESTRE / DETALHE )
    Self.mem_MASTER.close;
    Self.mem_MASTER.Data := TFDQuery( mm.varC_Frame_Master.FindComponent( 'sqlMaster' ) ).Data;
end;

procedure TfrmBaseCRUDDetail.UniFormDestroy(Sender: TObject);
begin
  mm.varC_Form_Detail := nil;
  // fechar querys abertas
  dm_rc.rc_CloseQuerys( Self , False, False );
end;

procedure TfrmBaseCRUDDetail.UniFormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = 27 then
     begin
          if not ( dsMaster.State in [ dsEdit, dsInsert ] ) then
          begin
             mm.varB_Yes := False;
             mm.varB_No := True;
             Self.ModalResult := mrNone;

             timerClose.Enabled := true;
             rc_MoveAnimationForm( self,
                                   self.left,
                                   self.left,
                                   self.top,
                                   -self.Height,
                                   120,
                                   1 ) ;
          end
          else
             dm_rc.rc_ShowMessage( mm.MSG_BUGERROR_REGISTER_IN_USE );
     end;
end;

procedure TfrmBaseCRUDDetail.UniFormReady(Sender: TObject);
begin
    Self.Top := ( UniSession.UniApplication.ScreenHeight  div 2 ) - ( self.Height div 2  );

    //if UniApplication.FindComponent('MainForm' ) <> nil then
    begin
      // in development
      rc_Translate( Self, nil , '' , mm.CONFIG_LANGUAGE );
    end;

    // v. 3.5.0.0
    //dm_rc.rc_ResizeBlocks( Self, true, true );

    Self.ed_FormOrigin.Text      := mm.varC_FormSource_Search ;
end;

procedure TfrmBaseCRUDDetail.UniFormShow(Sender: TObject);
begin
  inherited;
  Self.Top  := 0;
  rc_MoveAnimationForm( self,
                        self.left,
                        self.left,
                        self.top,
                        ( mm.varI_ScreenHeight  div 2 ) - ( self.Height div 2  ),
                        120,
                        1 ) ;
end;

procedure TfrmBaseCRUDDetail.Xml1Click(Sender: TObject);
begin
     dm_rc.rc_DBGridExport( dbgExport, etXML );
end;

procedure TfrmBaseCRUDDetail.Xml2Click(Sender: TObject);
begin
     dm_rc.rc_DBGridExport( dbgExport, etCSV );
end;

end.
