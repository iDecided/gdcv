// I copy-pasted these checks from scr_populate_overworld
/// @arg0 guiObjList The tracker list that the gui uses to make sure that objects only get drawn once per frame

var _guiObjList = argument0;

var day = date_get_weekday(global.date);
var roomSched = global.schedules[? global.talkingTo];
var accessor = scr_get_hr_grid_accessor(global.date);

if(global.plannedDates[? global.talkingTo]) {
	show_debug_message("They should be showing the start date button");
	if(ds_map_find_value(global.plannedDates[? global.talkingTo], "day") == day && ds_map_find_value(global.plannedDates[? global.talkingTo], "time") == global.tod) {
		var startObj = instance_create_depth(367, 551, 0, obj_start_date);
		ds_list_add(_guiObjList, startObj);
	}
}

if(global.planningDate) {
	pickerLayer_bg = layer_create(-100, "datePicker_bg");
	var tempSpr = layer_sprite_create(pickerLayer_bg,0,0,spr_solid_black);
	layer_sprite_alpha(tempSpr, 0.90);

	pickerLayer_obj = layer_create(-101, "datePicker_obj");
	// 04/14/2018
	// So this had to be moved to the obj layer because I make the other layer have a lower opacity
	// And so I'mma move it to this one since it never changes.
	layer_sprite_create(pickerLayer_obj,640,192,spr_date_question);
	var tempObj = instance_create_layer(225, 326, pickerLayer_obj, obj_dropdown);
	with(tempObj) {
		listType = "day";
		defaultOption = "Day";
	}
	tempObj = instance_create_layer(396, 326, pickerLayer_obj, obj_dropdown);
	with(tempObj) {
		listType = "time";
		defaultOption = "Time";
	}
	tempObj = instance_create_layer(691, 326, pickerLayer_obj, obj_dropdown);
	with(tempObj) {
		listType = "location";
		defaultOption = "Location";
	}
	
	instance_create_layer(352, 454, pickerLayer_obj, obj_submit);
	instance_create_layer(672, 454, pickerLayer_obj, obj_cancel);
	
	//show_debug_message("There are this many drop down boxes: " + string(instance_number(obj_dropdown)));
}

if(global.showNewGift != "") {
	newGiftLayer_bg = layer_create(-100, "newGiftLayer_bg");
	var tempSpr = layer_sprite_create(newGiftLayer_bg,0,0,spr_solid_black);
	layer_sprite_alpha(tempSpr, 0.75);

	newGiftLayer_obj = layer_create(-101, "newGiftLayer_obj");
	instance_create_layer(640, 360, newGiftLayer_obj, obj_new_gift);
}

// Pretty much made this part unnecessary when I made it so that you can always attempt to give a gift
//if(global.affectionMap[? global.talkingTo] % 20 == 0 && global.affectionMap[? global.talkingTo] == (global.affectionLevelMap[? global.talkingTo] + 1) * 20) {
	//show_debug_message("Should be drawing the date stuff right now");
	
	// No longer need to spawn the give gift object because the option is always there.
	// Now, the NPC will just give a response based one when and what you give them.
	//var giveGift = instance_create_depth(576, 640, 0, obj_give_gift);
	//ds_list_add(argument0, giveGift);
	
	// This is the code for showing the date picker menu
	//var dayPicker = instance_create_depth(160, 585, 0, obj_dropdown);
	//with(dayPicker) {
	//	defaultOption = "DAY";
	//	listType = "day";
	//}
	//ds_list_add(argument0, dayPicker);
	
	//var timePicker = instance_create_depth(423, 585, 0, obj_dropdown);
	//with(timePicker) {
	//	defaultOption = "TIME";
	//	listType = "time";
	//}
	//ds_list_add(argument0, timePicker);
	
	//var placePicker = instance_create_depth(684, 585, 0, obj_dropdown);
	//with(placePicker) {
	//	defaultOption = "LOCATION";
	//	listType = "location";
	//}
	//ds_list_add(argument0, placePicker);
	
	//var submit = instance_create_depth(576, 640, 0, obj_submit);
	//ds_list_add(argument0, submit);
//}