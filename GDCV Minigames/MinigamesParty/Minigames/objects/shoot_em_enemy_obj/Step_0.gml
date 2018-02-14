/// @description Insert description here
// You can write your code in this editor

move_bounce_solid(false)

//if(x < 0 || x > 720 || y < 0 || y > 720) {
//	instance_destroy();
//} 

if(enemy_health <= 0) {
	instance_destroy();
}