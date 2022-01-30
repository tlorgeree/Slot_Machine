if !global.gamepaused{	
	//Control Machine Spin
	//Hit spacebar to start the spin
	show_debug_message(string(active_total));
	if (keyboard_check_pressed(vk_space) && !spin_anim && !pay_anim
	&& calc_done && active_total>0){
		
		spin_state = true; //will calc spin
		setup = false; //no longer change active rows
		calc_done = false; //in spin calculation
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
		if (active[0]) array_push(payout,[1,0]);		
		if (active[1]) array_push(payout,[2,0]);
		if (active[2]) array_push(payout,[3,0]);
		if (active[3]) array_push(payout,[4,0]);
		if (active[4]) array_push(payout,[5,0]);
		if (array_length(payout) > 0 && !pay_anim){pay_anim =true; anim_timer = 60;}
		//else Reset_Slot_State();
		calc_done = true;//finished spin calculation
	}
	
	//reset variables and change # active rows
	if (!spin_anim && calc_done && !pay_anim){
		if !setup{
			setup = true;
		}
	}
}
show_debug_message(string(global.Dungeon));