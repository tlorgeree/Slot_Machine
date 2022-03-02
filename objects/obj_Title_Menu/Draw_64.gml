if (display_text){
	var _gui_w = display_get_gui_width();
	var _gui_h = display_get_gui_height();
	draw_set_halign(fa_center);
	draw_set_color(c_red);
	draw_text_transformed(_gui_w/2,_gui_h*(4/5),"PRESS ENTER TO START",3,3,0);
	draw_set_halign(fa_left);
	draw_set_color(c_white);
} 