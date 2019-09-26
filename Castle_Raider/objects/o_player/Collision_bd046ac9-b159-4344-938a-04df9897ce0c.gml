with (other) {
	if (!active) {
		fadeToRoom(target_rm, target_x, target_y, other.facing, c_black);
		active = true;
	}
}