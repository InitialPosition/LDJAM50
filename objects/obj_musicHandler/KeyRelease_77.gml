/// @description mute / unmute music

if music_muted {
	music_muted = false;
	audio_group_set_gain(audiogroup_default, 0.1, 0);
} else {
	music_muted = true;
	audio_group_set_gain(audiogroup_default, 0, 0);
}

