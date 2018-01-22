/// @description Insert description here
// You can write your code in this editor
draw_self();

if(hoveredOver) {
	draw_sprite_ext(asset_get_index("spr_char_" + character), 0, 411, 87, -0.21, 0.21, 0, c_white, 1);
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

switch (locationString) {
	case "rm_cc":
		locationString = "Central Campus";
		break;
	case "rm_cs":
		locationString = "Convenience Store";
		break;
	case "rm_dc":
		locationString = "Dining Center";
		break;
	case "rm_gdl":
		locationString = "Game Dev Lab";
		break;
	case "rm_lib":
		locationString = "Library";
		break;
	case "rm_ps":
		locationString = "Pearson Hallway";
		break;
	case "rm_sr":
		locationString = "Streaming Room";
		break;
	case "rm_ud":
		locationString = "Union Drive";
		break;
	default:
		break;
}

if(!is_string(locationString)) {
	locationString = "Not Available";
}

draw_set_font(fnt_people);
draw_text(x + 116, y, character);
draw_text(x + 144, y + 70, locationString);
draw_sprite_ext(spr_overview_affection, index, x + 2, y + 118, 0.666 * (global.affectionMap[? character] / 100), 0.666, 0, c_white, 1);