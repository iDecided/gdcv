/// @description Insert description here
// You can write your code in this editor


if(place_meeting(x+hspd, y+vspd, wall_obj)) {
	//var other_wall = instance_place(x+hspd, y+vspd, wall_obj);
	//if(hspd > 0) x = other_wall.x - 72;
	//if(hspd < 0) x = other_wall.x + 72;
	//if(vspd > 0) y = other_wall.y - 72;
	//if(vspd < 0) y = other_wall.y + 72;
	//x = x % 72 + board_grid_obj.x + 32;
	//y = y % 72 + board_grid_obj.y + 32;
	
	x = 72*round((board_grid_obj.x + x)/72) - board_grid_obj.x + 4;// + 32;
	y = 72*round((board_grid_obj.y + y)/72) - board_grid_obj.y + 4;// + 32;
	hspd = 0;
	vspd = 0;
}
else if(place_meeting(x+hspd, y+vspd, tile_obj)) {
	var other_tile = instance_place(x+hspd, y+vspd, tile_obj);
	
	if(other_tile.hspd == 0 && other_tile.vspd == 0) {
		if(value == other_tile.value && !other_tile.has_combined && !has_combined) {
			value *= 2;
			has_combined = true;
			image_blend = make_color_rgb(100+1.25*value, 100-value, value*1.25);
			instance_destroy(other_tile);
		}
		//only stop if they've stopped moving.
		else {
			if(hspd > 0) x = other_tile.x - 72;
			if(hspd < 0) x = other_tile.x + 72;
			if(vspd > 0) y = other_tile.y - 72;
			if(vspd < 0) y = other_tile.y + 72;
			//x -= hspd;
			//y -= vspd;
			x = 72*round((board_grid_obj.x + x)/72) - board_grid_obj.x + 4;// + 32;
			y = 72*round((board_grid_obj.y + y)/72) - board_grid_obj.y + 4;// + 32;
			hspd = 0
			vspd = 0;	
		}
	}

}
else {
	x += hspd;
	y += vspd;	
}