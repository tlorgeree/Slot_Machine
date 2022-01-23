//Control Machine Spin
if (keyboard_check_pressed(vk_space) && !spin_anim && !pay_anim){
	if (global.money) >= spin_cost * power(2,active-1){
		spin_state = true;
		setup = false;
		calc_done = false;
	}else no_money = true;
}

//if keyboard_check_pressed(vk_enter) && active<6
if (spin_state){
	global.money -= (spin_cost * power(2,active-1));
	for (var i= 0; i<reel_num; ++i){
		spin_inc[i] = irandom(array_length(reels[i])-1);
		
	}
	
	for(var j = 0; j<reel_num;++j){
		var _reel_len = array_length(reels[j]);
		for(var k = 0; k < _reel_len; ++k){
			if (k + spin_inc[j] >= _reel_len) spin_inc[j] = -k;
			var _index = k + spin_inc[j];
			reels_spun[j][k] = reels[j][_index];
		}
	}
	//spin_anim = true;
	//alarm[0] = 60;
	spin_state = false;
}


//calculate payout
if (!calc_done){
	if (active>=1){
		if (reels_spun[0,1] != 0) 
		&& (reels_spun[0,1] == reels_spun[1,1] && reels_spun[1,1] == reels_spun[2,1]){
			array_push(payout,[1,reels_spun[0,1]]);
			
		}
	}
	if (active>=2){
		if (reels_spun[0,0]!= 0)
		&& (reels_spun[0,0] == reels_spun[1,0] && reels_spun[1,0] == reels_spun[2,0]){
			array_push(payout,[2,reels_spun[0,0]]);
		}
	}
	if (active>=3){
		if (reels_spun[0,2] != 0)
		&& (reels_spun[0,2] == reels_spun[1,2] && reels_spun[1,2] == reels_spun[2,2]){
			array_push(payout,[3,reels_spun[0,0]]);
		}
	}
	if (active>=4){
		if (reels_spun[0,0] != 0)
		&& (reels_spun[0,0] == reels_spun[1,1] && reels_spun[1,1] == reels_spun[2,2]){
			array_push(payout,[4,reels_spun[0,0]]);
		}
	}
	if (active>=5){
		if (reels_spun[0,2] != 0)
		&& (reels_spun[0,2] == reels_spun[1,1] && reels_spun[1,1] == reels_spun[2,0]){
			array_push(payout,[5,reels_spun[0,0]]);
		}
	}
	if (array_length(payout) > 0 && !pay_anim){pay_anim =true; anim_timer = 60;}
	calc_done = true;
}
	
//reset variables
if (!spin_anim && calc_done && !pay_anim){
	if !setup{
		active = 1;
		setup = true;
	}
	else{
		if keyboard_check_pressed(vk_enter) && (active < 5)	{
			//can the player afford to increase the wheel
			if (global.money) >=  (spin_cost * power(2,active)) active++;
			else no_money = true;
		}
	}
}