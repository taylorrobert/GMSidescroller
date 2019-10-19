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

if (attack and can_shoot) {
	can_shoot = false;
	
	var xpos = 0;
	var ypos = 0;
	if (up) {
		if (sign(facing)) {
			xpos = x+1;
			ypos = y-42;
		}
		else {
			xpos = x-7;
			ypos = y-42;
		}
		var inst = instance_create_layer(xpos, ypos, "PlayerShots", o_basicShot);
		inst.vsp = -5;	
	}
	else {
		if (sign(facing)) {
			xpos = x + 12;
			ypos = y - 28;
		}
		else {
			xpos = x - 18;
			ypos = y - 28;
		}
		var inst = instance_create_layer(xpos, ypos, "PlayerShots", o_basicShot);
		inst.hsp = 5 * facing;		
	}
	alarm[PLAYERSHOTTIMER] = shot_delay;
	
}

//apply movement
collision();

//check player hp
checkPlayerHp();

//apply animations
anim();
