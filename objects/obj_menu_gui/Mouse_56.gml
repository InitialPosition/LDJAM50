/// @description select based on selection

if selection == 0 {	
	if instance_number(obj_fade) == 0 {
		instance_create_layer(0, 0, "Instances_1", obj_fade);
	}
}

if selection == 1 {
	window_set_fullscreen(!window_get_fullscreen());
}

