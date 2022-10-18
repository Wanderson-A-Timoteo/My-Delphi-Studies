Aplicar apenas nos projetos:

-BRASIL
-GLOBAL
-BASE DB


procedure TMainForm.htmlFrameAjaxEvent(Sender: TComponent; EventName: string;  Params: TUniStrings);
var
   pQryMaster : TFDQuery;
   pDsMaster  : TDataSource;

   pFrame, pFrame2 : TObject;

   pLabel : TUniLabel;

   pVariacaoCep, cTemp, cTemp2, cTemp3, cDataSource, cQuery,
   FClassName: string;
   oHfRequired : TUniHTMLFrame; // v. 3.4.0.0
   oLabel      : TUniLabel; // v. 3.4.0.0
   pObj : TUniControl;
   oSBox : TUniScrollBox; // v. 3.3.3.2
   oScrollBlock : TObject; // v. 3.5.0.0
   // v. 3.1.0.61
   bAbort       : boolean;
   pPageControl : TUniPageControl;

   i : integer;
begin
   if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;

   pQryMaster  := nil;
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
       bAbort := false; // v. 3.2.0..7
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
                if FClassName <> 'MainForm' then
                begin
                   pFrame2 := rc_FindControl( FClassName );
                   if pFrame2 <> nil then
                      dm_rc.rc_ResizeBlocks( pFrame2 );
                end;
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
                 pQryMaster := TFDQuery( TComponent( pFrame ).FindComponent( cQuery ) );

                 if pQryMaster <> nil then
                    if ( pQryMaster.State in [dsInsert, dsEdit ] ) and ( Params.Values[ 'field' ] <> '' ) then
                    begin
                         try
                            if DataTypeIsNumber( pQryMaster.FieldByName( Params.Values[ 'field' ] ).DataType ) then
                               pQryMaster.FieldByName( Params.Values[ 'field' ] ).Value := pObj.tag
                            else
                               if pObj.tag = 0 then
                                  pQryMaster.FieldByName( Params.Values[ 'field' ] ).Value := mm.VALUE_NO
                               else
                                  pQryMaster.FieldByName( Params.Values[ 'field' ] ).Value := mm.VALUE_YES;
                         except on e:exception do
                                begin
                                     dm_rc.rc_ShowError( 'Field: ' + Params.Values[ 'field' ] + ' ' + e.Message )
                                end;
                         end;
                    end;
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

                         if lowercase( TComponent(pFrame).Name ) = 'mainform' then
                            dm_rc.rc_BootStrapRender( MainForm , ( pQryMaster <> nil ), TUniLabel( TComponent(pFrame).Components[i] ) )
                         else
                            dm_rc.rc_BootStrapRender( pFrame , ( pQryMaster <> nil ) , TUniLabel( TComponent(pFrame).Components[i] ) );
                      end;
                   end;
               end;
           end;

           pLabel := TUniLabel( TComponent(pFrame).FindComponent( Params.Values[ EventName ] ) );

           // set tag = 1 to Item Selected
           pLabel.Tag := 1;

           cQuery     := Params.Values[ lowercase( 'query' ) ];
           pQryMaster := TFDQuery( TComponent( pFrame ).FindComponent( cQuery ) );

           if pQryMaster <> nil then
              if ( pQryMaster.State in [dsInsert, dsEdit ] ) and ( Params.Values[ 'field' ] <> '' ) then
              begin
                   try
                      if DataTypeIsNumber( pQryMaster.FieldByName( Params.Values[ 'field' ] ).DataType ) then
                      begin
                         pQryMaster.FieldByName( Params.Values[ 'field' ] ).Value := Params.Values[ 'value' ].ToInteger;
                      end
                      else
                      begin
                         if pLabel.tag = 0 then
                            pQryMaster.FieldByName( Params.Values[ 'field' ] ).Value := ''
                         else
                            pQryMaster.FieldByName( Params.Values[ 'field' ] ).Value := Params.Values[ 'value' ];
                      end;
                   except on e:exception do
                          begin
                               dm_rc.rc_ShowError( 'Field: ' + Params.Values[ 'field' ] + ' ' + e.Message )
                          end;
                   end;
              end;

           if lowercase( TComponent(pFrame).Name ) = 'mainform' then
              dm_rc.rc_BootStrapRender( MainForm , ( pQryMaster <> nil ), pLabel )
           else
              dm_rc.rc_BootStrapRender( pFrame , ( pQryMaster <> nil ) , pLabel );
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
        // pegar a referencia do FRAME ATUAL
        FClassName := Params.Values['form'];

        pVariacaoCep := Params.Values['tipocep'];

        pFrame := rc_FindControl( FClassName );

        if pFrame <> nil then
        begin
            pQryMaster := TFDQuery( TComponent( pFrame ).FindComponent( Params.Values['qry'] ) );

            if pQryMaster <> nil then
               if pQryMaster.State in [dsInsert, dsEdit ] then
               begin
                    if pQryMaster.FieldList.IndexOf ( 'endereco' + pVariacaoCep ) >= 0 then
                       pQryMaster.FieldByName( 'endereco' + pVariacaoCep ).AsString  := Params.Values['rua'];

                    if pQryMaster.FieldList.IndexOf ( 'bairro' + pVariacaoCep ) >= 0 then
                       pQryMaster.FieldByName( 'bairro' + pVariacaoCep ).AsString    := Params.Values['bairro'];

                    // no cad. que tem CEP...UF e CIDADE sao vinculadas a um CODIGO e nao a DESCRICAO LIVRE
                    if pQryMaster.FieldList.IndexOf ( 'codiuf' + pVariacaoCep ) >= 0 then
                    begin
                       dm_rc.memTemp.Close;
                       dm_rc.memTemp.Data := dm_rc.rc_GetRecord( mm.varB_Use_FireDac ,
                                                                  false,
                                                                  ' select codigo, descricao ' +
                                                                  ' from ufs ' +
                                                                  ' where descricao = ' + QuotedStr( Params.Values['uf'] ) );
                       if mm.varC_LastErrorMsg <> '' then
                       begin
                           dm_rc.rc_ShowError( mm.varC_LastErrorMsg );
                           Exit;
                       end
                       else
                           pQryMaster.FieldByName( 'codiuf' + pVariacaoCep ).AsString    := dm_rc.memTemp.FieldByName('codigo').AsString;
                    end
                    else
                       pQryMaster.FieldByName( 'uf' + pVariacaoCep ).AsString    := Params.Values['uf'];

                    if pQryMaster.FieldList.IndexOf ( 'codicidade' + pVariacaoCep ) >= 0 then
                    begin
                       dm_rc.memTemp.Close;
                       dm_rc.memTemp.Data := dm_rc.rc_GetRecord( mm.varB_Use_FireDac ,
                                                                  false,
                                                                  ' select codigo, descricao ' +
                                                                  ' from cidades ' +
                                                                  ' where descricao = ' + QuotedStr( ansiuppercase( Params.Values['cidade']  ) ) );
                       if mm.varC_LastErrorMsg <> '' then
                       begin
                           dm_rc.rc_ShowError( mm.varC_LastErrorMsg );
                           Exit;
                       end
                       else
                           pQryMaster.FieldByName( 'codicidade' + pVariacaoCep ).AsString    := dm_rc.memTemp.FieldByName('codigo').AsString;
                    end
                    else
                       pQryMaster.FieldByName( 'cidade' + pVariacaoCep ).AsString := Params.Values['cidade'];

                    // codiibge nao vai existir em todas telas q tem pesquisa de cep
                    if pQryMaster.FieldList.IndexOf ( 'codiibge' + pVariacaoCep ) >= 0 then
                       pQryMaster.FieldByName( 'codiibge' + pVariacaoCep ).AsInteger := StrToIntDef( Params.Values['ibge'], 0 );

                    dm_rc.rc_LookUpUpdateData( pFrame );
               end;
        end;
   end
   else
   if EventName = '_DadosCepErro'  then
   begin
       dm_rc.rc_ShowError( 'Falha na consulta do CEP ou CEP Inválido' );
   end
   else
   if EventName = '_PositionXY'  then
   begin
       //dm_rc.rc_ShowMessage( 'obj tour:' + Params.Values['PosX'] + ' - ' + Params.Values['PosY'] );

 //      ed_X.Text := Params.Values['PosX'];
 //      ed_Y.Text := Params.Values['PosY'];

 //      pForm     := TUniForm( Params.Values['Form'] );
 //
 //      paObjTour := TUniControl( pForm.FindComponent( Params.Values['ObjetoAtual'] ));
 //
 //      paObj2 := TUniContainerPanel( MainForm.FindComponent( 'paObjFeatured' ) );
 //      paObj2.Top    := StrToIntDef( MainForm.ed_Y.Text, 0 );
 //      paObj2.Left   := StrToIntDef( MainForm.ed_X.Text, 0 );
 //      paObj2.Width  := TUniControl( paObjTour ).Width;
 //      paObj2.Height := TUniControl( paObjTour ).Height;
 //
 //      paObj3 := TUniContainerPanel( pForm.FindComponent( 'paMessage' ) );
 //
 //      paObj3.Top  := StrToIntDef( MainForm.ed_Y.Text, 0 );
 //      paObj3.Left := StrToIntDef( MainForm.ed_X.Text, 0 );
   end;
end;
