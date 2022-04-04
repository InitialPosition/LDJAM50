/// @description 

var i;
for (i = 0; i < MAX_ACTION_POINTS; i++) {
	pointIndex = ACTION_POINTS > i;
	draw_sprite(spr_action_point, pointIndex, 166 + (i * 13) + 5, 190);
}

