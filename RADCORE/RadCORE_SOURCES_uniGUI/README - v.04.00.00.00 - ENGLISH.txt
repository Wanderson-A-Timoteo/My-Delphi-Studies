RadCORE 4.0.0.0



DOCUMENTATION

Improvement and/or new topics added


RESPONSIBILITY

- Adjustment to HD resolution (thanks to FABIO OLIVEIRA)

RC ELEMENTS

- Adjustment in the display of all available attributes and their respective parameters

RC WIZARD

- Language setting adjustment
- English language updated to "English US" and "English GB"

THEME / LAYOUT CONTROL

- New Font Options
- New option to set the width of the scroll bar
- New option to parameterize UniDBGRID colors
- New option to parameterize the UniDBGRID layout
- New option to standardize the display of the new navigation bar
- New option to define animation and load mask type with or without background
- Adjusted the option of forms without rounded edges
- Preview of DARK MODE

MAIN FORM

- Display of a "KEY" icon at the bottom of the SIDE MENU when user is MASTER
- Decoupled Menu. Smoother animation.
- Initial Dashboard loading on the main tab

DYNAMIC MENU

- Improved control of HIDDEN OPTIONS
- New option for generating options that require MASTER access
- New option to "do not display" a menu option EVEN BEING "ADMIN"

DASHBOARDS

- New Dashboard templates
  - CRM
  - E-Commerce
  - Hospital
  - School

STANDARD CSS

- New button templates without background
- New model with caption color responding correctly to HOVER
- Creation of secondary file so radcore user can add their classes without changing the default file
- Improved DateTimePicker layout
- Dozens of new classes

UNIDBGRID

- New dynamic navigation bar
  - Refresh button that updates the query
- New layout elements linked to the theme control

frmBASECRUD / frmBASECRUDETAIL

- Various layout/responsiveness improvements
  - CRUD Model with Side Buttons adjust for MOBILE
  - CRUD Model with Captions on Buttons
    - On mobile the captions are hidden
  - Choice of color pattern
  - Choice of Action Button pattern
  - Animated advanced search panel

- New configurable templates
  - New button templates
  - Parameterization of the SEARCH pattern

- Refactoring of "Action Buttons" without using "widgets" and "fields editor (without using OnGetText)"
  - Improved layout
  - Binding to any button contained in the form inherited from frmBaseCRUD

NEW UNIT "mkm_createcomponents"

Dynamic creation of responsive blocks, labels, edits, etc.


NEW DYNAMIC ATTRIBUTES

> "border:"
- Creation of full or partial borders in a container

IMPROVEMENTS IN DYNAMIC ATTRIBUTES

> "rc_RenderControls" now allows rendering only one object.

> "collapse:"
- Parameter "icons:"
  - "icons:aaaa aaaa" for customizing the icons of "collapse:"
  - "icons:off" to allow any object to trigger the "collapse:" without using icons

> "state-color" and "state-font-color"
- Can be applied in editing components ( uniEDIT etc )
- use of THEMES control identifiers in the edit fields to keep the CURRENT THEME standard:
  - [[EDIT_COLOR]]
  - [[EDIT_FONT_COLOR]]
  - [[EDIT_COLOR_READONLY]]
  - [[EDIT_FONT_COLOR_READONLY]]

> "ico-stack:"
- Parameter "type:"
  - circle
  - square
- Parameter "size:"

> "valid-required:"
- Adjustment in the positioning of the marker (Thanks FABIO SALVIANO)

> "cbx-fill:" Fills a combobox with a list of files
- Parameter "folder:"
  - folder:files\images\loaders filter:*.gif,*.svg

DYNAMIC LOOKUP

> "getsearchfield:"
> "lkponlysearch"
- Allows you to create a lookup without a datafield link

DEMO: frmCadPURCHASE

- Added reactive attributes in DETAIL grid
- Adjustment in product lookup update (cleaning when including)
- IMPORTANT: Update in the structure of the "COMPRAS_PRODUTOS" table. Check the default template.


RC_TRANSLATE

- Adjustment to prevent errors
- Translation of the error message regarding the MAXIMUM OPEN TABS LIMIT control

OTHER IMPROVEMENTS

- Adjustment to keep a possible "_" (typed by the user) in the name of the application created by the WIZARD
- display of side arrows in "bsTABS" on MOBILE( Issue feedback: Andrew Stepanchuk from Ukraine )
- Adjustment of "min-" and "max-" validation when in conjunction with "notblank"
- Various adjustments