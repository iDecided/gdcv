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
	
	// WHY THE ACTUAL FUCK IS THIS SO GODDAMN HARD LIKE FUCK THIS
	// ~ Zachary, at GGJ, on why drawing the detail affection bar is so dumb.
	/*var _numBars = floor(global.affectionMap[? global.detailedCharacter] / 20) + 1;
	if(global.affectionMap[? global.detailedCharacter] % 20 == 0) {
		_numBars--;
	}
	
	show_debug_message("Drawing " + string(_numBars));
	
	for (var i = 0; i < _numBars; ++i) {
		if(i * 20 <= global.affectionMap[? global.detailedCharacter]) {
			//show_debug_message("drawing full");
			//scr_draw_affection_bars(spr_detail_bar, 0, 265 + (i * 200), 454 + (i * 200), 155);
		}
		else {
			//show_debug_message("drawing percentage");
			//scr_draw_affection_bars(spr_detail_bar, 0, 265 + (i * 200), (265 + (i * 200)) + (454 * (global.affectionMap[? global.detailedCharacter] % 20) * 5 / 100), 155);
		} 
		
		scr_draw_affection_bars(spr_detail_bar, 0, 265 + (i * 200), (265 + (i * 200)) + (454 * (global.affectionMap[? global.detailedCharacter] % 20) * 5 / 100), 155);
		
		// scr_draw_affection_bars(spr_detail_bar, 0, 265 + (i * 200), ((454 * global.affectionMap[? global.detailedCharacter] - (global.affectionLevelMap[? global.detailedCharacter] * 20)) / 100), 155);
		//show_debug_message("Percentage needed: " + string((global.affectionMap[? global.detailedCharacter] % 20) * 5 / 100));
		//scr_draw_affection_bars(spr_detail_bar, 0, 265 + (i * 200), (265 + (i * 200)) + (454 * (global.affectionMap[? global.detailedCharacter] % 20) * 5 / 100), 155);
	}*/
	// FUCK IT, I CAN'T FIGURE THIS OUT, I'M WRITING A NEW DRAW SCRIPT THAT USES PERCENTAGES AND AN ENDPOINT
	
	//scr_draw_affection_bars_percentage(spr_detail_bar, 0, 265, 433, 50, 155);
	// Never mind...I'm just gunna work on the game jam stuff now...I'm sick of this. I'll figure it out later.
	
	// Oh my God...I finally fucking did it...I *finally* figured it out...goddammit...
	// 20:43 at night...so many hours later...and I figured it out
	// Here's something to think about in the future: it can really, REALLY help to make temp variables that are well named to help you figure out what you're doing.
	var fullBars = floor(global.affectionMap[? global.detailedCharacter] / 20);
	for (var i = 0; i < fullBars; ++i) {
	    scr_draw_affection_bars(spr_detail_bar, 0, 265 + (i * 200), 454 + (i * 200), 155);
	}
	// Find how much more we need to draw
	var remainder = global.affectionMap[? global.detailedCharacter] % 20;
	// Compute a number out of 100 that represents the percentage of the next bar that needs to be drawn
	var percentage = remainder * 100 / 20;
	//show_debug_message("remainder: " + string(remainder) + " percentage: " + string(percentage));
	// Checks to see if we even need to draw anything.
	if(remainder > 0) {
		// Draw the affection remainder bar
		var xOffset = 265 + (fullBars * 200);
		scr_draw_affection_bars(spr_detail_bar, 0, xOffset , xOffset + 189 * percentage / 100, 155);
	}
	
	//ds_map_destroy(charDetails);
}