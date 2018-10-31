; super rod data
; format: map, pointer to fishing group
SuperRodData:
	dbw PALLET_TOWN, FishingGroup1
	dbw VIRIDIAN_CITY, FishingGroup1
	dbw CERULEAN_CITY, FishingGroup3
	dbw VERMILION_CITY, FishingGroup4
	dbw CELADON_CITY, FishingGroup5
	dbw FUCHSIA_CITY, FishingGroup10
	dbw CINNABAR_ISLAND, FishingGroup8
	dbw ROUTE_4, FishingGroup3
	dbw ROUTE_6, FishingGroup4
	dbw ROUTE_10, FishingGroup5
	dbw ROUTE_11, FishingGroup4
	dbw ROUTE_12, FishingGroup7
	dbw ROUTE_13, FishingGroup7
	dbw ROUTE_17, FishingGroup7
	dbw ROUTE_18, FishingGroup7
	dbw ROUTE_19, FishingGroup8
	dbw ROUTE_20, FishingGroup8
	dbw ROUTE_21, FishingGroup8
	dbw ROUTE_22, FishingGroup2
	dbw ROUTE_23, FishingGroup9
	dbw ROUTE_24, FishingGroup3
	dbw ROUTE_25, FishingGroup3
	dbw CERULEAN_GYM, FishingGroup3
	dbw VERMILION_DOCK, FishingGroup4
	dbw SEAFOAM_ISLANDS_4, FishingGroup8
	dbw SEAFOAM_ISLANDS_5, FishingGroup8
	dbw SAFARI_ZONE_EAST, FishingGroup6
	dbw SAFARI_ZONE_NORTH, FishingGroup6
	dbw SAFARI_ZONE_WEST, FishingGroup6
	dbw SAFARI_ZONE_CENTER, FishingGroup6
	dbw UNKNOWN_DUNGEON_2, FishingGroup9
	dbw UNKNOWN_DUNGEON_3, FishingGroup9
	dbw UNKNOWN_DUNGEON_1, FishingGroup9
	db $FF

; fishing groups
; number of monsters, followed by level/monster pairs
FishingGroup1:
	db 2
	db 15,HYPNO
	db 15,PIDGEOTTO

FishingGroup2:
	db 2
	db 15,ZUBAT
	db 15,PIDGEOTTO

FishingGroup3:
	db 3
	db 15,METAPOD
	db 15,ZUBAT
	db 15,KADABRA

FishingGroup4:
	db 2
	db 15,KADABRA
	db 15,MANKEY

FishingGroup5:
	db 2
	db 23,PONYTA
	db 15,DROWZEE

FishingGroup6:
	db 4
	db 15,DODRIO
	db 15,KADABRA
	db 15,METAPOD
	db 15,DROWZEE

FishingGroup7:
	db 4
	db 5,HYPNO
	db 15,KADABRA
	db 15,ZUBAT
	db 15,ONIX

FishingGroup8:
	db 4
	db 15,GOLEM
	db 15,BEEDRILL
	db 15,MANKEY
	db 15,ZUBAT

FishingGroup9:
	db 4
	db 23,OMASTAR
	db 23,WEEZING
	db 23,SANDSLASH
	db 23,KABUTOPS

FishingGroup10:
	db 4
	db 23,WEEZING
	db 15,KADABRA
	db 15,ZUBAT
	db 15,ONIX
