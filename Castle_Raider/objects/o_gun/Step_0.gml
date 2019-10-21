
var angle = getMouseAngleToPlayer();
var mouseSide = getMouseDirectionToPlayer();
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
	visible = true;
	image_speed = 1;
}
else {
	object_set_visible(o_gun, false);
	visible = false;
}