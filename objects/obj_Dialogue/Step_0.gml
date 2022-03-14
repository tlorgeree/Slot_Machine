/// @desc
if((text !=-1)&&(!is_array(text_conv))){
	line_curr = 0;
	opening = 30;
	closing = 0;
	text_timer_max = 75;
	stall = text_timer_max; //time final text lingers before closing box
	
	text_conv = Convert_Text(text);
	text = -1;
	
	//timer arrayinitialization
	text_timer[array_length(text_conv)-1]=0;
	draw_set_font(fnt_Text);
	for(var t =0; t< array_length(text_conv);++t){
		text_timer[t] = text_timer_max;
		if(t>0) displacement_max[t]=string_height(text_conv[t-1]);
	}
	draw_set_font(fnt_Default);

	displacement = displacement_max;
}