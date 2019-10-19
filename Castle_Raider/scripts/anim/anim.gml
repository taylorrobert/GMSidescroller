/// anim();
sprite_index = sprites_array[state];
mask_index = mask_array[state];
image_xscale = facing;

switch (state) {
	case states.jump:
		//if (jumps == 6) {
		//	image_index = 0;
		//	image_speed = 1;
		//}
		//else if (jumps < 6) {
		//	image_index = 0;
		//	image_speed = 1;
		//}
		//else {
		//	image_speed = 1;		
		//}
	break;
	case states.attack:
		
		if (!attack) {
			if (!onGround()) sprite_index = s_warped_player_jump;
			else if (hsp != 0) sprite_index = s_warped_player_run;
			else if (hsp == 0) {
				if (up) sprite_index = s_warped_player_shoot_up;
				else sprite_index = s_warped_player_idle;
			}
			return;
		}
		
		else if (!onGround()) {
			if (up) {
				sprite_index = s_warped_player_shoot_up;
			}
			else {
				sprite_index = s_warped_player_jump_shoot;
			}
		}
		else {
			if (up) {
				sprite_index = s_warped_player_shoot_up;
			}
			else if (hsp != 0) {
				sprite_index = s_warped_player_run_shoot;		
			}
			else {
				sprite_index = s_warped_player_stand_shoot;
			}
			
			
			//if (hsp != 0) {
			//	sprite_index = s_warped_player_run_shoot;			
				
			//	image_speed = 1;
			//}
			//else {
			//	sprite_index = s_warped_player_run_shoot;
			//	image_speed = 0;	
			//	image_index = 1;
			//}
		}
	break;
	case states.hurting:
		if (!onGround()) {
			sprite_index = s_warped_player_hurt;	
			if (vsp < 0) image_index = 0;
			else image_index = 1;
		}
	break;
	case states.idle:
		if (up) {
			sprite_index = s_warped_player_shoot_up;	
		}
		else {			
			sprite_index = s_warped_player_idle;			
		}
		image_speed = 1;
	break;
}
