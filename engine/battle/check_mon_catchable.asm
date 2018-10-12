; the max index of wCurMap is 247, hence ceil(247/8) = 31 bytes for data
; This means theres a 1-to-1 maping between wCurMap index and

CheckMonCatchable:
	CheckEvent EVENT_GOT_POKEDEX ; if player doesnt have pokedex, dont count the encounter
	ret z


	ResetEvent EVENT_FIRST_ENCOUNTER ; default to "didn't have encounter"
	ResetEvent EVENT_DUPE_MON ; default to "didn't have encounter"
	ld a, [wCurMap]	; 0 < wCurMap < 247
	ld hl, wEncounterFlags ; locations 0-7
.loop
; if [wCurMap] < 8
	cp 8 ; compare a, which is [wCurMap], to 8
	jr c, .done ; if true
	inc hl
	sub 8 ; subract 8 from a
; else continue loop
	jr .loop
.done
	ld b, 1 ; load %00000001 into b
.loop2
	cp 0 ; compare a to 0
	jr z, .done2
	sla b
	dec a
	jr .loop2
.done2 ; b is now something like %00000100 (if A was 2)
	ld a, [hl] ; A <- (wEncounterFlags + A/8), 1byte
    and b ; A <- A AND B ; GETs the value of the b-th bit in a
; if the bit was already high
    ret nz ; dont enable pokeballs
; if the bit is low it IS the first encounter
	ld a, [hl] ; A <- (wEncounterFlags + A/8), 1byte
    or b ; A <- A or B ; SETs the value of the b-th bit in a
	push hl
	push af
    SetEvent EVENT_FIRST_ENCOUNTER

; now, check for dupe
	ld a, [wEnemyMonSpecies2]
	ld [wd11e], a
; Add the caught Pokémon to the Pokédex.
	predef IndexToPokedex
	ld a, [wd11e]
	dec a
	ld c, a
	ld b, FLAG_TEST
	ld hl, wPokedexOwned
	predef FlagActionPredef
	ld a, c
	and a ; was the Pokémon already in the Pokédex?
	jr z, .updateEncounterFlags ; if no, can catch the mon
	SetEvent EVENT_DUPE_MON
	pop af
	pop hl
	ret


.updateEncounterFlags
    pop af
    pop hl
    ld [hl], a ; update wEncounterFlags
	ret
