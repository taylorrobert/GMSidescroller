
var angle = point_direction(x, y, mouse_x, mouse_y);
var mouseSide = surface_get_width(application_surface)/2 < window_mouse_get_x() ? 1 : -1;
image_xscale = mouseSide;
image_angle = angle;

if (mouseSide > 0) {
	
	x = o_player.x + 3;
	y = o_player.y - 26;	
}
else {
	image_angle += 180;
	x = o_player.x - 3;
	y = o_player.y - 26;
}

if (o_player.attack) {
	object_set_visible(object_index, true);
	image_speed = 1;
}
else {
	object_set_visible(object_index, false);
	image_speed = 0
}