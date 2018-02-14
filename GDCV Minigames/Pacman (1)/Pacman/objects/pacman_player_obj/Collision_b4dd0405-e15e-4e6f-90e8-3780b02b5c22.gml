/// @description Insert description here
// You can write your code in this editor
with(other) {
instance_destroy();
}	

pacman_game_controller.current_dots += 3;

with(pacman_enemy_obj) {
	scared = true;
	moveDir = "None";
	canMove = true;
	alarm[0] = room_speed * 8;
	sprite_index = pacman_enemy_scared_spr;
}