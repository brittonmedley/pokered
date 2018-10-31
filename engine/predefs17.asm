; this function temporarily makes the starters (and Ivysaur) seen
; so that the full Pokedex information gets displayed in Oak's lab
StarterDex:
	; for starter 1
	ld a, [wPokedexOwned + 12] ; EXEGGCUTE(101)
	or $ff
	ld [wPokedexOwned + 12], a ; EXEGGCUTE(101)
	; for starter 2
	ld a, [wPokedexOwned + 17] ; SNORLAX(142)
	or $ff
	ld [wPokedexOwned + 17], a ; SNORLAX(142)

	; for starter 3
	ld a, [wPokedexOwned + 16] ; FLAREON(135)
	or $ff
	ld [wPokedexOwned + 16], a ; FLAREON(135)

	predef ShowPokedexData
	xor a ; unset starter flags
	ld [wPokedexOwned + 16], a ; FLAREON(135)
	ld [wPokedexOwned + 17], a ; SNORLAX(142)
	ld [wPokedexOwned + 12], a ; EXEGGCUTE(101)
	ret
