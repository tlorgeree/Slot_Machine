/// @desc Saving the game

//Save the game
var _save_data = array_create(0);
	
with(obj_Game){
	var _save_game = 
	{
		obj : object_get_name(object_index),
		y : y,
		x : x,
		meta : global.meta_currency,
		main_reel : global.Main_Reel_Layout,
		dun_reel : global.Dungeon_Reel_Layout,
	}
	array_push(_save_data, _save_game);	
}
//Convert to JSON string and save via buffer
var _string = json_stringify(_save_data);
var _buffer = buffer_create(string_byte_length(_string)+1, buffer_fixed, 1);
buffer_write(_buffer, buffer_string, _string);
buffer_save(_buffer, "Save_File.save");
buffer_delete(_buffer);
show_debug_message("Game Saved" + _string);
instance_destroy();