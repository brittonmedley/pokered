; the max index of wCurMap is 255, hence 255/8 = 31 bytes for data
; This means theres a 1-to-1 maping between wCurMap index and

CheckMonCatchable:
	ResetEvent EVENT_ENABLE_POKEBALLS ; default disable pokeballs
	ld a, [wCurMap]
	ld hl, wEncountersEvents
	ld b, 8
.loop ; get modulo and increase by quotient
	cp 8
	jr c, .done ; if [wCurMap] > 8
	sub 8
	inc hl ; wCurMap could be in the next byte
.done
	ld b, 1 ; %00000001
.loop2
	sla b ; b<<1 shift one bit left
	dec a
	jr z, .done2 ; is a 0?
	jr .loop2
;	and b ; A <- A AND B
.done2
	ld a, [hl] ; load the encounter flags
	and a
	ret nz ; if it was already set a pokemon has been encountered
	or b ; otherwise set bit high
	ld [hl], b
	SetEvent EVENT_ENABLE_POKEBALLS
	ret
