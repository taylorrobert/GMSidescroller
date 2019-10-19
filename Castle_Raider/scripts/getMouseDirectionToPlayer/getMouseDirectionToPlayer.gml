with (o_player) {
	var w = surface_get_width(application_surface)/2;
	if (window_mouse_get_x() > w)
		return 1;
	else
		return -1;
}