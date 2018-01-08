/// @description Variable declaration and initialization
// You can write your code in this editor

enum menu_states {
	none = 0,
	exploring,
	items,
	people_1,
	people_2,
	date_1,
	date_2,
	date_3,
	date_final
};

weekdayNames = ["SUN", "MON", "TUE", "WED", "THR", "FRI", "SAT"];

menu_state = menu_states.none;

ls_guiObjects = ds_list_create();