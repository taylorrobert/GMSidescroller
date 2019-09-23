if (image_index > 7) {
	if (gems_created < gems_to_spawn) {
		repeat(2) {
			instance_create_layer(x + random_range(-4, 4), y, "Gems", o_gem);
			gems_created++;
		}
		//time between spawns
		alarm[OPEN] = 10;
	}
}
else {
	//wait
	alarm[OPEN] = 1;
}