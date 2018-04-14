///move_tiles(direction);

with(tile_obj) {
	var check_x = 0;
	var check_y = 0;
	var move_speed = 32;
	
	has_combined = false;
	if(argument0 == "Left") {
			check_x = -8;
			hspd = -move_speed;
	}
	else if(argument0 == "Right") {
			check_x = 8;
			hspd = move_speed;
	}
	else if(argument0 == "Up") {
			check_y = -8;
			vspd = -move_speed;
	}
	else if(argument0 == "Down") {
			check_y = 8;
			vspd = move_speed;
	}
	else {
		//No.
		return 0;
	}
}

//if(position_meeting(x+check_x, y+check_y, tile_obj)) {
	
//}

