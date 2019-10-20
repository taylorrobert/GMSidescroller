
generated_tile_size = 16;
tile_group_size = 48;
side_buffer = 5;
turn_chance = 30;
total_area = 400;
downCountMax = 12;

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
	if (downCount > downCountMax) {
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

//Make sure all passageways are navigable
//for (i = side_buffer * generated_tile_size; i < room_width - side_buffer * generated_tile_size; i += generated_tile_size) {	
//	for (var j = side_buffer * generated_tile_size; j < room_height - side_buffer * generated_tile_size; j += generated_tile_size) {	
		
//		var topHasSolid = instance_place(i - generated_tile_size, j, o_wall) > 0
//							and instance_place(i, j, o_wall) > 0
//							and instance_place(i + generated_tile_size, j, o_wall) > 0;
							
//		var bottomHasSolid = instance_place(i - generated_tile_size, j + generated_tile_size * 4, o_wall) > 0
//								and instance_place(i, j + generated_tile_size * 4, o_wall) > 0
//								and instance_place(i + generated_tile_size, j + generated_tile_size * 4, o_wall) > 0;
								
//		var mid1	= instance_place(i, j + generated_tile_size, o_wall);
//				var mid2	= instance_place(i, j + generated_tile_size * 2, o_wall);
//				var mid3	= instance_place(i, j + generated_tile_size * 3, o_wall);		
								
//		if (topHasSolid and bottomHasSolid and (mid1 < 0 || mid2 < 0 || mid3 < 0)) {
			
			
//			for (var side = -1; side < 2; side++) {				
//				var mid1	= instance_place(i + generated_tile_size * side, j + generated_tile_size, o_wall);
//				var mid2	= instance_place(i + generated_tile_size * side, j + generated_tile_size * 2, o_wall);
//				var mid3	= instance_place(i + generated_tile_size * side, j + generated_tile_size * 3, o_wall);				
		
//				instance_destroy(mid1);	
//				instance_destroy(mid2);
//				instance_destroy(mid3);
//			}
//		}
		
//	}
//}

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
			
			if (nine == G_9SLICE_SINGLEISLAND || nine == G_9SLICE_TOPHANGER || nine == G_9SLICE_BOTTOMUPJUT || nine == G_9SLICE_UNKNOWN) 			
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
			
			
			var lay_id;
			var map_id;	
			
			
			if (nine <= -1) continue; 
			
			if (nine == G_PLATFORM_LEFT || nine == G_PLATFORM_MID || nine == G_PLATFORM_RIGHT
					|| nine == G_PLATFORM_WALLLEFT || nine == G_PLATFORM_WALLRIGHT) 
			{
					
				//Create platforms out of single-width blocks		
				lay_id = layer_get_id("Collisions");
				map_id = layer_tilemap_get_id(lay_id);		
				tilemap_set(map_id, PLATFORM, i div generated_tile_size, j div generated_tile_size);	
			}
			
			var tileId = tilesetMap_forest_cave(nine, 0);
			lay_id = layer_get_id("NineSliceTest");
			map_id = layer_tilemap_get_id(lay_id);				
			
			tilemap_set(map_id, tileId, i div generated_tile_size, j div generated_tile_size);	
			
			
			
		}
		
		
	}
}


//Place bugs
for (i = 0; i < room_width; i += generated_tile_size) {	
	for (var j = 0; j < room_height; j += generated_tile_size) {	
		var canPlace = true;
		
		//check the group to see if there is an enemy already, or if it is not all solid
		for (var k = 0; k < 2 * generated_tile_size; k += generated_tile_size) {
			for (l = 0; l < 2 * generated_tile_size; l += generated_tile_size) {
				
				lay_id = layer_get_id("Collisions");
				map_id = layer_tilemap_get_id(lay_id);
				tile = tilemap_get_at_pixel(map_id, i + k, j + l);
				
				var inst = instance_place(i + k, j + l, o_enemy_parent);
				
				if (tile != VOID || inst > 0) {
					canPlace = false;
					break;
				}	
				
			}
			
			if (!canPlace) break;
		}
		
		if (canPlace and random(1000) < 5) 
			instance_create_layer(i + generated_tile_size, j + generated_tile_size, "Enemies", o_bug);
	}
}

//Place bugs
for (i = 0; i < room_width; i += generated_tile_size) {	
	for (var j = 0; j < room_height; j += generated_tile_size) {	
		var canPlace = true;
		
		//check the group to see if there is an enemy already, or if it is not all solid
		for (var k = 0; k < 4 * generated_tile_size; k += generated_tile_size) {
			for (var l = 0; l < 4 * generated_tile_size; l += generated_tile_size) {
				
				lay_id = layer_get_id("Collisions");
				map_id = layer_tilemap_get_id(lay_id);
				tile = tilemap_get_at_pixel(map_id, i + k, j + l);
				
				var inst = instance_place(i + k, j + l, o_enemy_parent);
				
				if ((l < 2 * generated_tile_size) and ( tile != VOID || inst > 0)
					or (l == (3 * generated_tile_size) and !isSolid(tile))) 
				{
					canPlace = false;
					break;
				}	
				
			}
			
			if (!canPlace) break;
		}
		
		if (canPlace and random(1000) < 50) 
			instance_create_layer(i + generated_tile_size, j + generated_tile_size * 2, "Enemies", o_frog);
	}
}
