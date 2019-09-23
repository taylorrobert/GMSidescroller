show_debug_overlay(true);


if (mouse_check_button_pressed(mb_left)) {
	repeat(3) {
		instance_create_layer(mouse_x, mouse_y, "Gems", o_gem);	
	}
}