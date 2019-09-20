/// player_attack_state();


//get input
getInput();

//calculate movement
calcMovement();

//check state
if (image_index >= image_number - sprite_get_speed(sprite_index)/room_speed) {
	if (!onGround()) state = states.jump;	
	else  {
		if (hsp != 0) state = states.walk;
		else state = states.idle;
	}
}

if (jump) {
	jumped();
	state = states.attack;
}

//enable smaller jumps
if (vsp < 0 and !jump_held) vsp = max(vsp, jump_spd/jump_dampener);

//apply movement
collision();

//apply animations
anim();
