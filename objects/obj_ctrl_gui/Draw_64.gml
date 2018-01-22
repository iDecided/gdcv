/// @description 
// You can write your code in this editor

if(menu_state == menu_states.ovw || menu_state == menu_states.items || menu_state == menu_states.people_overview || menu_state == menu_states.people_details) {
	draw_set_color(c_black);
	draw_set_font(fnt_datetime);
	var timeString = scr_format_time_string(global.date);
	draw_text(0, 0, weekdayNames[date_get_weekday(global.date)]);
	draw_text(110, 0, timeString);
}

if(menu_state == menu_states.people_overview) {
	//var tempName = global.names[| i];
	//var day = date_get_weekday(global.date);
	//var roomSched = global.schedules[? tempName];
	//var accessor = scr_get_hr_grid_accessor();
	
	//shouldDraw = roomSched[# day, accessor] == room_get_name(room);
}

if(menu_state == menu_states.people_details) {
	draw_sprite_ext(asset_get_index("spr_char_" + global.detailedCharacter), 0, -16, 176, 0.18, 0.18, 0, c_white, 1);
	
	// I should REALLY put this somewhere else...cuz like...that could REALLY cause lag in my game, calling this every single frame
	var personality = scr_load_json("character_details.json");
	
	draw_set_color(c_black);
	
	// Draw the bio section
	draw_set_font(fnt_people_details_bio);
	draw_text_ext(308, 256, personality[? global.detailedCharacter + "_bio"], font_get_size(fnt_people_details)+ 5, 287);
	
	// Draw the personality section
	draw_set_font(fnt_people_details);
	draw_text(650, 272, ds_list_find_value(personality[? global.detailedCharacter + "_personality"], 0));
	draw_text(650, 347, ds_list_find_value(personality[? global.detailedCharacter + "_personality"], 1));
	draw_text(650, 422, ds_list_find_value(personality[? global.detailedCharacter + "_personality"], 2));
	draw_text(650, 497, ds_list_find_value(personality[? global.detailedCharacter + "_personality"], 3));
	draw_text(650, 572, ds_list_find_value(personality[? global.detailedCharacter + "_personality"], 4));
	draw_text(650, 647, ds_list_find_value(personality[? global.detailedCharacter + "_personality"], 5));
	ds_map_destroy(personality);
	
	// Draw the items that you've given them so far
	for (var i = 0; i < floor(global.affectionMap[? detailedCharacter] / 20); ++i) {
	    draw_sprite_ext(asset_get_index("spr_gift_" + global.detailedCharacter), i, 1154, 268 + (i * 87), 0.063, 0.063, 0, c_white, 1);
	}
	
	// Draw the affection bar
	draw_text(711, 172, string(global.affectionMap[? global.detailedCharacter]) + "/100");
}