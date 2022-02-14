/// @desc
depth = 1;

#region Slot Reels
slots = [-1,-1,-1]; //Holds ID values for each reel
reel_num = 3; //number of reels in game
symbol_num = 3;
reels[0] = [[TYPE.BLANK,BLANK.BASE],[TYPE.MONEY,MONEY.COIN],
[TYPE.WEAPON,WEAPON.SWORD],[TYPE.DEFENSE,DEFENSE.SHIELD]]; //reels[] stores the symbol data for each reel
reels[1] = [[TYPE.DEFENSE,DEFENSE.SHIELD],[TYPE.WEAPON,WEAPON.SWORD],
[TYPE.MONEY,MONEY.COIN],[TYPE.BLANK,BLANK.BASE]];
reels[2] = [[TYPE.MONEY,MONEY.COIN],[TYPE.DEFENSE,DEFENSE.SHIELD],
[TYPE.BLANK,BLANK.BASE],[TYPE.WEAPON,WEAPON.SWORD]];
reels_spun[0] = reels[0]; //This is the resulting output from a spin
reels_spun[1] = reels[1];
reels_spun[2] = reels[2];
last_spin[0] = reels[0]; //This is the resulting output from a spin
last_spin[1] = reels[1];
last_spin[2] = reels[2];
#endregion

#region Slot Controller Variables
spin_cost = 200; //Cost of 1 spin
active = [0,0,0,0,0]; //#active rows
active_total = 0;//for slot cost calc
active_calc = 0;//recalculate active slots
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
spin_timer = [0,0,0]; //how long each reel spins
spin_spd = [8,16,24]; // how fast reels spin
displacement = [0,0,0];
#endregion

#region Message Variables
no_money = false; //message trigger
msg_timer = 0;	//message display time
#endregion