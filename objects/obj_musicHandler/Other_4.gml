/// @description look up music and play

if room == rm_game {
	if !audio_is_playing(mus_gameloop) {
		audio_stop_all();
		audio_play_sound(mus_gameloop, 1, 1);
	}
}

if room == rm_mainMenu {
	if !audio_is_playing(mus_menu) {
		audio_stop_all();
		audio_play_sound(mus_menu, 1, 1);
	}
}

