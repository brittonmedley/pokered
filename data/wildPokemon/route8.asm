Route8Mons:
	db $0F
	IF DEF(_RED)
		db 18,PARASECT
		db 18,ZAPDOS
		db 17,EEVEE
		db 16,WEEDLE
		db 20,PARASECT
		db 20,ZAPDOS
		db 19,EEVEE
		db 17,WEEDLE
		db 15,WEEDLE
		db 18,WEEDLE
	ENDC
	IF DEF(_BLUE)
		db 18,PARASECT
		db 18,GOLBAT
		db 17,RATTATA
		db 16,MEW 
		db 20,PARASECT
		db 20,GOLBAT
		db 19,RATTATA
		db 17,MEW 
		db 15,MEW 
		db 18,MEW 
	ENDC
	db $00
