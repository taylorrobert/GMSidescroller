//breathing

if (breath_timer < 0) {
	//start breath animation
	image_speed = 1;
}
else {
	breath_timer--;
}

//stop breathing at the end of the animation
if (image_index >= image_number	- sprite_get_speed(sprite_index)/room_speed) {
	breath_timer = breath_timer_initial;
	//pause at the first frame
	image_index = 0;
	image_speed = 0;
}