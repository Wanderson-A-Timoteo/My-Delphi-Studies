RadCORE 3.3.0.0

Search and replace in files
Search and replace in files
------------------------------------
I really enjoy using "GExperts" for this purpose.
https://blog.dummzeuch.de/experimental-geexperts-version/

I believe "cnPack" does it too, but as it makes the Delphi IDE slower, I prefer "GExperts"
NotePad++ can also do this operation.

*** remembering that you have to search in "*.pas" and "*.dfm" (the delphi researcher does not have this feature)


SEARCH.. REPLACE..
-------------------------------------------------- --------------------------------------
0 2 0 0

        Note: Replace by nothing !!! it's to remove.



RESPONSIVE BLOCKS

New attributes, many improvements and new examples.

max-width:nn
max-width:xxx mobile-v-yyy

noborder-left:mobile
noborder-right:mobile
noborder-top:mobile
noborder-bottom:mobile
noborder-all:mobile

** Thanks for the idea Mr. SANTIAGO RICHARD


NEW FEATURES / IMPROVEMENTS

rc_AddCssClass / rc_RemoveCssClass: Improved error prevention.

rc_RenderControlsExecute: Improved error prevention and new functionality.

rc_BootStrapRenderExecute: Improved error prevention for "bsvideo:"

rc_DynamicAlignment: New features( center:parent x-mobile-y and center:parent y-mobile-x )



NEW ATTRIBUTES

COLLAPSE

Now adding the "collapsed" attribute, the block will start closed.
The arrows also changed the original meaning to give the more correct context.


MORE REACTIVE RESOURCES

You know that classic feature that when we access a record and we need to encode the state, color, icon, etc. of some button or any other object to get the user's attention?

Ex: Customer BLOCKED by payment, Sale in OPEN/CLOSED etc where we have a field with a value for Yes or No (Y or N), or Open and Closed (A or F).

Now, everything will be simpler!

- field-cls

- field-cls-ico

- field-ico

** thanks to Mr. Fábio Oliveira for your idea


DM_RC

Added UK English( en_GB ) for handling internal messages and regional standards


rc_BuildMENUS: Added control for options marked HIDDEN/HIDDEN

** thanks to Mr. Zilav


frmCadPURCHASES

Added example of "Header Title" and summary in QTDE and TOTALPROD fields



frmCadUSERS

Fixed Russian translation

** thanks to Mr. Zilav


Dynamic Permission Control

If in your current project, in some "rc_BuildMenuItem" instruction to assemble the menu items, there is a definition of table and form parameters,
the parameter "pRestrictionField" must be filled according to the name of the field declared in the table "USUARIOS_RESTRICOES".


uconst

Added English UK( en_GB )


MainModule

Added items for OPTION MENU translation

Added Arabic translation
**thanks to mr. Mohammed Boullal


frmMESSAGE

Added translation for "SUPPORT" button

**thanks to mr. Mohammed Boullal


FREEFRAME

Optimized responsiveness of the "qrcode" demo


RC WIZARD

New models based on the BRAZIL and GLOBAL version to be able to test report features or remove them to test only general functionality.


RC ELEMENTS

New extra CLONE command.

Now you will be able to select one or several blocks of components to reuse within the same screen, the same project in another form or even between different DELPHI instances.


RC TRANSLATE

Fixed and improved the translation to ARABIC.
Added some more terms.
Added option to translate unidbrid's "Header Title"

**thanks to mr. Mohammed Boullal