/// @description Insert description here
// You can write your code in this editor

// 03/07/18
// Now that I've copied all of this over and made a trinket child, I realized I have hardcoded the locations
// of the objects that are drawn. Now I'm going to fix that issue.

// 04/08/2018
// Alright, so I just struggled with depth drawing issues where the messages would draw over the green popup and jeezus
// fuck, Ryan helped me figure it out. Literally all I did was go into the room and move the instances layer to the very top
// of the layer list so that the layer the button is on draws on top of everything else. Idk why that actually works and is
// something to look into, but hey it's fixed for now so yaaaay. View Discord DM logs for more info.

draw_self();

var _drawList = ds_list_create();

if(_childrenType = obj_gift_parent_2) {
	// It seems really shaky to use the length of global.names to draw the gifts, but I think it checks out.
	// Has potential to be buggy!
	// JK, in this situation, I need to loop over all the gifts in my inventory and check to see if its level
	// is greater than or equal to that person's current affection level. If it is, draw it.
	// Again, this also appears legit but it also has the potential to be a bug later on depending on corner cases
	// Idk, I should see if someone can prove this mathematically.
	for (var i = 0; i < global.maxGifts; ++i) {
		var giftString = global.gifts[i];
		var owner = string_copy(giftString, 0, string_length(giftString) - 2);
		var level = string_char_at(giftString, string_length(giftString));
		if(global.affectionLevelMap[? owner] <= real(level)) {
			ds_list_add(_drawList, giftString);
		}
	}
	_popupSprite = spr_gift_selector;
}
else if(_childrenType = obj_trinket_parent) {
	// This is cool. Enums translate into just ints, so I can use them here as the end zones of the for loop
	// I did do a thing though where I initially just did i<trinket.tr_6, but that doesn't work
	// You have to make it <= because otherwise, it'll only draw 5 of the trinkets, not all six
	for (var i = trinket.tr_1; i <= trinket.tr_6; ++i) {
		ds_list_add(_drawList, i);
	}
	_popupSprite = spr_trinket_selector;
}

var _buttonMid = x + sprite_get_width(sprite_index) / 2;
//show_debug_message("the object middles are: " + string(_buttonMid));

if(_choosing) {
	draw_sprite(_popupSprite, 0, _buttonMid, y);
	
	if(!_childrenDrawn) {
		// Set the position for where the first item gets spawned relative to the object itself
		var startX = _buttonMid - 128;
		var startY = y - 204;
		var spacingX = 94;
		var spacingY = 89;
	
		var col = 0;
		var row = 0;
		
		// 03/09 I'm making all these changes to share the drawing code between gifts and trinkets
		// I've hardcoded the six here because that's how many slots the giving button will show the player
		for (var i = 0; i < ds_list_size(_drawList); ++i) {
			//var owner = string_copy(giftString, 0, string_length(giftString) - 2);
			//var level = string_char_at(giftString, string_length(giftString));
			var tempX = startX + (col * spacingX);
			var tempY = (row * spacingY) + startY;
			var tempObj = instance_create_depth(tempX, tempY, -1, _childrenType);
			if(_childrenType == obj_gift_parent_2) {
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

// 04/08/2018
// This used to all be in the left clicked, but now I've moved it here so that it's entirely dependent on just changing
// the _choosing variable. If you change just that one variable, this will work.
// This would also be a fantastic way to teach state machines, because it also depends on the sub-state of whether the objects are drawn
if(!_choosing) {
	if(_childrenDrawn) {
		for (var i = 0; i < ds_list_size(_childrenObjs); ++i) {
			instance_destroy(_childrenObjs[| i], true);
		}
		ds_list_clear(_childrenObjs);
	}
	_childrenDrawn = false;
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