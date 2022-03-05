/// @desc Draw the reels to the screens
draw_set_alpha(0.8);
draw_rectangle_color(0,0,2*room_x,2*room_y,c_dkgray,c_dkgray,c_dkgray,c_dkgray,0);
draw_set_alpha(1);
if(!picking){
	var blend = [c_grey,c_grey,c_grey];
	blend[active] = c_white;
	show_debug_message(string(selected[active]))
	for(var i = 0; i < 3; ++i){//draw the 3 reels to screen
		var _x, _y;
		switch(i){
			case 0: _x = room_x*(0.5); _y = room_y;
				break;
			case 1: _x = room_x; _y = room_y;
				break;
			case 2: _x = room_x*(1.5); _y = room_y;
				break;
		}
		for(var j = -2; j <= 2; ++j){
			var _sym;
			var jj = j + selected[i];
			if(jj<0) jj = (reel_len[i]-1)+(selected[i] + j);
			else if (jj > (reel_len[i]-1)) jj = (selected[i]+j) - (reel_len[i]);
			var curr_draw = global.Main_Reel_Curr[i][jj];
			var tile = spr_Tile;
			if(jj == 0) tile = spr_Tile_First;

			switch(abs(j)){ //draw the tiles
				case 0: draw_sprite_ext(tile,0,_x,_y,(3-abs(j))/3,(3-abs(j))/3,0,blend[i],1);
						draw_sprite(spr_Select_Outline,0,_x,_y);
					break;
				case 1: draw_sprite_ext(tile,0,_x,_y + (20*j),(3-abs(j))/3,(3-abs(j))/3,0,blend[i],1);
					break;
				case 2: draw_sprite_ext(tile,0,_x,_y + (16*j),(3-abs(j))/3,(3-abs(j))/3,0,blend[i],1);
					break;
			}		
			switch(curr_draw[0]){// Draw the symbols
				case TYPE.BLANK: _sym = spr_Slot_Empty;
					break;
				case TYPE.MONEY: switch(curr_draw[1]){
					case MONEY.COIN: _sym = spr_Slot_Gold;
						break;
				}break;
				case TYPE.WEAPON: switch(curr_draw[1]){
					case WEAPON.SWORD: _sym = spr_Slot_Sword;
						break;
				}break;
				case TYPE.DEFENSE: switch(curr_draw[1]){
					case DEFENSE.SHIELD: _sym = spr_Slot_Shield;
						break;
				}break;
			}

			switch(abs(j)){ //draw the tiles
				case 0: draw_sprite_ext(_sym,0,_x,_y,(3-abs(j))/3,(3-abs(j))/3,0,blend[i],1);
					break;
				case 1: draw_sprite_ext(_sym,0,_x,_y + (20*j),(3-abs(j))/3,(3-abs(j))/3,0,blend[i],1);
					break;
				case 2: draw_sprite_ext(_sym,0,_x,_y + (16*j),(3-abs(j))/3,(3-abs(j))/3,0,blend[i],1);
					break;
			}
		}
		if(mode == MODE.ADD)||(mode==MODE.SWAP){
			draw_sprite(spr_Tile_New,0,room_x, view_get_hport(0)/8);
			draw_sprite(add_symbol,0,room_x, view_get_hport(0)/8);
		}
	}
}else{
	if(menu_picking){
		var blend = [c_grey,c_grey,c_grey];
		blend[menu_sel] = c_white;
		var _sym,_text;
		for(var p =0;p<3;p++){	
			switch(p){
				case 0: _x = room_x*(0.5); _y = room_y;
					_sym = spr_UI_Add;
					_text = "Add a new Symbol";
					break;
				case 1: _x = room_x; _y = room_y;
					_sym = spr_UI_Swap;
					_text = "Swap a Symbol";
					break;
				case 2: _x = room_x*(1.5); _y = room_y;
					_sym = spr_UI_Leave;
					_text = "Exit the shop"
					break;
			}
			draw_sprite_ext(spr_Tile,0,_x,_y,1,1,0,blend[p],1);//Draw back tile
			draw_sprite_ext(_sym,0,_x,_y,1,1,0,blend[p],1);//Draw back tiles
			draw_set_halign(fa_center);
			draw_set_color(c_red);
			if (p == menu_sel) draw_text(room_x,room_y/4,_text);
			draw_set_halign(fa_left);
			draw_set_color(c_white);
		}
	}
	else{
		var blend = [c_grey,c_grey,c_grey];
		var _text;
		switch(mode){
			case MODE.ADD:_text = "Add a\n";
				break;
			case MODE.SWAP:_text = "Swap with a\n";
				break;
			case MODE.REMOVE:_text = "Remove a\n";
				break;
		}
		switch(pick_sel){
			case 0: _text += "Money Symbol";break;
			case 1: _text += "Weapon Symbol";break;
			case 2: _text += "Defense Symbol";break;
		}
		blend[pick_sel] = c_white;
		for(var p =0;p<3;p++){	
			switch(p){
				case 0: _x = room_x*(0.5); _y = room_y;
					break;
				case 1: _x = room_x; _y = room_y;
					break;
				case 2: _x = room_x*(1.5); _y = room_y;
					break;
			}
			draw_sprite_ext(spr_Tile_New,0,_x,_y,1,1,0,blend[p],1);//Draw back tiles
		
			var _symb;
			switch(pick[p][0]){// Draw the symbols
				case TYPE.BLANK: _symb = spr_Slot_Empty;
					break;
				case TYPE.MONEY: switch(pick[p][1]){
					case MONEY.COIN: _symb = spr_Slot_Gold;
						break;
				}break;
				case TYPE.WEAPON: switch(pick[p][1]){
					case WEAPON.SWORD: _symb = spr_Slot_Sword;
						break;
				}break;
				case TYPE.DEFENSE: switch(pick[p][1]){
					case DEFENSE.SHIELD: _symb = spr_Slot_Shield;
						break;
				}break;
			}
			draw_sprite_ext(_symb,0,_x,_y,1,1,0,blend[p],1);//Draw back tiles
			draw_set_halign(fa_center);
			draw_set_color(c_red);
			if (p == pick_sel) draw_text(room_x,room_y/4,_text);
			draw_set_halign(fa_left);
			draw_set_color(c_white);
		}
		
	}
	
}
