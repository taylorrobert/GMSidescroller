/// @description  draw the stick

draw_sprite_ext(boundSprite,0,guiX,guiY,image_xscale,image_yscale,0,c_white,alpha); 

// stick
draw_sprite_ext(stickSprite,0,stickX,stickY,image_xscale,image_yscale,0,c_white,alpha); 


// debug

axisx = scr_get_analog_stick_axis(self,axis.X); 
axisy = scr_get_analog_stick_axis(self,axis.Y); 

//draw_text(32,32,string_hash_to_newline("x: "+string(axisx)+"#y: "+string(axisy))); 

var stickAngle = point_direction(obj_analog_stick.guiX, obj_analog_stick.guiY, 
obj_analog_stick.stickX, obj_analog_stick.stickY);
		
	//if (mouseDir < 0) stickAngle += 180;
	
draw_text(32,32,string_hash_to_newline(
	"x: "+string(obj_analog_stick.axisx)
	+"#y: "+string(obj_analog_stick.axisy)
	+"#Angle: "+string(stickAngle)
	+"#guiMouseX: "+string(guiMouseX)
	+"#guiMouseY: "+string(guiMouseY)
	+"#stickX: "+string(stickX)
	+"#stickY: "+string(stickY)
	+"#guiX: "+string(guiX)
	+"#guiY: "+string(guiY)
)); 

