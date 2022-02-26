/// @desc
if (hp <= 0){
	global.curr_room_complete = true;
	if(global.room_curr == 3){
		room_goto(rm_Dungeon_Slot);
	}
	else{
		++global.room_curr;
		++global.rooms_completed;
	}
	if (instance_exists(obj_Slot_Machine_New)){
		obj_Slot_Machine_New.slot_mode = SLOT_MODE.NULL;
	}
	instance_destroy();
	obj_Slot_Machine_New.spawn = true;
}