/// @desc
if (instance_number(obj_Slot_Reel==3)){
	for (var i = 0; i < instance_number(obj_Slot_Reel); ++i;)
    {
		slots[i] = instance_find(obj_Slot_Reel,i);
    }	
}
else show_message("Wrong number of reels preset");