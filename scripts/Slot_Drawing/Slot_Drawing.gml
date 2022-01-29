function Draw_Slot_Position(_sprite,_subimage, _x, _y){
	draw_sprite(_sprite,_subimage, slots[_x].x, slots[_x].y + SLOT_H * _y)
}

function Draw_Slot_Position_Ext(_sprite,_subimage, _x, _y, _displacement){
	draw_sprite(_sprite,_subimage, slots[_x].x, slots[_x].y + SLOT_H * _y + _displacement);
}
function Reset_Slot_State(){
	pay_anim = false;
	spin_anim = false;
	payout = [];
	anim_timer = 0;
	anim_ind = 0;
	active = [0,0,0,0,0];
	active_total = 0;
	obj_Arrow.active = false;
	obj_Arrow.image_index = 0;
}