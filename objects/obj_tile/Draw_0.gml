/// @description draw status effects

draw_self();

if debug {
	draw_set_font(fnt_tile_info)
	draw_text(x, y, string(is_occupied))
	draw_text(x, y + 10, string(plant))
}

if is_watered {
	draw_sprite(spr_water_indicator, 3 - water_counter, x, y + 16);
}

