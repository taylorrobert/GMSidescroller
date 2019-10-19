/// @description Insert description here
// You can write your code in this editor
//speeds
hsp = 0;
vsp = 0;
max_hsp = 2;
walk_spd = 1.5;
jump_spd = -7;
jump_dampener = 2.5;
jumps_initial = 6;
jumps = jumps_initial;
shot_delay = room_speed * .3;
can_shoot = true;

hsp_decimal = 0;
vsp_decimal = 0;

//friction
drag = .10;

//stretching
scale_x = 1;
scale_y = 1;
scale_min = 0.75;
scale_max = 1.25;
scale_decay = 0.2;

//facing direction
facing = 1;
movingDir = 1;
mouseDir = 1;

//gems
gems = 0;
gems_value = 50;

//set rm_00 start location
room_start_pos_x = o_game.x;
room_start_pos_y = o_game.y;
room_start_facing_direction = 1;
x = room_start_pos_x;
y = room_start_pos_y;
facing = room_start_facing_direction;

//hurt
flash_counter = 0;
hurt = false;
hurt_time = room_speed;
hp = 5;
max_hp = hp;

//how long enemies get knocked back for when hit
knockback_time = room_speed / 2;
knockback_distance = 1.5;

//lives
lives_initial = 3;
lives = lives_initial;
lives_value = 1000;

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
	crouch_block,
	hurting,
	knockback,
	die
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
states_array[states.hurting]		= player_hurting_state;
states_array[states.knockback]		= player_knockback_state;
states_array[states.die]			= player_die_state;


//sprites array
sprites_array[states.idle]			= s_warped_player_idle;
sprites_array[states.walk]			= s_warped_player_run;
sprites_array[states.jump]			= s_warped_player_jump;
sprites_array[states.attack]		= s_warped_player_run_shoot;
sprites_array[states.block]			= s_warped_player_idle;
sprites_array[states.crouch]		= s_warped_player_duck;
sprites_array[states.crouch_block]	= s_warped_player_duck;
sprites_array[states.hurting]		= s_warped_player_hurt;
sprites_array[states.knockback]		= s_warped_player_hurt;
sprites_array[states.die]			= s_player_die;



//mask array
mask_array[states.idle]			= s_warped_player_idle;
mask_array[states.walk]			= s_warped_player_idle;
mask_array[states.jump]			= s_warped_player_idle;
mask_array[states.attack]		= s_warped_player_idle;
mask_array[states.block]		= s_warped_player_idle;
mask_array[states.crouch]		= s_warped_player_idle;
mask_array[states.crouch_block]	= s_warped_player_idle;
mask_array[states.hurting]		= s_warped_player_idle;
mask_array[states.knockback]	= s_warped_player_idle;
mask_array[states.die]			= s_warped_player_idle;





