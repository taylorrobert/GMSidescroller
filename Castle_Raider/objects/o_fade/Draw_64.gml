//get dimensions
var dw = display_get_gui_width();
var dh = display_get_gui_height();

//fade to color
if (fade_to_color) {
	alpha += fade_spd;
	draw_set_alpha(alpha);
	draw_rectangle_color(0, 0, dw, dh, col, col, col, col, false);
	if (alpha >= 1) {
		fade_to_color = false;
		with(o_player) {
			//set starting position
			room_start_pos_x = other.target_x;
			room_start_pos_y = other.target_y;
			x = room_start_pos_x;
			y = room_start_pos_y;
			
			//set facing direction
			room_start_facing_direction = other.facing;
			facing = room_start_facing_direction;
			
			//reset values
			hsp = 0;
			vsp = 0;
			hsp_decimal = 0;
			vsp_decimal = 0;
			scale_x = 1;
			scale_y = 1;
			
			//change state and update animation
			state = states.idle;
			anim();
		}
		
		//pan camera quickly
		o_camera.camera_pan_speed = 1;
		room_goto(target_rm);
	}
}
else {
	//fade from color
	alpha -= fade_spd;
	draw_set_alpha(alpha);
	draw_rectangle_color(0, 0, dw, dh, col, col, col, col, false);
	if (alpha <= 0) {
		//reset camera pan speed
		o_camera.camera_pan_speed = o_camera.camera_pan_speed_initial;
		instance_destroy();
	}
}

draw_set_alpha(1);