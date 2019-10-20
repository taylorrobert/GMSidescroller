/// player_attack_state();


//get input
getInput();

//calculate movement
calcMovement();

//check state - this code is to end the attack after one animation cycle
if (!attack) {
	if (!onGround()) state = states.jump;	
	else  {				
		if (hsp != 0) state = states.walk;
		else state = states.idle;		
	}
}

if (jump) {
	jumped();
	state = states.attack;
}

//create hitbox
//if (image_index >= 1 and image_index <=3) {
//	var inst = instance_create_layer(x, y, "Player", o_player_attack_hitbox);
//	inst.image_xscale = facing;
//}

//enable smaller jumps
if (vsp < 0 and !jump_held) vsp = max(vsp, jump_spd/jump_dampener);

if (attack and can_shoot) {
	can_shoot = false;
	
	var angle = o_gun.image_angle;
	if (facing < 0) angle += 180;
	
	var inst = instance_create_layer(o_gun.x + lengthdir_x(12, angle), o_gun.y + lengthdir_y(12, angle), "PlayerShots", o_basicShot);
	var dir = point_direction(inst.x, inst.y,mouse_x,mouse_y)
	inst.hsp = lengthdir_x(inst.spd, dir);
	inst.vsp = lengthdir_y(inst.spd, dir); 	
	 
	//var xpos = 0;
	//var ypos = 0;
	//if (up and !right and !left) {
	//	if (sign(facing)) {
	//		xpos = x+1;
	//		ypos = y-42;
	//	}
	//	else {
	//		xpos = x-7;
	//		ypos = y-42;
	//	}
	//	var inst = instance_create_layer(xpos, ypos, "PlayerShots", o_basicShot);
	//	inst.vsp = -5;	
	//}
	//else if (down and !right and !left) {
	//	if (sign(facing)) {
	//		xpos = x;
	//		ypos = y;
	//	}
	//	else {
	//		xpos = x;
	//		ypos = y;
	//	}
	//	var inst = instance_create_layer(xpos, ypos, "PlayerShots", o_basicShot);
	//	inst.vsp = 5;	
	//}
	//else if (up and right) {
	//	xpos = x + 12;
	//	ypos = y - 40;
	//	var inst = instance_create_layer(xpos, ypos, "PlayerShots", o_basicShot);
	//	inst.vsp = -5;
	//	inst.hsp = 5;
	//}
	//else if (up and left) {
	//	xpos = x - 12;
	//	ypos = y - 40;
	//	var inst = instance_create_layer(xpos, ypos, "PlayerShots", o_basicShot);
	//	inst.vsp = -5;
	//	inst.hsp = -5;
	//}
	//else if (down and left) {
	//	xpos = x - 12;
	//	ypos = y - 4;
	//	var inst = instance_create_layer(xpos, ypos, "PlayerShots", o_basicShot);
	//	inst.vsp = 5;
	//	inst.hsp = -5;
	//}
	//else if (down and right) {
	//	xpos = x + 12;
	//	ypos = y - 4;
	//	var inst = instance_create_layer(xpos, ypos, "PlayerShots", o_basicShot);
	//	inst.vsp = 5;
	//	inst.hsp = 5;
	//}
	//else { //just left and just right
	//	if (sign(facing)) {
	//		xpos = x + 12;
	//		ypos = y - 28;
	//	}
	//	else {
	//		xpos = x - 18;
	//		ypos = y - 28;
	//	}
	//	var inst = instance_create_layer(xpos, ypos, "PlayerShots", o_basicShot);
	//	inst.hsp = 5 * facing;		
	//}
	alarm[PLAYERSHOTTIMER] = shot_delay;	
}

//if (!attack and image_index >= image_number	- sprite_get_speed(sprite_index)/room_speed) {
//	state = states.idle;
//}

//apply movement
collision();

//check player hp
checkPlayerHp();

//apply animations
anim();
