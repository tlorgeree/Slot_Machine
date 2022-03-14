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
	var sum_1 = 0;
	var s_len_1 = string_length(_Dialogue_Arr[line_curr]);
	var col_seg_1 = [col_dif[0]/s_len_1,col_dif[1]/s_len_1,col_dif[2]/s_len_1];
	var col_curr_1;
	for(var c = 1; c<=s_len_1;++c){
		col_curr_1 = make_color_rgb(col1_rgb[0]+(c*col_seg_1[0]),
			col1_rgb[1]+(c*col_seg_1[1]),col1_rgb[2]+(c*col_seg_1[2]));
		var c_w = string_width(string_char_at(_Dialogue_Arr[line_curr],c));
		draw_text_color(_x1+4+sum_1+random(text_shake),
			_y+4+random(text_shake),string_char_at(_Dialogue_Arr[line_curr],c),
			col1,col1,col2,col2,1);
		sum_1+=c_w;
	}
	
	if((line_curr+1)<array_length(text_conv)){	
		var sum_2 = 0;
		var s_len_2 = string_length(_Dialogue_Arr[line_curr+1]);
		var col_seg_2 = [col_dif[0]/s_len_2,col_dif[1]/s_len_2,col_dif[2]/s_len_2];
		var col_curr_2;
		for(var c2 = 1; c2<=s_len_2;++c2){
			col_curr_2 = make_color_rgb(col1_rgb[0]+(c2*col_seg_2[0]),col1_rgb[1]+(c2*col_seg_2[1]),
				col1_rgb[2]+(c2*col_seg_2[2]));
			var c_w2 = string_width(string_char_at(_Dialogue_Arr[line_curr+1],c2));
			draw_text_color(_x1+4+sum_2+random(text_shake),
				_y+4+string_height(_Dialogue_Arr[line_curr])+random(text_shake),
				string_char_at(_Dialogue_Arr[line_curr+1],c2),col1,col1,col2,col2,1);
			sum_2+=c_w2;
		}
	}
	draw_set_font(fnt_Default);
	
}