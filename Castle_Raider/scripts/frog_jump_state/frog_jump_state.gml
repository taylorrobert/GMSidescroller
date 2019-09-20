//frog_jump_state


//get inputs


//calculate movement
hsp += spd * facing;
vsp += global.grav;

//limit speed
hsp = min(abs(hsp), max_hsp) * facing;

//modify state



//apply movement
collision()


//animations
frog_anim();