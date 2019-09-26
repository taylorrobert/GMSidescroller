//execute state
if (!instance_exists(o_fade)) {
	script_execute(states_array[state]);
}
else {
	//stop animation
	image_index = 0;
}
