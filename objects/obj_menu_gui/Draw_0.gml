/// @description 

draw_set_halign(fa_center);
draw_set_color(c_white);
draw_set_font(fnt_title);

draw_text(room_width / 2, 40, "QUACKENFARM");

draw_set_font(fnt_tile_info);
if selection == 0 {
	draw_set_color(c_yellow);
} else {
	draw_set_color(c_white);
}
draw_text(room_width / 2, 100, str_new_game);
draw_set_color(c_white);
draw_text(room_width / 2, 120, str_highscore);

if selection == 1 {
	draw_set_color(c_yellow);
} else {
	draw_set_color(c_white);
}
draw_text(room_width / 2, 150, str_fullscreen);
draw_set_color(c_white);

draw_set_halign(fa_right);
draw_text(room_width - 10, 10, "T: Tutorial");
draw_text(room_width - 10, 20, "M: Mute / Unmute Music");

draw_text(room_width - 10, room_height - 15, str_version);

