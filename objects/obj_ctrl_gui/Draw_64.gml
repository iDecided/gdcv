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
}