function scr_plant_set_plant_stats(plant_index) {
	
	finished = false;
	
	switch plant_index {
		case 0:
			// red base plant
			sprite_index = spr_plant_1;
			value = 10;
			needs_water = false;
			break;
		case 1:
			// daisy
			sprite_index = spr_plant_2;
			value = 10;
			needs_water = false;
			break;
	}
}

function scr_plant_grow() {
	if !finished {
		image_index++;
		
		if image_index >= sprite_get_number(sprite_index) - 1 {
			show_debug_message("PLANT DONE");
			finished = true;
		}
	}
}

