/// @description 

if fadeUp {
	if a < 1 {
		a += 0.01;
	} else {
		with obj_particles_general_mainMenu {
			part_emitter_clear(part_sys, emit);
			part_system_destroy(part_sys);
			instance_destroy();
		}
	
		room_goto(rm_game);
		fadeUp = false;
		
		if !muted {
			audio_group_set_gain(audiogroup_default, 0.1, 1000);
		}

	}
} else {
	if a > 0 {
		a -= 0.01;
	} else {
		instance_destroy();
	}
}
