/// getInput();

if (global.Platform == noone) {
	left		= keyboard_check(vk_left) or keyboard_check(ord("A"));
	right		= keyboard_check(vk_right) or keyboard_check(ord("D"));
	//up			= keyboard_check(vk_up) or keyboard_check(ord("W"));
	//down		= keyboard_check(vk_down) or keyboard_check(ord("S"));
	attack		= keyboard_check(vk_shift) || mouse_check_button(mb_left);
	jump		= keyboard_check_pressed(vk_space);
	jump_held	= keyboard_check(vk_space);
	//block		= keyboard_check(ord("Z")) or keyboard_check(ord("C"));
	action		= keyboard_check(ord("E")) or keyboard_check(ord("X"));
	left_mouse	= mouse_check_button(mb_left);
}

//var gui_width = display_get_gui_width();
//var gui_height = display_get_gui_height();

//global.virtualKeyJump = virtual_key_add(gui_width - 100, gui_height - 75, 200, gui_height - 100, vk_space);


//virtual_key_show(global.rightVirtualKey);

//if (global.Platform == PLATFORM_MOBILE) {
	left		= keyboard_check(vk_left);
	right		= keyboard_check(vk_right);
	jump		= keyboard_check_pressed(vk_space);
	jump_held	= keyboard_check(vk_space);
	//attack		= keyboard_check(vk_shift);
//}

if (global.Platform == PLATFORM_CONSOLE) {
	//controller input
	var dev = 0;
	if (gamepad_is_connected(dev)) {
		var deadzone = 0.3;
		left				= gamepad_axis_value(dev, gp_axislh) < -deadzone or left;
		right				= gamepad_axis_value(dev, gp_axislh) > deadzone or right;
		up					= gamepad_axis_value(dev, gp_axislv) < -deadzone or up;
		down				= gamepad_axis_value(dev, gp_axislv) > deadzone or down;
		attack				= gamepad_button_check(dev, gp_face2) or attack;
		jump				= gamepad_button_check_pressed(dev, gp_face1) or jump;
		jump_held			= gamepad_button_check(dev, gp_face1) or jump_held;
		block				= gamepad_button_check(dev, gp_shoulderr) or block;
		action				= gamepad_button_check(dev, gp_face3) or action;
	
	}
}