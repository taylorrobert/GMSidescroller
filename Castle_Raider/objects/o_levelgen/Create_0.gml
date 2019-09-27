
generated_tile_size = 16;
tile_group_size = 32;

for (i = 0; i < room_width div generated_tile_size; i++) {
	for (var j = 0; j < room_height div generated_tile_size; j++) {		
		instance_create_layer(i * generated_tile_size, j * generated_tile_size, "Structure", o_wall);
	}
}


//instance_create_layer(i * tile_group_size, j * tile_group_size, "Structure", o_wall);
//instance_create_layer(i * tile_group_size + generated_tile_size, j * tile_group_size, "Structure", o_wall);		
//instance_create_layer(i * tile_group_size, j * tile_group_size + generated_tile_size, "Structure", o_wall);
//instance_create_layer(i * tile_group_size + generated_tile_size, j * tile_group_size + generated_tile_size, "Structure", o_wall);

var dir = 0;
var total_area = 300;
var carved = 0;

while (carved < total_area) {
	if (chance(50)) {		
		dir = choose(0, 1, 2, 3) * 90;
	}
	
	var object = instance_place(x, y, o_wall);
	
	if (object) {
		carved++;	
		instance_destroy(object);
		instance_destroy(instance_place(x + generated_tile_size, y, o_wall));
		instance_destroy(instance_place(x, y + generated_tile_size, o_wall));
		instance_destroy(instance_place(x + generated_tile_size, y + generated_tile_size, o_wall));
	} 
	
	
	x += lengthdir_x(tile_group_size, dir);
	y += lengthdir_y(tile_group_size, dir);
	
	x = clamp(x, 0 + generated_tile_size * 3, room_width - generated_tile_size * 3);
	y = clamp(y, 0 + generated_tile_size * 3, room_height - generated_tile_size * 3);
	
	
}

for (i = 0; i < room_width div generated_tile_size; i++) {
	for (var j = 0; j < room_height div generated_tile_size; j++) {
		var object = instance_place(i * generated_tile_size, j * generated_tile_size, o_wall);
		var sliceId = get9Slice(object);
	}
}

//go through in 4x4 squares and place platforms to get up and down if there are no vertical surfaces


//map 
