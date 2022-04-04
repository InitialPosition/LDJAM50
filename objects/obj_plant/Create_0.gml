/// @description Init Plant

image_speed = 0;
scr_plant_set_plant_stats(irandom(2));

part_sys = part_system_create();
emit = part_emitter_create(part_sys);
particle = scr_particles_plant(true);
part_emitter_region(part_sys, emit, x, x + 32, y, y + 32, ps_shape_ellipse, ps_distr_gaussian);
part_emitter_burst(part_sys, emit, particle, 10);
part_emitter_stream(part_sys, emit, particle, -20);

particle_done = scr_particles_plant_done();

