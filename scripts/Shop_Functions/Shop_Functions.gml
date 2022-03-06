function Symbol_Add(_reel,_index,_data){
	var len = array_length(global.Main_Reel_Curr[_reel]);
	var temp_arr = [];
	for(var i = 0; i <len;i++){
		if(i == _index) array_push(temp_arr,_data);
		array_push(temp_arr, global.Main_Reel_Curr[_reel][i])
	}
	global.Main_Reel_Curr[_reel] = temp_arr;
}

function Symbol_Remove(_reel,_index){
	var len = array_length(global.Main_Reel_Curr[_reel]);
	var temp_arr = [];
	for(var i = 0; i <len;i++){
		if(i!=_index) array_push(temp_arr, global.Main_Reel_Curr[_reel][i])
	}
	global.Main_Reel_Curr[_reel] = temp_arr;
}

function Symbol_Swap(_reel,_index,_data){
	var len = array_length(global.Main_Reel_Curr[_reel]);
	var temp_arr = [];
	for(var i = 0; i <len;i++){
		if(i == _index) array_push(temp_arr,_data);
		else array_push(temp_arr, global.Main_Reel_Curr[_reel][i])
	}
	global.Main_Reel_Curr[_reel] = temp_arr;
}

function Monster_Reward(rm_type){
	with(instance_create_layer(x,y,"Instances",obj_Reel_Manager)){
		menu_picking = false;
		randomized = true;
		mode = MODE.ADD;
		var _items;
		switch(rm_type){
			case DUN_SYMBOL.RED: _items = 2; break;
			case DUN_SYMBOL.BLUE: _items = 3;break;
		}
		num_items = _items;
	}
}