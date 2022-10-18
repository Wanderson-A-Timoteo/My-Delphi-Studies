Aplicar apenas nos projetos:

-BASE
-STARTER


procedure TMainForm.htmlFrameAjaxEvent(Sender: TComponent; EventName: string;  Params: TUniStrings);
var
   //pQryMaster : TFDQuery;
   pDsMaster  : TDataSource;

   FrC : TUniFrameClass;
   Fr  : TUniFrame;

   fClass : TClass;

   FrmC : TUniFormClass;
   Frm  : TUniForm;

   pFrame, pFrame2 : TObject;

   pLabel : TUniLabel;

   pVariacaoCep, cTemp, cTemp2, cTemp3, cDataSource, cQuery,
   FClassName, Path: string;

   oHfRequired : TUniHTMLFrame; // v. 3.4.0.0
   oLabel      : TUniLabel; // v. 3.4.0.0
   pObj : TUniControl;
   oSBox : TUniScrollBox; // v. 3.3.3.2
   oScrollBlock : TObject; // v. 3.5.0.0
   // v. 3.1.0.61
   bAbort       : boolean;
   pPageControl : TUniPageControl;

   paObj1, paObj2, paObj3,
   paTourTransp,
   paObjFeatured : TUniContainerPanel;

   pForm : TUniForm;

   w, h,
   i , f: integer;
