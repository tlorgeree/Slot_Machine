//Control Machine Spin
if (keyboard_check_pressed(vk_space) && !spin_anim){
	if (global.money) >= spin_cost * power(2,active-1){
		spin_state = true;
		setup = false;
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
	spin_anim = true;
	alarm[0] = 60;
}
spin_state = false;



if (!spin_anim){
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
show_debug_message(string(active));
