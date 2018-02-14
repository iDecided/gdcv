/// @description Insert description here
// You can write your code in this editor

if(!hasTeleported) {
	canMove = true;
	moveDir = "None";
	x = other.partner.x;
	y = other.partner.y;
	hasTeleported = true;
	
	pacman_game_controller.cameraTargetX = 1280+736;
	pacman_game_controller.cameraTargetY = 0;
	pacman_game_controller.cameraTransition = true;
	
	//with(enemy_obj) {
		//canMove = false;
	//}
}