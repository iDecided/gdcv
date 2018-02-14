/// @description Insert description here
// You can write your code in this editor

var shoot_direction;

//on top wall
if(!place_free(x, y-1)) {
	shoot_direction = 270;
}

//on bottom wall
else if(!place_free(x, y+1+sprite_height)) {
	shoot_direction = 90;
}

//on left wall
else if(!place_free(x-1, y)) {
	shoot_direction = 0;
}

//on right wall
else if(!place_free(x+1+sprite_width, y)) {
	shoot_direction = 180;
}

var new_bullet = instance_create_depth(x, y, -10, shoot_em_enemy_bullet_obj);
with(new_bullet) {
	direction = shoot_direction;
	speed = 6;
}

alarm[0] = 2 * room_speed;