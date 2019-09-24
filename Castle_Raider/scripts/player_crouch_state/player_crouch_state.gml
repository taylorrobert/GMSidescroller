/// player_crouch_state();

//get input
getInput();

//calculate movement
calcMovement();


//blocking
blockCheck();


if (attack) {
	state = states.attack;
	image_index = 0;
}

if (jump) {
	jumped();
}


	

//apply movement
collision();

//check player hp
checkPlayerHp();

//apply animations
anim();
