//frog_attack_state


//get inputs



//calculate movement



//modify state
//attack
//set tongue depth
depth = layer_get_depth(layer_get_id("Player") - 1);

if (image_index >= image_number - image_speed) {
	state = frog_states.idle;
	alarm[CAN_ATTACK] = attack_delay;
	depth = layer_get_depth(layer_get_id("Enemy"));
}

//apply movement
collision();


//animations
frog_anim();