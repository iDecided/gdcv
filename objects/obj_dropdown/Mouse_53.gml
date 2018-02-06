/// @description Insert description here
// You can write your code in this editor
if (position_meeting(mouse_x, mouse_y, self)) {
	
	// Create the backend list based off of the type of dropdown it is
	if(listType == "day")
	{
		ds_list_add(optionsList, "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday");
		ds_list_add(valueList, 0, 1, 2, 3, 4, 5, 6);
	}
	else if(listType == "location")
	{
		ds_list_add(optionsList, "Central Campus", "Dining Center", "Game Dev Lab", "Library", "Streaming Room");
		ds_list_add(valueList, rm_cc, rm_dc, rm_gdl, rm_lib, rm_sr);
	}
	else if(listType == "time")
	{
		ds_list_add(optionsList, "Morning", "Afternoon", "Evening");
		ds_list_add(valueList, time.morning, time.afternoon, time.night);
	}
	else {
		show_message("Somehow, the dropdown that needed shows didn't have its 'listType' set.");
		game_end();
	}
	
	if (!ds_list_empty(dropdownItemsList)) {
		for (var i = 0; i < ds_list_size(dropdownItemsList); ++i) {
		    instance_destroy(dropdownItemsList[| i]);
		}
		ds_list_clear(dropdownItemsList);
	}
	else {
		var yIncrement = sprite_get_height(spr_tmp_dropdown);
		var yy = y - yIncrement;
		for (var i = 0; i < ds_list_size(optionsList); ++i) {
		    dropdownItemsList[| i] = instance_create_depth(x, yy, -1000, obj_dropdown_item);
			dropdownItemsList[| i].text = optionsList[| i];
			dropdownItemsList[| i].value = valueList[| i];
			dropdownItemsList[| i].owner = id;
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