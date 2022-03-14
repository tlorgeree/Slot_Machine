function Convert_Text(_string){
	/*Converts string to array of instructions
		1.Parse input array for headers
		2.Igonore headers in char counter
		3. identify words by spacing
		4 Create nextline based on charatcer space required within
			Text Box Dimensions
	
		The output array should contain the following
		information:
		1. The text and its drawing coordinates
		2. The specific effects for a given word
		3. The bounds of the Text Box
		
		This function is separate from Draw_Dialoague
		Since it doesn not need to be run every cycle
	*/
	//Draw Text Box
	draw_set_font(fnt_Text);//for calc string length in px
	var bounds = x_width-8;
	var output = [];
	var temp = "";
	
	var s_len = string_length(_string);
	for(var c = 1; c<=s_len;++c){
		var word = "";
		var i = 0;
		while(string_char_at(_string,c+i)!=" "){
			word+=string_char_at(_string,c+i);
			++i;
			if(c+i>s_len) break;
		}
		if((string_width(temp)+string_width(" " + word))<bounds){
			if(temp == "")temp += word;
			else temp += (" "+  word);
			show_debug_message(temp);
		}else{
			array_push(output,temp);
			temp = "";
			temp += word;
		}
		c = c+i;
	}
	if(string_length(temp)>0) array_push(output,temp);
	draw_set_font(fnt_Default);
	return output;
	
}

function Draw_Dialogue_Box(_Dialogue_Arr,_x,_y,_x_width,_y_width){
	/*Takes input dialogue array and draws each element to screen
		depending on the text effect, will draw each section
		independently
	*/
	draw_set_font(fnt_Text);
	var _x1 = _x - (_x_width/2);
	draw_sprite_stretched(spr_Dialogue_Box,0,_x1,_y,_x_width,_y_width);
	draw_text(_x1+4,_y+4,_Dialogue_Arr[line_curr]);
	if((line_curr+1)<array_length(text_conv))draw_text(_x1 +4,_y+3+string_height(_Dialogue_Arr[line_curr]),_Dialogue_Arr[line_curr+1]);
	draw_set_font(fnt_Default);
	
}