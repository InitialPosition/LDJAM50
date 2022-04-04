function scr_player_init() {
	xx = x;
	yy = y;
	
	walk_speed = 0.1;
	locked = false;
	
	xx_wrong = false;
	yy_wrong = false;
	yy_blocked = false;
	
	move_cheat_threshold = 2;
	
	grid_size = 64;
}

function scr_player_update() {
	
	// walk towards xx, yy
	xx_wrong = x != xx;
	yy_wrong = y != yy;
	
	if xx_wrong {
		
		if x > xx {
			// we are to the right
			sprite_index = spr_player_run_l;
		} else {
			sprite_index = spr_player_run_r;
		}
		
		yy_blocked = true;
		x = lerp(x, xx, walk_speed);
		
		if abs(x - xx) < move_cheat_threshold {
			x = xx;
		}
	} else {
		yy_blocked = false;
	}
	
	if yy_wrong and !yy_blocked {
		if sprite_index == spr_player_idle_l {
			sprite_index = spr_player_run_l;
		}
		if sprite_index == spr_player_idle_r {
			sprite_index = spr_player_run_r;
		}
		
		y = lerp(y, yy, walk_speed);
		
		if abs(y - yy) < move_cheat_threshold {
			y = yy;
		}
	}
	
	scr_player_set_correct_idle_animation();
	
	// update plant z indices
	for (var i = 0; i < instance_number(obj_z_object); ++i;) {
		var current_enemy = instance_find(obj_z_object,i);
		if current_enemy.y > y {
			current_enemy.depth = depth - 1;
		} else {
			current_enemy.depth = depth + 1;
		}
	}
}

function scr_player_set_correct_idle_animation() {
	if !xx_wrong and !yy_wrong {
		if sprite_index == spr_player_run_l {
			sprite_index = spr_player_idle_l;
		}
		if sprite_index == spr_player_run_r {
			sprite_index = spr_player_idle_r;
		}
	}
}

function scr_player_update_target_position() {
	// dont activate if the player is clicking the gui
	if mouse_x > 320 or mouse_y > 160 {
		exit;
	}
	
	if obj_gamestate.CURRENT_TURN == 1 {
		exit;
	}
	
	if !scr_action_has_enough(1) {
		exit;
	}
	
	obj_gamestate.ACTION_POINTS--;
	
	xx = round(clamp((mouse_x - 16), 64, 253) / grid_size) * grid_size;
	yy = round(clamp((mouse_y - 16), 32, 127) / (grid_size / 2)) * (grid_size / 2);
	
	// fix so duck doesnt run over fields
	yy -= 16;
}

