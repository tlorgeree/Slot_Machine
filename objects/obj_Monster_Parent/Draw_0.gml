/// @desc
draw_self();
hp_bar = (hp/hp_max)*100;
var _y = y - sprite_get_height(sprite_index)/2;
var half_spr_width = sprite_get_width(sprite_index)/2;
draw_healthbar(x-half_spr_width,_y - 10, x+half_spr_width,_y,hp_bar,
	c_black,c_red,c_orange,0,1,1);

//Draw Status Icons
var _sx = x-sprite_get_width(sprite_index)/2;
var _sy = y+sprite_get_width(sprite_index)/2 + 4;
var _slen = array_length(status);
for(var si = 0;si<_slen;++si){
	var _spr;
	switch(si){
		case STATUS.POISON: _spr = spr_Status_Poison;break;
		case STATUS.FREEZE: _spr = spr_Status_Freeze;break;
		case STATUS.BURN: _spr = spr_Status_Burn;break;
	}
	for(var sj=0;sj<status[si];++sj){
		draw_sprite(_spr,0,_sx + (sj*7),_sy+(si*7));
	}
}
#region Messages
if (attack_message){ //Tell player they can't afford the action
	if(msg_timer<20) draw_set_alpha(msg_timer/20);
	draw_set_color(c_red);
	draw_set_halign(fa_center);
	if (msg_timer > 0){
		draw_text_transformed(room_width/2, room_height/2, "Monster Dealt " + string(damage) + " damage!", 0.5,0.5,0);
		if (!global.gamepaused) msg_timer--;//pause timer with pause
	}
	else attack_message = false;
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_alpha(1);
}
#endregion