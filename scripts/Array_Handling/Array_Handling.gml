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
				case MONEY.P_COIN: _sym = spr_Slot_Poison_Coin;
					break;
			}break;
			case TYPE.WEAPON: switch(_data_array[1]){
				case WEAPON.SWORD: _sym = spr_Slot_Sword;
					break;
				case WEAPON.P_SWORD: _sym = spr_Slot_Poison_Dagger;
					break;
			}break;
			case TYPE.DEFENSE: switch(_data_array[1]){
				case DEFENSE.SHIELD: _sym = spr_Slot_Shield;
					break;
				case DEFENSE.P_SHIELD: _sym = spr_Slot_Poison_Shield;
					break;
			}break;
		}
	return _sym;
}

function Symbol_Payout(_data_array,_money,_defense,_weapon,_poison,_freeze,_burn){	
	switch(_data_array[0]){
		case TYPE.MONEY: switch(_data_array[1]){
			case MONEY.COIN: _money[MONEY.COIN]+=1;break;
			case MONEY.P_COIN:  _money[MONEY.P_COIN]+=1;
				_poison+=1; break;
		}break;							
		case TYPE.WEAPON: switch(_data_array[1]){
			case WEAPON.SWORD: _weapon[WEAPON.SWORD]+=1;break;
			case WEAPON.P_SWORD: _weapon[WEAPON.P_SWORD]+=1; 
				_poison+=1;break;
		}break;							
		case TYPE.DEFENSE: switch(_data_array[1]){
			case DEFENSE.SHIELD: _defense[DEFENSE.SHIELD]+=1;break;
			case DEFENSE.P_SHIELD:_defense[DEFENSE.P_SHIELD]+=1;
				_poison+=1;break;
		}break;
	}

	//show_message(string(output));
	return [_money,_defense,_weapon,_poison,_freeze,_burn];
}