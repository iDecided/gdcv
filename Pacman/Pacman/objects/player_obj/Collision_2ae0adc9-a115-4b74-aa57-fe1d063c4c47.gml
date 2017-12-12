/// @description Insert description here
// You can write your code in this editor

if(!hasTeleported) {
	canMove = true;
	moveDir = "None";
	x = other.partner.x;
	y = other.partner.y;
	hasTeleported = true;
	
	game_controller.cameraTargetX = 1280 + (736/2);
	game_controller.cameraTargetY = 576;
	game_controller.cameraTransition = true;
	
	//with(enemy_obj) {
		//canMove = false;
	//}
}