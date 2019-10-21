//show_debug_overlay(true);

var gui_width = display_get_gui_width();
var gui_height = display_get_gui_height();

//set gui size
display_set_gui_size(window_get_width(), window_get_height());



if (global.Platform == PLATFORM_MOBILE) {
	obj_dpad.dpad_x = 75;
	obj_dpad.dpad_y = gui_height - 300;
	obj_dpad.visible = true;
	
	obj_analog_stick.guiX = gui_width - 200;
	obj_analog_stick.guiY = gui_height - 200;
}


if (mouse_check_button_pressed(mb_left)) {
	repeat(3) {
		//if (instance_exists(o_player)) instance_create_layer(mouse_x, mouse_y, "Gems", o_gem);	
	}
}

if (mouse_check_button_pressed(mb_right)) {
	//kill player
	//if (instance_exists(o_player)) o_player.hp = 0;
	
	//show 9slice info	
	//show_message("9 SLICE: " + string(get9Slice(mouse_x, mouse_y, global.tile_size, true)));
	
	////show tile locator text
	//var nine = get9Slice(mouse_x, mouse_y, global.tile_size, false);			
	//var tileId = tilesetMap_px_cave(nine, 0);	
	//var lay_id = layer_get_id("NineSliceTest");
	//var map_id = layer_tilemap_get_id(lay_id);
	//var tileId = tilemap_get_at_pixel(map_id, mouse_x, mouse_y)
	//show_message("TILE: " + string(tileId));
}

if (game_over_lose) {
	with (o_player) {
		getInput();
		if (jump or attack) {
			game_restart();	
		}
	}
}

//reduce delay time in game over room
if (game_over_won) {
	game_over_won_delay--;	
}