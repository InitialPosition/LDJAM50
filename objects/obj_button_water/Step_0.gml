/// @description Update icon to unavailable if not at water with empty bucket

if !place_meeting(obj_player.x, obj_player.y, obj_trigger_waterbucket) or
	!place_meeting(obj_player.xx, obj_player.yy, obj_trigger_waterbucket) {
	if image_index == 1 {
		image_index = 2;
		obj_gui.str_info = "CANT FILL WATER";
	}
} else {
	if image_index == 2 {
		image_index = 1;
		obj_gui.str_info = "FILL WATER";
	}
}