begin
//   if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;

   //pQryMaster  := nil;
   pDsMaster   := nil;
   cDataSource := '';
   cQuery      := '';
   // v. 3.3.1.0
   if (EventName = '_CopyToClipBoard') then
   begin
       mm.varC_TempString := Params.Values['content'];
       // based on: https://qawithexperts.com/article/javascript/creating-copy-to-clipboard-using-javascript-or-jquery/364
       UniSession.AddJS( 'function copyToClipboard(text) {' +
                         'var sampleTextarea = document.createElement("textarea");'+
                         'document.body.appendChild(sampleTextarea);'+
                         'sampleTextarea.value = text;' +
                         'sampleTextarea.select();' +
                         'document.execCommand("copy");' +
                         'document.body.removeChild(sampleTextarea);' +
                         '}' +
                         'copyToClipboard(' + QuotedStr( mm.varC_TempString ) + ');' );
       dm_rc.rc_ShowToaster( 'info', 'Copied to clipboard: ' + mm.varC_TempString + ' !', false, 'pinItUp' );
   end
   else
   if (EventName = '_onFocus') then
   begin
       FClassName := Params.Values['pform'];

       pFrame := rc_FindControl( FClassName );

       if pFrame = nil then
       begin
            if mm.oPgGeneral <> nil then
            begin
              fClassName := dm_rc.rc_GetActiveFormFrameNameInMainTab;// v. 3.3.3.0 //Copy( mm.oPgGeneral.ActivePage.Name, 5, 100 );
              pFrame     := rc_FindControl( FClassName );
            end;
       end;

       if pFrame <> nil then
       begin
          pObj := rc_FindControl( Params.Values[ 'pobj' ], pFrame );// v. 3.3.1.0 // TUniControl( TComponent(pFrame).FindComponent( Params.Values[ 'pobj' ] ) ); // v. 3.3.0.1

          if pObj <> nil then
          begin
              rc_RemoveCssClass( pObj , 'inputWithIcon' + varIIF( mm.RTL, '-rtl', '' ) + ' inputIconBg' + varIIF( mm.RTL, '-rtl', '' ) );
              // v. 3.5.0.0
              If Pos( 'focus-color:off', pObj.Hint ) = 0 then
                 rc_AddCssClass( pObj , 'inputWithIconFocus' + varIIF( mm.RTL, '-rtl', '' ) + ' inputIconBg' + varIIF( mm.RTL, '-rtl', '' ) );
          end;
       end;
       // v. 3.4.0.1
       if pObj <> nil then
       begin
          if ( pos( 'valid-required:', pObj.hint ) > 0 ) then
          begin
             oHfRequired := TUniHTMLFrame( TComponent(pFrame).FindComponent('rc__Required' + pObj.Name) );
             if oHfRequired <> nil then
             begin
                  oHfRequired.Visible := False;
             end;
          end;
          // v. 3.4.0.0
          if ( pos( 'form-label:', pObj.hint ) > 0 ) then
          begin
             oLabel := TUniLabel( TComponent(pFrame).FindComponent('rc__FormLabel' + pObj.Name) );
             if ( oLabel <> nil ) then //and ( TUniEdit(pObj).Text = '' ) then
             begin
                  if ( pos( 'form-label:top-in', pObj.hint ) > 0 ) then
                     rc_jQueryAnimate( oLabel , 'top'  , IntToStr( oLabel.Top - 18 ) , '350' )
                  else
                  if ( pos( 'form-label:top', pObj.hint ) > 0 ) then
                     rc_jQueryAnimate( oLabel , 'top'  , IntToStr( oLabel.Top - 26 ) , '350' );
             end;
          end;
       end;
       // v. 3.5.0.0
       if ( mm.varB_Mobile_Screen ) and ( ( mm.varB_Android ) or ( mm.varB_Tablet ) or ( mm.varB_iOS ) ) and ( ( pFrame <> nil ) or ( lowercase( fClassName ) = 'mainform' ) ) then
       begin
           oScrollBlock := rc_GetScrollBoxForMobileKeyboard( pObj );
           if oScrollBlock <> nil then
           begin
              oSBox := TUniScrollBox( oScrollBlock );
              if oSBox <> nil then
              begin
                 oSBox.Align := alNone;
                 oSBox.Top   := 0;
                 oSBox.Left  := 0;
                 oSBox.Height := oSBox.Parent.Height - 260;
                 oSBox.Width  := oSBox.Parent.Width;
              end;
           end;
       end;
   end
   else
   if (EventName = '_onBlur') then
   begin
       FClassName := Params.Values['pform'];

       pFrame := rc_FindControl( FClassName );

       if pFrame = nil then
       begin
            if mm.oPgGeneral <> nil then
            begin
              fClassName := dm_rc.rc_GetActiveFormFrameNameInMainTab;// v. 3.3.3.0 //Copy( mm.oPgGeneral.ActivePage.Name, 5, 100 );
              pFrame     := rc_FindControl( FClassName );
            end;
       end;

       if pFrame <> nil then
       begin
          pObj := rc_FindControl( Params.Values[ 'pobj' ], pFrame );// v. 3.3.1.0 // TUniControl( TComponent(pFrame).FindComponent( Params.Values[ 'pobj' ] ) ); // v. 3.3.0.1

          if pObj <> nil then
          begin
              rc_RemoveCssClass( pObj , 'inputWithIconFocus' + varIIF( mm.RTL, '-rtl', '' ) + ' inputIconBg' + varIIF( mm.RTL, '-rtl', '' ) );
              // v. 3.5.0.0
              If Pos( 'focus-color:off', pObj.Hint ) = 0 then
                 rc_AddCssClass( pObj , 'inputWithIcon' + varIIF( mm.RTL, '-rtl', '' ) + ' inputIconBg' + varIIF( mm.RTL, '-rtl', '' ) );
          end;
       end;
       // v. 3.4.0.1
       if pObj <> nil then
       begin
          if ( pos( 'valid-required:', pObj.hint ) > 0 ) then
          begin
             oHfRequired := TUniHTMLFrame( TComponent(pFrame).FindComponent('rc__Required' + pObj.Name) );
             if ( oHfRequired <> nil ) then
             begin
                  oHfRequired.Visible := TUniEdit(pObj).Text = '' ;
             end;
          end;
          // v. 3.4.0.0
          if ( pos( 'form-label:', pObj.hint ) > 0 ) then
          begin
             oLabel := TUniLabel( TComponent(pFrame).FindComponent('rc__FormLabel' + pObj.Name) );
             if ( oLabel <> nil ) and ( TUniEdit(pObj).Text = '' ) then
             begin
                  rc_jQueryAnimate( oLabel , 'top'  , IntToStr( oLabel.Top ) , '350' );
             end;
          end;
       end;
       // v. 3.5.0.0
       if ( mm.varB_Mobile_Screen ) and ( ( mm.varB_Android ) or ( mm.varB_Tablet ) or ( mm.varB_iOS ) ) and ( ( pFrame <> nil ) or ( lowercase( fClassName ) = 'mainform' ) ) then
       begin
           oScrollBlock := rc_GetScrollBoxForMobileKeyboard( pObj );
           if oScrollBlock <> nil then
           begin
              oSBox := TUniScrollBox( oScrollBlock );
              if oSBox <> nil then
              begin
                 oSBox.Align := alClient;
              end;
           end;
       end;
   end
   else
   if EventName = '_dashboard' then
   begin
        //if Params.Values['obj'] = 'produto 1' then
           dm_rc.rc_ShowMessage( Params.Values['item'] );
   end
   else
   if EventName = '_notifications' then
   begin
        //if Params.Values['obj'] = 'produto 1' then
           dm_rc.rc_ShowMessage( Params.Values['tipo'] );
   end
   else
   if EventName = '_mainFloatButton' then
   begin
        if Params.Values['tipo'] = 'off' then
           close
        else
           dm_rc.rc_ShowMessage( Params.Values['tipo'] );
   end
   else
   if EventName = '_CloseForm' then
   begin
        if Params.Values['form'] <> '' then
        begin
             FClassName := Params.Values['form'];

             pFrame := rc_FindControl( FClassName );

             if pFrame <> nil then
             begin
                  TUniForm( pFrame ).Close;
             end;
        end;
   end
   else
   if EventName = '_getXY' then
   begin
        mm.varI_PosX := StrToIntDef( Params.Values['x'] , 0 );
        mm.varI_PosY := StrToIntDef( Params.Values['y'] , 0 );
        mm.varI_PosH := StrToIntDef( Params.Values['h'] , 0 );
        mm.varI_PosW := StrToIntDef( Params.Values['w'] , 0 );
   end
   else
   if EventName = '_SetFormLeft' then
   begin
        if Params.Values['form'] <> '' then
        begin
             FClassName := Params.Values['form'];

             pFrame := rc_FindControl( FClassName );

             if pFrame <> nil then
             begin
                  TUniForm( pFrame ).Left := StrToIntDef( Params.Values['value'], TUniForm( pFrame ).Left );
             end;
        end;
   end
   else
   // EVENTOS rc_BootStrapRender
   //
   // bsPill MAINMENU hint -> [[bsPills:light cls:btn-sm pgc:pgGeneral]]
   // v. 3.1.0.61
   if ( EventName.ToLower = 'bstabs' ) or ( EventName.ToLower = 'bscardtabs' ) or ( EventName.ToLower = 'bspills' ) then
   begin
       FClassName := Params.Values['form'];

       if ( Params.Values['tab'] = 'TabLeft' ) or ( Params.Values['tab'] = 'TabRight' ) then
       begin
              mm.varI_TabIni := mm.varI_TabIni + varIIF( Params.Values['tab'] = 'TabRight', varIIF( mm.varB_Mobile_Screen, 1, 6 ), varIIF( mm.varB_Mobile_Screen, -1, -6 ) );

              if Params.Values['tab'] = 'TabRight' then
                 if ( mm.varI_TabEnd - mm.varI_TabIni > varIIF( mm.varB_Mobile_Screen, 1, 6 ) ) then
                    mm.varI_TabIni := mm.varI_TabEnd - varIIF( mm.varB_Mobile_Screen, 1, 6 );

              if mm.varI_TabIni < 0 then
                 mm.varI_TabIni := 0;
       end;

       pFrame := rc_FindControl( FClassName );

       if pFrame <> nil then
       begin
           if lowercase( TComponent(pFrame).Name ) = 'mainform' then
           begin
              pObj := TUniPageControl( FindComponent( Params.Values['pgcontrol'] ) );

              if ( Params.Values['tab'] <> '_closeTab' ) and ( Params.Values['tab'] <> '_closeAllTabs' ) then
              begin
                 TUniPageControl( FindComponent( Params.Values['pgcontrol'] ) ).ActivePage := TuniTabSheet( FindComponent( Params.Values[lowercase(EventName)] ) );
                 fClassName := TUniPageControl( FindComponent( Params.Values['pgcontrol'] ) ).ActivePage.Name;
              end
              else
              begin
                 if ( Params.Values['tab'] = '_closeTab' ) then
                    dm_rc.rc_CloseTab( MainForm, Params.Values['pgcontrol'], Params.Values[lowercase(EventName)] )
                 else
                 if ( Params.Values['tab'] = '_closeAllTabs' ) then
                 begin
                      pPageControl := TUniPageControl( FindComponent( Params.Values['pgcontrol'] ) );

                      i := pPageControl.PageCount-1;
                      while ( i > 0 ) do
                      begin
                           if pPageControl.Pages[ i ] <> nil then
                              if pPageControl.Pages[ i ].TabVisible then
                              begin
                                   cTemp := trim( TUniTabSheet( pPageControl.Pages[ i ] ).Name );
                                   // v. 3.2.0.6
                                   if ( cTemp <> 'tabDashBoard' ) then
                                   begin
                                      // v. 3.3.3.0
                                      //if ( Pos( 'closebtn:false', TUniTabSheet( pPageControl.Pages[ i ] ).Hint ) = 0 ) then
                                         bAbort := dm_rc.rc_CloseTab( MainForm, Params.Values['pgcontrol'], cTemp );
                                      //else
                                      //   bAbort := true;
                                   end;
                              end;
                           // v. 3.3.3.0
