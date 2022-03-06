/// @desc
if(keyboard_check_pressed(ord("R"))) show_debug_message(string(room_width) + " " +string(room_height));
if(global.room_change){
	//Do Rewards
	if(global.mon_reward){
		Monster_Reward(global.Dungeon[global.room_curr]);
		global.mon_reward = false;
	}
	global.curr_room_complete = true;
	if(global.room_curr == 3){
		room_goto(rm_Dungeon_Slot);
		global.room_curr = -1;
	}else{
		++global.room_curr;

		if (global.room_curr!=0){
			++global.rooms_completed;
		}
	}
	if (instance_exists(obj_Slot_Machine_New)){
		obj_Slot_Machine_New.p_turn = true;
	}
	global.room_change = false;
	//Reset Temp vairables
	global.Defenses = 0;
	show_debug_message("Room is: "+ string(global.room_curr));
	var _to_spawn;
	var _choice;
	switch(global.Dungeon[global.room_curr]){
		case DUN_SYMBOL.GREY: _choice = irandom(global.event_num-1);
			switch(_choice){
				case EVENT.ALTAR: _to_spawn = obj_Event_Altar;
					break;
			}
			obj_Slot_Machine_New.slot_mode = SLOT_MODE.EVENT;
			break;
		
		case DUN_SYMBOL.RED: _choice = irandom(global.mon_basic_num-1);
			switch(_choice){
				case MON_BASIC.EYE: _to_spawn = obj_Monster_Eyeball;
					break;
				case MON_BASIC.SLIME: _to_spawn = obj_Monster_Slime;
					break;
			}
			obj_Slot_Machine_New.slot_mode = SLOT_MODE.BATTLE;
			break;
		
		case DUN_SYMBOL.BLUE: _choice = irandom(global.mon_elite_num-1);
			switch(_choice){
				case MON_ELITE.EYE: _to_spawn = obj_Monster_Elite_Eyeball;
					break;
				case MON_ELITE.SLIME: _to_spawn = obj_Elite_Slime;
					break;
			}
			obj_Slot_Machine_New.slot_mode = SLOT_MODE.BATTLE;
			break;
		case DUN_SYMBOL.BOSS: _choice = irandom(global.mon_boss_num-1);
			switch(_choice){
				case MON_BOSS.EYE: _to_spawn = obj_Monster_Eyeball_Boss;
					break;
				case MON_BOSS.SLIME: _to_spawn = obj_Boss_Slime;
					break;
			}
			obj_Slot_Machine_New.slot_mode = SLOT_MODE.BATTLE;
			break;
	}

	instance_create_depth(obj_Spawner.x, obj_Spawner.y,0, _to_spawn);

}