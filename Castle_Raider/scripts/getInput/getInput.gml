/// getInput();

left		= keyboard_check(vk_left);
right		= keyboard_check(vk_right);
up			= keyboard_check(vk_up);
down		= keyboard_check(vk_down);
attack		= keyboard_check_pressed(vk_shift);
jump		= keyboard_check_pressed(vk_space);
jump_held	= keyboard_check(vk_space);
block		= keyboard_check(ord("Z"));


//controller input
var dev = 0;
if (gamepad_is_connected(dev)) {
	var deadzone = 0.3;
	left				= gamepad_axis_value(dev, gp_axislh) < -deadzone or left;
	right				= gamepad_axis_value(dev, gp_axislh) > deadzone or right;
	up					= gamepad_axis_value(dev, gp_axislv) < -deadzone or up;
	down				= gamepad_axis_value(dev, gp_axislv) > deadzone or down;
	attack				= gamepad_button_check_pressed(dev, gp_face2) or attack;
	jump				= gamepad_button_check_pressed(dev, gp_face1) or jump;
	jump_held			= gamepad_button_check(dev, gp_face1) or jump_held;
	block				= gamepad_button_check(dev, gp_shoulderr) or block;
	
}