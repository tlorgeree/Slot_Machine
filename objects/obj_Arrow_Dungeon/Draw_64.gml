/// @desc Error Message
if (has_active){ //Tell player they can't afford the action
	draw_set_alpha(msg_timer/60);
	draw_set_color(c_red);
	draw_set_halign(fa_center);
	if (msg_timer > 0){
		draw_text_transformed(room_width/2, room_height/2, "Only Active Row Allowed", 1,1,0);
		if (!global.gamepaused) msg_timer--;//pause timer with pause
	}
	else has_active = false;
}
