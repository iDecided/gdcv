/// @description Insert description here
// You can write your code in this editor

event_inherited();

var prevX = x;
var prevY = y;

//on top wall
if(!place_free(x, y-1)) {
	move_contact_solid(90 + (90*clockwise), moveSpeed);
	var change = abs(prevX - x);
	if (change != moveSpeed) {
		//need to go down now.
		move_contact_solid(270, moveSpeed - change);
	}
}

//on bottom wall
else if(!place_free(x, y+1)) {
	move_contact_solid(270 + (90*clockwise), moveSpeed);
	var change = abs(prevX - x);
	if (change != moveSpeed) {
		//need to go up now.
		move_contact_solid(90, moveSpeed - change);
	}
}

//on left wall
else if(!place_free(x-1, y)) {
	move_contact_solid(180 + (90*clockwise), moveSpeed);
	var change = abs(prevY - y);
	if (change != moveSpeed) {
		//need to go right now.
		move_contact_solid(0, moveSpeed - change);
	}
}

//on right wall
else if(!place_free(x+1+sprite_width, y)) {
	move_contact_solid(0 + (90*clockwise), moveSpeed);
	var change = abs(prevY - y);
	if (change != moveSpeed) {
		//need to go left now.
		move_contact_solid(180, moveSpeed - change);
	}
}