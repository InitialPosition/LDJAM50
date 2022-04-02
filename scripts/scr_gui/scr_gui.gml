function scr_gui_update_gui_strings() {
	str_current_turn = "ROUND: " + string(obj_gamestate.CURRENT_ROUND);
	str_current_points = "POINTS: " + string(obj_gamestate.CURRENT_POINTS);
	str_current_money = "GOLD: " + string(obj_gamestate.CURRENT_GOLD);
}

function scr_gui_draw_gui() {
	draw_set_halign(fa_left);
	draw_set_color(c_white);
	
	draw_set_font(fnt_gui);
	
	draw_text(20, view_hport[0] - 120, str_current_turn);
	draw_text(20, view_hport[0] - 90, str_current_money);
	draw_text(20, view_hport[0] - 60, str_current_points);
}

