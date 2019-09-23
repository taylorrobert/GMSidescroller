//frog_jump_land_state


//get inputs


//calculate movement



//modify state
if (image_index >= image_number - (sprite_get_speed(sprite_index)/room_speed)) {
	state = frog_states.idle;
	image_index = 0;
	image_speed = 0;
}




//apply movement
collision();


//animations
frog_anim();