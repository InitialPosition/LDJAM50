/// @description 

if unlocked {
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
}

