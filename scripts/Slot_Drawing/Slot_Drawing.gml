function Draw_Slot_Position(_sprite,_subimage, _x, _y){
	draw_sprite(_sprite,_subimage, slots[_x].x, slots[_x].y + SLOT_H * _y)
}
function Draw_Slot_Position_New(_sprite,_subimage, _x, _y){
	draw_sprite(_sprite,_subimage, slots[_x].x, slots[_x].y + (SLOT_H+3) * _y)
}

function Draw_Slot_Position_Ext(_sprite,_subimage, _x, _y, _displacement){
	draw_sprite(_sprite,_subimage, slots[_x].x, slots[_x].y + SLOT_H * _y + _displacement);
}
function Draw_Slot_Position_Ext_New(_sprite,_subimage, _x, _y, _displacement){
	draw_sprite(_sprite,_subimage, slots[_x].x, slots[_x].y + (SLOT_H+3) * _y + _displacement);
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
function Reset_Slot_State_New(){
	pay_anim = false;
	spin_anim = false;
	payout = [];
	anim_timer = 0;
	anim_ind = 0;
	active = [0,0,0,0,0];
	active_total = 0;
	spin_lock = false;
	p_turn = true;
	obj_Arrow_New.active = false;
	obj_Arrow_New.image_index = 0;
}