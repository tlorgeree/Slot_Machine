/// @desc
depth = -10;
show_message("Spawner ID: " + string(id));
dialogue_box = instance_create_layer(0,0,"Dialogue_Box",obj_Dialogue);
dialogue_box.x_ori = x;
dialogue_box.y_ori = view_get_hport(0)-dialogue_box.y_width;