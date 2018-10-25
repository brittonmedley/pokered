DisplayReviveMenu::
	ld a, BANK(GoBack)
	ld [H_LOADEDROMBANK], a
	ld [MBC1RomBank], a


RedisplayReviveMenu::
	call SaveScreenTilesToBuffer2 ; copy background from wTileMap to wTileMapBackup2
	callba DrawReviveMenu
	call UpdateSprites ; ???
.loop
	call HandleMenuInput ; zeros a
	ld b, a ; zeros b
.checkIfUpPressed
	bit 6, a ; was Up pressed?
	jr z, .checkIfDownPressed
	ld a, [wCurrentMenuItem] ; menu selection
	and a
	jr nz, .loop
	ld a, [wLastMenuItem]
	and a
	jr nz, .loop
; if the player pressed tried to go past the top item, wrap around to the bottom
	ld a, 1 ; there are 7 menu items with the pokedex, so the max index is 6
	jr nz, .wrapMenuItemId
.wrapMenuItemId
	ld [wCurrentMenuItem], a
	call EraseMenuCursor
	jr .loop
.checkIfDownPressed
	bit 7, a
	jr z, .buttonPressed
; if the player  tried to go past the bottom item, wrap around to the top
	ld a, [wCurrentMenuItem]
	ld c, 2 ; there are 7 menu items with the pokedex
	jr nz, .checkIfPastBottom
	dec c ; there are only 2 items
.checkIfPastBottom
	cp c
	jr nz, .loop
	xor a;	ld a, [wLastMenuItem]
	jr .wrapMenuItemId
.buttonPressed ; A, B, or Start button pressed
	call PlaceUnfilledArrowMenuCursor
	ld a, [wCurrentMenuItem]
	ld a, b
	and %00000010 ; was the B button pressed?
	jp nz, GoBack
	ld a, [wCurrentMenuItem]
;	jr nz, .useMenuItem
;.useMenuItem
	cp 0
	jp z, UseRevive
	cp 1
	jp z, UseMaxRevive

UseRevive:
; From home.asm
; AddNTimes::
; add bc to hl a times
	ld hl, wPartyMon1MaxHP
	ld bc, wPartyMon2 - wPartyMon1
	ld a, [wWhichPokemon]
	call AddNTimes						; hl is now wPartyMonXMaxHP, X = wWichPokemon
	ld a, [hli] ;load max hp
	srl a ; shist right -> half the max HP
	push hl
	push af
	ld [wHPBarNewHP], a ; load the screen number
	ld hl, wPartyMon1HP
	ld bc, wPartyMon2 - wPartyMon1
	ld a, [wWhichPokemon]
	call AddNTimes						; hl is now wPartyMonXMaxHP, X = wWichPokemon
	pop af
	ld [hl], a						; load PartyMonXHP with [hli] from above
	pop hl
	ld a, [hl]
	rr a
	push af
	ld [wHPBarNewHP], a ; load the screen number
	ld hl, wPartyMon1HP
	ld bc, wPartyMon2 - wPartyMon1
	ld a, [wWhichPokemon]
	call AddNTimes						; hl is now wPartyMonXMaxHP, X = wWichPokemon
	pop af
	inc hl
	ld [hl], a
	ld [wHPBarNewHP+1], a
;	ld a, $ff
;	ld [wUsedRevive], a
	ld a, SFX_HEAL_HP
	call PlaySoundWaitForCurrent
	ld c, 50
	call DelayFrames
	call DisplayRevivedMessage
	ld a, REVIVE
	ld [wcf91], a
	ld a, 1
	ld [wItemQuantity], a
;	ld a, [wWhichPokemon]
	push af
	call FindItemIndex
	ld hl, wNumBagItems
	call RemoveItemFromInventory
	pop af
	ld [wWhichPokemon], a
	ret

UseMaxRevive:
	ld hl, wPartyMon1MaxHP
	ld bc, wPartyMon2 - wPartyMon1
	ld a, [wWhichPokemon]
	call AddNTimes						; hl is now wPartyMonXMaxHP, X = wWichPokemon
	ld a, [hli]
	push hl
	push af
	ld [wHPBarNewHP], a ; load the screen number
	ld hl, wPartyMon1HP
	ld bc, wPartyMon2 - wPartyMon1
	ld a, [wWhichPokemon]
	call AddNTimes						; hl is now wPartyMonXMaxHP, X = wWichPokemon
	pop af
	ld [hl], a
	pop hl
	ld a, [hl]
	push af
	ld hl, wPartyMon1HP
	ld bc, wPartyMon2 - wPartyMon1
	ld a, [wWhichPokemon]
	call AddNTimes						; hl is now wPartyMonXHP, X = wWichPokemon
	pop af
	inc hl
	ld [hl], a
	ld [wHPBarNewHP+1], a
;	ld a, $ff
;	ld [wUsedRevive], a
	ld a, SFX_HEAL_HP
	call PlaySoundWaitForCurrent
	ld c, 50
	call DelayFrames
	call DisplayRevivedMessage
	ld a, MAX_REVIVE
	ld [wcf91], a
	ld a, 1
	ld [wItemQuantity], a
	ld a, [wWhichPokemon]
	push af
	call FindItemIndex
	ld hl, wNumBagItems
	call RemoveItemFromInventory
	pop af
	ld [wWhichPokemon], a

	ret


GoBack:
;	ld a, $00
;	ld [wUsedRevive], a
	SetEvent EVENT_CANCEL_REVIVE
	call LoadScreenTilesFromBuffer2 ; copy background from wTileMap to wTileMapBackup2
	call Delay3
	ret
