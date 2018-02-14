/// @description Insert description here
// You can write your code in this editor


//change alpha to flash

if(image_alpha == 1) {
	image_alpha = 0.5;
}
else {
	image_alpha = 1;
}

//reset alarm
alarm_set(0, 0.5 * room_speed);