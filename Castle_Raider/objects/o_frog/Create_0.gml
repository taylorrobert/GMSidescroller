//movement

hsp = 0;
max_hsp_initial = 2;
max_hsp = max_hsp_initial;
vsp = 0;
spd = 2;
jump_spd = -6;
hsp_decimal = 0;
vsp_decimal = 0;
facing = choose(-1,1);

//breathing
breath_timer_initial = random_range(room_speed * 1.75, room_speed * 2.25);
breath_timer = breath_timer_initial;
image_speed = 0;


//states
enum frog_states {
	idle	
}

state = frog_states.idle;

states_array[frog_states.idle] = frog_idle_state;

sprites_array[frog_states.idle] = s_frog_idle;