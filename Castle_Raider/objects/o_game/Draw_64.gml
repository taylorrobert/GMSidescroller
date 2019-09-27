//720, 360

//used for testing level gen code
if (!layer_get_id("Player")) return;

//get gui dimensions
var gui_width = display_get_gui_width();
var gui_height = display_get_gui_height();

if (room != rm_menu) {

	if (room != rm_game_end) {
		//gems
		draw_set_font(fnt_stats);
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		var color = make_color_rgb(173, 144, 159);
		draw_set_color(color);

		//set draw location
		var xx = gui_width - 92;
		var yy = 2;
		draw_sprite(s_gem_gui, 0, xx, yy);

		//text
		var text_xx = 7;
		var text_yy = 22;
		draw_set_color(c_black);
		draw_text(xx + text_xx + 1, yy + text_yy + 1, o_player.gems);
		draw_set_color(color);
		draw_text(xx + text_xx, yy + text_yy, o_player.gems);

		//hp bar
		xx = 48;
		yy = 25;
		draw_sprite(s_hp_bar, 1, xx, yy);
		draw_sprite_ext(s_hp_bar, 2, xx, yy, o_player.hp/o_player.max_hp, 1, 0, c_white, image_alpha);
		draw_sprite(s_hp_bar, 0, xx, yy);

		//lives
		xx = 48;
		yy = 32;
		var gap = 22;
		if (lives > 0) {
			for (var i = 0; i < lives; i++) {
				draw_sprite(s_lives, 0, xx + i * gap, yy);	
			}
		}



		//score
		xx = gui_width / 2;
		yy = 11;
		draw_sprite(s_score, 0, xx, yy);
		draw_set_halign(fa_right);
		text_xx = 54;
		text_yy = 14;
		//draw shadow
		draw_set_color(c_black);
		draw_text(xx + text_xx + 1, yy + text_yy + 1, score);
		//draw text
		draw_set_color(color);
		draw_text(xx + text_xx, yy + text_yy, score);
	}



	

	//game over
	if (game_over_lose or (game_over_won and game_over_won_delay <= 0)) {
		//center gui
		if (game_over_won) {
			var mx = gui_width/4;
			var my = gui_height/2;
		}
		else {
			//game over lose	
			var mx = gui_width/2;
			var my = gui_height/2;
		}
		
		//draw game over
		draw_sprite(s_game_over, 0, mx, my);
		if (game_over_lose) var _index = 0 else var _index = 1;
		draw_sprite(s_game_over_text, _index, mx, my);
		draw_set_halign(fa_right);
		draw_set_color(c_white);
	
		//create array of text to output
		var text;
	
		//line1
		//gems value | gems | gems total
		text[0] = string(o_player.gems_value) + " x";
		text[1] = o_player.gems;
		var _gems_total = o_player.gems * o_player.gems_value;
		text[2] = _gems_total;
	
		//line2
		//lives value | lives | lives total
		text[3] = string(o_player.lives_value) + " x";
		text[4] = lives;
		var _lives_total = lives * o_player.lives_value;
		text[5] = _lives_total;
	
		//line3
		//blank | "Score" | score
		text[6] = "";
		text[7] = "Score";
		text[8] = score;
	
		//line 4
		//blank | "Total Score" | total score
		text[9] = "";
		text[10] = "Total Score";
		var _score_total =  score + _gems_total + _lives_total;
		text[11] = _score_total;
		
		//update highscore
		if _score_total > highscore {
			highscore = _score_total;
			ini_open(savename);
			ini_write_real("Score", "Highscore", highscore);
			ini_close();
		}
	
	
		//set starting pos
		var xx = mx - 10;
		var yy = my - 32;	
		//set gaps
		var gap_c = 40;
		var gap_r = 30;
		//what line we are on
		var line = 0;
		var rows = 4;
		var columns = 3;
	
		for (var j = 0; j < rows; j++) {
			for (var i = 0; i < columns; i++) {
				draw_text(xx + i * gap_c, yy, text[i + line * columns]);	
			}
			yy += gap_r;
			line++;
		
			//move down extra for the last line
			if (j == 2) yy += gap_r/3;
		}
	}


}
else {
	//draw main menu and fade to first level
	var start_y = 350; //how far animation moves
	var factor = start_y;
	
	var max_frames = 60; //how long animation goes for
	if (current_frame < max_frames) {
		current_frame++;
		var move = EaseOutBounce(current_frame, 0, 1, max_frames)
	}
	else {
		move = 1;
		//allow game start as menu has dropped
		if ((keyboard_check_pressed(vk_space) or gamepad_button_check_pressed(0, gp_face1))
				and !instance_exists(o_fade)) {
			fadeToRoom(rm_start, 0, 0, 1, c_black);	
		}
	}
	
	draw_sprite(s_main_menu, 0, 0, (move * factor) - start_y);
	
	//highscore
	if (current_frame == max_frames) {
		draw_set_halign(fa_right);
		draw_set_font(fnt_bookman);
		draw_text_ext_color(gui_width - 10, 28, highscore, 5, 100, c_aqua, c_aqua, c_gray, c_gray, 1);
	}
}


//fade screen in
if (fade_in) {
	alpha = lerp(alpha, 0, fade_spd);
	draw_set_alpha(alpha);
	draw_rectangle_color(0, 0, gui_width, gui_height, c_black,c_black,c_black,c_black, false);
	draw_set_alpha(1);
}










