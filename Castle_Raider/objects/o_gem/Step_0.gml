//movement

calcEntityMovement();

//bounce
if (onGround() and !bounce) {
	//give vertical movement
	vsp = vsp_initial * random_range(.7, .8);
	bounce = true;
	can_pickup = true;
}

//bounce off walls
if (sign(hsp_initial)) var side = bbox_right;
else var side = bbox_left

var t1 = tilemap_get_at_pixel(global.map, side + sign(hsp_initial), bbox_bottom);
if (t1 == SOLID) {
	//wall found, reverse direction
	hsp = hsp_initial * .75 * -1;
}

//destroy if falls out of room
if (die or y > room_height) instance_destroy();

//collide with walls
collision();
