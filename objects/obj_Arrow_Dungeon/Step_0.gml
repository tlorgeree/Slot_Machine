/// @desc
//Activate on click
if !(global.gamepaused){
	if mouse_check_button_pressed(mb_left) 
	&& position_meeting(mouse_x, mouse_y, id){
		//show_message(string(arrow_num)); 
		if (!active){
			with (obj_Dungeon_Slot){//update slot_machine
				
					if (active_total == 0){
						active_total = 1;
						active_calc = true;
						active[other.arrow_num-1]=1;
						other.active = true;
						other.image_index = 1;
					}
					else{
						has_active = true;
						msg_timer = 60;
					}
			}
		}
		else {
			obj_Dungeon_Slot.active_total = 0;
			obj_Dungeon_Slot.active = [0,0,0,0,0];
			active = false;
			image_index = 0;
		}
		
	}
}
