/// @desc Load Game
//Erase current game state
if(file_exists("Save_File.save")){
	var _buffer = buffer_load("Save_File.save");
	var _string = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	var _load_data = json_parse(_string);
	
	var _load_entity = array_pop(_load_data);
	instance_destroy(obj_Game);
	with(instance_create_layer(0,0,layer,asset_get_index(_load_entity.obj))){
		x = _load_entity.x;
		y = _load_entity.y;
		global.meta_currency = _load_entity.meta;
		global.Main_Reel_Layout = _load_entity.main_reel;
		global.Dungeon_Reel_Layout = _load_entity.dun_reel;
	}
	show_debug_message("Game Loaded! " + _string);
	instance_destroy();
} else{
	show_debug_message("Save File not found.");
	instance_destroy();
}
