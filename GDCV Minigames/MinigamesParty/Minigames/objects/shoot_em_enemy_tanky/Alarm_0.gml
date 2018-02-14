/// @description Insert description here
// You can write your code in this editor


for(var i = 0; i < 6; i++) {
	var new_bullet = instance_create_depth(x, y, -10, shoot_em_enemy_bullet_obj);
	with(new_bullet) {
		direction = i * 60;
		speed = 6;
	}

}

alarm[0] = 2 * room_speed;
