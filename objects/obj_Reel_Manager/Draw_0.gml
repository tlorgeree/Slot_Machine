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
		else if (jj > (reel_len[i]-1)) jj = (selected[i]+j) - (reel_len[i]-1);
		var curr_draw = [];
		curr_draw = global.Main_Reel_Layout[active][jj];
		var tile = spr_Tile;
		if(jj == 0) tile = spr_Tile_First;
		draw_sprite_ext(tile,0,_x,_y+(24*j),(3-abs(j))/3,(3-abs(j))/3,0,blend[i],1);
		
	}
}