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

if (pay_anim){
	//show_debug_message(string(anim_ind<array_length(payout)))
	if (anim_ind<array_length(payout)){
		draw_set_alpha(anim_timer/60);
		switch (payout[anim_ind,0]){
			case 1: Draw_Slot_Position(spr_Highlight_Green,0,0,1);
					Draw_Slot_Position(spr_Highlight_Green,0,1,1);
					Draw_Slot_Position(spr_Highlight_Green,0,2,1);
					break;
			case 2: Draw_Slot_Position(spr_Highlight_Green,0,0,0);
					Draw_Slot_Position(spr_Highlight_Green,0,1,0);
					Draw_Slot_Position(spr_Highlight_Green,0,2,0);
					break;
			case 3: Draw_Slot_Position(spr_Highlight_Green,0,0,2);
					Draw_Slot_Position(spr_Highlight_Green,0,1,2);
					Draw_Slot_Position(spr_Highlight_Green,0,2,2);
					break;
			case 4: Draw_Slot_Position(spr_Highlight_Green,0,0,0);
					Draw_Slot_Position(spr_Highlight_Green,0,1,1);
					Draw_Slot_Position(spr_Highlight_Green,0,2,2);
					break;		
			case 5: Draw_Slot_Position(spr_Highlight_Green,0,0,2);
					Draw_Slot_Position(spr_Highlight_Green,0,1,1);
					Draw_Slot_Position(spr_Highlight_Green,0,2,0);
					break;		
		}
		anim_timer--;
		if (anim_timer<=0){ 
			anim_ind++;
			//anim_timer = 60;
			global.money += 1000;
		}
	}
	else{
		pay_anim = false;
		calc_done = true;
		spin_anim = false;
		payout = [];
		anim_timer = 0;
		anim_ind = 0;
	}
}
draw_set_alpha(1);
show_debug_message(string(payout));