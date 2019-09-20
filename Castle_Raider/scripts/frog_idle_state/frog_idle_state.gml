//frog_idle_state


//get inputs
breathing();


//calculate movement



//modify state
if (jump_timer < 0) {
	//reset timer
	jump_timer = jump_timer_initial;
	//do we jump?
	var _jump = random(1);
	if (_jump > jump_chance) {
		state = frog_states.jump_start;
		//reset breath values
		image_index = 0;
		image_speed = 1;
	}
}
else {
	jump_timer--;	
}


//apply movement



//animations
frog_anim();