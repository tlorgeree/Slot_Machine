/// @desc Draw Bag
//Draw interior
draw_self();
if(current < global.money){
	diff = global.money - current;
	current = global.money
}else current = global.money;
//Draw contents
var _contents;
if(current>120) _contents = 120;
else _contents = current;
var _h = sprite_get_height(spr_Bag_Interior_Background);
var _w = sprite_get_width(spr_Bag_Interior_Background);

var _20s = floor(_contents/20);
var _20r = _contents mod 20;
var _20h = sprite_get_height(spr_UI_Coin_20)-4;
show_debug_message(string(_20s));
for (var i = 0; i<_20s; ++i){
	var _20x = x - _w;
	var _20y = y + _h - i* _20h;
	
	draw_sprite(spr_UI_Coin_20,0,_20x, _20y);
}
var _5s = floor(_20r/5);
var _5r = _20r mod 5;
var _5h = sprite_get_height(spr_UI_Coin_5)+4;
var _5w = sprite_get_width(spr_UI_Coin_5);

for (var i = 0; i<_5s; ++i){
	var _5x = x - _w + (i*_5w);
	if((i==0) ||(i==2)){
		var _5y = y + _h -(_20s * _20h) -1;
	}else var _5y = y + _h -(_20s * _20h);
	draw_sprite(spr_UI_Coin_5,0,_5x, _5y);
}
var _1s = _5r;
var _1h = sprite_get_height(spr_UI_Coin_1)-2;


for (var i = 0; i<_1s; ++i){
	var _1x = x - _w + (_5s*_5w);
	if((_5s==0) ||(_5s==2)){
		var _1y = y + _h -(_20s * _20h)-(i*_1h) -2;
	}else var _1y = y + _h -(_20s * _20h)-(i*_1h)-1;
	
	draw_sprite(spr_UI_Coin_1,0,_1x, _1y);
}


//Draw the border
draw_sprite(spr_Bag_Border,0,x,y);