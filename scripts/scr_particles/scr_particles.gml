function scr_particles_plant(nice) {
	part = part_type_create();
	
	if nice {
		part_type_alpha3(part, 0, 1, 0);
		part_type_color_rgb(part, 180, 255, 180, 255, 180, 255);
		part_type_size(part, 0.01, 0.02, -0.0001, 0);
	} else {
		part_type_alpha2(part, 1, 0);
		part_type_color_rgb(part, 180, 255, 0, 0, 0, 20);
		part_type_size(part, 0.02, 0.04, -0.0001, 0);
	}
	
	part_type_speed(part, 0.01, 0.1, 0, 0);
	part_type_direction(part, 0, 360, 0 ,0);
	part_type_life(part, 120, 240);
	part_type_shape(part, pt_shape_square);
	return part;
}

function scr_particles_plant_done() {
	part = part_type_create();
	
	part_type_alpha3(part, 0, 1, 0);
	part_type_color_rgb(part, 180, 255, 180, 255, 20, 40);
	part_type_size(part, 0.03, 0.06, -0.0001, 0);
	
	part_type_speed(part, 0.01, 0.1, 0, 0);
	part_type_direction(part, 0, 360, 0 ,0);
	part_type_life(part, 120, 240);
	part_type_shape(part, pt_shape_square);
	return part;
}

function scr_particles_general() {
	part = part_type_create();
	
	part_type_alpha3(part, 0, 1, 0);
	part_type_color_rgb(part, 180, 255, 180, 255, 180, 255);
	part_type_size(part, 0.01, 0.02, -0.0001, 0);
	part_type_speed(part, 0.01, 0.1, 0, 0);
	part_type_direction(part, 0, 360, 0 ,0);
	part_type_life(part, 120, 240);
	part_type_shape(part, pt_shape_square);
	
	return part;
}
