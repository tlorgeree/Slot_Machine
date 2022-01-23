/// @desc

for (var i = 0; i<reel_num;++i){
	var _reel_len = array_length(reels[i]);
	
	for (var j = 0; j<_reel_len;++j){
		var _symbol;
		
		switch (reels_spun[i][j]) {
			case SYMBOL.BLANK: _symbol = spr_Slot_Blank;  break;
			case SYMBOL.MONEY: _symbol = spr_Slot_Money; break;
		}
		draw_sprite(_symbol, 0, slots[i].x, slots[i].y + (j * SLOT_H));
	}
}

if (no_money){
	
	draw_set_alpha(msg_timer/60);
	draw_set_color(c_red);
	draw_set_halign(fa_center);
	if (msg_timer > 0){
		draw_text_transformed(room_width/2, room_height/2, "Not enough money", 1,1,0);
		msg_timer--;
	}
	else {
		no_money = false;
		msg_timer = 60;
	}
}
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);