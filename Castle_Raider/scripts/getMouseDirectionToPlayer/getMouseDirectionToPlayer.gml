with (o_player) {
	
	if (global.Platform == PLATFORM_DESKTOP) {
		var w = surface_get_width(application_surface)/2;
		if (window_mouse_get_x() > w)
			return 1;
		else
			return -1;
	}
	else {
		if (obj_analog_stick.axisx == 0) return 1;
		if (obj_analog_stick.axisx > 0) return 1;
		if (obj_analog_stick.axisx < 0) return -1;
	}
}