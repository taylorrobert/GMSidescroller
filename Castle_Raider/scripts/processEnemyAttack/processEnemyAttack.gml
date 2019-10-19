/// @desc processEnemyAttack(hurt_knockback, block_knockback);
/// @arg hurt_knockback_def_-1
/// @arg block_knockback_def_-1

var hk = argument0;
var bk = argument1;

//set some default values
if (hk == -1) hk = 4;
if (bk == -1) bk = 2.5;


if (o_player.hp > 0 and !hurt) {
	if (!block or (block and sign(x - other.x) == facing)) {
		hurt = true;	
			
		//face the enemy
		facing = sign(other.x - x);
		
		//ensure facing can never be 0
		if (facing == 0) facing = 1;
		
		//ensure enemy faces player
		other.facing = -facing;
				
		//move player away
		var knockback_distance = hk;
		hsp = -movingDir * knockback_distance;
			
		//damage enemy
		hp -= 1;
			
		//set hurt timer
		alarm[HURT] = hurt_time;				
				
		//change state
		state = states.hurting;
		image_index = 0;
		
		//screen shake
		scr_screen_shake(.125, -1);
	}
	else {
		//blocking damage
		if (state != states.knockback) {
			state = states.knockback;
			image_index = 0;
			image_speed = 1;
				
			//zero hsp_decimal as precision is more important here
			hsp_decimal = 0;
				
			//move player away from the attack
			var knockback_distance = bk;
			hsp = sign(x - other.x) * knockback_distance;
			
			//screen shake
			scr_screen_shake(.125, -1);
			
			//enemy gets knocked back too
			with (other) {
				if (object_index == o_bug) {
					//zero decimal to get exact movement
					hsp_decimal = 0;
					//knock enemy away from player
					hsp = sign(x - o_player.x) * other.knockback_distance;
					alarm[KNOCKEDBACK] = other.knockback_time;
				}
			}
		}
	}
}