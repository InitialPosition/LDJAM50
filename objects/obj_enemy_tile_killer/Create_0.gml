/// @description 

image_speed = 0;
finished = false;
tile = noone;

part_sys = part_system_create();
emit = part_emitter_create(part_sys);
particle = scr_particles_enemy();
part_emitter_region(part_sys, emit, x, x + 32, y, y + 32, ps_shape_ellipse, ps_distr_gaussian);
part_emitter_burst(part_sys, emit, particle, 10);
part_emitter_stream(part_sys, emit, particle, -30);

show_debug_message(part_sys)

