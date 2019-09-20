/// @description Insert description here
// You can write your code in this editor
//speeds
hsp = 0;
vsp = 0;
max_hsp = 2;
walk_spd = 1.5;
jump_spd = -5;
jump_dampener = 2.5;
jumps_initial = 2;
jumps = jumps_initial;

hsp_decimal = 0;
vsp_decimal = 0;

//friction
drag = .12;

//facing direction
facing = 1;

left = 0;
right = 0;
up = 0;
down = 0;
attack = 0;
jump = 0;
jump_held = 0;
block = 0;

//camera
o_camera.follow = o_player;

//states
enum states {
	idle,
	walk,
	jump,
	attack,
	block,
	crouch,
	crouch_block
}

state = states.idle;

//create states array
states_array[states.idle]			= player_idle_state;
states_array[states.walk]			= player_walk_state;
states_array[states.jump]			= player_jump_state;
states_array[states.attack]			= player_attack_state;
states_array[states.block]			= player_block_state;
states_array[states.crouch]			= player_crouch_state;
states_array[states.crouch_block]	= player_crouch_block_state;


//sprites array
sprites_array[states.idle]			= s_player_idle;
sprites_array[states.walk]			= s_player_walk;
sprites_array[states.jump]			= s_player_jump;
sprites_array[states.attack]		= s_player_attack;
sprites_array[states.block]			= s_player_block;
sprites_array[states.crouch]		= s_player_crouch;
sprites_array[states.crouch_block]	= s_player_crouch_block;


//mask array
mask_array[states.idle]			= s_player_idle;
mask_array[states.walk]			= s_player_idle;
mask_array[states.jump]			= s_player_idle;
mask_array[states.attack]		= s_player_idle;
mask_array[states.block]		= s_player_idle;
mask_array[states.crouch]		= s_player_crouch;
mask_array[states.crouch_block]	= s_player_crouch;






