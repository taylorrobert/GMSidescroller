//execute state

if (!instance_exists(o_fade)) {
	script_execute(states_array[state]);
}
else {
	//stop animation
	if (state != states.die) image_index = 0;
}
