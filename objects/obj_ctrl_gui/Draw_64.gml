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
	// Draw the character portrait
	draw_sprite_ext(asset_get_index("spr_char_" + global.detailedCharacter), 0, 320, 156, -0.19, 0.19, 0, c_white, 1);
	
	draw_set_color(c_black);
	
	// Draw the bio section
	draw_set_font(fnt_people_details_bio);
	draw_text_ext(332, 245, charDetails[? global.detailedCharacter + "_bio"], font_get_size(fnt_people_details) + 5, 306);
	
	// Draw the personality section
	draw_set_font(fnt_people_details);
	var personality = charDetails[? global.detailedCharacter + "_personality"];
	for (var i = 0; i < ds_list_size(personality); ++i) {
		draw_text(690, 272 + 74 * i, ds_list_find_value(personality, i));
	}
	
	// Draw the items that you've given them so far
	// THIS DOES NOT WORK EFFECTIVELY. NEEDS REFACTORING LATER.
	// When someone is ready for a gift, they'll have a multiple of 20, which would draw the the item, even though they're still waiting for it...
	for (var i = 0; i < floor(global.affectionMap[? global.detailedCharacter] / 20); ++i) {
	    draw_sprite_ext(asset_get_index("spr_gift_" + global.detailedCharacter), i, 1171, 237 + (i * 88), 0.079, 0.079, 0, c_white, 1);
	}
	
	// Draw the affection bar
	draw_text(711, 172, string(global.affectionMap[? global.detailedCharacter]) + "/100");
	
	//ds_map_destroy(charDetails);
}