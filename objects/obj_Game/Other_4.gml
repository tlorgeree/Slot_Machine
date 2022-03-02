/// @desc
view_wport[0] = room_width;
view_hport[0] = room_height;
if (room = rm_Slot_Machine_New){
	#region Spawner
	screen_coordx = 171;
	screen_coordy = 72;
	instance_create_layer(screen_coordx,screen_coordy,"Instances",obj_Spawner);
	#endregion
}
display_set_gui_size(view_wport[0]*3, view_hport[0]*3);