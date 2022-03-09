function Monster_State_Attack(){
	var _dmg_dealt = damage;
	if(status[STATUS.BURN]>0){
		_dmg_dealt-=status[STATUS.BURN];
		status[STATUS.BURN]= floor(status[STATUS.BURN]/2);
	}
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

function Monster_Poisoned(){
	hp-=status[STATUS.POISON];
	status[STATUS.POISON]= floor(status[STATUS.POISON]/2);
}

function Monster_Frozen(){
	if(status[STATUS.FREEZE]>=hp){
		acted = true;
		status[STATUS.FREEZE]= 0;
		show_debug_message("I lost my turn");
	}
}
function Monster_Burned(){
	//Moved to monster state attack
}