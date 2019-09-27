/// @description 
// You can write your code in this editor

//draw_sprite_ext(mask_index,0,x,y,image_xscale,image_yscale,0,c_red,1);  

//flash red when taking damage
if (hurt) {
	flash_counter++;
	var flash_on_time = 8; // how long the sprite will stay red
	if (flash_counter < flash_on_time) {	
		
		//comment all this out for an empty flash
		
		//flash white
		gpu_set_fog(true, c_white, 0, 0);
		draw_self();
		gpu_set_fog(false, c_white, 0, 0);
		//flash red
		//draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_maroon, image_alpha);
	}
	else {
		draw_self();
		if (flash_counter > flash_on_time * 2) flash_counter = 0;
	}
}
else {
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * scale_x, image_yscale * scale_y, image_angle, c_white, image_alpha);
}
