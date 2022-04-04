function scr_button_find_nearest_tiles(target, amount) {
	// failsafe: get amount into a range that will never loop infinitely
	amount = clamp(amount, 0, instance_number(obj_tile));
	
	var counter = 0;
	var found_items = array_create(amount);
	
	repeat amount {
		var found_tile = instance_nearest(target.x, target.y, obj_tile);
		found_items[counter] = found_tile;
		counter++;
		
		found_tile.x -= 10000;
	}
	
	var i;
	for (i = 0; i < amount; i++) {
		var moving_item = found_items[i];
		moving_item.x += 10000;
	}
	
	return found_items;
}

function scr_button_plant_toggle_planting_mode() {
	obj_gamestate.CURRENT_TURN = !obj_gamestate.CURRENT_TURN;
}

