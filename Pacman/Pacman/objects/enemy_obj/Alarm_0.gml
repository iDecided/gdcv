/// @description Insert description here
// You can write your code in this editor

scared = false;
sprite_index = enemy_spr;
if(x % 32 == 0 && y % 32 == 0) {
	canMove = true;
	moveDir = "None";
}
else {
	//reverse to normal 4x4 grid
	if(moveDir == "Left") {
		x += 2;
	}
	if(moveDir == "Right") {
		x -= 2;
	}
	if(moveDir == "Up") {
		y += 2;
	}
	if(moveDir == "Down") {
		y -= 2;
	}
}