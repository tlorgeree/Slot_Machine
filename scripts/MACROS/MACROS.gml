//Macro List
#macro SLOT_W 62
#macro SLOT_H 32

//Symbols
enum TYPE {
	BLANK = 0,
	MONEY = 1,
	WEAPON = 2,
	DEFENSE = 3
}
enum WEAPON {
	SWORD = 0
}

enum DEFENSE {
	SHIELD = 0
}
enum MONEY {
	COIN = 0
}
enum BLANK {
	BASE = 0
}
enum DUN_SYMBOL {
	GREY = 0,
	RED = 1,
	BLUE = 2
}

//Room Types
enum EVENT{
	ALTAR = 0
}
enum MON_BASIC{
	EYE = 0
}	
enum MON_ELITE{
	EYE = 0
}
enum MON_BOSS{
	EYE = 0
}

//Slot Modes
enum SLOT_MODE{
	NULL = -1,
	BATTLE = 0,
	EVENT = 1,
}