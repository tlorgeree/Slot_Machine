/// @desc Initialize Variables
depth-=100;
text = "Monster does a text demo. Wow.";
text_conv = -1;
line_curr = 0;
x_ori = 0;
y_ori = 0;
x_width = 100;
y_width = 30;
text_shake =0.6;


//Colors
col1_rgb = [255,215,0];
col1 = make_color_rgb(col1_rgb[0],col1_rgb[1],col1_rgb[2])
	
col2_rgb = [102,153,204];
col2 = make_color_rgb(col2_rgb[0],col2_rgb[1],col2_rgb[2])
	
col_dif = [col2_rgb[0]-col1_rgb[0],col2_rgb[1]-col1_rgb[1],col2_rgb[2]-col1_rgb[2]];