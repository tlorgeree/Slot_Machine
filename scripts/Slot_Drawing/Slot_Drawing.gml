function Draw_Slot_Position(_sprite,_subimage, _x, _y){
	draw_sprite(_sprite,_subimage, slots[_x].x, slots[_x].y + SLOT_H * _y)
}