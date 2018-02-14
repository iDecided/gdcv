/// @description Insert description here
// You can write your code in this editor


if(zoomIn) {
	if(cameraX2 > 736) {
		cameraX2 -= 23;
	}
	if(cameraY2 > 576) {
		cameraY2 -= 18;
	}
	else {
	zoomIn = false;
	}
	
	camera2 = camera_create_view(cameraX1, cameraY1, cameraX2, cameraY2, 0, -1, -1, -1, 32, 32);
	view_set_camera(1, camera2);
	
	cameraTransition = false;

}

if(cameraTransition) {

	var changed = false;

	if (cameraX1 < cameraTargetX) {
		cameraX1 += 23;
		changed = true;
	}
	if (cameraY1 < cameraTargetY) {
		cameraY1 += 18;
		changed = true;
	}
	
	if (cameraX1 > cameraTargetX) {
		cameraX1 -= 23;
		changed = true;
	}
	if (cameraY1 > cameraTargetY) {
		cameraY1 -= 18;
		changed = true;
	}
	
	camera2 = camera_create_view(cameraX1, cameraY1, 736, 572, 0, -1, -1, -1, 32, 32);
	view_set_camera(1, camera2);
	
	if(!changed) {
		cameraTransition = false;
		
		with(pacman_enemy_obj) {
			canMove = true;
		}
	}	
}


//if(instance_number(heart_obj) == 0) {
if(current_dots >= goal_dots) {
	minigame_info_slave.did_win = true;
	minigame_info_slave.draw_something = true;
	room_goto(startingPacmanRoom);
}



