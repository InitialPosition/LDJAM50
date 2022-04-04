function scr_gamestate_init() {
	CURRENT_TURN = 0;						// 0: not planting, 1: planting
	CURRENT_POINTS = 0;						// current amount of points
	CURRENT_ROUND = 1;						// current round (1 round = 1 turn state cycle)
	WHEAT_PROBABILITY = 0.2;				// probability for wheat spawns in every round
	MAX_WHEAT_PER_ROUND = 3;				// highest amount of wheats that can spawn in one round
	ACTION_POINTS = 8;						// action points player can spend this round
	MAX_ACTION_POINTS = 8;					// max action points player can have
	CURRENT_RENT = 30;						// current rent player has to pay every 10 rounds
	RENT_INCREASE = 50;						// amount of money rent goes up every time it is payed
	
	fx_shake = fx_create("_filter_linear_blur");
	layer_set_fx("Effect_Spawn", fx_shake);
	FX_SHAKE_INTENSITY = 0;
	
	fx_set_parameter(fx_shake, "g_LinearBlurVector", 0, 0);
}

function scr_gamestate_update() {
	if FX_SHAKE_INTENSITY > 0 {
		fx_set_parameter(fx_shake, "g_LinearBlurVector", 
						irandom_range(-FX_SHAKE_INTENSITY, FX_SHAKE_INTENSITY),
						irandom_range(-FX_SHAKE_INTENSITY, FX_SHAKE_INTENSITY));
		
		FX_SHAKE_INTENSITY -= 0.5;
	} else {
		FX_SHAKE_INTENSITY = 0;
	}
}

function scr_gamestate_do_enemy_turn() {
	obj_player.locked = true;
	
	FX_SHAKE_INTENSITY = 10;
	
	for (var i = 0; i < instance_number(obj_enemy); ++i;) {
		var current_enemy = instance_find(obj_enemy,i);
		current_enemy.alarm[0] = 1;
	}
	
	// grow plants if they are on watered fields
	for (var i = 0; i < instance_number(obj_plant); ++i;) {
		var current_plant = instance_find(obj_plant,i);
		with current_plant {
			scr_plant_grow();
		}
	}
	
	// for empty tiles, spawn a certain amount of new wheats with a certain probability
	var empty_tiles = array_create(0)
	for (var i = 0; i < instance_number(obj_tile); ++i;) {
		var current_tile = instance_find(obj_tile,i);
		if !current_tile.is_occupied {
			array_push(empty_tiles, current_tile);
		}
	}
	
	var spawned_wheats = 0;
	for (var i = 0; i < min(array_length(empty_tiles), MAX_WHEAT_PER_ROUND); ++i;) {
		var current_tile = empty_tiles[max(0, irandom(array_length(empty_tiles)) - 1)];
		
		if !current_tile.is_occupied {
			if random(1) < WHEAT_PROBABILITY {				
				var new_plant = instance_create_layer(current_tile.x, current_tile.y, "Instances_Enemy", obj_enemy_tile_killer); // TODO choose what to spawn
				current_tile.is_occupied = true;
				current_tile.plant = new_plant;
				new_plant.tile = current_tile;
				
				spawned_wheats++;
				if spawned_wheats >= MAX_WHEAT_PER_ROUND {
					break;
				}
			}
		}
	}
	
	CURRENT_ROUND++;
	scr_action_reset();
	
	// every 5 rounds, increase the spawn probability for weeds
	if CURRENT_ROUND % 5 == 0 {
		show_debug_message("Diff up")
		MAX_WHEAT_PER_ROUND++;
	}
	
	with obj_tile {
		// water handling
		if is_watered {
			water_counter--;
			
			if water_counter <= 0 {
				water_counter = 0;
				is_watered	= false;
			}
		}
	}
	
	with obj_gui {
		scr_gui_update_gui_strings();
	}
	
	obj_cursor_action.x = -64;
	obj_cursor_action.y = -64;
	
	// pay rent
	if CURRENT_ROUND % 5 == 0 {
		if CURRENT_POINTS >= CURRENT_RENT {
			CURRENT_POINTS -= CURRENT_RENT;
			CURRENT_RENT += RENT_INCREASE;
			
			if CURRENT_ROUND == 5 {
		CURRENT_RENT = 50;
	}
			
			audio_play_sound(snd_rent, 1, 0);
			
			scr_gui_update_gui_strings();
		} else {
			var gameover = instance_create_layer(0, 0, "Instances_GUI", obj_gameOver);
			gameover.str_reason = "You could not pay the rent!";
		}
	}
	
	
	
	alarm[0] = 3;
	
	obj_player.locked = false;
	
	CURRENT_TURN = 0;
	obj_cursor_action.x = -64;
	obj_cursor_action.y = -64;
}

function scr_gamestate_check_if_lost() {
	// check if player lost the game
	var lost = true;
	for (var i = 0; i < instance_number(obj_tile); ++i;) {
		var current_tile = instance_find(obj_tile,i);
		if current_tile.is_occupied {
			if current_tile.plant.object_index == obj_enemy_tile_killer {
				if !current_tile.plant.grown {
					lost = false;
					break;
				}
			}
		} else {
			lost = false;
			break;
		}
	}
	
	if lost {
		var gameover = instance_create_layer(0, 0, "Instances_GUI", obj_gameOver);
		gameover.str_reason = "Ran out of space!";
	}
}