//                           if not bAbort then
//                              i := pPageControl.PageCount-1
//                           else
//                              i := 0;
                           Dec( i );
                      end;
                 end;
              end;
           end
           else
           begin
              pObj := TUniPageControl( TComponent(pFrame).FindComponent( Params.Values['pgcontrol'] ) );

              if Params.Values['tab'] <> '_closeTab' then
              begin
                 TUniPageControl( TComponent(pFrame).FindComponent( Params.Values['pgcontrol'] ) ).ActivePage := TuniTabSheet( TComponent(pFrame).FindComponent( Params.Values[lowercase(EventName)] ) );
                 fClassName := TUniPageControl( TComponent(pFrame).FindComponent( Params.Values['pgcontrol'] ) ).ActivePage.Name;
              end
              else
              begin
                 if ( Params.Values['tab'] = '_closeTab' ) then
                    dm_rc.rc_CloseTab( pFrame, Params.Values['pgcontrol'], Params.Values[lowercase(EventName)] )
                 else
                 if ( Params.Values['tab'] = '_closeAllTabs' ) then
                 begin
                      pPageControl := TUniPageControl( FindComponent( Params.Values['pgcontrol'] ) );

                      i := pPageControl.PageCount-1;
                      while i > 0 do
                      begin
                           if pPageControl.Pages[ i ] <> nil then
                              if pPageControl.Pages[ i ].TabVisible then
                              begin
                                   cTemp := trim( TUniTabSheet( pPageControl.Pages[ i ] ).Name );
                                   // v. 3.3.3.0
                                   //if ( Pos( 'closebtn:false', TUniTabSheet( pPageControl.Pages[ i ] ).Hint ) = 0 ) then
                                      bAbort := dm_rc.rc_CloseTab( pFrame, Params.Values['pgcontrol'], cTemp );
                                   //else
                                   //   bAbort := true;
                              end;
                           // v. 3.3.3.0
