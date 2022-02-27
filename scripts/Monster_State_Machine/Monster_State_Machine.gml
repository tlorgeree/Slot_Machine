function Monster_State_Attack(){
	
	if(global.Defenses>=damage) global.Defenses -= damage;
	else{
		damage-=global.Defense_Payout;
		global.money -= damage;
		global.Defenses = 0;
	}
	show_debug_message("Dealt " + string(damage) +" damage");
	
	acted = true;
	state = -1;
}