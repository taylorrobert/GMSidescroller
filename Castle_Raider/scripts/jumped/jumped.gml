//standard jump off the ground
if (onGround()) jumps = jumps_initial;
if (jumps > 0) {
	state = states.jump;
	vsp = jump_spd;
	jumps--;
	jumpDust();
}