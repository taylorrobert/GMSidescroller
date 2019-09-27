//show_debug_overlay(true);


if (mouse_check_button_pressed(mb_left)) {
	repeat(3) {
		//if (instance_exists(o_player)) instance_create_layer(mouse_x, mouse_y, "Gems", o_gem);	
	}
}

if (mouse_check_button_pressed(mb_right)) {
	//if (instance_exists(o_player)) o_player.hp = 0;
	get9Slice(mouse_x, mouse_y, global.tile_size, true);
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