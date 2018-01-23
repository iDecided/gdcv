/// @description Insert description here
// You can write your code in this editor
if (position_meeting(mouse_x, mouse_y, self)) {
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