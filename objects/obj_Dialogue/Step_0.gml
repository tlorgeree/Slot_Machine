/// @desc
if((text !=-1)&&(!is_array(text_conv))){
	show_message("We did this" + string(id));
	draw_set_font(fnt_Dialogue);
	text_conv = Convert_Text(text);
	draw_set_font(fnt_Default);
	text = -1;
	show_debug_message(string(text_conv));
}

if(keyboard_check_pressed(ord("M"))){
	if(line_curr<array_length(text_conv)-1)line_curr++;
}