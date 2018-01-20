/// @description Insert description here
// You can write your code in this editor
draw_self();
if(hoveredOver) {
	draw_sprite_ext(asset_get_index("spr_char_" + character), 0, -16, 176, 0.18, 0.18, 0, c_white, 1);
}

var day = date_get_weekday(global.date);
var roomSched = global.schedules[? character];
var accessor = scr_get_hr_grid_accessor();

var locationString;
if(global.plannedDates[? character] && ds_map_find_value(global.plannedDates[? character], "day") == day && ds_map_find_value(global.plannedDates[? character], "time") == global.tod) {
	locationString = room_get_name(ds_map_find_value(global.plannedDates[? character], "location"));
}
else {
	locationString = roomSched[# day, accessor];
}
if(!is_string(locationString)) {
	locationString = "Not Available";
}

draw_set_font(fnt_people);
draw_text(463, y + 36, locationString);