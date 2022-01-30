if (display_text){
	draw_set_halign(fa_center);
	draw_set_color(c_red);
	draw_text_transformed(view_wport[0]/2,view_hport[0]/2,"Game Over\nPress Enter To Restart",3,3,0);
	draw_set_halign(fa_left);
	draw_set_color(c_white);
}