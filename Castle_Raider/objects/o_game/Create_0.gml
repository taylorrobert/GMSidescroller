/// @description Insert description here
// You can write your code in this editor
macros();

global.grav = 0.25;


//set gui size
display_set_gui_size(720, 360);

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