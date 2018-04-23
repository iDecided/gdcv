/// @description Insert description here
// You can write your code in this editor
if (position_meeting(mouse_x, mouse_y, self)) {
	
	// Create the backend list based off of the type of dropdown it is
	if(listType == "day")
	{
		ds_list_add(optionsList, "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat");
		ds_list_add(valueList, 0, 1, 2, 3, 4, 5, 6);
		_typeNum = 0;
	}
	else if(listType == "time")
	{
		ds_list_add(optionsList, "Morning", "Afternoon", "Evening");
		ds_list_add(valueList, time.morning, time.afternoon, time.night);
		_typeNum = 1;
	}
	else if(listType == "location")
	{
		ds_list_add(optionsList, "Central Campus", "Dining Center", "Game Dev Lab", "Library", "Streaming Room");
		ds_list_add(valueList, rm_cc, rm_dc, rm_gdl, rm_lib, rm_sr);
		_typeNum = 2;
	}
	else {
		show_message("The dropdown that needed shows didn't have its 'listType' set.");
		game_end();
	}
	
	if (!ds_list_empty(dropdownItemsList)) {
		for (var i = 0; i < ds_list_size(dropdownItemsList); ++i) {
		    instance_destroy(dropdownItemsList[| i]);
		}
		ds_list_clear(dropdownItemsList);
	}
	else {
		var yIncrement = sprite_get_height(spr_dropdown_item) - 6;
		var yy = y - yIncrement;
		for (var i = 0; i < ds_list_size(optionsList); ++i) {
		    dropdownItemsList[| i] = instance_create_depth(x, yy, -1000, obj_dropdown_item);
			dropdownItemsList[| i].text = optionsList[| i];
			dropdownItemsList[| i].value = valueList[| i];
			dropdownItemsList[| i].owner = id;
			//show_debug_message(string(_typeNum));
			// 04/14/2018
			// I don't know why, but this is weird. For some reason, I had to move the super long boxes to the
			// second two spots in the actual sprite frames, even though that doesn't line up with the numbers I've
			// set _typeNum to in the above related if-statements
			dropdownItemsList[| i]._typeImageIndex = _typeNum * 2;
			yy -= yIncrement;
		}
	}
	
	ds_list_clear(optionsList);
	ds_list_clear(valueList);
}
else {
	if (!position_meeting(mouse_x, mouse_y, obj_dropdown_item)) {
		if (!ds_list_empty(dropdownItemsList)) {
			for (var i = 0; i < ds_list_size(dropdownItemsList); ++i) {
			    instance_destroy(dropdownItemsList[| i]);
			}
			ds_list_clear(dropdownItemsList);
		}
	}
}