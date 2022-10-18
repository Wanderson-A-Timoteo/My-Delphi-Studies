RadCORE 4.0.0.5


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
'invalid: 					{vb. 4.0.0.5}'invalidate:



RC ELEMENTS

- Addition of New Attributes
- tweak to match FMX


RC WIZARD

- Little adjustments


RESPONSIBILITY

- Adjustment to avoid processing ENABLED=FALSE blocks


FUNCTIONS / PROCEDURES

- rc_GetRecord
  Bug fix with "LIMIT"

- rc_RenderLookUpControls
  Improved rendering of dynamic combobox( "cbbx:" )

- rc_PosHintProperty
  Bug improvement and prevention

frmCadPURCHASES

- BUG Fixes
- Change in the structure of the COMPRAS and COMPRAS_PRODUTOS tables


frmTHEMES

- Adjustment of "spin" controls


frmBaseCRUD / frmBaseCRUDDetail

- Adjustments to dynamic combobox rendering
- Adjustments for new dynamic validation attributes


MainForm

- Adjustment in MENU display to RTL


mkm_validate

- New attributes and validation parameters

  valid:not-exists
  valid:blank ifvisible:aaaa
  valid:blank ifenabled:aaaa

- BUG FIX for dynamic validation of CPF/CNPJ

- Refactoring to adapt to new features

mkm_translate

- New msg for new dynamic validation attribute