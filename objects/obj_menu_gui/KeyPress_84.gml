/// @description 

with obj_particles_general_mainMenu {
			part_emitter_clear(part_sys, emit);
			part_system_destroy(part_sys);
			instance_destroy();
		}

room_goto(rm_tutorial)
