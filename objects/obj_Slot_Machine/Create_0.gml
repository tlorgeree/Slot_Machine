/// @desc
depth--;
slots = [-1,-1,-1];
reel_num = 3;
reels[0] = [1,0,1];
reels[1] = [0,1,0];
reels[2] = [1,0,1];
reels_spun[0] = reels[0];
reels_spun[1] = reels[1];
reels_spun[2] = reels[2];

spin_cost = 100;
active = 1;
setup = true;

spin_state = false;
spin_inc = [0,0,0];
spin_anim = false;

no_money = false;
msg_timer = 60;