with(other) {
	if (!hurt) {
		hurt = true;	
			
		//get sign direction from hitbox to enemy
		var hkick = sign(x - other.x);
		var vkick = sign(y - other.y);
			
		//ensure objects are not at the same x
		if (hkick == 0) hkick = 1;
		if (vkick == 0) vkick = 1;
				
		//move away from the hitbox
		var knockback_distance = 3;
		hsp = hkick * knockback_distance;
		vsp = vkick * knockback_distance;
			
		//face the hitbox if on the rgound
		if (onGround()) facing = -hkick;		
			
		//damage enemy
		hp -= 1;
			
		//set hurt timer
		alarm[HURT] = hurt_time;
				
		scr_screen_shake(.1, 1.5);

	}
}

//destroy arrows that are hit
var inst = instance_place(x, y, o_arrow);
if (inst != noone) {
	inst.die = true;	
}

//enable death at begin step
die = true;