/// @description Particles

part_sys = part_system_create();
emit = part_emitter_create(part_sys);
particle = scr_particles_general();
part_emitter_region(part_sys, emit, 0, room_width, 0, room_height, ps_shape_rectangle, ps_distr_linear);
part_emitter_burst(part_sys, emit, particle, 10);
part_emitter_stream(part_sys, emit, particle, 1);

