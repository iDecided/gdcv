/// @description 
// You can write your code in this editor

// Draw nothing for a menu except what's already in the room
if(menu_state == menu_states.none) {
	
	// 03/19/18
	// I was looking online to find out how to draw clipping masks and I literally just copy-pasted this
	// from online and it just worked. No changes, no updates, one-to-one just magically worked.
	// This might be the first time that's ever happened in my life and I'm kind of taken aback by it tbh.
	// Anyways, yeah. This is code that will be used for drawing conversations on the talking screen. Just an update.
	/*var clip_height = 500;
	var clip_width = 500;
	var clip_x = 50;
	var clip_y = 50;
	
	// create a surface if it doesn't exist:
	var clip_surface = surface_create(clip_width, clip_height);
	// clear and start drawing to surface:
	surface_set_target(clip_surface);
	draw_clear_alpha(c_black, 0);
	// draw things here, subtracting (clip_x, clip_y) from coordinates:
	// draw_circle(mouse_x - clip_x, mouse_y - clip_y, 40, false);
	draw_sprite(spr_btn_load_game, 0, mouse_x - clip_x, mouse_y - clip_y);
	// finish and draw the surface itself:
	surface_reset_target();
	draw_surface(clip_surface, clip_x, clip_y);*/
}

// Draw the top menu
if(menu_state == menu_states.ovw || menu_state == menu_states.items || menu_state == menu_states.people_overview || menu_state == menu_states.people_details) {
	draw_sprite(spr_tm_bg, 0, 0, 0);
	draw_sprite(spr_tm_timeline, 0, 207, 29);
	
	// This was before I was drawing the time to the popup
	//draw_set_color(c_black);
	//draw_set_font(fnt_datetime);
	//var timeString = scr_format_time_string(global.date, true);
	//draw_text(0, 0, weekdayNames[date_get_weekday(global.date)]);
	//draw_text(110, 0, timeString);
	
	draw_set_color(c_gray);
	draw_set_font(fnt_datetime);
	//var hasHalfHour = clamp((date_get_minute(global.date)-29), 0, 1);
	//show_debug_message(string(hasHalfHour));
	draw_text(20, 15, weekdayNames[date_get_weekday(global.date)]);
	var tempX = 266 + ((date_get_hour(global.date)-8) * 40) + clamp((date_get_minute(global.date)-29), 0, 1) * 20;
	draw_sprite(spr_tm_time_popup, 0, tempX, 66);
	draw_set_font(fnt_datetime_small);
	draw_set_color(c_white);
	var timeString = scr_format_time_string(global.date, true);
	draw_set_halign(fa_center);
	draw_text(tempX, 66 + 21, timeString);
	draw_set_halign(fa_left);
}

if(menu_state == menu_states.people_overview) {
	//var tempName = global.names[| i];
	//var day = date_get_weekday(global.date);
	//var roomSched = global.schedules[? tempName];
	//var accessor = scr_get_hr_grid_accessor();
	
	//shouldDraw = roomSched[# day, accessor] == room_get_name(room);
}

