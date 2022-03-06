	/// @desc Reel Navigation
if(initialized){
	if(!output_selected){
		for(var i=0;i<num_items;++i){
			var _type, _subtype;
			if(randomized)_type = irandom_range(1,3);
			else _type = i+1;

			switch(_type){
				case TYPE.MONEY: _subtype = global.num_moneys;break;
				case TYPE.WEAPON: _subtype = global.num_weapons;break;
				case TYPE.DEFENSE: _subtype = global.num_defenses;break;
			}
			array_push(pick,[_type,irandom(_subtype-1)]);
		}
	}
	if(!menu){
		if(temp_display != -1) instance_destroy(temp_display);
		global.Manager = -1;
		instance_destroy();
	}

	//Change Active Reel Selection
	if(!picking){
		if(keyboard_check_pressed(ord("W"))){
			selected[active]++;
			if (selected[active] >= reel_len[active]) selected[active] = 0;
		}
		if(keyboard_check_pressed(ord("S"))){
			selected[active]--;
			if (selected[active] < 0) selected[active] = reel_len[active]-1;
		}
	}

	//Change which Reel is active
	if(keyboard_check_pressed(ord("D"))){
		if(picking){
			if(menu_picking){
				menu_sel++;
				if(menu_sel>2)menu_sel = 0;
			}
			else{
				pick_sel++;
				if(pick_sel>=(num_items))pick_sel = 0;
			}
		}else{
			active++;
			if (active > 2) active = 0;
		}
	}
	if(keyboard_check_pressed(ord("A"))){
		if(picking){
			if(menu_picking){
				menu_sel--;
				if(menu_sel<0)menu_sel = 2;
			}
			else{
				pick_sel--;
				if(pick_sel<0)pick_sel = num_items-1;
			}
		}else{
			active--;
			if (active < 0) active = 2;
		}
	}


	if(keyboard_check_pressed(vk_enter)){
		if(picking){
			if(menu_picking){
				switch(menu_sel){
					case 0: mode = MODE.ADD;
						menu_picking = false;
						global.money -= 20;
						break;
					case 1: mode = MODE.SWAP;
						menu_picking = false;
						global.money -= 30;
						break;
					case 2: menu = false;
						menu_picking = false;
						picking = false;
						break;
				}
			}
			else{
				to_add = pick[pick_sel];
				add_symbol = Symbol_Type(pick[pick_sel]);
				picking = false;
			}
		}
		else{
			switch(mode){
				case MODE.ADD: Symbol_Add(active,selected[active],to_add);
					break;
				case MODE.REMOVE: Symbol_Remove(active,selected[active]);
					break;
				case MODE.SWAP: Symbol_Swap(active,selected[active],to_add);
					break;
			}
			menu = false;
			if(instance_exists(obj_Slot_Machine_New))obj_Slot_Machine_New.reels = global.Main_Reel_Curr;
		}
	}
}
