//frog_jump_state


//get inputs


//calculate movement
hsp += spd * facing;
vsp += global.grav;

//limit speed
hsp = min(abs(hsp), max_hsp) * facing;

//modify state
//check if on ground
if (onGround()) {
	state = frog_states.jump_land;
	hsp = 0;
	image_index = 0;
	image_speed = 1;
}


//apply movement
collision()


//animations
frog_anim();