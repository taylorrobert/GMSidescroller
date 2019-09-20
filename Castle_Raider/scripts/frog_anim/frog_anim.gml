/// anim();
sprite_index = sprites_array[state];
//mask_index = mask_array[state];
image_xscale = facing;

switch (state) {
	case states.jump:
		if (vsp < 0) image_index = 0;
		else image_index = 1;
	break;
}
