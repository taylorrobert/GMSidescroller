/// player_die_state();

//get input


//calculate movement
vsp += global.grav;

//drag
hsp = lerp(hsp, 0, drag);

//stop
if (abs(hsp) <= 0.5) hsp = 0

//check state
//change state after animation
if (image_index  >= image_number - 1) {
	image_speed = 0;	
	if (lives <= 0) {
		o_game.game_over_lose = true;
	}
	else {
		getInput();
		if (jump or attack) {
			//room_restart();
			////reset player
			//x = room_start_pos_x;
			//y = room_start_pos_y;
			//facing = room_start_facing_direction;
			//state = states.idle;
			////reset speed after death pause
			//image_speed = 1;
			////reset hp
			//hp = max_hp;
			fadeToRoom(room, room_start_pos_x, room_start_pos_y, room_start_facing_direction, c_black);
			//allow instant camera panning
			with(o_camera) {
				//enable instance panning	
				camera_pan_speed = 1;
				//reset camera pan speed;
				alarm[CAMERA_RESET] = 3;
			}
		}		
	}
}

//apply movement
collision();

//apply animations
anim();





