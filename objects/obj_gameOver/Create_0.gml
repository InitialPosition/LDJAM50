/// @description Set up game over object


unlocked = false;

str_gameover = "GAME OVER!";

local_score = obj_gamestate.CURRENT_ROUND;

if file_exists(working_directory + "highscore.txt") {
	f = file_text_open_read(working_directory + "highscore.txt");
	saved_score = file_text_read_real(f);
	file_text_close(f);
} else {
	saved_score = 0;
}

if local_score > saved_score {
	str_score = "NEW HIGHSCORE! FINAL ROUND: " + string(local_score);
	f = file_text_open_write(working_directory + "highscore.txt");
	file_text_write_real(f, local_score);
	file_text_close(f);
} else {
	str_score = "FINAL ROUND: " + string(local_score);
}

obj_player.locked = true;

audio_stop_all();
audio_play_sound(snd_gameover, 1, 0);

alarm[0] = 60;

