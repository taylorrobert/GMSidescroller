//frog_idle_state
//check health
checkEnemyHP();

//set spd
hsp = 0;
vsp = 0;

//change state
if (wait_time < 0) {
	facing *= -1;
	start_x = x;
	state = bug_states.patrol;
	wait_time = wait_time_initial;
}
else {
	wait_time--;	
}


//apply movement
collision();


//animations
bug_anim();