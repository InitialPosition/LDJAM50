/// @description water bucket

if image_index == 0 {
	var tiles = scr_button_find_nearest_tiles(obj_player, 4);
	var i;

	for (i = 0; i < array_length(tiles); i++) {
		var tile = tiles[i];
		tile.is_watered = true;
		tile.water_counter = 3;
	}
	
	image_index = 1;
} else {
	// empty bucket handling
	
	// if we are at the water hose, fill bucket, otherwise do nothing
	if place_meeting(obj_player.x, obj_player.y, obj_trigger_waterbucket) {
		image_index = 0;
	}
}

