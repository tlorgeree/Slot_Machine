/// @desc globals
randomise();
global.rooms_completed = 0;
global.curr_room_complete = false;
global.player_turn = true;
display_set_gui_size(view_wport[0],view_hport[0]);
global.gamepaused = false;
global.money = 10000;
global.Dungeon = [0,0,0];
global.dungeon_calc = false;

global.Money_Payout = 0;
global.Damage_Payout = 0;
global.Defense_Payout = 0;