/// @desc
if (hp <= 0){
	state = -1;
	is_turn = false;
	if(global.room_curr < 3) global.room_change = true;
	else{
		global.room_curr = -1;
		room_goto(rm_Dungeon_Slot)
	}
	obj_Slot_Machine_New.slot_mode = SLOT_MODE.NULL;
	global.money += reward;
	instance_destroy();

}
if(is_turn){
	show_debug_message("I'M ALIVE AND ABLE TO DO");
	show_debug_message(string(acted));
	show_debug_message(string(state));
	if (!acted && state == -1){
		damage = irandom_range(1,damage_max);
		show_debug_message("I'm ready to attack");
		state = Monster_State_Attack;
		attack_message = true;
		msg_timer = 60;
	}
	if(acted){
		is_turn = false;

	}
}

if((state != -1) && (!acted)) script_execute(state);

