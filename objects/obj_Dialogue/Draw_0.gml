/// @desc
if(opening>0) Draw_Dialogue_Box(x_ori,y_ori,x_width,y_width);
if((text_conv != -1)&&(opening<=0)){
	Draw_Dialogue_Box_Text(text_conv,x_ori,y_ori,x_width,y_width);
	if(displacement[line_curr]>0)displacement[line_curr]--;
	else{
		if(text_timer[0]>0){
			--text_timer[line_curr];
		}else{
			if(line_curr+1<array_length(text_timer)){
				--text_timer[line_curr+1];
				if((text_timer[line_curr+1]<=0) && (line_curr+1<array_length(text_conv))){
					++line_curr;
				}
				
			}
		}
		if(displacement[array_length(displacement)-1]<=0){
			if(stall>0){--stall;}
			else{
				text_conv = -1;
				closing = 30;
				text_timer = [];
				displacement = [];
				displacement_max = [];
			}
		}
	}
		
}
if(closing>0) Draw_Dialogue_Box(x_ori,y_ori,x_width,y_width);