/// player_idle_state();

//get input
getInput();

facing = mouseDir;

//calculate movement
calcMovement();

//check state
if (hsp != 0) state = states.walk;

if (attack) {
	state = states.attack;
	image_index = 0;
}

if (jump) {
	jumped();	
}

if (!jump and down) {
	state = states.crouch;
	image_index = 0;
}

if (block) {	
	if (down) state = states.crouch_block;
	else state = states.block;
	hsp = 0;
}



//blockCheck();

//apply movement
collision();

//check player hp
checkPlayerHp();

//apply animations
anim();





