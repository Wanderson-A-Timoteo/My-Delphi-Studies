unit mkm_paginator; // v. 4.0.0.0

interface

uses
    System.SysUtils, System.Classes ,       System.TypInfo, JSON, DBXJSON, DBXJSONReflect,
    System.DateUtils, math, System.Rtti, System.StrUtils, Vcl.Graphics,
    Controls,
    // feedback: Mesut from Turkey
    {$ifdef LINUX}
    System.UIConsts,
    {$endif}
    uconsts,
    uniGUIForm, uniGUIFrame, uniGUIApplication, uniGUIBaseClasses, uniGUIClasses, uniGUITypes, uniGUIJSUtils, Vcl.forms,
    uniPanel, uniLabel, uniEdit, uniDbGrid;

    // v. 4.0.0.0
    procedure rc_RenderPaginator( pFormFrame : TObject; pControl : TUniControl; pHint : string ; pRCPaginator : string);

implementation

uses untdm_rc, mkm_layout;

// v. 4.0.0.0
procedure rc_RenderPaginator( pFormFrame : TObject; pControl : TUniControl; pHint : string ; pRCPaginator : string);
var
   // v. 4.0.0.0
   oPaPageBar, oPaPageBtn : TUniContainerPanel;
   oLabel    : TUniLabel;
   oEditPage : TUniEdit;
   oDBGrid   : TUniDBGrid;
   oDS       : TDataSource;
   iBarWidth : integer;
   cTmp      : string;
