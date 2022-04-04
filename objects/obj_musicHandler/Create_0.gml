/// @description 
if instance_number(obj_musicHandler) > 1 {
	show_debug_message("more than one music maker, destroying")
	instance_destroy();
}


if !audio_group_is_loaded(audiogroup_sfx) {
	audio_group_load(audiogroup_sfx);
}

audio_group_set_gain(audiogroup_sfx, 0.1, 0);
audio_group_set_gain(audiogroup_default, 0.1, 0);

music_muted = false;

