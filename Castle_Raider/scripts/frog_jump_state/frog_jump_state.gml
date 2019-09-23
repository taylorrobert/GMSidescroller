//frog_jump_state

//check health
checkEnemyHP();

//get inputs


//calculate movement
calcEntityMovement();

//horizontal
hsp += spd * facing;

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