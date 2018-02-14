/// @description Insert description here
// You can write your code in this editor

if(!pacman_game_controller.gameStarted) return;

if(canMove && !pacman_game_controller.cameraTransition) {

	if(keyboard_check(vk_left)) {
		if(place_free(x-4, y)) {
			canMove = false;
			moveDir = "Left";
		}
	}
	if(keyboard_check(vk_right)) {
		if(place_free(x+4, y)) {
			canMove = false;
			moveDir = "Right";
		}
	}
	if(keyboard_check(vk_up)) {
		if(place_free(x, y-4)) {
			canMove = false;
			moveDir = "Up";
		}
	}
	if(keyboard_check(vk_down)) {
		if(place_free(x, y+4)) {
			canMove = false;
			moveDir = "Down";
		}
	}
	
	if(moveDir == "Left") {
		x -= 4;
	}
	if(moveDir == "Right") {
		x += 4;
	}
	if(moveDir == "Up") {
		y -= 4;
	}
	if(moveDir == "Down") {
		y += 4;
	}
}
else if(moveDir == "Left" && keyboard_check(vk_right)) {
	moveDir = "Right";
}
else if(moveDir == "Right" && keyboard_check(vk_left)) {
	moveDir = "Left";
}
else if(moveDir == "Up" && keyboard_check(vk_down)) {
	moveDir = "Down";
}
else if(moveDir == "Down" && keyboard_check(vk_up)) {
	moveDir = "Up";
}

else {
	//move the player to grid
	if(moveDir == "Left") {
		x -= 4;
	}
	if(moveDir == "Right") {
		x += 4;
	}
	if(moveDir == "Up") {
		y -= 4;
	}
	if(moveDir == "Down") {
		y += 4;
	}
	
	if(x % 32 == 0 && y % 32 == 0) {
		canMove = true;
		moveDir = "None";	
	}

}

if(!place_meeting(x, y, pacman_red_teleporter_obj) &&
   !place_meeting(x, y, pacman_blue_teleporter_obj) &&
   !place_meeting(x, y, pacman_green_teleporter_obj)) {
    hasTeleported = false;
   }
   else {
	//hasTeleported = true;
   }