
generated_tile_size = 16;
tile_group_size = 48;
side_buffer = 5;
turn_chance = 30;
total_area = 400;

for (i = 0; i < room_width div generated_tile_size; i++) {
	for (var j = 0; j < room_height div generated_tile_size; j++) {		
		instance_create_layer(i * generated_tile_size, j * generated_tile_size, "Structure", o_wall);
	}
}


var dir = 0;
var carved = 0;
var previousDir = dir;
var downCount = 0;

while (carved < total_area) {
	if (downCount > 5) {
		dir = choose(0, 2) * 90;
		downCount = 0;
	}
	else if (chance(turn_chance)) {				
		dir = choose(0, 1, 2, 3) * 90;					
	}
	
	if (dir == 90 || dir == 270) downCount++;
	
	
	
	var object = instance_place(x, y, o_wall);
	
	if (object) {
		
		for (var i = 0; i < tile_group_size div generated_tile_size; i++) {
			for (var j = 0; j < tile_group_size div generated_tile_size; j++) {
				instance_destroy(instance_place(x + (generated_tile_size * i), y + (generated_tile_size * j), o_wall));	
			}
		}
		carved++;	
	} 
	
	
	x += lengthdir_x(generated_tile_size, dir);
	y += lengthdir_y(generated_tile_size, dir);
	
	x = clamp(x, 0 + generated_tile_size * side_buffer, room_width - generated_tile_size * side_buffer - tile_group_size);
	y = clamp(y, 0 + generated_tile_size * side_buffer, room_height - generated_tile_size * side_buffer - tile_group_size);
	
	
}

//Add collision layer on top of walls
for (i = 0; i < room_width div generated_tile_size; i++) {
	for (var j = 0; j < room_height div generated_tile_size; j++) {
		var object = instance_place(i * generated_tile_size, j * generated_tile_size, o_wall);
		if (object != noone) {
				
			//draw collision layer
			var lay_id = layer_get_id("Collisions");
			var map_id = layer_tilemap_get_id(lay_id);
			var data = tilemap_get(map_id, 0, 0);
			tilemap_set(map_id, SOLID, i, j);
			
			////draw basic tile layer			
			//lay_id = layer_get_id("TileMid");
			//map_id = layer_tilemap_get_id(lay_id);
			//data = tilemap_get(map_id, 0, 0);			
			//tilemap_set(map_id, 22, i, j);		
			
		}		
	}
}


//clean up unwanted structures, like islands
for (i = 0; i < room_width; i += generated_tile_size) {	
	for (var j = 0; j < room_height; j += generated_tile_size) {	
		var object = instance_place(i, j, o_wall);
		if (object != noone) {
				
			
			//Clean up tiles drawn
			var lay_id = layer_get_id("NineSliceTest");
			var map_id = layer_tilemap_get_id(lay_id);
		
			var nine = get9Slice(i, j, generated_tile_size, false);		
			
			if (nine == G_9SLICE_SINGLEISLAND || nine == G_9SLICE_TOPHANGER || nine == G_9SLICE_BOTTOMUPJUT) 			
			{
				//Remove tiles
				var tile = tilemap_get_at_pixel(map_id, i, j);
				tile_set_empty(tile);
				tilemap_set_at_pixel(map_id, 0, i, j);
			
				//remove collision layer
				lay_id = layer_get_id("Collisions");
				map_id = layer_tilemap_get_id(lay_id);
				tile = tilemap_get_at_pixel(map_id, i, j);
				tile_set_empty(tile);
				tilemap_set_at_pixel(map_id, 0, i, j);
			}
		}		
	}
}


//fix into 9 slices
for (i = 0; i < room_width; i += generated_tile_size) {	
	for (var j = 0; j < room_height; j += generated_tile_size) {	
		
		var object = instance_place(i, j, o_wall);
		if (object != noone) {
			
		
			var nine = get9Slice(i, j, generated_tile_size, false);		
			instance_destroy(instance_place(i, j, o_wall));	
			
			if (nine == G_9SLICE_SINGLEISLAND) 
				continue;
			
			var tileId = tilesetMap_forest_cave(nine, 0);
			
			var lay_id;
			var map_id;	
			
			
			if (nine <= -1) continue; 
			
			if (nine == G_PLATFORM_LEFT || nine == G_PLATFORM_MID || nine == G_PLATFORM_RIGHT
					|| G_PLATFORM_WALLLEFT || G_PLATFORM_WALLRIGHT) 
			{
					
				//Create platforms out of single-width blocks		
				lay_id = layer_get_id("Platforms");
				map_id = layer_tilemap_get_id(lay_id);		
			}
			else {
				lay_id = layer_get_id("NineSliceTest");
				map_id = layer_tilemap_get_id(lay_id);	
			}
			
			tilemap_set(map_id, tileId, i div generated_tile_size, j div generated_tile_size);	
			
			
			
		}
		
		
	}
}


//Clean up unwanted structures



//go through in 4x4 squares and place platforms to get up and down if there are no vertical surfaces


//map 
