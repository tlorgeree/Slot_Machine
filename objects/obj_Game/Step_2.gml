/// @desc game paused
if (keyboard_check_pressed(vk_escape)){
	global.gamepaused = !global.gamepaused;	
}
if ((room == rm_Title) && (keyboard_check_pressed(vk_enter))){
	room_goto(rm_Dungeon_Slot);
}
if (global.dungeon_calc){
	room_goto(rm_Slot_Machine_New);
	global.dungeon_calc = false;
}

if (room == rm_Slot_Machine) && (!obj_Slot_Machine.pay_anim)
&&(global.money<obj_Slot_Machine.spin_cost) room_goto(rm_Game_Over);
if ((room == rm_Game_Over) && (keyboard_check_pressed(vk_enter))){
	room_goto(rm_Title);
	global.Dungeon= [0,0,0]
	global.gamepaused = false;
}
