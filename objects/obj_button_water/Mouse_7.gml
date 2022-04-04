/// @description water bucket
if image_index == 0 {
	if point_distance(obj_player.x, obj_player.y, obj_player.xx, obj_player.yy) > 10 {
		exit;
	}
	
	if !scr_action_has_enough(1) {
		exit;
	}
	
	obj_gamestate.ACTION_POINTS--;
	
	var tiles = scr_button_find_nearest_tiles(obj_player, 4);
	var i;

	for	(i = 0; i < array_length(tiles); i++) {
		var tile = tiles[i];
		tile.is_watered = true;
		tile.water_counter = 3;
	}
	
	if !audio_is_playing(snd_water) {
		audio_play_sound(snd_water, 1, 0);
	}
	
	image_index = 1;
	obj_gamestate.CURRENT_TURN = 0;
	obj_cursor_action.x = x;
	obj_cursor_action.y = y;
} else {
	// empty bucket handling

	// if we are at the water hose, fill bucket, otherwise do nothing
	if place_meeting(obj_player.x, obj_player.y, obj_trigger_waterbucket) and
	place_meeting(obj_player.xx, obj_player.yy, obj_trigger_waterbucket) {
		image_index = 0;
	}
	
	if !audio_is_playing(snd_water) {
		audio_play_sound(snd_water, 1, 0);
	}
}

