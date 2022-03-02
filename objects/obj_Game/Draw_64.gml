/// @desc
if((room == rm_Dungeon_Slot) || (room == rm_Slot_Machine_New)){
	var _gui_w = display_get_gui_width();
	var _gui_h = display_get_gui_height();
	draw_text(20,20, "Money: " + string(global.money));
	draw_text(20,35, "Defenses: " + string(global.Defenses));
	draw_text(20,50, "Spin: SPACE");
	draw_text(20,65, "Pause: Esc");

	draw_set_halign(fa_center);
	draw_text(_gui_w/2,20, "Last Money Payout: " + string(global.Money_Payout));
	draw_text(_gui_w/2,35, "Last Weapon Payout: " + string(global.Damage_Payout));
	draw_text(_gui_w/2,50, "Last Defense Payout: " + string(global.Defense_Payout));
	draw_set_halign(fa_left);

	draw_set_halign(fa_right);
	draw_text(_gui_w*(7/8),20, "Current_Room: " + string(global.room_curr));
	draw_text(_gui_w*(7/8),35, "Rooms Completed: " + string(global.rooms_completed));
	draw_text(_gui_w*(7/8),50, "Meta Currency: " + string(global.meta_currency));
	draw_set_halign(fa_left);

	if(global.gamepaused){
		draw_set_halign(fa_center);
		draw_set_color(c_red);
		draw_text_transformed(_gui_w/2,_gui_h/2,"PAUSED",3,3,0);
		draw_set_halign(fa_left);
		draw_set_color(c_white);
	}
}
