Route12Mons:
	db $0F
	IF DEF(_RED)
		db 24,GOLEM
		db 25,PARASECT
		db 23,PARASECT
		db 24,LICKITUNG
		db 22,GOLEM
		db 26,LICKITUNG
		db 26,GOLEM
		db 27,PARASECT
		db 28,ELECTRODE
		db 30,ELECTRODE
	ENDC
	IF DEF(_BLUE)
		db 24,GASTLY
		db 25,PARASECT
		db 23,PARASECT
		db 24,LICKITUNG
		db 22,GASTLY
		db 26,LICKITUNG
		db 26,GASTLY
		db 27,PARASECT
		db 28,KAKUNA
		db 30,KAKUNA
	ENDC
	db $00
