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
	obj_Dialogue.text=(Name + " dealt " + string(_dmg_dealt) +" damage.");
	
	acted = true;
	state = -1;
}

function Monster_Poisoned(){
	hp-=status[STATUS.POISON];
	status[STATUS.POISON]= floor(status[STATUS.POISON]/2);
	obj_Dialogue.text=(Name + " was poisoned!");
}

function Monster_Frozen(){
	if(status[STATUS.FREEZE]>=hp){
		acted = true;
		status[STATUS.FREEZE]= 0;
		obj_Dialogue.text=(Name + " is frozen!");
	}
}
function Monster_Burned(){
	//Moved to monster state attack
	obj_Dialogue.text=(Name + " was burned!");
}