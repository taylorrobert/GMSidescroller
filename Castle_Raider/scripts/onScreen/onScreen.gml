/// @descr onScreen(buffer);
/// @arg buffer
/// is the object on the screen?

var buf = argument0;
var left = global.cx - buf;
var right = global.cx + global.cw + buf;
var top = global.cy - buf;
var bottom = global.cy + global.ch + buf;

if (x > left and x < right and y > top and y < bottom) {
	return true;	
}

return false;