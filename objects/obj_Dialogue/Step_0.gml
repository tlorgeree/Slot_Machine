/// @desc
if((text !=-1)&&(!is_array(text_conv))){
	text_conv = Convert_Text(text);
	text = -1;
	show_debug_message(string(text_conv));
}

if(keyboard_check_pressed(ord("M"))){
	if(line_curr<array_length(text_conv)-1)line_curr++;
}