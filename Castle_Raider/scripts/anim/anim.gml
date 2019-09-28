/// anim();
sprite_index = sprites_array[state];
mask_index = mask_array[state];
image_xscale = facing;

switch (state) {
	case states.jump:
		if (jumps == 1) {
			image_index = 0;
			image_speed = 1;
		}
		else if (jumps == 2) {
			image_index = 0;
			image_speed = 0;
		}
		else {
			image_speed = 1;		
		}
		//if (jumps 
		//if (vsp < 0) image_index = 0;
		//else image_index = 0;
	break;
	case states.attack:
		if (!onGround()) sprite_index = s_player_air_attack;
		else {
			if (hsp != 0) sprite_index = s_player_attack_walk;
			else sprite_index = s_player_attack;
		}
	break;
	case states.hurting:
		if (!onGround()) {
			sprite_index = s_player_jump;	
			if (vsp < 0) image_index = 0;
			else image_index = 1;
		}
	break;
	case states.idle:
		image_speed = 1;
	break;
}
