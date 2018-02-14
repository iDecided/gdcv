/// @description Insert description here
// You can write your code in this editor

if(canMove) {

	var noMoveFound = true;
	var counter = 0;
	while(noMoveFound) {
	
		counter++;
		if(counter > 20) {
			instance_destroy(self);
		}
		
		var randOptions = moveDir;
	
		if(!place_meeting(x-4, y, pacman_red_teleporter_obj) &&
		   !place_meeting(x-4, y, pacman_blue_teleporter_obj) &&
		   !place_meeting(x-4, y, pacman_green_teleporter_obj) &&
		   place_free(x-4, y) && moveDir != "Right") {
			canMove = false;
			if(irandom(1)) {
				randOptions = "Left";
				noMoveFound = false;
			}
		}
		if(!place_meeting(x+4, y, pacman_red_teleporter_obj) &&
		   !place_meeting(x+4, y, pacman_blue_teleporter_obj) &&
		   !place_meeting(x+4, y, pacman_green_teleporter_obj) &&
		   place_free(x+4, y) && moveDir != "Left") {
			canMove = false;
			if(irandom(1)) {
				randOptions = "Right";
				noMoveFound = false;
			}
		}
		if(!place_meeting(x, y-4, pacman_red_teleporter_obj) &&
		   !place_meeting(x, y-4, pacman_blue_teleporter_obj) &&
		   !place_meeting(x, y-4, pacman_green_teleporter_obj) &&
		   place_free(x, y-4) && moveDir != "Down") {
			canMove = false;
			if(irandom(1)) {
				randOptions = "Up";
				noMoveFound = false;
			}
		}
	
		if(!place_meeting(x, y+4, pacman_red_teleporter_obj) &&
		   !place_meeting(x, y+4, pacman_blue_teleporter_obj) &&
		   !place_meeting(x, y+4, pacman_green_teleporter_obj) &&
		   place_free(x, y+4) && moveDir != "Up") {
			canMove = false;
			if(irandom(1)) {
				randOptions = "Down";
				noMoveFound = false;
			}
		}
	
		moveDir = randOptions;
	}

	
}

if(!canMove) {
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
	
		if(x % 32 == 0 && y % 32 == 0) canMove = true;
	}