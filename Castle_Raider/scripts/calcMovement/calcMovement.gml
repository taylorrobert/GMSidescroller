/// calcMovement();

var hdelta = (right - left) * walk_spd;
var vdelta = global.grav;

//if (sign(hdelta)) {
//	var next = tilemap_get_at_pixel(global.map, bbox_right + hdelta, bbox_bottom);
//	if (next == SOLID) 
//		hdelta = 0;
//	//if (next == SOLID) hdelta = hdelta - (bbox_right + hdelta)
//	//if (bbox_right + hdelta
//}
//else {
//	var next = tilemap_get_at_pixel(global.map, bbox_left - hdelta, bbox_bottom);
//	if (next == SOLID) 
//		hdelta = 0;
//}

//if (sign(vdelta)) {
//	var next = tilemap_get_at_pixel(global.map, bbox_bottom + vdelta, bbox_left);
//	if (next == SOLID) 
//		vdelta = 0;
//	//if (next == SOLID) hdelta = hdelta - (bbox_right + hdelta)
//	//if (bbox_right + hdelta
//}
//else {
//	var next = tilemap_get_at_pixel(global.map, bbox_top - vdelta, bbox_left);
//	if (next == SOLID) 
//		vdelta = 0;
//}



hsp += hdelta;
vsp += vdelta;

//drag
hsp = lerp(hsp, 0, drag);

//stop
if (abs(hsp) <= 0.1) hsp = 0

//set facing to mouse direction
mouseDir = getMouseDirectionToPlayer();

//face correct way
if (hsp != 0) movingDir = sign(hsp);
if (state != states.attack) 
	facing = movingDir;
else 
	facing = mouseDir;

//imit speed
hsp = min(abs(hsp), max_hsp) * movingDir;

//stop stretch
scale_x = lerp(scale_x, 1, scale_decay);
scale_y = lerp(scale_y, 1, scale_decay);