/// @desc
//Activate on click
if !(global.gamepaused) && (!obj_Slot_Machine_New.spin_lock){
	if mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id){
		id.active = !id.active;
		if (active){
			with (obj_Slot_Machine_New){//update slot_machine
				if (global.money) >= spin_cost + (spin_cost*(active_total)){
					active[other.arrow_num-1] = true;
					other.image_index = 1;
				}
				else {no_money = true; msg_timer = 60;}
			}
		}
		else {
			obj_Slot_Machine_New.active[arrow_num-1] = false;
			image_index = 0;
		}
		obj_Slot_Machine_New.active_calc = true;
	}
}
