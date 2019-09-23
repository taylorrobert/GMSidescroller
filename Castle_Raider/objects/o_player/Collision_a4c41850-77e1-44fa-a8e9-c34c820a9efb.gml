if (action and !other.open and hp > 0 and (bbox_bottom == other.bbox_bottom)) {
	with(other) {
		image_speed = 1;
		open = true;
		alarm[OPEN] = 1;
	}
}