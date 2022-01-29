/// @desc
for (var i = 0; i<reel_num;++i){
	
	for (var j = 0; j<symbol_num;++j){
		var _symbol;
		
		switch (reels_spun[i][j]) {
			case SYMBOL.BLANK: _symbol = spr_Slot_Blank;  break;
			case SYMBOL.MONEY: _symbol = spr_Slot_Money; break;
		}
		Draw_Slot_Position(_symbol, 0, i, j);
	}
}


if (pay_anim) && (!spin_anim){
	if (anim_ind<array_length(payout)){//if there are payouts, animate
		draw_set_alpha(anim_timer/60); //flash effect
		switch (payout[anim_ind,0]){ //controller for each row
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
		if (!global.gamepaused) anim_timer--; //pause animation with pause
		if (anim_timer<=0){ //if done animating, check next row
			anim_ind++;
			anim_timer = 60;
			global.money += 1000;
			
		}
	}else Reset_Slot_State();
	
}

draw_set_alpha(1);

#region Messages
if (no_money){ //Tell player they can't afford the action
	draw_set_alpha(msg_timer/60);
	draw_set_color(c_red);
	draw_set_halign(fa_center);
	if (msg_timer > 0){
		draw_text_transformed(room_width/2, room_height/2, "Not enough money", 1,1,0);
		if (!global.gamepaused) msg_timer--;//pause timer with pause
	}
	else no_money = false;
}
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
#endregion

#region Spin Animation
if (spin_anim){
	for(var i = 0; i<reel_num; ++i){
		if (spin_timer[i] <=0) continue; //hold reels done spinning
		if (displacement[i] + spin_spd[i] > SLOT_H){
			displacement[i] -= SLOT_H;
			var _inc = 1;
			var _reel_len = array_length(last_spin[i]);
			for(var j = 0; j < _reel_len; ++j){
				if (j + _inc >= _reel_len) _inc = -j;
				var _index = j + _inc;
				last_spin[i][j] = last_spin[i][_index];
			}	
		}
		else{ 
			var _symbol;
			for(var k = 0; k<reel_num;++k){
				for(var l = -1; l <reel_num;++l){
					if l == -1{
						switch (last_spin[k][array_length(last_spin[k])-1]) {
							case SYMBOL.BLANK: _symbol = spr_Slot_Blank;  break;
							case SYMBOL.MONEY: _symbol = spr_Slot_Money; break;
						}
					}
					else{
						switch (last_spin[k][l]) {
							case SYMBOL.BLANK: _symbol = spr_Slot_Blank;  break;
							case SYMBOL.MONEY: _symbol = spr_Slot_Money; break;
						}
					}
				}
			}
			displacement[i] += spin_spd[i];
			Draw_Slot_Position_Ext(_symbol,0,i,-1,displacement[i]);
			Draw_Slot_Position_Ext(_symbol,0,i,0,displacement[i]);
			Draw_Slot_Position_Ext(_symbol,0,i,1,displacement[i]);
			Draw_Slot_Position_Ext(_symbol,0,i,2,displacement[i]);
		}
			
	}
	//decrement spinf timer for each wheel
	for(var t = 0; t <reel_num;++t){
		if (spin_timer[t]>0) spin_timer[t]--;
	}
	if (spin_timer[0] == 0 && spin_timer[0]==spin_timer[1]
		&& spin_timer[0]==spin_timer[2]){
		spin_anim = false;
		if !pay_anim Reset_Slot_State();//reset vars if no payout
	}
}
draw_self();//draw the board sprite to cover up the others

#endregion