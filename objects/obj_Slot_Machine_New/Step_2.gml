//calc total active rows
if (active_calc){
	active_total = 0;
	for(var i = 0; i<5; i++){
		if (active[i] == 1) active_total++;
	}
}
active_calc = false;

if(spawn == true){
	show_debug_message(string(global.room_curr));
	var _to_spawn;
	var _choice;
	switch(global.Dungeon[global.room_curr]){
		case DUN_SYMBOL.GREY: _choice = irandom(global.event_num-1);
			switch(_choice){
				case EVENT.ALTAR: _to_spawn = obj_Altar;
					break;
			}
			break;
		
		case DUN_SYMBOL.RED: _choice = irandom(global.mon_basic_num-1);
			switch(_choice){
				case MON_BASIC.EYE: _to_spawn = obj_Monster_Eyeball;
					break;
			}
			break;
		
		case DUN_SYMBOL.BLUE: _choice = irandom(global.mon_elite_num-1);
			switch(_choice){
				case MON_ELITE.EYE: _to_spawn = obj_Monster_Elite_Eyeball;
					break;
			}
			break;
	}
	show_debug_message("To choice roll was:" + string(_choice));
	instance_create_layer(obj_Spawner.x, obj_Spawner.y,"Spawns", _to_spawn);
	spawn = false;
}
