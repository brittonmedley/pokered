DrawReviveMenu:
	ld a, 2
	ld [wMaxMenuItem], a ; number of menu items
	coord hl, 0, 0
	ld b, 3
	ld c, 14
.drawTextBoxBorder
	call TextBoxBorder
	ld a, D_DOWN | D_UP | B_BUTTON | A_BUTTON
	ld [wMenuWatchedKeys], a
	ld a, $01
	ld [wTopMenuItemY], a ; Y position of first menu choice
	ld a, $01
	ld [wTopMenuItemX], a ; X position of first menu choice
;	ld a, [wBattleAndStartSavedMenuItem] ; remembered menu selection from last time
	ld a, 0 ;initialize menu item to the first item
	ld [wCurrentMenuItem], a
	ld a, 1
	ld [wLastMenuItem], a
	xor a
	ld [wMenuWatchMovingOutOfBounds], a
;	ld hl, wd730
;	set 6, [hl] ; no pauses between printing each letter
;	ld [wMaxMenuItem], a ; number of menu items
	coord hl, 2, 1
	ld de, ReviveMenuText
	call PrintReviveMenuItem
	ld de, MaxReviveMenuText
	call PrintReviveMenuItem
	ld hl, wd730
	res 6, [hl] ; turn pauses between printing letters back on
	ret


PrintReviveMenuItem:
	push hl
	call PlaceString
	pop hl
	ld de, SCREEN_WIDTH * 2
	add hl, de
	ret

ReviveMenuText:
	db   "REVIVE@"
MaxReviveMenuText:
	db "MAX REVIVE@"
