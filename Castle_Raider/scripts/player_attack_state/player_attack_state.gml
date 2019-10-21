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



var mx = 0;
var my = 0;

//if (global.Platform == PLATFORM_MOBILE) {
	
	var stickAngle = getMouseAngleToPlayer();
		
	//if (mouseDir < 0) stickAngle += 180;
	
	
	mx = o_gun.x + lengthdir_x(40, stickAngle);
	my = o_gun.y + lengthdir_y(40, stickAngle);
	
//}
//else {
//	mx = mouse_x;
//	my = mouse_y;
//}

//Aiming looks and feels bad if mouse is within a certain distance.
//Check to make sure it's outside that radius.
//var mouseOutsidePlayerRadius = point_distance(o_player.x, o_player.y - 30, mx, my) > 15;
//if (!mouseOutsidePlayerRadius) attack = false;

if (attack and can_shoot) {
	can_shoot = false;
	
	var angle = o_gun.image_angle;
	if (facing < 0) angle += 180;
	
	var inst = instance_create_layer(o_gun.x + lengthdir_x(12, angle), o_gun.y + lengthdir_y(12, angle), "PlayerShots", o_basicShot);
	var dir = point_direction(inst.x, inst.y,mx,my)
	inst.hsp = lengthdir_x(inst.spd, dir);
	inst.vsp = lengthdir_y(inst.spd, dir); 	
	 

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
