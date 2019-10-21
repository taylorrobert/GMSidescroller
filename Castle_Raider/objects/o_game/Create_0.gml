/// @description Insert description here
// You can write your code in this editor
macros();


switch (os_type)
{
	case os_windows: 
	case os_linux: 
	case os_macosx:
		global.Platform = PLATFORM_DESKTOP; break;
	case os_android: 
	case os_ios: 
		global.Platform = PLATFORM_MOBILE; break;
	case os_xboxone:
	case os_ps4:
	case os_ps3:
		global.Platform = PLATFORM_CONSOLE; break;
}


//var gui_width = display_get_gui_width();
//var gui_height = display_get_gui_height();

//global.leftVirtualKey = virtual_key_add(50, gui_height - 100, 80, 50, vk_left);
//global.rightVirtualKey = virtual_key_add(130, gui_height - 100, 80, 50, vk_right);
//global.jumpVirtualKey = virtual_key_add(gui_width - 100, gui_height - 200, 50, 50, vk_space);


//virtual_key_show(global.leftVirtualKey);
//virtual_key_show(global.rightVirtualKey);
//virtual_key_show(global.jumpVirtualKey);







global.grav = 0.25;


//set gui size
display_set_gui_size(window_get_width(), window_get_height());

var gui_width = display_get_gui_width();
var gui_height = display_get_gui_height();

global.vkey_jump = virtual_key_add(gui_width - 350, gui_height - 600, 200, 200, vk_space);
//virtual_key_show(global.vkey_jump)

//how many sparks come off gems
gem_sparks = 6;

//enemy sparks
enemy_sparks = 6;

//game over
//game over and we lost
game_over_lose = false;

//game over and we won
game_over_won = false;

//score delay
game_over_won_delay = room_speed * 3;

//main menu
current_frame = 0;

//fade in menu
fade_in = true;
alpha = 1;
fade_spd = 0.02;


savename = "game.sav";
highscore = 0;

//open save file
ini_open(savename);
//read an old highscore or set it to 0 if none
highscore = ini_read_real("Score", "Highscore", 0);
ini_close();