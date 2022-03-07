function Monster_State_Attack(){
	var _dmg_dealt = damage;
	if(global.Defenses>=_dmg_dealt) global.Defenses -= _dmg_dealt;
	else{
		_dmg_dealt-=global.Defense_Payout;
		global.money -= _dmg_dealt;
		global.Defenses = 0;
	}
	show_debug_message("Dealt " + string(_dmg_dealt) +" damage");
	
	acted = true;
	state = -1;
}

function Monster_Poisoned(_int){
	hp-=status[STATUS.POISON];
	status[STATUS.POISON]= floor(status[STATUS.POISON]/2)
}

function Monster_Frozen(_int){
	if(status[STATUS.FREEZE]>=hp) acted = true;
	status[STATUS.FREEZE]= floor(status[STATUS.FREEZE]/2)
}
function Monster_Burned(_int){
	hp-=status[STATUS.BURN];
	status[STATUS.BURN]= floor(status[STATUS.BURN]/2)
}