/// @desc
draw_text(20,20, "Money: " + string(global.money));
draw_text(20,35, "Spin: SPACE");
draw_text(20,50, "Pause: Esc");

draw_text(300,20, "Last Money Payout: " + string (global.Money_Payout));
draw_text(300,35, "Last Money Payout: " + string (global.Damage_Payout));
draw_text(300,50, "Last Money Payout: " + string (global.Defense_Payout));


if(global.gamepaused){
	draw_set_halign(fa_center);
	draw_set_color(c_red);
	draw_text_transformed(view_wport[0]/2,view_hport[0]/2,"PAUSED",3,3,0);
	draw_set_halign(fa_left);
	draw_set_color(c_white);
}