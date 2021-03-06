/// @description Insert description here
// You can write your code in this editor
draw_self();

if(hoveredOver) {
	draw_sprite_ext(asset_get_index("spr_char_" + character), 0, 411, 87, -0.21, 0.21, 0, c_white, 1);
}

var day = date_get_weekday(global.date);
var roomSched = global.schedules[? character];
var accessor = scr_get_hr_grid_accessor(global.date);

var locationString;
if(global.plannedDates[? character] && ds_map_find_value(global.plannedDates[? character], "day") == day && ds_map_find_value(global.plannedDates[? character], "time") == global.tod) {
	locationString = room_get_name(ds_map_find_value(global.plannedDates[? character], "location"));
}
else {
	locationString = roomSched[# day, accessor];
}

locationString = scr_room_id_to_string(locationString, false);

if(!is_string(locationString)) {
	locationString = "Not Available";
}

draw_set_font(fnt_people);
draw_set_color(c_gray);
draw_text(x + 116, y, character);
draw_text(x + 144, y + 70, locationString);
// Use this to teach what why I didn't like what I did here. Shaun Spalding taught me this method.
//draw_sprite_ext(spr_overview_affection, index, x + 2, y + 118, 0.666 * (global.affectionMap[? character] / 100), 0.666, 0, c_white, 1);
if(global.affectionMap[? character] > 0) {
	scr_draw_affection_bars(spr_overview_bar, index, x - 2, x + (310 * global.affectionMap[? character] / 100), y + 118);
}