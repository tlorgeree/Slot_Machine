//Pause Game
if (keyboard_check_pressed(vk_escape)){
	global.gamepaused = !global.gamepaused;	
}
//Reset Game
if (keyboard_check_pressed(vk_backspace)) game_restart();
if (keyboard_check_pressed(ord("Q"))) game_end();
if ((room == rm_Title) && (keyboard_check_pressed(vk_enter))){
	room_goto(rm_Dungeon_Slot);
}
if (global.dungeon_calc){
	global.room_curr = 0;
	room_goto(rm_Slot_Machine_New);
	global.dungeon_calc = false;
}

if (room == rm_Slot_Machine_New) && (!obj_Slot_Machine_New.pay_anim)
&&(global.money<obj_Slot_Machine_New.spin_cost){
	room_goto(rm_Game_Over);
	global.meta_currency += global.rooms_completed;
	global.rooms_completed = 0;
}
if ((room == rm_Game_Over) && (keyboard_check_pressed(vk_enter))){
	room_goto(rm_Title);
	global.Dungeon= [0,0,0];
	global.room_curr = -1;
	global.gamepaused = false;
}
if (keyboard_check_pressed(ord("P"))){
	global.res_set.Resize_Large();
	alarm[0] = 2;//1 frame doesn't catch the full screen exit
}