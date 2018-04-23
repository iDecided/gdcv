/// @description Insert description here
// You can write your code in this editor
listType = pointer_null;
defaultOption = "";

optionsList = ds_list_create();
valueList = ds_list_create();
dropdownItemsList = ds_list_create();
image_speed = 0;
selectedText = defaultOption;
selectedValue = pointer_null;

// Moving this to the left clicked event because I need to set the variable in code instead of in the editor
//if(listType == "day")
//{
//	ds_list_add(optionsList, "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday");
//	ds_list_add(valueList, 0, 1, 2, 3, 4, 5, 6);
//}
//else if(listType == "location")
//{
//	ds_list_add(optionsList, "Central Campus", "Dining Center", "Game Dev Lab", "Library", "Streaming Room");
//	ds_list_add(valueList, rm_cc, rm_dc, rm_gdl, rm_lib, rm_sr);
//}
//else if(listType == "time")
//{
//	ds_list_add(optionsList, "Morning", "Afternoon", "Evening");
//	ds_list_add(valueList, time.morning, time.afternoon, time.night);
//}

// 04/14/2018
// So this is used to change the length of the background sprite.
// Btw, I had to change the sprite collision mask to precise per frame in order to make it dynamic
// based on the size. Definitely not something you'd want to do for like...everything. It's just a
// few items on screen at a time with these.
_typeNum = pointer_null;
			