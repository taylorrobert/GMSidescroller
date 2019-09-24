//flicker

var _radius = 0;
var _intensity = 0;
if (flickering) {
	var _radius	= random_range(2,4);
	_intensity = random(.12);
}

gpu_set_blendmode(bm_add);
if (circle) {
	draw_circle_color(x, y, radius + _radius, merge_color(c_black, col, intensity + _intensity), c_black, 0);	
}
else {
	//ellipse
	var w = abs(sprite_width) * .75;
	var h = abs(sprite_height) + abs(sprite_height)*.75;
	draw_ellipse_color(x - w, y - h, x + w, y + h, merge_color(c_black, col, intensity + _intensity), c_black, 0);
}

gpu_set_blendmode(bm_normal);