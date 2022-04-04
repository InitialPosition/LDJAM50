/// @description check that player is next to tile

if obj_gamestate.CURRENT_TURN == 1 {
	var tiles_near = scr_button_find_nearest_tiles(obj_player, 4);
	
	tile_is_near = false;
	
	var i;
	for (i = 0; i < array_length(tiles_near); i++) {
		show_debug_message("comparing " + string(tiles_near[i]) + " to " + string(self.id));
		if tiles_near[i] == self.id {
			tile_is_near = true;
			break;
		}
	}
	
	if !tile_is_near {
		exit;
	}
	
	// if we make it here, we are indeed standing next to the tile
	if !is_occupied {
		if !scr_action_has_enough(1) {
			exit;
		}
		obj_gamestate.ACTION_POINTS--;
	
		var new_plant = instance_create_layer(x, y, "Instances_Plants", obj_plant);
		scr_plant_plant_plant(self, new_plant);
	}
}

