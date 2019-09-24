/// player_jump_state();

//get input
getInput();

//calculate movement
calcMovement();

//check state
if (onGround()) {
	
	//apply stretch
	scale_x = scale_max;
	scale_y = scale_min;
	
	if (hsp != 0) state = states.walk;
	else state = states.idle;
	
	//create dust if landing
	if (vsp > 0) {
		instance_create_layer(x, y, "Dust", o_player_dust_land);	
	}
}

if (attack) {
	state = states.attack;
	image_index = 0;
}

if (jump) {
	jumped();	
}

//enable smaller jumps
if (vsp < 0 and !jump_held) vsp = max(vsp, jump_spd/jump_dampener);


//apply movement
collision();

//check player hp
checkPlayerHp();

//apply animations
anim();

