//frog_jump_start_state


//get inputs


//calculate movement
calcEntityMovement();


//modify state
if (image_index >= image_number - (sprite_get_speed(sprite_index)/room_speed)) {
	state = frog_states.jump;
	vsp = jump_spd;
}


//apply movement
collision();


//animations
frog_anim();