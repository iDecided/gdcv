/// @description Insert description here
// You can write your code in this editor
draw_self();

// Currently have a pretty large issue where this draws the objects every single frame, leading to hundred
// and a LOT of slow down. Will take care of later.

if(accepted) {
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
}