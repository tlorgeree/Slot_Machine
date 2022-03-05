function Symbol_Add(_reel,_index,_data){
	show_message("Index is: " + string(_index));
	var len = array_length(global.Main_Reel_Curr[_reel]);
	var temp_arr = [];
	for(var i = 0; i <len;i++){
		if(i == _index) array_push(temp_arr,_data);
		array_push(temp_arr, global.Main_Reel_Curr[_reel][i])
	}
	show_message("Temp array is: " + string(temp_arr));
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