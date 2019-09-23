//cycle through all enemies and see if they were hit
with(o_enemy_parent) {
	if (distance_to_object(other) < 60) {
		if (place_meeting(x, y, other)) {
			if (!hurt) {
				hurt = true;	
			
				//get sign direction from hitbox to enemy
				var _dir = sign(x - other.x);
			
				//ensure objects are not at the same x
				if (_dir == 0) _dir = 1;
			
				//face the hitbox if on the rgound
				if (onGround()) facing = -_dir;
			
				//damage enemy
				hp -= 1;
			
				//set hurt timer
				alarm[HURT] = hurt_time;
			}
		}
	}
}



//enable death at begin step
die = true;