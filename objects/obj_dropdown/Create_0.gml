/// @description Insert description here
// You can write your code in this editor

optionsList = ds_list_create();
dropdownItemsList = ds_list_create();
image_speed = 0;
choiceSelected = defaultOption;

if(listType == "day")
{
	ds_list_add(optionsList, "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday");
}
else if(listType == "location")
{
	ds_list_add(optionsList, "Central Campus", "Dining Center", "Game Dev Lab", "Library", "Streaming Room");
}
else if(listType == "time")
{
	ds_list_add(optionsList, "Morning", "Afternoon", "Evening");
}