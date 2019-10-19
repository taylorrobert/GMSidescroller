/// player_attack_state();


//get input
getInput();

//calculate movement
calcMovement();

//check state - this code is to end the attack after one animation cycle
//if (image_index >= image_number - sprite_get_speed(sprite_index)/room_speed) {
//	if (!onGround()) state = states.jump;	
//	else  {				
//		if (hsp != 0) state = states.walk;
//		else state = states.idle;		
//	}
//}

if (jump) {
	jumped();
	state = states.attack;
}

//create hitbox
//if (image_index >= 1 and image_index <=3) {
//	var inst = instance_create_layer(x, y, "Player", o_player_attack_hitbox);
//	inst.image_xscale = facing;
//}

if (onGround() and up) hsp = 0;

//enable smaller jumps
if (vsp < 0 and !jump_held) vsp = max(vsp, jump_spd/jump_dampener);

//apply movement
collision();

//check player hp
checkPlayerHp();

//apply animations
anim();
