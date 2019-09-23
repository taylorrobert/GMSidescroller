/// player_hurting_state

//get input
getInput();

//calculate movement
vsp += global.grav;

//drag
hsp = lerp(hsp, 0, drag);

//stop
if (abs(hsp) <= 0.1) hsp = 0

//check state
//set to first frame and stop if animation has played once
if (onGround()) {
	if (image_index >= image_number	- sprite_get_speed(sprite_index)/room_speed) {
		image_index = 0;
		image_speed = 0;
	}
}

var recover_time = 0.4; //1 - instant recover
if (alarm[HURT] < hurt_time * recover_time) {
	if (onGround()) {
		state = states.idle;	
	}
	else {
		state = states.jump;	
	}
	image_speed = 1;
}

//apply movement
collision();

//apply animations
anim();





