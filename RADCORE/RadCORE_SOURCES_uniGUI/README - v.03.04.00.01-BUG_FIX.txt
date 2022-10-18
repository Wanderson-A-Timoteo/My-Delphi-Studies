Bug fix #1
[PT]
Alterar esse trecho de código dento de "TMainForm.htmlFrameAjaxEvent"

[EN]
Change this code snippet inside "TMainForm.html Frame Ajax Event"
.
.
.
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
              // v. 3.4.1.0
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
       // v. 3.4.1.0
       if ( mm.varB_Mobile_Screen ) and ( ( pFrame <> nil ) or ( lowercase( fClassName ) = 'mainform' ) ) then
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
              // v. 3.4.1.0
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
       // v. 3.4.1.0
       if ( mm.varB_Mobile_Screen ) and ( ( pFrame <> nil ) or ( lowercase( fClassName ) = 'mainform' ) ) then
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


Bug fix #2
[PT]
Alterar essa função dentro da unit "mkm_layout" inclusive a sua declaração

[EN]
Change this function inside the "mkm_layout" unit including its declaration

// v. 3.4.1.0
function rc_GetScrollBoxForMobileKeyboard( pObj : TObject ):TObject;
var
   i : integer;
   oSBox : TUniScrollBox;
   oScrollBlock : TObject;
begin
   Result       := nil;
   oScrollBlock := nil;
   i            := 0;
   if TUniControl( pObj ).HasParent then
      Result := TUniControl( pObj ).Parent;
   while ( Result.ClassName <> 'TUniScrollBox' ) and ( i < 3 ) do
   begin
      if TUniControl( Result ).HasParent then
      begin
         Result := TUniControl( Result  ).Parent;
      end;
      if ( Result.ClassName <> 'TUniScrollBox' ) then
         Inc( i );
   end;
   if ( Result.ClassName <> 'TUniScrollBox' ) then
      Result := nil;
end;

