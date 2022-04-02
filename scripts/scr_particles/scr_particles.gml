function scr_particles_enemy() {
	part = part_type_create();
	part_type_alpha2(part, 1, 0);
	part_type_color_rgb(part, 180, 255, 0, 0, 0, 20);
	part_type_size(part, 0.02, 0.04, -0.0001, 0);
	part_type_speed(part, 0.01, 0.1, 0, 0);
	part_type_direction(part, 0, 360, 0 ,0);
	part_type_life(part, 120, 240);
	part_type_shape(part, pt_shape_square);
	return part;
}

