/// @description Insert description here
// You can write your code in this editor

if(!did_move) {
	if(keyboard_check_pressed(vk_left)) {
		move_tiles("Left");
		did_move = true;
	}
	else if(keyboard_check_pressed(vk_right)) {
		move_tiles("Right");
		did_move = true;
	}
	else if(keyboard_check_pressed(vk_up)) {
		move_tiles("Up");
		did_move = true;
	}
	else if(keyboard_check_pressed(vk_down)) {
		move_tiles("Down");
		did_move = true;
	}

	
}

if(did_move) {
	with(tile_obj) {
		if(hspd != 0 || vspd != 0) return 0;	
	}
	did_move = false;
	if(!create_random_tile()) {
	//game over	
	show_debug_message("GAME OVER");
	}
}