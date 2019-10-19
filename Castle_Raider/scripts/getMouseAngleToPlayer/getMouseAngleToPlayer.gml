with (o_player) {
	var w = camera_get_view_width(o_camera) / 2;
	if (window_mouse_get_x() > w)
		return 1;
	else
		return -1;
}