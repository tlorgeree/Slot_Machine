/// @desc
randomise();
hp = hp_max;
is_turn = false;
state = -1;
acted = false;
status = [];

#region Message Variables
attack_message = false; //message trigger
msg_timer = 0;	//message display time
#endregion
damage = irandom_range(1,damage_max);