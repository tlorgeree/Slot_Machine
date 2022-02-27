if !global.gamepaused{
	cost_total = spin_cost + (spin_cost*(active_total-1));
	
	//Control Machine Spin
	//Hit spacebar to start the spin
	if (keyboard_check_pressed(vk_space) && (!spin_lock) && !spin_anim && !pay_anim && (active_total>0)){
		show_debug_message("Max spin total is :" + string(cost_total));
		show_debug_message("Number of enemies: " + string(instance_number(obj_Monster_Parent)));
		if (global.money) >= cost_total{ //if player can afford
			spin_state = true; //will calc spin
			setup = false; //no longer change active rows
			calc_done = false; //in spin calculation
			pay_anim =true; 
			anim_timer = 60;
			spin_lock = true;
			global.money -= cost_total; //pay active cost
		}else {no_money = true; msg_timer = 60;} //else, prompt message
	}

	if (spin_state){
		for (var i= 0; i<reel_num; ++i){//increment each reel randomly
			spin_inc[i] = irandom(array_length(reels[i])-1);
		}
		last_spin = reels_spun;//store last spin for animation
		for(var j = 0; j<reel_num;++j){
			var _reel_len = array_length(reels[j]);
			for(var k = 0; k < _reel_len; ++k){
				if (k + spin_inc[j] >= _reel_len) spin_inc[j] = -k;
				var _index = k + spin_inc[j];
				reels_spun[j][k] = reels[j][_index];
			}
		}
		spin_anim = true;
		spin_timer = [60+irandom(15), 90 + irandom(15), 120 + irandom(15)];
		spin_state = false;
	}


	//calculate payout
	if (!calc_done){
		if (active[0]){
			var _temp = [];
			var _valid = true;
			for (var i = 0; i <=2; ++i){
				if(reels_spun[i,1][0] == TYPE.BLANK){_valid = false;break}
				if(reels_spun[i,1][0] != TYPE.MONEY){
					if (array_length(_temp) == 0) array_push(_temp,reels_spun[i,1]);
					else{
						if (In_1D_Array(_temp,reels_spun[i,1]) == false) _valid = false;
					}
				}
			}
			if(_valid) array_push(payout,[1]);
			
		}
		if (active[1]){
			var _temp = [];
			var _valid = true;
			for (var i = 0; i <=2; ++i){
				if(reels_spun[i,0][0] == TYPE.BLANK){_valid = false;break}
				if(reels_spun[i,0][0] != TYPE.MONEY){
					if (array_length(_temp) == 0) array_push(_temp,reels_spun[i,0]);
					else{
						if (In_1D_Array(_temp,reels_spun[i,0]) == false) _valid = false;
					}
				}
			}
			if(_valid) array_push(payout,[2]);
		}
		if (active[2]){
			var _temp = [];
			var _valid = true;
			for (var i = 0; i <=2; ++i){
				if(reels_spun[i,2][0] == TYPE.BLANK){_valid = false;break}
				if(reels_spun[i,2][0] != TYPE.MONEY){
					if (array_length(_temp) == 0) array_push(_temp,reels_spun[i,2]);
					else{
						if (In_1D_Array(_temp,reels_spun[i,2]) == false) _valid = false;
					}
				}
			}
			if(_valid) array_push(payout,[3]);
		}
		if (active[3]){
			var _temp = [];
			var _valid = true;
			for (var i = 0; i <=2; ++i){
				if(reels_spun[i,i][0] == TYPE.BLANK){_valid = false;break}
				if(reels_spun[i,i][0] != TYPE.MONEY){
					if (array_length(_temp) == 0) array_push(_temp,reels_spun[i,i]);
					else{
						if (In_1D_Array(_temp,reels_spun[i,i]) == false) _valid = false;
					}
				}
			}
			if(_valid) array_push(payout,[4]);
		}
		if (active[4]){
			var _temp = [];
			var _valid = true;
			for (var i = 0; i <=2; ++i){
				if(reels_spun[i,2-i][0] == TYPE.BLANK){_valid = false;break}
				if(reels_spun[i,2-i][0] != TYPE.MONEY){
					if (array_length(_temp) == 0) array_push(_temp,reels_spun[i,2-i]);
					else{
						if (In_1D_Array(_temp,reels_spun[i,2-i]) == false) _valid = false;
					}
				}
			}
			if(_valid) array_push(payout,[5]);
		}
		
		calc_done = true;//finished spin calculation
		global.Damage_Payout = 0;
		global.Defense_Payout = 0;
		global.Money_Payout = 0;
	}
	
	//reset variables and change # active rows
	if (!spin_anim && calc_done && !pay_anim){
		if !setup{
			setup = true;
		}
	}
}