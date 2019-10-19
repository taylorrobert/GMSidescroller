event_inherited();


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
hp = 3;

//actions
can_attack = true;
attack_delay = room_speed;

//inhale
attack = false;
inhale = false;
inhale_timer = room_speed * .3;

//breathing
breath_timer_initial = random_range(room_speed * 1.75, room_speed * 2.25);
breath_timer = breath_timer_initial;
image_speed = 0;


//jump
//will he jump this chance?
jump_chance = .5;
//how often to check for a jump change?
jump_timer_initial = random_range(room_speed, room_speed * 1.5);
jump_timer = jump_timer_initial;


//states
enum frog_states {
	idle,
	jump_start,
	jump,
	jump_land,
	attack
}

state = frog_states.idle;

states_array[frog_states.idle] = frog_idle_state;
states_array[frog_states.jump_start] = frog_jump_start_state;
states_array[frog_states.jump] = frog_jump_state;
states_array[frog_states.jump_land] = frog_jump_land_state;
states_array[frog_states.attack] = frog_attack_state;

sprites_array[frog_states.idle] = s_frog_idle;
sprites_array[frog_states.jump_start] = s_frog_jump_start;
sprites_array[frog_states.jump] = s_frog_jump;
sprites_array[frog_states.jump_land] = s_frog_jump_land;
sprites_array[frog_states.attack] = s_frog_attack;