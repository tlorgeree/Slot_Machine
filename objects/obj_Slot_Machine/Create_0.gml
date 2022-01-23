/// @desc
depth--;

#region Slot Reels
slots = [-1,-1,-1]; //Holds ID values for each reel
reel_num = 3; //number of reels in game
reels[0] = [1,0,1]; //reels[] stores the symbol data for each reel
reels[1] = [0,1,0];
reels[2] = [1,0,1];
reels_spun[0] = reels[0]; //This is the resulting output from a spin
reels_spun[1] = reels[1];
reels_spun[2] = reels[2];
#endregion

#region Slot Controller Variables
spin_cost = 100; //Cost of 1 spin
active = 1; //#active rows
setup = true; //Can the player set up the next spin
calc_done = true; //Has the machine finished its precious calc
payout = [];//payouts will take the form of [active row, payout type]
pay_anim = false; //Is the machine currently animating the payout
spin_state = false; //Is the machine calculating the spin result
spin_inc = [0,0,0]; //Change in final position of the reel symbols
spin_anim = false; //Is the machine currently animating the spin
#endregion



#region Animation Variables
anim_timer = 0; //alarm
anim_ind = 0;	//incrementer
#endregion

#region Message Variables
no_money = false; //message trigger
msg_timer = 0;	//message display time
#endregion