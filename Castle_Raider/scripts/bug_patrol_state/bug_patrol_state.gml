//bug_patrol_state
//check health
checkEnemyHP();

//set spd
hsp = spd * facing;
vsp = 0;

//change state
if (abs(start_x - x) > patrol_distance) {
	state = bug_states.idle;	
}

//turn around if wall found
if (facing) var side = bbox_right else var side = bbox_left;
var t1 = tilemap_get_at_pixel(global.map, side + sign(hsp), y);
if (t1 == SOLID) state = bug_states.idle;

if (distance_to_object(o_player) < chase_distance and o_player.hp > 0) {
	state = bug_states.chase;	
}


//apply movement
collision();


//animations
bug_anim();