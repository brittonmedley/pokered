; the max index of wCurMap is 247, hence ceil(247/8) = 31 bytes for data
; This means theres a 1-to-1 maping between wCurMap index and

CheckMonCatchable:
	CheckEvent EVENT_GOT_POKEDEX ; if player doesnt have pokedex, dont count the encounter
	ret z
	CheckEvent EVENT_ENABLE_NUZLOCKE
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
	push af ;   ld [hl], a
	ld a, [wCurMap]	; 0 < wCurMap < 247
;.checkMtMoon
	cp MT_MOON_1 | MT_MOON_2 | MT_MOON_3 ; bit 3B, 3C, 3D
	jr nz, .checkMansion ; if not in mt moon
	ld a, [wEncounterFlags + 7] ; bits 37-3D
	or %00111000
	ld [wEncounterFlags + 7], a
	jp .checkDupe
.checkMansion
	cp  MANSION_1 | MANSION_2 | MANSION_3 | MANSION_4
	jr nz, .checkPokemonTower
;	for mansion 1
	ld a, [wEncounterFlags + 20]
	or %00001000
	ld [wEncounterFlags + 20], a
;	for mansion 2,3
	ld a, [wEncounterFlags + 26]
	or %00000011
	ld [wEncounterFlags + 26], a
;	for mansion b1
	ld a, [wEncounterFlags + 27]
	or %10000000
	ld [wEncounterFlags + 27], a
	jr .checkDupe
.checkPokemonTower
	cp  POKEMONTOWER_1 | POKEMONTOWER_2 | POKEMONTOWER_3 | POKEMONTOWER_4 | POKEMONTOWER_5 | POKEMONTOWER_6 | POKEMONTOWER_7
	jr nz, .checkRockTunnel
;	for pokemon tower 1, 2
	ld a, [wEncounterFlags + 26]
	or %00000011
	ld [wEncounterFlags + 26], a
;	for pokemon tower 3,4,5,6,7
	ld a, [wEncounterFlags + 27]
	or %11111000
	ld [wEncounterFlags + 27], a
	jr .checkDupe
.checkRockTunnel
	cp ROCK_TUNNEL_1 | ROCK_TUNNEL_2
	jr nz, .checkSeaFoamCaves
	ld a, [wEncounterFlags + 10]
	or %01000000
	ld [wEncounterFlags + 10], a
	ld a, [wEncounterFlags + 29]
	or %10000000
	ld [wEncounterFlags + 29], a
	jr .checkDupe
.checkSeaFoamCaves
	cp SEAFOAM_ISLANDS_2 | SEAFOAM_ISLANDS_3 | SEAFOAM_ISLANDS_4 | SEAFOAM_ISLANDS_5
	jr nz, .checkUnknownDungeon
	ld a, [wEncounterFlags + 19]
	or %00000001
	ld [wEncounterFlags + 19], a
	ld a, [wEncounterFlags + 20]
	or %11000000
	ld [wEncounterFlags + 20], a
	jr .checkDupe
.checkUnknownDungeon
	cp UNKNOWN_DUNGEON_1 | UNKNOWN_DUNGEON_2 | UNKNOWN_DUNGEON_3
	jr nz, .checkVictoryRoad
	ld a, [wEncounterFlags + 28]
	or %01110000
	ld [wEncounterFlags + 28], a
	jr .checkDupe
.checkVictoryRoad
	cp VICTORY_ROAD_1 | VICTORY_ROAD_2 | VICTORY_ROAD_3
	jr nz, .singleMap
	ld a, [wEncounterFlags + 13]
	or %00001000
	ld [wEncounterFlags + 13], a
	ld a, [wEncounterFlags + 24]
	or %00100010
	ld [wEncounterFlags + 24], a
	jr .checkDupe
.singleMap
	pop af
	ld [hl], a
	jr .checkDupeSkipPop
.checkDupe
	pop af
.checkDupeSkipPop
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
	jr z, .noDupe ; if no, can catch the mon
	SetEvent EVENT_DUPE_MON
.noDupe
	ret
