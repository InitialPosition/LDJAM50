/// @description Go to next turn

if enabled {
	//enabled = false;
	//sprite_index = spr_next_turn_reload;
	
	with obj_gamestate {
		scr_gamestate_do_enemy_turn();
	}
}

