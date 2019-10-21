with (o_player) {	
	if (global.Platform == PLATFORM_DESKTOP) {
		var p = point_direction(o_gun.x, o_gun.y, mouse_x, mouse_y);
		return p;
	}
	else {
		var stickAngle = point_direction(obj_analog_stick.guiX, obj_analog_stick.guiY, 
		obj_analog_stick.stickX, obj_analog_stick.stickY);
		return stickAngle;
	}
}