//                           if not bAbort then
//                              i := pPageControl.PageCount-1
//                           else
//                              i := 0;
                           Dec( i );
                      end;
                 end;

                 //dm_rc.rc_CloseTab( pFrame, Params.Values['pgcontrol'], Params.Values[lowercase(EventName)] );
              end;
           end;
           // v. 3.2.0.7
           // update TABSHEET colors
           //if UniApplication.FindComponent('MainForm' ) <> nil then
           //   dm_rc.rc_ResizeBlocks( MainForm );
           if UniApplication.FindComponent('MainForm' ) <> nil then
              if mm.oPgGeneral <> nil then
                 if mm.oPgGeneral.ActivePageIndex = 0 then
                    dm_rc.rc_ResizeBlocks( MainForm );

           pFrame2 := rc_FindControl( Copy( FClassName, 5, 100 ) );

           if pFrame2 <> nil then
           begin
              dm_rc.rc_ResizeBlocks( pFrame2 );
           end
           else // bsPill dentro de outros forms/frames
           begin
                FClassName := Params.Values['form'];
                pFrame2 := rc_FindControl( FClassName );
                if pFrame2 <> nil then
                   dm_rc.rc_ResizeBlocks( pFrame2 );
           end;

           rc_UpdateCharts;
       end;
   end
   else
   if ( EventName = 'bsswt' ) or ( EventName = 'bschk' ) then
   begin
       EventName := Copy( EventName, 3, 3 );

       FClassName := Params.Values['form'];

       pFrame := rc_FindControl( FClassName );

       if ( pFrame <> nil ) then
       begin
           if lowercase( TComponent(pFrame).Name ) = 'mainform' then
           begin
              pObj := TUniLabel( FindComponent( Params.Values[ EventName ] ) );
              pObj.tag := varIIF( pObj.tag = 0, 1, 0 );

              cTemp := pObj.Hint;
              cTemp := rc_GetHintProperty( 'field:', cTemp );

           end
           else
           begin
              pObj := TUniLabel( TComponent(pFrame).FindComponent( Params.Values[ EventName ] ) );
              pObj.tag := varIIF( pObj.tag = 0, 1, 0 );

              cTemp := pObj.Hint;
              cTemp := rc_GetHintProperty( 'field:', cTemp , True );

              if cTemp <> '' then
              begin
                 cQuery     := Params.Values[ lowercase( 'query' ) ];
              end;
           end;

           if lowercase( TComponent(pFrame).Name ) = 'mainform' then
              dm_rc.rc_BootStrapRender( MainForm, ( cTemp <> '' ) , pObj )
           else
              dm_rc.rc_BootStrapRender( pFrame , ( cTemp <> '' ) , pObj ) ;

           if lowercase( pObj.name ) = 'swtcamera' then
              UniSession.AddJS( varIIF( pObj.tag = 1 , 'rc_cameraOn();' , 'rc_cameraOff();' )  );
       end;
   end
   else
   if ( EventName = 'bsrgp' ) then
   begin
       FClassName := Params.Values['form'];

       pFrame := rc_FindControl( FClassName );

       if pFrame <> nil then
       begin
           pLabel := TUniLabel( TComponent(pFrame).FindComponent( Params.Values[ EventName ] ) );
           cTemp3 := lowercase( dm_rc.rc_GetParamFromRGP( pLabel.Name, rptFIELD ) );

           // all itemn set tag = 0
           for I := 0 to TComponent(pFrame).ComponentCount - 1 do
           begin
               if TComponent(pFrame).Components[i] is TUniLabel then
               begin
                   cTemp  := lowercase( TComponent(pFrame).Components[i].Name ); // bsrgp1_M_Tipo

                   if ( Copy( cTemp, 1, 5 ) = 'bsrgp' ) then
                   begin
                      cTemp2 := lowercase( dm_rc.rc_GetParamFromRGP( cTemp, rptFIELD ) );

                      if cTemp2 = cTemp3 then
                      begin
                         TUniLabel( TComponent(pFrame).Components[i] ).Tag := 0;
                         // v. 3.2.0.3
                         if lowercase( TComponent(pFrame).Name ) = 'mainform' then
                            dm_rc.rc_BootStrapRender( MainForm , false, TUniLabel( TComponent(pFrame).Components[i] ) )
                         else
                            dm_rc.rc_BootStrapRender( pFrame , false , TUniLabel( TComponent(pFrame).Components[i] ) );
                      end;
                   end;
               end;
           end;

           pLabel := TUniLabel( TComponent(pFrame).FindComponent( Params.Values[ EventName ] ) );

           // set tag = 1 to Item Selected
           pLabel.Tag := 1;

           cQuery     := Params.Values[ lowercase( 'query' ) ];

           if lowercase( TComponent(pFrame).Name ) = 'mainform' then
              dm_rc.rc_BootStrapRender( MainForm , false, pLabel )
           else
              dm_rc.rc_BootStrapRender( pFrame , false , pLabel );
       end;
   end
   else
   if SameText( EventName, '_GeoLocation' ) then
   begin
      if (Params.Values['lat'] <> '') then
      begin
        cLatitude  := Params.Values['lat'];
        cLongitude := Params.Values['lng'];
      end;
   end
   else
   if EventName = '_DadosCep' then   // específico para Brasil
   begin
   end
   else
   if EventName = '_DadosCepErro'  then
   begin
   end
   else
   if EventName = '_PositionXY'  then
   begin
   end;
end;
