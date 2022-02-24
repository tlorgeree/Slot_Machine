/// @desc

draw_text(20,20, "Money: " + string(global.money));
draw_text(20,35, "Spin: SPACE");
draw_text(20,50, "Pause: Esc");

draw_set_halign(fa_center);
draw_text(view_wport[0]/2,20, "Last Money Payout: " + string(global.Money_Payout));
draw_text(view_wport[0]/2,35, "Last Weapon Payout: " + string(global.Damage_Payout));
draw_text(view_wport[0]/2,50, "Last Defense Payout: " + string(global.Defense_Payout));
draw_set_halign(fa_left);

draw_set_halign(fa_right);
draw_text(view_wport[0]*(7/8),20, "Current_Room: " + string(global.room_curr));
draw_set_halign(fa_left);

if(global.gamepaused){
	draw_set_halign(fa_center);
	draw_set_color(c_red);
	draw_text_transformed(view_wport[0]/2,view_hport[0]/2,"PAUSED",3,3,0);
	draw_set_halign(fa_left);
	draw_set_color(c_white);
}
