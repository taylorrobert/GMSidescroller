/// player_knockback_state();

//get input
getInput();

//calculate movement
vsp += global.grav;

//drag
hsp = lerp(hsp, 0, drag);

//stop
if (abs(hsp) <= 0.5) hsp = 0

//check state
//change state after animation
if (image_index  >= image_number - sprite_get_speed(sprite_index/room_speed) and hsp == 0) {
	//change state
	if (block) {
		if (down) state = states.crouch_block;
		else state = states.block;
	}
	else {
		state = states.idle;
	}
}

//apply movement
collision();

//check player hp
checkPlayerHp();

//apply animations
anim();





