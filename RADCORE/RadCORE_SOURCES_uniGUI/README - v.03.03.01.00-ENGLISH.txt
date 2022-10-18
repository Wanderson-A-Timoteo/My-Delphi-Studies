
RadCORE 3.3.1.0

Pesquisar e substituir nos arquivos
Search and replace in files
------------------------------------
I really enjoy using "GExperts" for this purpose.
https://blog.dummzeuch.de/experimental-geexperts-version/

I believe "cnPack" does it too, but as it makes the Delphi IDE slower, I prefer "GExperts"
NotePad++ can also do this operation.

*** remembering that you have to search in "*.pas" and "*.dfm" (the delphi researcher does not have this feature)

	SEARCH..					                   REPLACE..
	--------------------------------------------    --------------------------------------------
	RemoveAcentos 								RemoveAccents
	'error' , false );							'error' ); // v. 3.3.1.0
	'warning' , false );						'warning' ); // v. 3.3.1.0
     'success' , false );						'success' ); // v. 3.3.1.0
	'info' , false );							'info' ); // v. 3.3.1.0
	ico:fa-									ico:fas-		             ( icones fontawesome "solid" = "fas-"  )


DOCUMENTATION

Improvement and/or new topics added


- Analyzing and applying features > Hint Editor

- Analyzing and Applying Features > Layout > Rendering Layout

    - Important change in: "Rendering a FORM"

- Analyzing and Applying Features > Layout > Rendering Layout > Labels: FontAwesome Icons

- Analyzing and applying features > Messages

- Analyzing and Applying Features > Dynamic LookUps > Dynamic Filter Lookup




DEFAULT CSS

new classes


RESPONSIVENESS

Rendering improvements for FORMS.
 

frmGenericModalForm

New MODAL form template that can be inherited.


formBASE

Adjustments to the new FORMS rendering standard.


New frmMessage

- now inherited from frmGenericModalForm
- New visual effects
- Improved layout

New frmInputBox

- now inherited from frmGenericModalForm
- New visual effects
- Improved layout


New frmWEBCAM

- now inherited from frmGenericModalForm
- bugs fixed
- corrected js file
   C:\RadCORE_SOURCES_uniGUI\inetpub\wwwroot\radcore\files\js\rc_webcam\rc_webcam.js



NEW ATTRIBUTES

Applying effects to images

   - img-cls:

Dynamic Lookup

   More options for optimizing coding-free lookup operations

   - lkpfilter:quoted(uf=edLkpUFS<text>)
   - lkpfilter-empty:Select a UF<translate>
   - lkpfilter-order:
   - lkpfilter-searchfields:codiibge
   - lkpfilter-gridattr:

   (usage example: frmCadCLIENTES -> edLkpCIDADES )


frmBaseCRUD

small improvements
New warnings about incorrect use of some "wildcards"


frmBaseCRUDDetail

small improvements
New warnings about incorrect use of some "wildcards"


frmFREEFRAME

Usage example of "img-cls:" applying ZOOM effect
Example of using rc_ShowSweetAlert with focus return on specified component.
CLIPBOARD example

RC ELEMENTS

Changed package description according to DELPHI version
Added "COMPLETE" feature for some attributes/buttons.
Added "FONTAWESOME" feature
Added new code editor theme selection menu
Optimized the colorization of RadCORE code elements.

RC WIZARD

Changed package description according to DELPHI version
Added option in DELPHI Menu to display a HELP on hotkeys.


DM_RC

Optimized various control functions for dynamic lookups

NEW FUNCTIONS FOR SPECIFIC MESSAGES

   - rc_ShowSweetAlertSuccess
   - rc_ShowSweetAlertWarning
   - rc_ShowSweetAlertInfo
   - rc_ShowSweetAlertError

   - rc_ShowSuccess
   - rc_ShowInfo
   - rc_ShowWarning
   - rc_ShowError

   - rc_ShowInputBox

     Optimized to use any of the fields as "password"
     (Example usage when clicking settings icon - frmTHEMES)

   - rc-ShowSweetAlert

     Now brings a parameter to focus on a specific component when closing the message.


- rc_MaskAdjust

   UNMASK fix to remove a previously defined mask


mkm_layout

- Adjustments to various responsiveness control functions
- Adjustments to avoid conflict when using the "ds:" attribute of some database attributes


mkm_translate

- Added option to translate new dynamic message attribute "lkpfilter-empty"


MainForm

- Restricted access to the CONFIG button ( frmTHEMES ) with the DEFAULT ADMIM password (see uCONST.PAS )


frmTHEMES

- Adjusted correct display of Switch Button( rcSwt ) for TLS and SSL in email configuration


ServerModule ( sm )

- Fixed the correct presentation of the port in Tray Icon.


OTHERS

- Tweaked all string handling functions to avoid errors.
(thanks M VAKILI)

- Added dlls for use with sending x32 and x64 emails

   C:\RadCORE_SOURCES_uniGUI\inetpub\wwwroot\radcore\files\lib\Email Indy x32 x64




