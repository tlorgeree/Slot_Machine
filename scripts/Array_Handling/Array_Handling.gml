function In_1D_Array(array,target){//Returns boolean
	var output = false;
	for(var i = 0; i<array_length(array);++i){
		if (array_equals(array[i],target)) output = true;
	}
	return output;
}

function Symbol_Type(_data_array){
	var _sym;
	switch(_data_array[0]){//selected symbol
			case TYPE.BLANK: _sym = spr_Slot_Empty;
				break;
			case TYPE.MONEY: switch(_data_array[1]){
				case MONEY.COIN: _sym = spr_Slot_Gold;
					break;
			}break;
			case TYPE.WEAPON: switch(_data_array[1]){
				case WEAPON.SWORD: _sym = spr_Slot_Sword;
					break;
			}break;
			case TYPE.DEFENSE: switch(_data_array[1]){
				case DEFENSE.SHIELD: _sym = spr_Slot_Shield;
					break;
			}break;
		}
	return _sym;
}