/// @description Activate Harvest action

if obj_gamestate.CURRENT_TURN == 0 and !instance_exists(obj_gameOver) {
	if scr_action_has_enough(2) {
		var tiles = scr_button_find_nearest_tiles(obj_player, 4);
		var i;
		
		obj_gamestate.ACTION_POINTS -= 2;
		var removed_plants = 0;
		
		for (i = 0; i < array_length(tiles); i++) {
			var tile = tiles[i];
			with tile {
				if is_occupied and sprite_index != spr_tile_grass_dead {
					if plant.visible {
						plant.visible = false;
						plant.alarm[1] = 360;
						plant.alarm[2] = 2;
					}
					
					removed_plants++;
					
					with plant {
						show_debug_message("run")
						
						finished = true;
					}
					
					is_occupied = false;
					
					// if it was a plant that awards points, award them
					if plant.object_index == obj_plant {
						if plant.grown {
							obj_gamestate.CURRENT_POINTS += plant.award;
							scr_gui_update_gui_strings()
						}
					}
					
					plant = noone;
				}
			}
		}
		
		if removed_plants == 0 {
			obj_gamestate.ACTION_POINTS += 2;
		} else {
			if !audio_is_playing(snd_harvest) {
				audio_play_sound(snd_harvest, 1, 0);
			}
		}
	} else {
		if audio_is_playing(snd_error) {
			audio_stop_sound(snd_error);
		}
		audio_play_sound(snd_error, 1, 0);
	}
}
