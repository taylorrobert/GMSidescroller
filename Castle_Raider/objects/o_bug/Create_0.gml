event_inherited();


//movement

hsp = 0;
max_hsp_initial = .5;
max_hsp = max_hsp_initial;
vsp = 0;
spd = .5;
hsp_decimal = 0;
vsp_decimal = 0;
facing = choose(-1,1);
drag = 0.04;
hp = 3;
death_gem_value = 5;

//patrol
patrol_distance = 96;

//patrol start distance
start_x = x;
start_y = y;
//how long to wait before patrolling?
wait_time_initial = random_range(room_speed * 2, room_speed * 4);
wait_time = wait_time_initial;


//states
enum bug_states {
	idle,
	patrol,
}

state = bug_states.idle;

states_array[bug_states.idle]		= bug_idle_state;
states_array[bug_states.patrol]		= bug_patrol_state;

sprites_array[bug_states.idle]		= s_bug_idle;
sprites_array[bug_states.patrol]	= s_bug_idle;