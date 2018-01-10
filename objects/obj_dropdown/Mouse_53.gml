/// @description Insert description here
// You can write your code in this editor
if (position_meeting(mouse_x, mouse_y, self)) {
	if (instance_exists(obj_dropdown_item)) {
		with (obj_dropdown_item) {
			instance_destroy();
		}
	}
	else {
		var yIncrement = sprite_get_height(spr_tmp_dropdown);
		var yy = y + yIncrement;
		for (var i = 0; i < ds_list_size(optionsList); i++) {
		    var item = instance_create_depth(x, yy, -1000, obj_dropdown_item);
			item.text = optionsList[| i];
			yy += yIncrement;
		}
	}
}
else {
	if (!position_meeting(mouse_x, mouse_y, obj_dropdown_item)) {
		if (instance_exists(obj_dropdown_item)) {
			with (obj_dropdown_item) {
				instance_destroy();
			}
		}
	}
}