
generated_tile_size = 16;
tile_group_size = 32;

for (i = 0; i < room_width div generated_tile_size; i++) {
	for (var j = 0; j < room_height div generated_tile_size; j++) {		
		instance_create_layer(i * generated_tile_size, j * generated_tile_size, "Structure", o_wall);
	}
}


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
		if (object != noone) {
				
			//draw collision layer
			var lay_id = layer_get_id("Collisions");
			var map_id = layer_tilemap_get_id(lay_id);
			var data = tilemap_get(map_id, 0, 0);
			tilemap_set(map_id, SOLID, i, j);
			
			//draw basic tile layer			
			lay_id = layer_get_id("TileMid");
			map_id = layer_tilemap_get_id(lay_id);
			data = tilemap_get(map_id, 0, 0);			
			tilemap_set(map_id, 22, i, j);
		}		
	}
}






//fix into 9 slices
for (i = 0; i < room_width div generated_tile_size; i++) {
	for (var j = 0; j < room_height div generated_tile_size; j++) {
		lay_id = layer_get_id("NineSliceTest");
		map_id = layer_tilemap_get_id(lay_id);
		data = tilemap_get(map_id, 0, 0);		
		var nine = get9Slice(i, j, generated_tile_size, false)
		tilemap_set(map_id, nine, i, j);
	}
}


//go through in 4x4 squares and place platforms to get up and down if there are no vertical surfaces


//map 
