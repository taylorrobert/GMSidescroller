//720, 360
//get gui dimensions
var gui_width = display_get_gui_width();
var gui_height = display_get_gui_height();



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

//game over
if (game_over_lose) {
	//center gui
	var mx = gui_width/2;
	var my = gui_height/2;
	//draw game over
	draw_sprite(s_game_over, 0, mx, my);
	draw_sprite(s_game_over_text, 0, mx, my);
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
















