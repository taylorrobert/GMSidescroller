

for (i = 0; i < room_width div TILE_SIZE; i++) {
	for (var j = 0; j < room_height div TILE_SIZE; j++) {
		instance_create_layer(i * TILE_SIZE, j * TILE_SIZE, "Instances", o_wall);
	}
}

var dir = 0;

repeat (1000) {
	if (chance(50)) {		
		dir = choose(0, 1, 2, 3) * 90;
	}
	
	var object = instance_place(x, y, o_wall);
	
	instance_destroy(object);
	
	x += lengthdir_x(TILE_SIZE, dir);
	y += lengthdir_y(TILE_SIZE, dir);
	
	x = clamp(x, 0 + TILE_SIZE * 3, room_width - TILE_SIZE * 3);
	y = clamp(y, 0 + TILE_SIZE * 3, room_height - TILE_SIZE * 3);
	
	
}