if(menu_state == menu_states.people_details) {
	show_debug_message(global.detailedCharacter + "'s Affection is: " + string(global.affectionMap[? global.detailedCharacter]) + " and their level is: " + string(global.affectionLevelMap[? global.detailedCharacter]));
	
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
	// Update: I added an affectionLevelMap that will be updated any time affection is increased or decreased.
	for (var i = 0; i < global.affectionLevelMap[? global.detailedCharacter]; ++i) {
	    draw_sprite_ext(asset_get_index("spr_gift_" + global.detailedCharacter), i, 1171, 237 + (i * 88), 0.079, 0.079, 0, c_white, 1);
	}
	
	// Draw the affection bar
	draw_text(711, 172, string(global.affectionMap[? global.detailedCharacter]) + "/100");
	
	// All of the code for drawing the segmented bars used to be here, but I've moved it to its own script now
	// This is so I can use the same code to draw the segmented affection bar on the talking screen
	scr_draw_affection_bars_seg(global.affectionMap[? global.detailedCharacter], global.detailedCharacter, 265, 189, 155);
	
	
	// Code for drawing the schedule times onto the screen
	draw_set_font(fnt_schedule);
	draw_set_valign(fa_center);
	
	// 04/08/2018
	// Oh my God, did I really just use 'blah' as a variable name?
	var blah = ["Campus", "C-Store", "Dining", "GDL", "Library", "Pearson", "S-Room", "UDCC", "???"];
	var slots = [8, 10, 14];
	var spacer = [46.375, 37.1, 26.5];
	var todTimes = [date_create_datetime(2017,1,1,8,0,0), date_create_datetime(2017,1,1,12,0,0), date_create_datetime(2017,1,1,17,0,0)];
	
	var day = date_get_weekday(global.date);
	var roomSched = global.schedules[? global.detailedCharacter];
	var accessor = 0;
	var locationString = "";
	
	// This trick is really interesting because of the way that enums work. 
	// Enums are automatically enumerated and since they start at 0, I can create arrays and access
	// them based on the numeric value of the enum
	// I'm really abusing arrays and enums like this
	for (var i = 0; i < slots[global.tod]; ++i) {
		accessor = scr_get_hr_grid_accessor(todTimes[global.tod]);
		locationString = scr_room_id_to_string(roomSched[# day, accessor], true);
		draw_text(905, 242 + (i * spacer[global.tod]), scr_format_time_string(todTimes[global.tod], false) + " - " + locationString);
		// I initially tried just the function call here (date_inc_minute(todTimes[global.tod], 30))
		// However this doesn't work because the function doesn't actually modify the value, since GML is entirely
		// pass-by-value. Instead, it just returns what it should be, so you have to set the value in the array itself.
		todTimes[global.tod] = date_inc_minute(todTimes[global.tod], 30);
	}
	draw_set_valign(fa_left);
}

if(menu_state == menu_states.talking) {
	// Draw the character bust
	draw_sprite_ext(asset_get_index("spr_char_" + global.talkingTo), 0, 416, 25, -0.25, 0.25, 0, c_white, 1);
	
	// Draw the affection bar
	scr_draw_affection_bars_seg(global.affectionMap[? global.talkingTo], global.talkingTo, 264, 189, 668);
	
	//// 03/19/18
	//// 03/21/18 Moved this to here.
	//// I was looking online to find out how to draw clipping masks and I literally just copy-pasted this
	//// from online and it just worked. No changes, no updates, one-to-one just magically worked.
	//// This might be the first time that's ever happened in my life and I'm kind of taken aback by it tbh.
	//// Anyways, yeah. This is code that will be used for drawing conversations on the talking screen. Just an update.
	////var clip_height = 392;
	////var clip_width = 718;
	//var clip_x = 434;
	//var clip_y = 161;
	
	//// 04/08/2018
	//// Turns out that this is a MASSIVE memory leak, because the surface never gets destroyed.
	//// So what I'm going to do is have it create the surface on room start. Otherwise, make it a null pointer.
	//// Also, I have to move the width and height with it as well.
	//// create a surface if it doesn't exist:
	////var clip_surface = surface_create(clip_width, clip_height);
	
	//// clear and start drawing to surface:
	//// surface_set_target(clip_surface);
	//surface_set_target(conversationSurface);
	//draw_clear_alpha(c_black, 0);
	//// draw things here, subtracting (clip_x, clip_y) from coordinates:
	//// draw_circle(mouse_x - clip_x, mouse_y - clip_y, 40, false);
	
	//// Here, you have to subtract the masks' coordinates because by putting it in a surface, that reframes the 0,0 to be the surface's 0,0
	//// So if you didn't do this and you drew where the mouse was, it would always be offset by the x,y of the surface
	//draw_sprite(spr_solid_black, 0, 0 - clip_x, 0 - clip_y);
	//// finish and draw the surface itself:
	//// Note: this is a really important function to call
	//surface_reset_target();
	//draw_surface(conversationSurface, clip_x, clip_y);
}