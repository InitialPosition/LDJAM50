/// @description draw status effects

draw_self();

if is_watered {
	draw_sprite(spr_tile_watered, -1, x - 2, y + 8);
	
	draw_set_halign(fa_center);
	draw_set_font(fnt_tile_info);
	draw_text(x + 12, y + 12, string(water_counter));
}

