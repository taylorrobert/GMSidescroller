//720, 360
//gems
draw_set_font(fnt_stats);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
var color = make_color_rgb(173, 144, 159);
draw_set_color(color);

//set draw location
var xx = display_get_gui_width() - 92;
var yy = 2;
draw_sprite(s_gem_gui, 0, xx, yy);

//text
var text_xx = 7;
var text_yy = 22;
draw_set_color(c_black);
draw_text(xx + text_xx + 1, yy + text_yy + 1, o_player.gems);
draw_set_color(color);
draw_text(xx + text_xx, yy + text_yy, o_player.gems);