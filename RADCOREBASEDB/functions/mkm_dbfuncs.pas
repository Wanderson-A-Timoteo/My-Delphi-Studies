unit mkm_dbfuncs; // v. 4.0.0.0

interface

uses
    uniDBComboBox, uniGUIFrame, uniGUIForm, System.SysUtils, vcl.Graphics, // v. 4.0.0.0
    System.Classes, uniGUIClasses, uconsts , TypInfo, Data.DB,
    uniEdit, uniDBEdit, uniLabel, uniPanel, uniDBGrid; // v. 4.0.0.0

procedure rc_DSReactiveCheck(pForm: TObject; pDS:TDataSource );

implementation
{------------------------------------------------------------------------------}

uses mkm_layout, untDM_RC, str_func;
// v. 4.0.0.0
procedure rc_DSReactiveCheck(pForm: TObject; pDS:TDataSource );
var
   i : integer;
   oObj : TUniControl;
   FieldValue, FieldValue1, FieldValue2 : Variant;

   cField, cParam1, cParam2, cHint, cTmp, cParamI, cParamE, cParamB, cDS : string;
   bVisible : boolean;
   oGrid : TUniDBGrid;
begin
  bVisible := false;

  for i := 0 to TComponent(pForm).ComponentCount -1 do
  begin
    // thanks to feedback: SANTIAGO from Angentina
    If ( Pos( 'TAction' , TComponent( pForm ).Components[I].ClassName ) = 0 ) and
       ( Pos( 'THelp' , TComponent( pForm ).Components[I].ClassName ) = 0 ) then
    begin
       if TComponent(pForm).Components[i] is TUniDBGrid then
          cTmp := cTmp;

       oObj := TUniControl( TComponent(pForm).Components[i] );
       If ( pDS <> nil ) and ( GetPropInfo( oObj.ClassInfo, 'Hint') <> nil ) then
       begin
          cHint := oObj.Hint;
          if not cHint.IsEmpty then
          begin
            cDS   := rc_GetHintProperty( 'ds:', cHint ).ToLower;
            // v. 4.0.0.0
            if ( cDS.IsEmpty ) then //or ( cDS = lowercase( pDS.Name ) ) then
            begin
               cDS := 'dsmaster';
            end;
            // v. 4.0.0.0
            if ( cDS = lowercase( pDS.Name ) ) then
            begin
               //enable
               cTmp := rc_GetHintProperty( 'state-enable:', cHint );
               if ( cTmp <> '' ) then //and ( cDS = lowercase( oDSCheck.Name ) ) then // v. 4.0.0.0
               begin
                  if ( pDS.State = dsInsert ) then
                  begin
                       if ( Pos( 'i-true', cTmp ) > 0 ) then
                          dm_rc.rc_ObjectEnabled( pForm, oObj, true )
                       else
                       if ( Pos( 'i-false', cTmp ) > 0 ) then
                          dm_rc.rc_ObjectEnabled( pForm, oObj, false );
                  end
                  else
                  if ( pDS.State = dsEdit ) then
                  begin
                       if ( Pos( 'e-true', cTmp ) > 0 ) then
                          dm_rc.rc_ObjectEnabled( pForm, oObj, true )
                       else
                       if ( Pos( 'e-false', cTmp ) > 0 ) then
                          dm_rc.rc_ObjectEnabled( pForm, oObj, false );
                  end
                  else
                  if ( pDS.State = dsBrowse ) then
                  begin
                       if ( Pos( 'b-true', cTmp ) > 0 ) then
                          dm_rc.rc_ObjectEnabled( pForm, oObj, true )
                       else
                       if ( Pos( 'b-false', cTmp ) > 0 ) then
                          dm_rc.rc_ObjectEnabled( pForm, oObj, false );

                       if ( pDS.DataSet.Bof ) and ( Pos( 'bof-false', cTmp ) > 0 ) then
                          dm_rc.rc_ObjectEnabled( pForm, oObj, false )
                       else
                       if ( pDS.DataSet.Eof ) and ( Pos( 'eof-false', cTmp ) > 0 ) then
                          dm_rc.rc_ObjectEnabled( pForm, oObj, false );

                  end;

                  //empty
                  if ( not ( pDS.State in [dsEdit , dsInsert] ) ) and ( Pos( 'empty-', cTmp ) > 0 ) then
                     if ( pDS.DataSet.IsEmpty ) then
                        dm_rc.rc_ObjectEnabled( pForm, oObj, ( Pos( 'empty-true', cTmp ) > 0 ) )
                     else
                        dm_rc.rc_ObjectEnabled( pForm, oObj, ( Pos( 'empty-false', cTmp ) > 0 ) );
               end;
               //color
               cTmp := rc_GetHintProperty( 'state-color:', cHint );
               if ( cTmp <> '' ) then //and ( cDS = lowercase( pDS.Name ) ) then // v. 4.0.0.0
               begin
                  if ( pDS.State = dsInsert ) then
                  begin
                       cParamI := rc_GetHintProperty( 'i-', cTmp, true ) + ' ';
                       cParamI := Copy( cParamI, 1, Pos( ' ', cParamI ) - 1 );
                       If ( cParamI <> '' ) then
                          TUniControl( oObj ).Color := StringToColor( cParamI );
                  end
                  else
                  if ( pDS.State = dsEdit ) then
                  begin
                       cParamE := rc_GetHintProperty( 'e-', cTmp, true ) + ' ';
                       cParamE := Copy( cParamE, 1, Pos( ' ', cParamE ) - 1 );
                       If ( cParamE <> '' ) then
                          TUniControl( oObj ).Color := StringToColor( cParamE );
                  end
                  else
                  if ( pDS.State = dsBrowse ) then
                  begin
                       cParamB := rc_GetHintProperty( 'b-', cTmp, true ) + ' ';
                       cParamB := Copy( cParamB, 1, Pos( ' ', cParamB ) - 1 );
                       If ( cParamB <> '' ) then
                          TUniControl( oObj ).Color := StringToColor( cParamB );
                  end;
                  //empty
                  if ( not ( pDS.State in [dsEdit , dsInsert] ) ) and ( Pos( 'empty-', cTmp ) > 0 ) then
                     if ( pDS.DataSet.IsEmpty ) then
                     begin
                        cParamB := rc_GetHintProperty( 'empty-', cTmp, true ) + ' ';
                        cParamB := Copy( cParamB, 1, Pos( ' ', cParamB ) - 1 );
                        If ( cParamB <> '' ) then
                           TUniControl( oObj ).Color := StringToColor( cParamB );
                     end;
               end;
               //font-color
               // v. 4.0.0.0
               cTmp := rc_GetHintProperty( 'state-font-color:', cHint );
               if ( cTmp <> '' ) then //and ( cDS = lowercase( pDS.Name ) ) then // v. 4.0.0.0
               begin
                  if ( pDS.State = dsInsert ) then
                  begin
                       cParamI := rc_GetHintProperty( 'i-', cTmp, true ) + ' ';
                       cParamI := Copy( cParamI, 1, Pos( ' ', cParamI ) - 1 );
                       If ( cParamI <> '' ) then
                          if oObj is TUniLabel then
                             TUniLabel( oObj ).Font.Color := StringToColor( cParamI )
                          else
                          if oObj is TUniEdit then
                             TUniEdit( oObj ).Font.Color := StringToColor( cParamI )
                          else
                          if oObj is TUniDBEdit then
                             TUniDBEdit( oObj ).Font.Color := StringToColor( cParamI );
                  end
                  else
                  if ( pDS.State = dsEdit ) then
                  begin
                       cParamE := rc_GetHintProperty( 'e-', cTmp, true ) + ' ';
                       cParamE := Copy( cParamE, 1, Pos( ' ', cParamE ) - 1 );
                       If ( cParamE <> '' ) then
                          //TUniLabel( oObj ).Font.Color := StringToColor( cParamE );
                          if oObj is TUniLabel then
                             TUniLabel( oObj ).Font.Color := StringToColor( cParamE )
                          else
                          if oObj is TUniEdit then
                             TUniEdit( oObj ).Font.Color := StringToColor( cParamE )
                          else
                          if oObj is TUniDBEdit then
                             TUniDBEdit( oObj ).Font.Color := StringToColor( cParamE );
                  end
                  else
                  if ( pDS.State = dsBrowse ) then
                  begin
                       // paginator ?
                       if Pos( Copy( TUniLabel( oObj ).Name, 1, Pos ( '_', TUniLabel( oObj ).Name )-1 ), ' labPageFirst labPagePrior labPageNext labPageLast' ) > 0  then
                       begin
                            oGrid := TUniDBGrid( TComponent(pForm).FindComponent( Copy( TUniLabel( oObj ).Name, Pos ( '_', TUniLabel( oObj ).Name ) + 1 ) ) );
                            if oGrid <> nil then
                               dm_rc.rc_GridPaginatorUpdateControls( oGrid , -1, -1 );
                       end
                       else
                       begin
                          cParamB := rc_GetHintProperty( 'b-', cTmp, true ) + ' ';
                          cParamB := Copy( cParamB, 1, Pos( ' ', cParamB ) - 1 );
                          If ( cParamB <> '' ) then
                             if oObj is TUniLabel then
                                TUniLabel( oObj ).Font.Color := StringToColor( cParamB )
                             else
                             if oObj is TUniEdit then
                                TUniEdit( oObj ).Font.Color := StringToColor( cParamB )
                             else
                             if oObj is TUniDBEdit then
                                TUniDBEdit( oObj ).Font.Color := StringToColor( cParamB );

                          if ( pDS.DataSet.Bof ) and ( Pos( 'bof-', cTmp ) > 0 ) then
                          begin
                             cParamB := rc_GetHintProperty( 'bof-', cTmp, true ) + ' ';
                             cParamB := Copy( cParamB, 1, Pos( ' ', cParamB ) - 1 );
                             If ( cParamB <> '' ) then
                                if oObj is TUniLabel then
                                   TUniLabel( oObj ).Font.Color := StringToColor( cParamB )
                                else
                                if oObj is TUniEdit then
                                   TUniEdit( oObj ).Font.Color := StringToColor( cParamB )
                                else
                                if oObj is TUniDBEdit then
                                   TUniDBEdit( oObj ).Font.Color := StringToColor( cParamB );
                          end
                          else
                          if ( pDS.DataSet.Eof ) and ( Pos( 'eof-', cTmp ) > 0 ) then
                          begin
                             cParamB := rc_GetHintProperty( 'eof-', cTmp, true ) + ' ';
                             cParamB := Copy( cParamB, 1, Pos( ' ', cParamB ) - 1 );
                             If ( cParamB <> '' ) then
                                if oObj is TUniLabel then
                                   TUniLabel( oObj ).Font.Color := StringToColor( cParamB )
                                else
                                if oObj is TUniEdit then
                                   TUniEdit( oObj ).Font.Color := StringToColor( cParamB )
                                else
                                if oObj is TUniDBEdit then
                                   TUniDBEdit( oObj ).Font.Color := StringToColor( cParamB );
                          end;
                       end;
                  end;
                  //empty
                  if ( not ( pDS.State in [dsEdit , dsInsert] ) ) and ( Pos( 'empty-', cTmp ) > 0 ) then
                     if ( pDS.DataSet.IsEmpty ) then
                     begin
                        cParamB := rc_GetHintProperty( 'empty-', cTmp, true ) + ' ';
                        cParamB := Copy( cParamB, 1, Pos( ' ', cParamB ) - 1 );
                        If ( cParamB <> '' ) then
                          if oObj is TUniLabel then
                             TUniLabel( oObj ).Font.Color := StringToColor( cParamB )
                          else
                          if oObj is TUniEdit then
                             TUniEdit( oObj ).Font.Color := StringToColor( cParamB )
                          else
                          if oObj is TUniDBEdit then
                             TUniDBEdit( oObj ).Font.Color := StringToColor( cParamB );
                     end;
               end;
               //caption
               cTmp := rc_GetHintProperty( 'state-caption:', cHint );
               // v. 4.0.0.0
               //if ( cTmp <> '' ) and ( cDS = lowercase( pDS.Name ) ) and ( oObj is TUniLabel ) then
               if ( cTmp <> '' ) and ( oObj is TUniLabel ) then
               begin
                  if ( pDS.State = dsInsert ) then
                  begin
                       cParamI := rc_GetHintProperty( 'i-', cTmp, true );
                       If ( cParamI <> '' ) then
                          TUniLabel( oObj ).Caption := cParamI;
                  end
                  else
                  if ( pDS.State = dsEdit ) then
                  begin
                       cParamE := rc_GetHintProperty( 'e-', cTmp, true );
                       If ( cParamE <> '' ) then
                          TUniLabel( oObj ).Caption := cParamE ;
                  end
                  else
                  if ( pDS.State = dsBrowse ) then
                  begin
                       cParamB := rc_GetHintProperty( 'b-', cTmp, true );
                       If ( cParamB <> '' ) then
                          TUniLabel( oObj ).Caption := cParamB ;
                  end;
               end;
               //cls
               cTmp := rc_GetHintProperty( 'state-cls:', cHint );
               if ( cTmp <> '' ) then //and ( cDS = lowercase( pDS.Name ) ) then // v. 4.0.0.0
               begin
                  cParamI := rc_GetHintProperty( 'i-', cTmp, true , true) + ' ';
                  cParamI := Copy( cParamI , 1, Pos( ' ', cParamI ) - 1 );
                  cParamE := rc_GetHintProperty( 'e-', cTmp, true , true) + ' ';
                  cParamE := Copy( cParamE , 1, Pos( ' ', cParamE ) - 1 );
                  cParamB := rc_GetHintProperty( 'b-', cTmp, true , true) + ' ';
                  cParamB := Copy( cParamB , 1, Pos( ' ', cParamB ) - 1 );

                  if not cParamI.IsEmpty then rc_RemoveCssClass( oObj, cParamI );
                  if not cParamE.IsEmpty then rc_RemoveCssClass( oObj, cParamE );
                  if not cParamB.IsEmpty then rc_RemoveCssClass( oObj, cParamB );

                  if ( pDS.State = dsInsert ) then
                  begin
                       If ( cParamI <> '' ) then
                       begin
                          rc_AddCssClass( oObj, cParamI );
                       end;
                  end
                  else
                  if ( pDS.State = dsEdit ) then
                  begin
                       If ( cParamE <> '' ) then
                       begin
                          rc_AddCssClass( oObj, cParamE );
                       end;
                  end
                  else
                  if ( pDS.State = dsBrowse ) then
                  begin
                       If ( cParamB <> '' ) then
                       begin
                          rc_AddCssClass( oObj, cParamB );
                       end;
                  end;
               end;
               //visible
               cTmp := rc_GetHintProperty( 'state-visible:', cHint );
               if ( cTmp <> '' ) then //and ( cDS = lowercase( pDS.Name ) ) then // v. 4.0.0.0
               begin
                  if Copy( TUniControl( oObj ).Name, 1, 7 ) = 'rcBlock' then
                     bVisible := oObj.Visible;

                  if ( pDS.State = dsInsert ) then
                  begin
                       if ( Pos( 'i-true', cTmp ) > 0 ) then
                          oObj.Visible := True
                       else
                       if ( Pos( 'i-false', cTmp ) > 0 ) then
                          oObj.Visible := False;
                  end
                  else
                  if ( pDS.State = dsEdit ) then
                  begin
                       if ( Pos( 'e-true', cTmp ) > 0 ) then
                          oObj.Visible := True
                       else
                       if ( Pos( 'e-false', cTmp ) > 0 ) then
                          oObj.Visible := False;
                  end
                  else
                  if ( pDS.State = dsBrowse ) then
                  begin
                       if ( Pos( 'b-true', cTmp ) > 0 ) then
                          oObj.Visible := True
                       else
                       if ( Pos( 'b-false', cTmp ) > 0 ) then
                          oObj.Visible := False;
                  end;

                  //empty
                  //if ( not ( pDS.State in [dsEdit , dsInsert] ) ) and ( Pos( 'empty-', cTmp ) > 0 ) then
                  if ( Pos( 'empty-', cTmp ) > 0 ) then
                     if ( pDS.DataSet.IsEmpty ) then
                        oObj.Visible := ( Pos( 'empty-true', cTmp ) > 0 )
                     else
                        oObj.Visible := ( Pos( 'empty-false', cTmp ) > 0 );

                  if ( Copy( TUniControl( oObj ).Name, 1, 7 ) = 'rcBlock' ) and
                     ( bVisible <> oObj.Visible ) then
                  begin
                     oObj.Enabled := oObj.Visible;
                     dm_rc.rc_ResizeBlocks( pForm );
                  end;

               end;
               //field-cls:bloqueado value-F:ButtonWhite value-J:ButtonThemeCrud ds:dsMaster|
               //field-ico:bloqueado value-F:fas-paper-plane  value-J:far-paper-plane ds:dsMaster|
               //field-cls-ico:bloqueado value-F:font-black  value-J: ds:dsMaster|
               // field-cls
               cTmp := rc_GetHintProperty( 'field-cls:', cHint );
               // v. 4.0.0.0
               //if ( cTmp <> '' ) and ( cDS = lowercase( pDS.Name ) )  then
               if ( cTmp <> '' ) and ( pDS.DataSet.active ) then // v. 4.0.0.0
               begin
                  // v. 3.3.1.0
                  if Pos( ' ds:', cTmp ) > 0 then
                     cTmp := Copy( cTmp, 1, Pos( ' ds:', cTmp ) - 1 );

                  cField     := Copy( cTmp, 1, Pos( ' ', cTmp ) -1 );
                  if pDS.DataSet.FindField( cField ) <> nil then
                  begin
                     FieldValue := pDS.DataSet.FieldByName( cField ).Value;
                     cTmp       := Copy( cTmp, Pos( ' ', cTmp ) + 1, 2000 );

                     FieldValue1 := Copy( cTmp, 1, Pos( ' ', cTmp ) -1 );
                     cTmp        := Copy( cTmp, Pos( ' ', cTmp ) + 1, 2000 );
                     FieldValue1 := Copy( FieldValue1, 7, 2000 );
                     cParam1     := Trim( Copy( FieldValue1, Pos( ':', FieldValue1 ) +1, 2000 ) );
                     FieldValue1 := Copy( FieldValue1, 1, Pos( ':', FieldValue1 ) -1 );

                     FieldValue2 := Copy( cTmp, 7, 2000 );
                     cParam2     := Trim( Copy( FieldValue2, Pos( ':', FieldValue2 ) +1, 2000 ) );
                     FieldValue2 := Copy( FieldValue2, 1, Pos( ':', FieldValue2 ) -1 );

                     if FieldValue1 = FieldValue then
                     begin
                         rc_RemoveCssClass( oObj, cParam2 );
                         rc_AddCssClass( oObj, cParam1 );
                     end
                     else
                     begin
                        rc_RemoveCssClass( oObj, cParam1 );
                        rc_AddCssClass( oObj, cParam2 );
                     end;
                  end;
               end;
               // field-cls-ico
               cTmp := rc_GetHintProperty( 'field-cls-ico:', cHint );
               // v. 4.0.0.0
               //if ( cTmp <> '' ) and ( cDS = lowercase( pDS.Name ) ) then
               if ( cTmp <> '' ) and ( pDS.DataSet.active ) then // v. 4.0.0.0
               begin
                  // v. 3.3.1.0
                  if Pos( ' ds:', cTmp ) > 0 then
                     cTmp := Copy( cTmp, 1, Pos( ' ds:', cTmp ) - 1 );

                  cField     := Copy( cTmp, 1, Pos( ' ', cTmp ) -1 );
                  if pDS.DataSet.FindField( cField ) <> nil then
                  begin
                     FieldValue := pDS.DataSet.FieldByName( cField ).Value;
                     cTmp       := Copy( cTmp, Pos( ' ', cTmp ) + 1, 2000 );

                     FieldValue1 := Copy( cTmp, 1, Pos( ' ', cTmp ) -1 );
                     cTmp        := Copy( cTmp, Pos( ' ', cTmp ) + 1, 2000 );
                     FieldValue1 := Copy( FieldValue1, 7, 2000 );
                     cParam1     := Trim( Copy( FieldValue1, Pos( ':', FieldValue1 ) +1, 2000 ) );
                     FieldValue1 := Copy( FieldValue1, 1, Pos( ':', FieldValue1 ) -1 );

                     FieldValue2 := Copy( cTmp, 7, 2000 );
                     cParam2     := Trim( Copy( FieldValue2, Pos( ':', FieldValue2 ) +1, 2000 ) );
                     FieldValue2 := Copy( FieldValue2, 1, Pos( ':', FieldValue2 ) -1 );

                     if FieldValue1 = FieldValue then
                     begin
                        rc_RemoveCssClass( oObj, cParam2 );
                        rc_AddCssClass( oObj, cParam1 );
                     end
                     else
                     begin
                        rc_RemoveCssClass( oObj, cParam1 );
                        rc_AddCssClass( oObj, cParam2 );
                     end;
                  end;
               end;
               // field-ico
               cTmp := rc_GetHintProperty( 'field-ico:', cHint );
               // v. 4.0.0.0
               //if ( cTmp <> '' ) and ( cDS = lowercase( pDS.Name ) ) then
               if ( cTmp <> '' ) and ( pDS.DataSet.active ) then // v. 4.0.0.0
               begin
                  // v. 3.3.1.0
                  if Pos( ' ds:', cTmp ) > 0 then
                     cTmp := Copy( cTmp, 1, Pos( ' ds:', cTmp ) - 1 );

                  cField     := Copy( cTmp, 1, Pos( ' ', cTmp ) -1 );
                  if pDS.DataSet.FindField( cField ) <> nil then
                  begin
                     FieldValue := pDS.DataSet.FieldByName( cField ).Value;
                     cTmp       := Copy( cTmp, Pos( ' ', cTmp ) + 1, 2000 );

                     FieldValue1 := Copy( cTmp, 1, Pos( ' ', cTmp ) -1 );
                     cTmp        := Copy( cTmp, Pos( ' ', cTmp ) + 1, 2000 );
                     FieldValue1 := Copy( FieldValue1, 7, 2000 );
                     cParam1     := Trim( Copy( FieldValue1, Pos( ':', FieldValue1 ) +1, 2000 ) );
                     FieldValue1 := Copy( FieldValue1, 1, Pos( ':', FieldValue1 ) -1 );

                     FieldValue2 := Copy( cTmp, 7, 2000 );
                     cParam2     := Trim( Copy( FieldValue2, Pos( ':', FieldValue2 ) +1, 2000 ) );
                     FieldValue2 := Copy( FieldValue2, 1, Pos( ':', FieldValue2 ) -1 );

                     if FieldValue1 = FieldValue then
                     begin
                        cTmp   := oObj.Caption;
                        cField := Copy( cTmp, Pos( 'fa-', cTmp ) + 3 ) + ' ' ;
                        cField := Copy( cField, 1, Pos( ' ', cField ) - 1 );
                        if Pos( 'fa fa-', cTmp ) > 0 then
                           FieldValue1 := 'fa'
                        else
                        if Pos( 'fas fa-', cTmp ) > 0 then
                           FieldValue1 := 'fas'
                        else
                        if Pos( 'far fa-', cTmp ) > 0 then
                           FieldValue1 := 'far'
                        else
                        if Pos( 'fab fa-', cTmp ) > 0 then
                           FieldValue1 := 'fab';

                        FieldValue2 := FieldValue1 + ' fa-' + Copy( cParam2, Pos( '-', cParam2 ) + 1 );

                        cTmp := StringReplace( cTmp, FieldValue1 + ' fa-' + cField, FieldValue2, [rfReplaceAll] );
                     end
                     else
                     begin
                        cTmp   := oObj.Caption;
                        cField := Copy( cTmp, Pos( 'fa-', cTmp ) + 3 ) + ' ' ;
                        cField := Copy( cField, 1, Pos( ' ', cField ) - 1 );
                        if Pos( 'fa fa-', cTmp ) > 0 then
                           FieldValue1 := 'fa'
                        else
                        if Pos( 'fas fa-', cTmp ) > 0 then
                           FieldValue1 := 'fas'
                        else
                        if Pos( 'far fa-', cTmp ) > 0 then
                           FieldValue1 := 'far'
                        else
                        if Pos( 'fab fa-', cTmp ) > 0 then
                           FieldValue1 := 'fab';

                        FieldValue2 := FieldValue1 + ' fa-' + Copy( cParam1, Pos( '-', cParam1 ) + 1 );

                        cTmp := StringReplace( cTmp, FieldValue1 + ' fa-' + cField, FieldValue2, [rfReplaceAll] );
                     end;
                     oObj.Caption := cTmp;
                  end;
               end;
            end;
          end;
       end;
    end;
  end;
end;
end.
