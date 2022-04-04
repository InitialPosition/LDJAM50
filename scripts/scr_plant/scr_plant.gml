function scr_plant_set_plant_stats(plant_index) {
	
	grown = false;
	tile = noone;
	
	switch plant_index {
		case 0:
			// red base plant
			sprite_index = spr_plant_1;
			award = 10;
			break;
		case 1:
			// daisy
			sprite_index = spr_plant_2;
			award = 10;
			break;
		case 2:
			// sunflower
			sprite_index = spr_plant_3;
			award = 10;
			break;
	}
}

function scr_plant_grow() {
	if !grown {
		if !tile.is_watered {
			exit;
		}
		
		image_index++;
		
		if image_index >= sprite_get_number(sprite_index) - 1 {
			show_debug_message("PLANT DONE");
			grown = true;
			
			part_emitter_stream(part_sys, emit, particle_done, -10);
		}
	} else {
		show_debug_message("TILE IS " + string(tile))
		with tile {
			is_occupied = false;
			plant = noone;
		}
		
		tile = noone;
		grown = true;
		
		if visible {
			visible = false;
			alarm[1] = 360;
			alarm[2] = 2;
		}
	}
}

function scr_plant_plant_plant(clicked_tile, new_plant) {			// best function name ill ever come up with
	if clicked_tile.is_occupied {
		exit;
	}
	
	clicked_tile.plant = new_plant;
	new_plant.tile = clicked_tile.id;
	
	clicked_tile.is_occupied = true;
}

