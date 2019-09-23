if (hp <= 0) {
	repeat(death_gem_value) {
		instance_create_layer(x, bbox_top, "Gems", o_gem);	
	}
	
	instance_destroy();
}