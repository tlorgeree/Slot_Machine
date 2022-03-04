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
	room_goto(rm_Slot_Machine_New);
	global.room_change = true;
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
	global.Dungeon= [0,0,0,0];
	global.room_curr = -1;
	global.gamepaused = false;
	global.money = 100;
}
if (keyboard_check_pressed(ord("P"))){
	global.res_set.Resize_Large();
	alarm[0] = 2;//1 frame doesn't catch the full screen exit
}
//Save Game
/*if(keyboard_check_pressed(ord("S"))){
	instance_create_layer(x,y,"Managers",obj_Save_System);
}
//Load Game
if(keyboard_check_pressed(ord("L"))){
	instance_create_layer(x,y,"Managers",obj_Load_System);
}
//Delete Save File
if(keyboard_check_pressed(ord("D"))){
	if(file_exists("Save_File.save")){
		file_delete("Save_File.save");
		show_debug_message("Deleted the save file.");
	}
	else show_debug_message("There was no save file to delete");
}*/


//Test Room
if (keyboard_check_pressed(ord("T"))){
	room_goto(rm_Wheel_Test);
}
if (keyboard_check_pressed(ord("M"))){
	global.money--;
}