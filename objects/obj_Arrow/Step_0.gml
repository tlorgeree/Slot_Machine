/// @desc
if (!active && arrow_num<=obj_Slot_Machine.active){
	active = true;
	image_index = 1;
}
if (active && arrow_num>obj_Slot_Machine.active){
	active = false;
	image_index = 0;
}