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
		var _highlight = spr_Highlight_Green_New;
		var _money = [0];//index corresponds with enum number
		var _defense = [0];
		var _weapon = [0];
		
		switch (payout[anim_ind,0]){ //controller for each row
			case 1: Draw_Slot_Position_New(_highlight,0,0,1);
					Draw_Slot_Position_New(_highlight,0,1,1);
					Draw_Slot_Position_New(_highlight,0,2,1);
					for (var ind = 0; ind<=2;++ind){
						switch(reels_spun[ind,1][0]){
							case TYPE.MONEY: switch(reels_spun[ind,1][1]){
								case MONEY.COIN: ++_money[MONEY.COIN];break;
							}break;							
							case TYPE.WEAPON: switch(reels_spun[ind,1][1]){
								case WEAPON.SWORD: ++_weapon[WEAPON.SWORD];break;
							}break;							
							case TYPE.DEFENSE: switch(reels_spun[ind,1][1]){
								case DEFENSE.SHIELD: ++_defense[DEFENSE.SHIELD];break;
							}break;
						}
					}
					break;
			case 2: Draw_Slot_Position_New(_highlight,0,0,0);
					Draw_Slot_Position_New(_highlight,0,1,0);
					Draw_Slot_Position_New(_highlight,0,2,0);
					for (var ind = 0; ind<=2;++ind){
						switch(reels_spun[ind,0][0]){
							case TYPE.MONEY: switch(reels_spun[ind,0][1]){
								case MONEY.COIN: ++_money[MONEY.COIN];break;
							}break;							
							case TYPE.WEAPON: switch(reels_spun[ind,0][1]){
								case WEAPON.SWORD: ++_weapon[WEAPON.SWORD];break;
							}break;							
							case TYPE.DEFENSE: switch(reels_spun[ind,0][1]){
								case DEFENSE.SHIELD: ++_defense[DEFENSE.SHIELD];break;
							}break;
						}
					}
					break;
			case 3: Draw_Slot_Position_New(_highlight,0,0,2);
					Draw_Slot_Position_New(_highlight,0,1,2);
					Draw_Slot_Position_New(_highlight,0,2,2);
					for (var ind = 0; ind<=2;++ind){
						switch(reels_spun[ind,2][0]){
							case TYPE.MONEY: switch(reels_spun[ind,2][1]){
								case MONEY.COIN: ++_money[MONEY.COIN];break;
							}break;							
							case TYPE.WEAPON: switch(reels_spun[ind,2][1]){
								case WEAPON.SWORD: ++_weapon[WEAPON.SWORD];break;
							}break;							
							case TYPE.DEFENSE: switch(reels_spun[ind,2][1]){
								case DEFENSE.SHIELD: ++_defense[DEFENSE.SHIELD];break;
							}break;
						}
					}
					break;
			case 4: Draw_Slot_Position_New(_highlight,0,0,0);
					Draw_Slot_Position_New(_highlight,0,1,1);
					Draw_Slot_Position_New(_highlight,0,2,2);
					for (var ind = 0; ind<=2;++ind){
						switch(reels_spun[ind,ind][0]){
							case TYPE.MONEY: switch(reels_spun[ind,ind][1]){
								case MONEY.COIN: ++_money[MONEY.COIN];break;
							}break;							
							case TYPE.WEAPON: switch(reels_spun[ind,ind][1]){
								case WEAPON.SWORD: ++_weapon[WEAPON.SWORD];break;
							}break;							
							case TYPE.DEFENSE: switch(reels_spun[ind,ind][1]){
								case DEFENSE.SHIELD: ++_defense[DEFENSE.SHIELD];break;
							}break;
						}
					}
					break;		
			case 5: Draw_Slot_Position_New(_highlight,0,0,2);
					Draw_Slot_Position_New(_highlight,0,1,1);
					Draw_Slot_Position_New(_highlight,0,2,0);
					for (var ind = 0; ind<=2;++ind){
						switch(reels_spun[ind,2-ind][0]){
							case TYPE.MONEY: switch(reels_spun[ind,2-ind][1]){
								case MONEY.COIN: ++_money[MONEY.COIN];break;
							}break;							
							case TYPE.WEAPON: switch(reels_spun[ind,2-ind][1]){
								case WEAPON.SWORD: ++_weapon[WEAPON.SWORD];break;
							}break;							
							case TYPE.DEFENSE: switch(reels_spun[ind,2-ind][1]){
								case DEFENSE.SHIELD: ++_defense[DEFENSE.SHIELD];break;
							}break;
						}
					}
					break;		
		}
		if (!global.gamepaused) anim_timer--; //pause animation with pause
		if (anim_timer<=0){ //if done animating, check next row
			anim_ind++;
			anim_timer = 60;
			//Apply payout wins
			//MONEY payouts
			for (var c = 0; c<array_length(_money);++c){
				if(_money[c]>0){
					switch(c){
						case MONEY.COIN: global.Money_Payout += (3*spin_cost*_money[MONEY.COIN]
						+ (2*spin_cost*(_money[MONEY.COIN]-1)));
						global.money += (2*spin_cost*_money[MONEY.COIN] + (spin_cost*(_money[MONEY.COIN]-1)));
							break;
					}
				}
			}
			//WEAPON payouts
			for (var w = 0; w<array_length(_weapon);++w){
				if(_weapon[w]>0){
					switch(w){
						case WEAPON.SWORD: global.Damage_Payout += (1*_weapon[WEAPON.SWORD] + (2*(_weapon[WEAPON.SWORD]-1)));
							break;
					}
				}
			}
			//DEFENSE payouts
			for (var d = 0; d<array_length(_defense);++d){
				if _defense[d]>0{
					switch(d){
						case DEFENSE.SHIELD: global.Defense_Payout += (1*_defense[DEFENSE.SHIELD] + (1*(_defense[DEFENSE.SHIELD]-1)));
							global.Defenses += global.Defense_Payout;
							break;
					}
				}
			}
		}
		
		
	}else {
		switch(slot_mode){
			case SLOT_MODE.BATTLE: 
				if(p_turn){
					show_debug_message("Damage payout is: " + string(global.Damage_Payout));
					show_debug_message("Monster hp pre-damage" + string(obj_Monster_Parent.hp))
					show_debug_message("Monster hp pre-damage" + string(obj_Monster_Parent.hp - global.Damage_Payout))
					obj_Monster_Parent.hp -= global.Damage_Payout;
					obj_Monster_Parent.is_turn = true;
					obj_Monster_Parent.acted = false;
					p_turn = false;
				}
				
				if (!obj_Monster_Parent.is_turn && !p_turn) Reset_Slot_State_New();
				break;
			case SLOT_MODE.EVENT: Reset_Slot_State_New(); break;
			default: Reset_Slot_State_New(); break;
		}
		
	}
	
}

draw_set_alpha(1);


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
draw_sprite(spr_Screen,0,screen_coordx,screen_coordy);

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
