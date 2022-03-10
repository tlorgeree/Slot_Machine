/// @desc
if !(global.gamepaused) && (!obj_Slot_Machine_New.spin_lock){
	if mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id){
		id.active = !id.active;
		if(active){
			for(var a = 1; a<=5;++a){
				for(var b = 0;b<=4;++b){
					if (arrows[b].arrow_num == a){
						with(arrows[b]){
							active = true;
						}
					}
				}
			}
			active = false;
		}
		else {
			image_index = 0;
		}
	}
}