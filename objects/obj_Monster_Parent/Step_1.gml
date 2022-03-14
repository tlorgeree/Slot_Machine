/// @desc Statuses
if(is_turn)&&(!status_calc){
	for(var s = 0;s<array_length(status);++s){
		if(status[s]>0){
			switch(s){
				case STATUS.POISON: Monster_Poisoned(status[STATUS.POISON]);break;
				case STATUS.FREEZE: Monster_Frozen(); break;
				case STATUS.BURN: Monster_Burned() break;
			}
		}
	}
	status_calc=true;
}