///@arg x
///@arg y

var tilemap = "Collisions";

var xx = argument0;
var yy = argument1;

var xp = x;
var yp = y;

x = xx;
y = yy;

var meeting = tilemap_get_at_pixel(tilemap, bbox_right, bbox_top) ||
				tilemap_get_at_pixel(tilemap, bbox_right, bbox_bottom) ||
				tilemap_get_at_pixel(tilemap, bbox_left, bbox_top) ||
				tilemap_get_at_pixel(tilemap, bbox_left, bbox_bottom);
				
				
x = xp;
y = yp;

return meeting;
				