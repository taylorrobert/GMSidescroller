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
				
				//move away from the hitbox
				var knockback_distance = 3;
				hsp = _dir * knockback_distance;
			
				//face the hitbox if on the rgound
				if (onGround()) facing = -_dir;
			
				//damage enemy
				hp -= 1;
			
				//set hurt timer
				alarm[HURT] = hurt_time;
				
				var inst = instance_create_depth(x, (bbox_top + bbox_bottom)/2, depth - 1, o_sword_hit);	
				inst.image_xscale = o_player.facing;
				if (hp <= 0) {
					var inst = instance_create_depth(x, (bbox_top + bbox_bottom)/2, depth - 1, o_sword_hit);	
					inst.image_xscale = o_player.facing;
					inst.sprite_index = s_sword_hit2;
				}				
			}
		}
	}
}



//enable death at begin step
die = true;