/// @description Activate Harvest action

var tiles = scr_button_find_nearest_tiles(obj_player, 4);
var i;

for (i = 0; i < array_length(tiles); i++) {
	var tile = tiles[i];
	with tile {
		if is_occupied and sprite_index != spr_tile_grass_dead {
			plant.visible = false;
			plant.alarm[1] = 360;
			plant.alarm[2] = 2;
			
			with plant {
				show_debug_message("run")
				
				finished = true;
			}
			
			is_occupied = false;
		}
	}
}

