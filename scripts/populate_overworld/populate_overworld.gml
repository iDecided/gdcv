/// Called from the game_ctlr to populate the current room with characters
/// In the future, with take the character's schedules into account as well


// ~~ Old way before adding days to the mix ~~
//for(var i=0; i<ds_list_size(global.names); i++) {
//	var roomSched = global.scheduleMap[? global.names[| i] + "_room"];
//	var accessor = scr_get_hr_grid_accessor();
//	if(roomSched[| accessor] == room_get_name(room)) {
//		with(instance_find(obj_ovw_char_prnt, i))
//		{
//			image_xscale = 0.1;
//			image_yscale = 0.1;
//			character = global.names[| i];
//			sprite_index = asset_get_index("spr_char_" + character + "_ovw");
//		}
//	}
//	else {
//		with(instance_find(obj_ovw_char_prnt, i))
//		{
//			image_xscale = 1;
//			image_yscale = 1;
//			character = "";
//			sprite_index = -1;
//		}
//	}
//}

/*var shouldDraw = true;
for(var i=0; i<ds_list_size(global.names); i++) {
	var tempName = global.names[| i];
	var day = date_get_weekday(global.date);
	
	var shouldDraw = true;
	
	if(global.plannedDates[? tempName] 
			&& !(ds_map_find_value(global.plannedDates[? tempName], "location") == room
			&& ds_map_find_value(global.plannedDates[? tempName], "day") == day
			&& ds_map_find_value(global.plannedDates[? tempName], "time") == global.tod)) {
		show_debug_message("skipping " + tempName + " because they have a date somewhere else.");
		show_debug_message(string(ds_map_find_value(global.plannedDates[? tempName], "day")) + string(ds_map_find_value(global.plannedDates[? tempName], "time")) + room_get_name(ds_map_find_value(global.plannedDates[? tempName], "location")));
		if(ds_map_find_value(global.plannedDates[? tempName], "location") == room
				&& ds_map_find_value(global.plannedDates[? tempName], "day") == day
				&& ds_map_find_value(global.plannedDates[? tempName], "time") == global.tod) {
			show_debug_message("You should be able to see " + tempName + " now because you need to meet them for your date.");
			with(instance_find(obj_ovw_char_prnt, i))
			{
				image_xscale = 0.1;
				image_yscale = 0.1;
				character = tempName;
				sprite_index = asset_get_index("spr_char_" + character + "_ovw");
			}
		}
	}
	else {
		var roomSched = global.schedules[? tempName];
		var accessor = scr_get_hr_grid_accessor();
		if(roomSched[# day, accessor] == room_get_name(room)) {
			with(instance_find(obj_ovw_char_prnt, i))
			{
				image_xscale = 0.1;
				image_yscale = 0.1;
				character = tempName;
				sprite_index = asset_get_index("spr_char_" + character + "_ovw");
			}
		}
		else {
			with(instance_find(obj_ovw_char_prnt, i))
			{
				image_xscale = 1;
				image_yscale = 1;
				character = "";
				sprite_index = -1;
			}
		}
	}
} */

var shouldDraw;
for(var i=0; i<ds_list_size(global.names); i++) {
	
	shouldDraw = true;
	
	var tempName = global.names[| i];
	var day = date_get_weekday(global.date);
	var roomSched = global.schedules[? tempName];
	var accessor = scr_get_hr_grid_accessor(global.date);
	
	shouldDraw = roomSched[# day, accessor] == room_get_name(room);
	
	if(global.plannedDates[? tempName]) { // Actually, this character is supposed to have a date
		// Now we need to check and see if it is currently the planned time and day
		if(ds_map_find_value(global.plannedDates[? tempName], "day") == day && ds_map_find_value(global.plannedDates[? tempName], "time") == global.tod) {
			// If it is, check to see if we're in the right room
			if(ds_map_find_value(global.plannedDates[? tempName], "location") == room) { //This is if we are in the right room
				shouldDraw = true;
			}
			else { // This is if we're not in the right room
				shouldDraw = false;
			}
			// Alternatively, you could set shouldDraw directly with the actual room check itself!
			/* shouldDraw = ds_map_find_value(global.plannedDates[? tempName], "location") == room; */
		}
		else { // If it's not, draw as normal.
			shouldDraw = roomSched[# day, accessor] == room_get_name(room);
		}
		
	}
	
	/* Code for determining which parent objects should have which name so that they can be drawn */
	if(shouldDraw) { // Set the character name to the appropriate one and set the sprite index to the character's ovw_ sprite
		with(instance_find(obj_ovw_char_prnt, i))
		{
			image_xscale = 0.1;
			image_yscale = 0.1;
			character = tempName;
			sprite_index = asset_get_index("spr_char_" + character + "_ovw");
		}
	}
	else { // Set the space to a blank string so that it doesn't render anyone, set sprite_index to -1 so that it doesn't render with an image
		with(instance_find(obj_ovw_char_prnt, i))
		{
			image_xscale = 1;
			image_yscale = 1;
			character = "";
			sprite_index = -1;
		}
	}
}