//movement
hsp = spd * facing;
image_xscale = sign(hsp);

//stop if dead
if (die) hsp = 0;

//destroy at wall if moved more than 1 tile
if (abs(xstart - x) > global.tile_size) {
	if (sign(hsp)) var side = bbox_right else var side = bbox_left;
	var t1 = tilemap_get_at_pixel(global.map, side + sign(hsp), y);
	if (t1 == SOLID) {
		die = true;	
	}
	collision();
}
else {
	x += hsp;	
}

//play animation
if (die) {
	//jump to image index 1 the first time we run die
	if (image_speed != 1) image_index = 1;
	image_speed = 1;	
}

//destroy if leaving room
if (x > room_width or x < 0) instance_destroy();