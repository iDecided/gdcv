/// @description Insert description here
// You can write your code in this editor
with(other) {
instance_destroy();
}	

with(enemy_obj) {
	scared = true;
	moveDir = "None";
	canMove = true;
	alarm[0] = room_speed * 8;
	sprite_index = enemy_scared_spr;
}