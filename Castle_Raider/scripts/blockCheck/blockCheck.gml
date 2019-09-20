///blockCheck();

if (block) {	
	if (down) state = states.crouch_block;
	else state = states.block;
	hsp = 0;
}
else {
	// leave block state
	if (down) {
		state = states.crouch;	
		hsp = 0;
	}
	else {
		if (hsp != 0) {
			if (!onGround()) state = states.jump;
			else state = states.walk;
			}
			else {
				state = states.idle;	
			}
	}
	
	
}