begin
   Try
      iBarWidth := 0;
      if ( pControl is TUniDBGrid )then
      begin
           if ( TUniDBGrid(pControl).WebOptions.Paged ) and
              ( ( Pos( 'grid-paginator', pHint ) > 0 ) or ( pRCPaginator = 'ON') ) then
           begin
              TUniDBGrid(pControl).OnRecordCount := dm_rc.DynamicGridPaginatorOnRecCount;

              dm_rc.rc_DBGridHidePaginationBar( TUniDBGrid(pControl) );
              // create a datasource copy
              oDS := TDataSource( TComponent(pFormFrame).FindComponent( TUniDBGrid(pControl).DataSource.Name + pControl.Name ) );
              if oDS = nil then
              begin
                 oDS        := TDataSource.Create( TComponent(pFormFrame) );
                 oDS.Name   := TUniDBGrid(pControl).DataSource.Name + pControl.Name;
                 oDS.DataSet := TUniDBGrid(pControl).DataSource.DataSet;
                 oDS.OnStateChange := dm_rc.DynamicGridPaginatorOnStateChange;
              end;
              // paPageBar
              //pControl.Align  := alNone;
              pControl.Height := pControl.Height - 40;
              oPaPageBar       := TUniContainerPanel( TComponent(pFormFrame).FindComponent( 'paPageBar_' + pControl.Name ) );
              if oPaPageBar = nil then
              begin
                 oPaPageBar        := TUniContainerPanel.Create( TComponent(pFormFrame) );
                 oPaPageBar.Parent := pControl.Parent;
                 oPaPageBar.Name   := 'paPageBar_' + pControl.Name;
              end;
              if oPaPageBar <> nil then
              begin
                 oPaPageBar.Hint := '[[round:b | cls:card-light]]';
                 pControl.Align    := alClient;
                 if pControl.Align = alClient then
                    oPaPageBar.Align  := alBottom;
   //                        else
   //                        begin
   //                            oPaPageBar.Anchors:= [ akTop, akLeft];
   //                            pControl.Height := pControl.Height - 36;
   //                            oPaPageBar.Hint   := '[[round:b | cls:card-light| scale:' + pControl.Parent.Name + ' w:100% | align:' + pControl.Parent.Name + ' r:-w b:0 | ]]';
   //                        end;
                 oPaPageBar.Top    := pControl.Top + pControl.Height;
                 oPaPageBar.Width  := pControl.Width;
                 oPaPageBar.Height := 40;
                 //oPaPageBar.Color  := clgray;

                 rc_BringToFront( oPaPageBar );
              end;
              // paPagePagBtns
              oPaPageBtn       := TUniContainerPanel( TComponent(pFormFrame).FindComponent( 'paPagePagBtns_' + pControl.Name ) );
              if oPaPageBtn = nil then
              begin
                 oPaPageBtn        := TUniContainerPanel.Create( TComponent(pFormFrame) );
                 oPaPageBtn.Parent := oPaPageBar;
                 oPaPageBtn.Name   := 'paPagePagBtns_' + pControl.Name;
              end;
              if oPaPageBtn <> nil then
              begin
                 //oPaPageBtn.Hint   := '[[round:b | cls:card-light]]';
                 if Pos( 'grid-paginator:center', pHint ) > 0 then
                    oPaPageBtn.Hint := '[[center:parent x]]';

                 oPaPageBtn.Anchors:= [ akTop, akLeft];
                 oPaPageBtn.Left   := 0;
                 oPaPageBtn.Top    := 0;
                 oPaPageBtn.Height := oPaPageBar.Height ;
                 oPaPageBtn.Width  := 355;
                 oPaPageBtn.Color  := clBtnFace;
              end;
              //labPageRefresh
              oLabel       := TUniLabel( TComponent(pFormFrame).FindComponent( 'labPageRefresh_' + pControl.Name ) );
              if oLabel = nil then
              begin
                 oLabel        := TUniLabel.Create( TComponent(pFormFrame) );
                 oLabel.Parent := oPaPageBtn;
                 oLabel.Name   := 'labPageRefresh_' + pControl.Name;
              end;
              if oLabel <> nil then
              begin
                 //oPaPageBtn.Hint   := '[[round:b | cls:card-light]]';
                 oLabel.Anchors:= [ akTop, akLeft];
                 oLabel.Left   := 8;
                 oLabel.Top    := 9;
                 oLabel.Height := 28 ;
                 oLabel.Width  := 35; iBarWidth := iBarWidth + oLabel.Left + oLabel.Width;
                 oLabel.Font.Color  := clBlack;
                 oLabel.Font.Size := 12;
                 oLabel.Cursor := crHandPoint;
                 oLabel.caption:= '<>';
                 //oLabel.Align  := alLeft;
                 oLabel.Alignment := taCenter;
                 oLabel.Margins.Bottom := 4;
                 oLabel.Margins.Left   := 10;
                 oLabel.Margins.Right  := 0;
                 oLabel.Margins.Top    := 8;
                 oLAbel.AlignWithMargins := True;
                 oLabel.Hint      :=
                   '[[ico:fas-sync-alt' +
                   '|state-enable:i-false e-false b-true ds:' + oDS.Name +
                   '|state-font-color:i-clsilver e-clsilver b-clblack ds:' + oDS.Name + '| ]]';
                 oLabel.Transparent := true;
                 oLabel.TextConversion := txtHTML;
                 oLabel.OnClick := dm_rc.DynamicGridPaginatorRefresh;
              end;
              //labPageFirst
              oLabel       := TUniLabel( TComponent(pFormFrame).FindComponent( 'labPageFirst_' + pControl.Name ) );
              if oLabel = nil then
              begin
                 oLabel        := TUniLabel.Create( TComponent(pFormFrame) );
                 oLabel.Parent := oPaPageBtn;
                 oLabel.Name   := 'labPageFirst_' + pControl.Name;
              end;
              if oLabel <> nil then
              begin
                 //oPaPageBtn.Hint   := '[[round:b | cls:card-light]]';
                 oLabel.Anchors:= [ akTop, akLeft];
                 oLabel.Left   := iBarWidth;//8 + 35;
                 oLabel.Top    := 9;
                 oLabel.Height := 24 ;
                 oLabel.Width  := 33; iBarWidth := iBarWidth + oLabel.Width;
                 oLabel.Font.Color  := clBlack;
                 oLabel.Font.Size := 12;
                 oLabel.Cursor := crHandPoint;
                 oLabel.caption:= 'up';
                 //oLabel.Align  := alLeft;
                 oLabel.Alignment := taCenter;
                 oLabel.Margins.Bottom := 4;
                 oLabel.Margins.Left   := 10;
                 oLabel.Margins.Right  := 0;
                 oLabel.Margins.Top    := 9;
                 oLAbel.AlignWithMargins := True;
                 oLabel.Hint      :=
                   '[[ico:fas-arrow-up' +
                   '|state-enable:i-false e-false b-true empty-false ds:' + oDS.Name + //bof-false eof-false
                   '|state-font-color:i-clsilver e-clsilver b-clblack empty-clsilver ds:' + oDS.Name + '| ]]'; //bof-clsilver eof-clsilver

                 oLabel.Transparent := true;
                 oLabel.TextConversion := txtHTML;
                 oLabel.OnClick := dm_rc.DynamicGridPaginatorFirst;
              end;
              //labPagePrior
              oLabel       := TUniLabel( TComponent(pFormFrame).FindComponent( 'labPagePrior_' + pControl.Name ) );
              if oLabel = nil then
              begin
                 oLabel        := TUniLabel.Create( TComponent(pFormFrame) );
                 oLabel.Parent := oPaPageBtn;
                 oLabel.Name   := 'labPagePrior_' + pControl.Name;
              end;
              if oLabel <> nil then
              begin
                 //oPaPageBtn.Hint   := '[[round:b | cls:card-light]]';
                 oLabel.Anchors:= [ akTop, akLeft];
                 oLabel.Left   := iBarWidth;//8 + 35 + 35;
                 oLabel.Top    := 9;
                 oLabel.Height := 24 ;
                 oLabel.Width  := 33; iBarWidth := iBarWidth + oLabel.Width;
                 oLabel.Font.Color  := clBlack;
                 oLabel.Font.Size := 12;
                 oLabel.Cursor := crHandPoint;
                 oLabel.caption:= '<';
                 //oLabel.Align  := alLeft;
                 oLabel.Alignment := taCenter;
                 oLabel.Margins.Bottom := 4;
                 oLabel.Margins.Left   := 10;
                 oLabel.Margins.Right  := 0;
                 oLabel.Margins.Top    := 9;
                 oLAbel.AlignWithMargins := True;
                 oLabel.Hint      :=
                   '[[ico:fas-arrow-left' +
                   '|state-enable:i-false e-false b-true empty-false ds:' + oDS.Name + //bof-false eof-false
                   '|state-font-color:i-clsilver e-clsilver b-clblack ds:' + oDS.Name + '| ]]'; //bof-clsilver eof-clsilver
                 oLabel.Transparent := true;
                 oLabel.TextConversion := txtHTML;
                 oLabel.OnClick := dm_rc.DynamicGridPaginatorPrior;
              end;
              //edPageNumber
              oEditPage       := TUniEdit( TComponent(pFormFrame).FindComponent( 'edPageNumber_' + pControl.Name ) );
              if oEditPage = nil then
              begin
                 oEditPage        := TUniEdit.Create( TComponent(pFormFrame) );
                 oEditPage.Parent := oPaPageBtn;
                 oEditPage.Name   := 'edPageNumber_' + pControl.Name;
              end;
              if oEditPage <> nil then
              begin
                 //oPaPageBtn.Hint   := '[[round:b | cls:card-light]]';
                 oEditPage.Anchors:= [ akTop, akLeft];
                 //iBarWidth := iBarWidth + 11;
                 oEditPage.Left   := iBarWidth;//4 + 35 + 35 + 45;
                 oEditPage.Top    := 6;
                 oEditPage.Height := 28 ;
                 oEditPage.Width  := 59; iBarWidth := iBarWidth + oEditPage.Width;
                 oEditPage.Font.Color  := clBlack;
                 oEditPage.Font.Size := 8;
                 oEditPage.Cursor := crHandPoint;
                 //oEditPage.caption:= 'dn';
                 //oEditPage.Align  := alLeft;
                 oEditPage.Alignment := taCenter;
                 oEditPage.Margins.Bottom := 6;
                 oEditPage.Margins.Left   := 0;
                 oEditPage.Margins.Right  := 0;
                 oEditPage.Margins.Top    := 6;
                 oEditPage.AlignWithMargins := false;
                 oEditPage.Hint      :=
                   '[[' +
                   '|state-enable:i-false e-false b-true empty-false ds:' + oDS.Name +
                   '|state-font-color:i-clsilver e-clsilver b-clblack ds:' + oDS.Name + '| ]]';
                 oEditPage.OnKeyDown := dm_rc.DynamicGridPaginatorGoPageDown;
              end;
              //labPageCurrPage
              oLabel       := TUniLabel( TComponent(pFormFrame).FindComponent( 'labPageCurrPage_' + pControl.Name ) );
              if oLabel = nil then
              begin
                 oLabel        := TUniLabel.Create( TComponent(pFormFrame) );
                 oLabel.Parent := oPaPageBtn;
                 oLabel.Name   := 'labPageCurrPage_' + pControl.Name;
              end;
              if oLabel <> nil then
              begin
                 //oPaPageBtn.Hint   := '[[round:b | cls:card-light]]';
                 oLabel.Anchors:= [ akTop, akLeft, akBottom];
                 oLabel.AutoSize := true;
                 oLabel.Left   := iBarWidth + 4;//8 + 35 + 35 + 35 + 70 + 4;
                 oLabel.Top    := 12;
                 oLabel.Height := 15 ;
                 oLabel.Width  := 59; iBarWidth := iBarWidth + 4 + oLabel.Width;
                 oLabel.Color := clWhite;
                 oLabel.Font.Color  := clGray;
                 oLabel.Font.Size := 10;
                 oLabel.Cursor := crHandPoint;
                 oLabel.caption:= '[001]';
                 //oLabel.Align  := alLeft;
                 oLabel.Alignment := taLeftJustify;
                 oLabel.Margins.Bottom := 6;
                 oLabel.Margins.Left   := 8;
                 oLabel.Margins.Right  := 4;
                 oLabel.Margins.Top    := 11;
                 oLAbel.AlignWithMargins := True;
                 oLabel.Hint      := '';
                 oLabel.Transparent := true;
                 oLabel.TextConversion := txtHTML;
              end;
              //labPageNext
              oLabel       := TUniLabel( TComponent(pFormFrame).FindComponent( 'labPageNext_' + pControl.Name ) );
              if oLabel = nil then
              begin
                 oLabel        := TUniLabel.Create( TComponent(pFormFrame) );
                 oLabel.Parent := oPaPageBtn;
                 oLabel.Name   := 'labPageNext_' + pControl.Name;
              end;
              if oLabel <> nil then
              begin
                 //oPaPageBtn.Hint   := '[[round:b | cls:card-light]]';
                 oLabel.Anchors:= [ akTop, akLeft];
                 oLabel.Left   := iBarWidth;//8 + 35 + 35 + 35 + 70 + 12 + 55;
                 oLabel.Top    := 9;
                 oLabel.Height := 24 ;
                 oLabel.Width  := 33; iBarWidth := iBarWidth + oLabel.Width;
                 oLabel.Font.Color  := clBlack;
                 oLabel.Font.Size := 12;
                 oLabel.Cursor := crHandPoint;
                 oLabel.caption:= '>';
                 //oLabel.Align  := alLeft;
                 oLabel.Alignment := taCenter;
                 oLabel.Margins.Bottom := 4;
                 oLabel.Margins.Left   := 8;
                 oLabel.Margins.Right  := 0;
                 oLabel.Margins.Top    := 9;
                 oLAbel.AlignWithMargins := True;
                 oLabel.Hint      :=
                   '[[ico:fas-arrow-right' +
                   '|state-enable:i-false e-false b-true empty-false ds:' + oDS.Name + //eof-false
                   '|state-font-color:i-clsilver e-clsilver b-clblack empty-clsilver ds:' + oDS.Name + '| ]]'; //bof-clsilver eof-clsilver
                 oLabel.Transparent := true;
                 oLabel.TextConversion := txtHTML;
                 oLabel.OnClick := dm_rc.DynamicGridPaginatorNext;
              end;
              //labPageLast
              oLabel       := TUniLabel( TComponent(pFormFrame).FindComponent( 'labPageLast_' + pControl.Name ) );
              if oLabel = nil then
              begin
                 oLabel        := TUniLabel.Create( TComponent(pFormFrame) );
                 oLabel.Parent := oPaPageBtn;
                 oLabel.Name   := 'labPageLast_' + pControl.Name;
              end;
              if oLabel <> nil then
              begin
                 //oPaPageBtn.Hint   := '[[round:b | cls:card-light]]';
                 oLabel.Anchors:= [ akTop, akLeft];
                 oLabel.Left   := iBarWidth;//8 + 35 + 35 + 35 + 74 + 4 + 65 + 35;
                 oLabel.Top    := 9;
                 oLabel.Height := 24 ;
                 oLabel.Width  := 33; iBarWidth := iBarWidth + oLabel.Width;
                 oLabel.Font.Color  := clBlack;
                 oLabel.Font.Size := 12;
                 oLabel.Cursor := crHandPoint;
                 oLabel.caption:= 'dn';
                 //oLabel.Align  := alLeft;
                 oLabel.Alignment := taCenter;
                 oLabel.Margins.Bottom := 4;
                 oLabel.Margins.Left   := 10;
                 oLabel.Margins.Right  := 0;
                 oLabel.Margins.Top    := 9;
                 oLAbel.AlignWithMargins := True;
                 oLabel.Hint      :=
                   '[[ico:fas-arrow-down' +
                   '|state-enable:i-false e-false b-true empty-false ds:' + oDS.Name + //eof-false
                   '|state-font-color:i-clsilver e-clsilver b-clblack empty-clsilver ds:' + oDS.Name + '| ]]'; //bof-clsilver eof-clsilver
                 oLabel.Transparent := true;
                 oLabel.TextConversion := txtHTML;
                 oLabel.OnClick := dm_rc.DynamicGridPaginatorLast;
              end;

              if Pos( 'grid-paginator:center', pHint ) > 0 then
              begin
                 oPaPageBar.Width := oPaPageBar.Parent.Width;//iBarWidth;
                 oPaPageBtn.Width := iBarWidth;
                 oPaPageBar.Left := 0;
                 cTmp := '0';
                 if Pos( 'grid-paginator:center(', pHint ) > 0 then
                 begin
                    cTmp := Copy( pHint, Pos( 'center(', pHint ) + 7 );
                    cTmp := Copy( cTmp, Pos( '.', cTmp ) + 1, Pos( ')', cTmp ) - 1 );
                 end;
                 oPaPageBar.Tag := StrToIntDef( cTmp , 0 );
                 if oPaPageBar.Tag < TUniDBGrid(pControl).Width then
                    oPaPageBar.Tag := TUniDBGrid(pControl).Width;
                 oPaPageBtn.Left := ( oPaPageBar.Tag div 2 ) - ( oPaPageBtn.Width div 2  );//oPaPageBar.Parent.Width
                 //oPaPageBtn.Left := ( TUniDBGrid(pControl).Width div 2 ) - ( oPaPageBtn.Width div 2  );//oPaPageBar.Parent.Width
              end
              else
                 oPaPageBtn.Left   := 0;

           end;
      end;
   Finally
      UniSession.ResumeLayouts;
   End;
end;

end.
