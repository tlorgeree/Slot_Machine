/// @desc globals
randomise();
display_set_gui_size(view_wport[0],view_hport[0]);

global.rooms_completed = 0;
global.curr_room_complete = false;
global.player_turn = true;

global.gamepaused = false;
global.money = 10000;
global.Dungeon = [0,0,0];
global.room_curr = -1;
global.dungeon_calc = false;

global.Money_Payout = 0;
global.Damage_Payout = 0;
global.Defense_Payout = 0;

global.event_num = 1;
global.mon_basic_num = 1;
global.mon_elite_num = 1;
global.mon_boss_num = 1;

#region Resolution Scaling

global.res_set = {
	base_width : 256,
	base_height : 144,
	scale : 1,
	aspect_ratio : display_get_gui_width()/display_get_height(),
	
	Resize_Large : function(){
		var base_ratio = base_width/base_height;
		var res_multiple = display_get_height()/base_height;
		scale++;
		if ((base_height*scale) <= display_get_height()){
			window_set_size(base_width*scale,base_height*scale);
		}
		else{
			if (window_get_fullscreen()==true){ //if fullscreen, cylce to windowed full screen
				window_set_fullscreen(0);
				if (base_width*base_ratio*res_multiple < display_get_width){
					window_set_size(base_width*res_multiple, display_get_height())

				}
				else window_set_size(display_get_width(), display_get_height());
				scale = 0;//reset scale variable
			}
			else{
				window_set_fullscreen(1);//set to fullscreen mode
			}
		}
	}
	
}
#endregion