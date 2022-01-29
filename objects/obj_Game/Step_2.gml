/// @desc game paused
if (keyboard_check_pressed(vk_escape)){
	global.gamepaused = !global.gamepaused;	
}
if ((room == rm_Title) && (keyboard_check_pressed(vk_enter))){
	room_goto(rm_Slot_Machine);
}
