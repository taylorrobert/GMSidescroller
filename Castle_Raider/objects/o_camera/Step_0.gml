/// @description Insert description here
// You can write your code in this editor

//move towards move_to_x and move_to_y
x = lerp(x, move_to_x, camera_pan_speed);
y = lerp(y, move_to_y, camera_pan_speed);

camera_set_view_pos(camera, x - camera_get_view_width(camera)/2, y - camera_get_view_height(camera)/2);

if (follow != noone) {
	move_to_x = follow.x;
	var buffer = global.tile_size/2
	move_to_y = follow.y - buffer;
}

var xx = clamp(camera_get_view_x(camera), 0, room_width - camera_get_view_width(camera));
var yy = clamp(camera_get_view_y(camera), 0, room_height - camera_get_view_height(camera));

//screen shake
if (screen_shake) {
	xx += random_range(-screen_shake_amount, screen_shake_amount);	
	yy += random_range(-screen_shake_amount, screen_shake_amount);	
}

camera_set_view_pos(camera, xx, yy);

//camera
global.cx = camera_get_view_x(camera);
global.cy = camera_get_view_y(camera);
global.cw = camera_get_view_width(camera);
global.ch = camera_get_view_height(camera);

//background scrolling
var layer_id = layer_get_id("Background");
layer_x(layer_id, lerp(0, camera_get_view_x(view_camera[0]), 0.6))
layer_y(layer_id, lerp(0, camera_get_view_y(view_camera[0]), 0.4))

layer_id = layer_get_id("Background2");
layer_x(layer_id, lerp(0, camera_get_view_x(view_camera[0]), 0.5))
layer_y(layer_id, lerp(0, camera_get_view_y(view_camera[0]), 0.3))

layer_id = layer_get_id("Background3");
layer_x(layer_id, lerp(0, camera_get_view_x(view_camera[0]), 0.4))
layer_y(layer_id, lerp(0, camera_get_view_y(view_camera[0]), 0.2))

layer_id = layer_get_id("Background4");
layer_x(layer_id, lerp(0, camera_get_view_x(view_camera[0]), 0.3))
layer_y(layer_id, lerp(0, camera_get_view_y(view_camera[0]), 0.1))

layer_id = layer_get_id("Background5");
layer_x(layer_id, lerp(0, camera_get_view_x(view_camera[0]), 0.2))
layer_y(layer_id, lerp(0, camera_get_view_y(view_camera[0]), 0.0))