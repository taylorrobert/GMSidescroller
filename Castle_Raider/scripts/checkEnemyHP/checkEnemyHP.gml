if (hp <= 0) {
	repeat(death_gem_value) {
		instance_create_layer(x, bbox_top, "Gems", o_gem);	
		
		//generate particles
		repeat(o_game.enemy_sparks) {
			var inst = instance_create_depth(x, (bbox_bottom + bbox_top)/2, depth - 1, o_spark);
			switch (object_index) {
				case o_frog:
					if (choose(0, 1, 1)) {
						//gray
						inst.col_head = c_gray;
						inst.col_tail = c_dkgray;
					} else {
						//white
						inst.col_head = c_white;
						inst.col_tail = c_ltgray;
					}
				break;
			}
		}
	}
	
	scr_screen_shake(.15, -1);
	instance_destroy();
}