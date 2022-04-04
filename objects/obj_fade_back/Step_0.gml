/// @description 

if fadeUp {
	if a < 1 {
		a += 0.005;
	} else {
		with obj_plant {
		part_emitter_destroy_all(part_sys);
		part_system_destroy(part_sys);
		instance_destroy();
	}
	with obj_enemy {
		part_emitter_destroy_all(part_sys);
		part_system_destroy(part_sys);
		instance_destroy();
	}
	with obj_particles_general {
		part_emitter_destroy_all(part_sys);
		part_system_destroy(part_sys);
		instance_destroy();
	}
	
		room_goto(rm_mainMenu);
		fadeUp = false;
		
		audio_group_set_gain(audiogroup_default, 0.1, 1000);

	}
} else {
	if a > 0 {
		a -= 0.005;
	} else {
		instance_destroy();
	}
}
