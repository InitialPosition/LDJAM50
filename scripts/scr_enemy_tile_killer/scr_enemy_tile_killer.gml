function scr_enemy_tile_killer_do_move(){
	
	if !finished {
		image_index++;
		
		part_emitter_burst(part_sys, emit, particle, 10);
		
		if image_index >= sprite_get_number(sprite_index) - 1 {
			show_debug_message("PLANT DONE");
			finished = true;
			with tile {
				sprite_index = spr_tile_grass_dead;
			}
		}
	}
}

