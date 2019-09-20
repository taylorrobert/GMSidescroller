/// anim();
sprite_index = sprites_array[state];
mask_index = mask_array[state];
image_xscale = facing;

switch (state) {
	case states.jump:
		if (vsp < 0) image_index = 0;
		else image_index = 1;
	break;
	case states.attack:
		if (!onGround()) sprite_index = s_player_air_attack;
		else {
			if (hsp != 0) sprite_index = s_player_attack_walk;
			else sprite_index = s_player_attack;
		}
	break;
}
