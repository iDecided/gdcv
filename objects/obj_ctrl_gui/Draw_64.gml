/// @description 
// You can write your code in this editor

if(menu_state == menu_states.ovw || menu_state == menu_states.items || menu_state == menu_states.people_overview || menu_state == menu_states.people_details) {
	draw_set_color(c_black);
	draw_set_font(fnt_datetime);
	var timeString = scr_format_time_string(global.date);
	draw_text(0, 0, weekdayNames[date_get_weekday(global.date)]);
	draw_text(110, 0, timeString);
}

if(menu_state == menu_states.items) {
	/* if(nameToDraw != "" && levelToDraw >= 0)
	{
		draw_sprite_ext(asset_get_index("spr_gift_"+nameToDraw),levelToDraw,855,142,0.3,0.3,0,c_white,1);
		var desc = descMap[? nameToDraw + "_" + string(levelToDraw)];
	
		draw_set_color(c_white);
		draw_set_font(fnt_gifts);
		draw_text_ext(850, 498, desc, font_get_size(fnt_gifts)+10, 350);
	} */
}