/// @description Insert description here
// You can write your code in this editor

// 03/07/18
// Now that I've copied all of this over and made a trinket child, I realized I have hardcoded the locations
// of the objects that are drawn. Now I'm going to fix that issue.

draw_self();

if(_choosing) {
	draw_sprite(spr_gift_selector, 0, x + (sprite_get_width(spr_give_gift) / 2), y);
	
	if(!_giftsDrawn) {
		var startX = 707;
		var startY = 372;
		var spacingX = 94;
		var spacingY = 89;
	
		var col = 0;
		var row = 0;
		// It seems really shaky to use the length of global.names to draw the gifts, but I think it checks out.
		// Has potential to be buggy!
		// JK, in this situation, I need to loop over all the gifts in my inventory and check to see if its level
		// is greater than or equal to that person's current affection level. If it is, draw it.
		// Again, this also appears legit but it also has the potential to be a bug later one depending on corner cases
		// Idk, I should see if someone can prove this mathematically.
		for (var i = 0; i < global.maxGifts; ++i) {
			var giftString = global.gifts[i];
			//show_debug_message("Currently checking to see if we should be drawing " + giftString);
			var owner = string_copy(giftString, 0, string_length(giftString) - 2);
			var level = string_char_at(giftString, string_length(giftString));
			//show_debug_message(owner + "_" + level + " vs. " + giftString);
			
			// Ah, see this one of those gotchyas again! You have to make sure to change level to an integer so that it can properly be compared!
			if(global.affectionLevelMap[? owner] <= real(level)) {
				show_debug_message("We should be drawing the object for " + giftString);
				var tempX = startX + (col * spacingX);
				var tempY = (row * spacingY) + startY;
				var tempObj = instance_create_depth(tempX, tempY, -1, obj_gift_parent_2);
				with(tempObj)
				{
					_giftRecip = owner;
					_giftLevel = level;
					_interactive = true;
					image_xscale = 0.07;
					image_yscale = 0.07;
				}
				ds_list_add(_giftObjs, tempObj);
			
				++col;
				if(col > 2)
				{
					++row;
					col = 0;
				}
			}
		}
		_giftsDrawn = true;
	}
}

// Currently have a pretty large issue where this draws the objects every single frame, leading to hundred
// and a LOT of slow down. Will take care of later.
// Created a global variable and am moving this to scr_draw_gui_talking
/*if(accepted) {
	pickerLayer = layer_create(-100, "datePicker");
	var tempSpr = layer_sprite_create(pickerLayer,0,0,spr_solid_black);
	layer_sprite_alpha(tempSpr, 0.5);

	var tempObj = instance_create_layer(352, 320, pickerLayer, obj_dropdown);
	with(tempObj) {
		listType = "day";
		defaultOption = "DAY";
	}
	tempObj = instance_create_layer(640, 320, pickerLayer, obj_dropdown);
	with(tempObj) {
		listType = "time";
		defaultOption = "TIME";
	}
	tempObj = instance_create_layer(928, 320, pickerLayer, obj_dropdown);
	with(tempObj) {
		listType = "location";
		defaultOption = "LOCATION";
	}
	
	instance_create_layer(480, 384, pickerLayer, obj_cancel);
	instance_create_layer(672, 384, pickerLayer, obj_submit);
	
	show_debug_message("There are this many drop down boxes: " + string(instance_number(obj_dropdown)));
}*/