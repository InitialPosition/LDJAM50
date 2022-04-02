function scr_gamestate_init() {
	CURRENT_TURN = 0;						// 0: player, 1: enemy
	CURRENT_POINTS = 0;						// current amount of points
	CURRENT_ROUND = 1;						// current round (1 round = 1 turn state cycle)
	CURRENT_GOLD = 100;						// current gold
	WHEAT_PROBABILITY = 0.05;				// probability for wheat spawns in every round
	MAX_WHEAT_PER_ROUND = 3;				// highest amount of wheats that can spawn in one round
	ACTION_POINTS = 10;						// action points player can spend this round
	MAX_ACTION_POINTS = 10;					// max action points player can have
	
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
	
	for (var i = 0; i < instance_number(obj_enemy); ++i;) {
		var current_enemy = instance_find(obj_enemy,i);
		current_enemy.alarm[0] = 1;
	}
	
	// for empty tiles, spawn a certain amount of new wheats with a certain probability
	var spawned_wheats = 0;
	for (var i = 0; i < instance_number(obj_tile); ++i;) {
		var current_tile = instance_find(obj_tile, irandom(instance_number(obj_tile) - 1));
		
		if !current_tile.is_occupied {
			if random(1) < WHEAT_PROBABILITY {
				FX_SHAKE_INTENSITY = 10;
				
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
	
	CURRENT_TURN = !CURRENT_TURN;
	CURRENT_ROUND++;
	
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
	
	obj_player.locked = false;
}

