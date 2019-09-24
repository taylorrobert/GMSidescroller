/// player_walk_state();

//get input
getInput();

//calculate movement
calcMovement();

//check state
if (hsp == 0) state = states.idle;

//check if falling off ledge
var side = bbox_bottom;
var t1 = tilemap_get_at_pixel(global.map, bbox_left, side + 1);
var t2 = tilemap_get_at_pixel(global.map, bbox_right, side + 1);

if (t1 == VOID and t2 == VOID) {
	state = states.jump;	
	jumps = jumps_initial;
}

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





