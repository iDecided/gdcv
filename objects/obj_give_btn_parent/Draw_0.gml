/// @description Insert description here
// You can write your code in this editor

// 03/07/18
// Now that I've copied all of this over and made a trinket child, I realized I have hardcoded the locations
// of the objects that are drawn. Now I'm going to fix that issue.

draw_self();

var _drawList = ds_list_create();

if(_childrenType = obj_gift_parent_2) {
	for (var i = 0; i < global.maxGifts; ++i) {
		var giftString = global.gifts[i];
		var owner = string_copy(giftString, 0, string_length(giftString) - 2);
		var level = string_char_at(giftString, string_length(giftString));
		if(global.affectionLevelMap[? owner] <= real(level)) {
			ds_list_add(_drawList, giftString);
		}
	}
}
else if(_childrenType = obj_trinket_parent) {
	// This is cool. Enums translate into just ints, so I can use them here as the end zones of the for loop
	for (var i = trinket.tr_1; i <= trinket.tr_6; ++i) {
		ds_list_add(_drawList, i);
	}
}

var _spriteMid = x + sprite_get_width(sprite_index) / 2;
//show_debug_message("the object middles are: " + string(_spriteMid));

if(_choosing) {
	draw_sprite(spr_gift_selector, 0, _spriteMid, y);
	
	if(!_childrenDrawn) {
		// Set the position for where the first item gets spawned relative to the object itself
		var startX = _spriteMid - 128;
		var startY = y - 204;
		var spacingX = 94;
		var spacingY = 89;
	
		var col = 0;
		var row = 0;
		// It seems really shaky to use the length of global.names to draw the gifts, but I think it checks out.
		// Has potential to be buggy!
		// JK, in this situation, I need to loop over all the gifts in my inventory and check to see if its level
		// is greater than or equal to that person's current affection level. If it is, draw it.
		// Again, this also appears legit but it also has the potential to be a bug later on depending on corner cases
		// Idk, I should see if someone can prove this mathematically.
		
		// 03/09 I'm making all these changes to share the drawing code between gifts and trinkets
		// I've hardcoded the six here because that's how many slots the giving button will show the player
		for (var i = 0; i < ds_list_size(_drawList); ++i) {
			//var owner = string_copy(giftString, 0, string_length(giftString) - 2);
			//var level = string_char_at(giftString, string_length(giftString));
			var tempX = startX + (col * spacingX);
			var tempY = (row * spacingY) + startY;
			var tempObj = instance_create_depth(tempX, tempY, -1, _childrenType);
			if(_childrenType = obj_gift_parent_2) {
				with(tempObj)
				{
					var giftString = _drawList[| i];
					_giftRecip = string_copy(giftString, 0, string_length(giftString) - 2);
					_giftLevel = string_char_at(giftString, string_length(giftString));
					_interactive = true;
					image_xscale = 0.07;
					image_yscale = 0.07;
				}
			}
			else {
				// The variable edit code for trinkets
				with(tempObj)
				{
					_type = _drawList[| i];
					_interactive = true;
				}
			}
			
			ds_list_add(_childrenObjs, tempObj);
			
			++col;
			if(col > 2)
			{
				++row;
				col = 0;
			}
		}
		_childrenDrawn = true;
	}
}

ds_list_clear(_drawList);
ds_list_destroy(_drawList);

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