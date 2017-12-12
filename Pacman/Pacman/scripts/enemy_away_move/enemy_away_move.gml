/// @description Insert description here
// You can write your code in this editor

var moveSpeed = 2;

if(canMove) {

	var noMoveFound = true;
	var onceThrough = false;
	
	while(noMoveFound) {
	
	
		var randOptions = moveDir;
	
		if(!place_meeting(x-moveSpeed, y, red_teleporter_obj) &&
		   !place_meeting(x-moveSpeed, y, blue_teleporter_obj) &&
		   !place_meeting(x-moveSpeed, y, green_teleporter_obj) &&
		   place_free(x-moveSpeed, y) && moveDir != "Right") {
			canMove = false;
			if(player_obj.x > x || onceThrough) {
				randOptions = "Left";
				noMoveFound = false;
			}
		}
		if(place_free(x+moveSpeed, y) && moveDir != "Left") {
			canMove = false;
			if(player_obj.x < x || onceThrough) {
				randOptions = "Right";
				noMoveFound = false;
			}
		}
		if(place_free(x, y-moveSpeed) && moveDir != "Down") {
			canMove = false;
			if(player_obj.y > y || onceThrough) {
				randOptions = "Up";
				noMoveFound = false;
			}
		}
	
		if(place_free(x, y+moveSpeed) && moveDir != "Up") {
			canMove = false;
			if(player_obj.y < y || onceThrough) {
				randOptions = "Down";
				noMoveFound = false;
			}
		}
		
		onceThrough = true;
	
		moveDir = randOptions;
	}

	
}

if(!canMove) {
		//move the player to grid
		if(moveDir == "Left") {
			x -= moveSpeed;
		}
		if(moveDir == "Right") {
			x += moveSpeed;
		}
		if(moveDir == "Up") {
			y -= moveSpeed;
		}
		if(moveDir == "Down") {
			y += moveSpeed;
		}
	
		if(x % 32 == 0 && y % 32 == 0) canMove = true;
	}