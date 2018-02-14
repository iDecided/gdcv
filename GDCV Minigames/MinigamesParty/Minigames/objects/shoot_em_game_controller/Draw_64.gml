/// @description Insert description here
// You can write your code in this editor

if(!has_started) {
	draw_text(232, 416, "WASD/ARROW to move, Mouse to aim/shoot.");
}

else {
	if(timer >= game_length) {
		draw_text(232, 670, "Kill all enemies!");
	}
	else {
		var time_left = game_length - timer;
		time_left = round(time_left);
		draw_text(232, 670, "Time remaining: " + string(time_left));
	}
}