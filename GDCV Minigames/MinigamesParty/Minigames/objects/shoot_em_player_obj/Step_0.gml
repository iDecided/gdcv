/// @description Insert description here
// You can write your code in this editor

if(shoot_em_game_controller.has_started) {

	if(my_health <= 0) shoot_em_game_controller.completed = true;
	
	if(keyboard_check(vk_left) || keyboard_check(ord("A"))) {
		x -= moveSpeed;
	}

	if(keyboard_check(vk_up) || keyboard_check(ord("W"))) {
		y -= moveSpeed;
	}

	if(keyboard_check(vk_right) || keyboard_check(ord("D"))) {
		x += moveSpeed;
	}

	if(keyboard_check(vk_down) || keyboard_check(ord("S"))) {
		y += moveSpeed;
	}
	
	x = clamp(x, 32 + 32, 752 - 32);
	y = clamp(y, 64 + 32, 640 - 32);

	var shot_dir = point_direction(x, y, mouse_x, mouse_y);
	image_angle = shot_dir;

	timer += (delta_time/1000000);
	
	//if (mouse_check_button_pressed(mb_left)) {
		if(timer > shotRate) {
			var new_bullet = instance_create_depth(x, y, -10, shoot_em_player_bullet_obj);
			with(new_bullet) {
				direction = shot_dir;
				speed = 20;
			}
			timer = 0;
		}
	//}
}