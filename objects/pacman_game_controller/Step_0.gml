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
	// Ryan's code
	minigame_info_slave.did_win = true;
	
	// Took this out because Ryan draws stuff to the screen
	//minigame_info_slave.draw_something = true;
	//room_goto(rm_talking);
	
	// My code, copied from the date win object
	show_debug_message("You finished the date. Deleting: " + global.talkingTo);

	// There are three things that need to happen here:
	// 1) Delete the date from the list of planned dates
	// 2) Advance the time of day
	// 3) Increase affection and affection level
	// 4) Give the character a new random item
	// 5) Send them back to the talking screen
	// 6) Trigger hyper-happy monologue
	ds_map_delete(global.plannedDates, global.talkingTo);
	scr_advance_tod();
	scr_add_affection(5, true);

	var receivedRandomGift = false;
	var giftStr;
	do {
		var randPers = global.names[| irandom_range(0, ds_list_size(global.names) - 1)];
		giftStr = randPers + "_" + string(global.affectionLevelMap[? randPers] + 1);
		receivedRandomGift = scr_add_gift(randPers, global.affectionLevelMap[? randPers] + 1);
	} until (receivedRandomGift);

	global.showNewGift = giftStr;

	UPDATE_GUI;

	room_goto(rm_talking);
	// event_inherited();
}



