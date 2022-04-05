function scr_enemy_tile_killer_do_move(){
	
	if !grown {
		image_index++;
		
		if visible {
			part_emitter_burst(part_sys, emit, particle, 10);
		}
		
		if image_index >= sprite_get_number(sprite_index) - 1 {
			show_debug_message("ENEMY DONE");
			grown = true;
			with tile {
				sprite_index = spr_tile_grass_dead;
			}
			
			// pay a fine
			obj_gamestate.CURRENT_POINTS -= 50;
			obj_gamestate.CURRENT_POINTS = max(obj_gamestate.CURRENT_POINTS, 0);
			
			scr_gui_update_gui_strings();
		}
	}
}

