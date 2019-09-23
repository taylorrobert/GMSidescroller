//standard jump off the ground
if (onGround()) jumps = jumps_initial;
if (jumps > 0) {
	scale_x = scale_min;
	scale_y = scale_max;
	state = states.jump;
	vsp = jump_spd;
	jumps--;
	jumpDust();
}