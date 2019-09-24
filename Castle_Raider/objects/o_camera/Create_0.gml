/// @description Insert description here
// You can write your code in this editor

var w = camera_get_view_width(view_camera[0]);
var h = camera_get_view_height(view_camera[0]);

//create camera
camera = camera_create_view(0, 0, w, h, 0, -1, 1, 128, 128);
view_set_camera(0, camera);

//camera following variables
follow = noone;
move_to_x = x;
move_to_y = y;

//how fast the camera pans
camera_pan_speed_initial = 0.15; //lower = slow pan
camera_pan_speed = 1;

//reset camera to default pan speed
alarm[CAMERA_RESET] = 3;

//screen shake
screen_shake = false;
screen_shake_amount_initial = 3;
screen_shake_amount = screen_shake_amount_initial;


room_goto_next();