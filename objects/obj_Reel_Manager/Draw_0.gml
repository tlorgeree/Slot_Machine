/// @desc Draw the reels to the screens
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
		var curr_draw = global.Main_Reel_Layout[i][jj];
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
}