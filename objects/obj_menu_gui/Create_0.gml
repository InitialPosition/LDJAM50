/// @description prepare strings

if file_exists(working_directory + "highscore.txt") {
	f = file_text_open_read(working_directory + "highscore.txt");
	highscore = file_text_read_real(f);
	file_text_close(f);
} else {
	highscore = 0;
}

str_new_game = "NEW GAME";
str_highscore = "BEST ROUND " + string(highscore);
str_fullscreen = "TOGGLE FULLSCREEN";

str_version = "1.0.2";
