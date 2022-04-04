/// @description draw death reason

draw_set_alpha(0.8);
draw_rectangle_color(0, 88, view_wport[0], 148, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);

draw_set_halign(fa_center);
draw_set_font(fnt_title_smaller);

draw_text(room_width / 2, 90, str_gameover);

draw_set_font(fnt_tile_info);

draw_text(room_width / 2, 110, string_upper(str_reason));
draw_text(room_width / 2, 130, string_upper(str_score));

