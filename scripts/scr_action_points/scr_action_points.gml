function scr_action_has_enough(cost) {
	return obj_gamestate.ACTION_POINTS >= cost;
}

function scr_action_reset() {
	obj_gamestate.ACTION_POINTS = obj_gamestate.MAX_ACTION_POINTS;
}

