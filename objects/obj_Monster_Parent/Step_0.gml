/// @desc
if (hp <= 0){
	state = -1;
	is_turn = false;
	if(global.room_curr < 3){ 
		global.room_change = true;
		global.mon_reward = true;
	}
	else{
		global.room_curr = -1;
		room_goto(rm_Dungeon_Slot)
	}
	obj_Slot_Machine_New.slot_mode = SLOT_MODE.NULL;
	global.money += reward;
	instance_destroy();

}
if(is_turn){
	if(status[STATUS.POISON]>0) show_debug_message("AAAHHHH I'm Poisoned: " +string(status[STATUS.POISON]));
	if (!acted && state == -1){
		damage = irandom_range(1,damage_max);
		show_debug_message("I'm ready to attack");
		state = Monster_State_Attack;
		attack_message = true;
		msg_timer = 60;
	}
	if(acted){
		is_turn = false;
		status_calc = false;

	}
}

if((state != -1) && (!acted)) script_execute(state);

