/// @desc Reel Navigation

//Change Active Reel Selection
if(keyboard_check_pressed(ord("W"))){
	selected[active]++;
	if (selected[active] >= reel_len[active]) selected[active] = 0;
}
if(keyboard_check_pressed(ord("S"))){
	selected[active]--;
	if (selected[active] < 0) selected[active] = reel_len[active]-1;
}

//Change which Reel is active
if(keyboard_check_pressed(ord("D"))){
	active++;
	if (active > 2) active = 0;
}
if(keyboard_check_pressed(ord("A"))){
	active--;
	if (active < 0) active = 2;
}
