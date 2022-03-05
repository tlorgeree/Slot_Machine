/// @desc
depth = -99;
if (room!= rm_Slot_Machine_New) temp_display = instance_create_depth(view_get_wport(0),0,depth-100,obj_Coin_Bag_UI);
else temp_display = -1;
menu = true;
menu_picking = true;
menu_sel = 0;

selected = [0,0,0];
active = 0;
room_y = view_get_hport(0)/2;
room_x = view_get_wport(0)/2;

reel_len[0] = array_length(global.Main_Reel_Curr[0]);
reel_len[1] = array_length(global.Main_Reel_Curr[0]);
reel_len[2] = array_length(global.Main_Reel_Curr[0]);
pick = [[1,irandom(0)],[2,irandom(0)],[3,irandom(0)]];
picking = true;
pick_sel = 0;
to_add = -1;

add_symbol = spr_Slot_Empty;

mode = -1;