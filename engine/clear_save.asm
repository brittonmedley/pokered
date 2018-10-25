DoClearSaveDialogue:
	call ClearScreen
	call RunDefaultPaletteCommand
	call LoadFontTilePatterns
	call LoadTextBoxTilePatterns
	ld hl, ClearSaveDataText
	call PrintText
	coord hl, 14, 7
	lb bc, 8, 15
	ld a, NO_YES_MENU
	ld [wTwoOptionMenuID], a
	ld a, TWO_OPTION_MENU
	ld [wTextBoxID], a
	call DisplayTextBoxID
	ld a, [wCurrentMenuItem]
	and a
	jp z, Init
	callba ClearSAV
	jp Init

DoClearSaveDialogue2:
	call ClearScreen
	call RunDefaultPaletteCommand
	call LoadFontTilePatterns
	call LoadTextBoxTilePatterns
	call EnableAutoTextBoxDrawing
	ld hl, ClearSaveDataText2
	call PrintText
;	callba ClearSAV; uncomment this line to go full-savage
	jp Init

ClearSaveDataText:
	TX_FAR _ClearSaveDataText
	db "@"
ClearSaveDataText2:
	TX_FAR _ClearSaveDataText2
	db "@"
