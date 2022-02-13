for (var i = 0; i<reel_num;++i){
	
	for (var j = 0; j<symbol_num;++j){
		var _symbol;
		
		switch (reels_spun[i][j][0]) {
			case TYPE.BLANK: switch(reels_spun[i][j][1]) {
				case BLANK.BASE: _symbol = spr_Slot_Empty; break;
			}break;
			case TYPE.MONEY: switch(reels_spun[i][j][1]) {
				case MONEY.COIN: _symbol = spr_Slot_Gold; break;
			}break;
			case TYPE.WEAPON: switch(reels_spun[i][j][1]) {
				case WEAPON.SWORD: _symbol = spr_Slot_Sword; break;
			}break;
			case TYPE.DEFENSE: switch(reels_spun[i][j][1]) {
				case DEFENSE.SHIELD: _symbol = spr_Slot_Shield; break;
			}break;
		}
		if(spin_timer[i] == 0) Draw_Slot_Position_New(_symbol, 0, i, j);
	}
}


if (pay_anim) && (!spin_anim){
	if (anim_ind<array_length(payout)){//if there are payouts, animate
		draw_set_alpha(anim_timer/60); //flash effect
		var _highlight = spr_Highlight_Green_New
		switch (payout[anim_ind,0]){ //controller for each row
			case 1: Draw_Slot_Position_New(_highlight,0,0,1);
					Draw_Slot_Position_New(_highlight,0,1,1);
					Draw_Slot_Position_New(_highlight,0,2,1);
					break;
			case 2: Draw_Slot_Position_New(_highlight,0,0,0);
					Draw_Slot_Position_New(_highlight,0,1,0);
					Draw_Slot_Position_New(_highlight,0,2,0);
					break;
			case 3: Draw_Slot_Position_New(_highlight,0,0,2);
					Draw_Slot_Position_New(_highlight,0,1,2);
					Draw_Slot_Position_New(_highlight,0,2,2);
					break;
			case 4: Draw_Slot_Position_New(_highlight,0,0,0);
					Draw_Slot_Position_New(_highlight,0,1,1);
					Draw_Slot_Position_New(_highlight,0,2,2);
					break;		
			case 5: Draw_Slot_Position_New(_highlight,0,0,2);
					Draw_Slot_Position_New(_highlight,0,1,1);
					Draw_Slot_Position_New(_highlight,0,2,0);
					break;		
		}
		if (!global.gamepaused) anim_timer--; //pause animation with pause
		if (anim_timer<=0){ //if done animating, check next row
			anim_ind++;
			anim_timer = 60;
			global.money += 1000;
			
		}
	}else Reset_Slot_State_New();
	
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
					var _check = last_spin[k][array_length(last_spin[k])-1];
					if l == -1{
						switch (_check[0]) {
							case TYPE.BLANK: switch(_check[1]) {
								case BLANK.BASE: _symbol = spr_Slot_Empty; break;
							}break;
							case TYPE.MONEY: switch(_check[1]) {
								case MONEY.COIN: _symbol = spr_Slot_Gold; break;
							}break;
							case TYPE.WEAPON: switch(_check[1]) {
								case WEAPON.SWORD: _symbol = spr_Slot_Sword; break;
							}break;
							case TYPE.DEFENSE: switch(_check[1]) {
								case DEFENSE.SHIELD: _symbol = spr_Slot_Shield; break;
							}break;
						}
					}
					else{
						switch (_check[0]) {
							case TYPE.BLANK: switch(_check[1]) {
								case BLANK.BASE: _symbol = spr_Slot_Empty; break;
							}break;
							case TYPE.MONEY: switch(_check[1]) {
								case MONEY.COIN: _symbol = spr_Slot_Gold; break;
							}break;
							case TYPE.WEAPON: switch(_check[1]) {
								case WEAPON.SWORD: _symbol = spr_Slot_Sword; break;
							}break;
							case TYPE.DEFENSE: switch(_check[1]) {
								case DEFENSE.SHIELD: _symbol = spr_Slot_Shield; break;
							}break;
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
		if !pay_anim Reset_Slot_State_New();//reset vars if no payout
	}
}
#endregion


/*
#region//Draw_Dungeon
draw_sprite(spr_Room_Start,0,room_width/2-(2.5*SLOT_W), 0)
draw_sprite(spr_Room_Finish,0,room_width/2+(1.5*SLOT_W), 0)
for(var rm = 0; rm < array_length(global.Dungeon);rm++){
	var _room;
	switch(global.Dungeon[rm]){
		case DUN_SYMBOL.GREY: _room = spr_Room_Base;
			break;
		case DUN_SYMBOL.RED: _room = spr_Room_Red;
			break;
		case DUN_SYMBOL.BLUE: _room = spr_Room_Blue;
			break;
	}
	draw_sprite(_room,0,room_width/2-((rm - .5)*SLOT_W),  0)
}
#endregion
*/

//Draw Border
draw_sprite(spr_Dungeon_Border,0,x,y);
draw_sprite(spr_Reel_Area,0,x,y);
draw_sprite(spr_Screen,0,129,22);