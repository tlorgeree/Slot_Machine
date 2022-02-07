/// @desc
//Activate on click
if !(global.gamepaused){
	if mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id){
		//show_message(string(arrow_num));
		id.active = !id.active;
		if (active){
			with (obj_Slot_Machine){//update slot_machine
				if (global.money) >= spin_cost * power(2,active_total){
					active[other.arrow_num-1] = true;
					other.image_index = 1;
				}
				else {no_money = true; msg_timer = 60;}
			}
		}
		else {
			obj_Slot_Machine.active[arrow_num-1] = false;
			image_index = 0;
		}
		obj_Slot_Machine.active_calc = true;
	}
}
