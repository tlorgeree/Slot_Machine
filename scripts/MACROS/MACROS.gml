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
	SWORD = 0,
	P_SWORD =1,
}

enum DEFENSE {
	SHIELD = 0,
	P_SHIELD = 1,
}
enum MONEY {
	COIN = 0,
	P_COIN = 1,
}
enum BLANK {
	BASE = 0
}
enum DUN_SYMBOL {
	GREY = 0,
	RED = 1,
	BLUE = 2,
	BOSS = 3
}

//Room Types
enum EVENT{
	ALTAR = 0
}
enum MON_BASIC{
	EYE = 0,
	SLIME = 1,
}	
enum MON_ELITE{
	EYE = 0,
	SLIME = 1,
}
enum MON_BOSS{
	EYE = 0,
	SLIME = 1,
}

//Slot Modes
enum SLOT_MODE{
	NULL = -1,
	BATTLE = 0,
	EVENT = 1,
}

//Reel Manager
enum MODE{
	ADD = 0,
	REMOVE = 1,
	SWAP = 2,
}
enum STATUS{
	POISON = 0,
	FREEZE = 1,
	BURN = 2
}