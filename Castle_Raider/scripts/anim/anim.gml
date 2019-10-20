/// anim();
sprite_index = sprites_array[state];
mask_index = mask_array[state];



switch (state) {
	case states.jump:
		
	break;
	case states.attack:
		if (movingDir == facing) image_speed = 1;
		else image_speed = -1;
		//If the attack has ended, switch animation
		if (!attack) {
			image_speed = 1;
			if (!onGround()) sprite_index = s_warped_player_jump;
			else if (hsp != 0) sprite_index = s_warped_player_run;
			else if (hsp == 0) sprite_index = s_warped_player_idle;
			return;
		}
		
		else if (!onGround()) {
			sprite_index = s_warped_player_jump_shoot_wip;			
		}
		else {
			if (hsp != 0) {
				sprite_index = s_warped_player_run_shoot_wip;		
			}
			else {
				sprite_index = s_warped_player_stand_shoot_wip;
			}			
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
		sprite_index = s_warped_player_idle;					
		image_speed = 1;
	break;
	default:
		break;
}

image_xscale = facing;