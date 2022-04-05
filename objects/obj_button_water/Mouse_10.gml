/// @description Bring selector

if obj_gamestate.CURRENT_TURN == 0 {
	obj_cursor_action.x = x;
	obj_cursor_action.y = y;
}

if image_index == 0 {
	obj_gui.str_info = "WATER (1AP)";
} else if image_index == 1 {
	obj_gui.str_info = "FILL WATER";
} else {
	obj_gui.str_info = "CANT FILL WATER";
}

