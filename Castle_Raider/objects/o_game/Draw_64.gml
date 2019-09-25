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






