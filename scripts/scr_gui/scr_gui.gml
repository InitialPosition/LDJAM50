function scr_gui_update_gui_strings() {
	obj_gui.str_current_turn = "ROUND: " + string(obj_gamestate.CURRENT_ROUND);
	obj_gui.str_current_points = "GOLD: " + string(obj_gamestate.CURRENT_POINTS);
	
	var next_rent_round = obj_gamestate.CURRENT_ROUND + 1;
	while next_rent_round % 5 != 0 {
		next_rent_round++;
	}
	obj_gui.str_rent_info = "RENT: " + string(obj_gamestate.CURRENT_RENT) + "\nBY ROUND " + string(next_rent_round);
}

function scr_gui_draw_gui() {
	draw_set_halign(fa_right);
	draw_set_color(c_white);
	
	draw_set_font(fnt_gui);
	
	draw_text(view_wport[0] - 30, 80, str_current_turn);
	draw_text(view_wport[0] - 30, 110, str_current_points);
	draw_text(view_wport[0] - 30, 140, str_rent_info);
	
	draw_set_halign(fa_left);
	draw_text(30, view_hport[0] - 80, str_info);
}

