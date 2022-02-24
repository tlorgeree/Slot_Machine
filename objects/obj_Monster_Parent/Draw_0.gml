/// @desc
draw_self();
var _y = y - sprite_get_height(sprite_index)/2;
var half_spr_width = sprite_get_width(sprite_index)/2;
draw_healthbar(x-half_spr_width,_y - 10, x+half_spr_width,_y,hp,
	c_black,c_red,c_orange,0,1,1);