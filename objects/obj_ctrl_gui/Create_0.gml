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

menu_state = menu_states.none;

global.guiLayer = layer_create(-1000, "guiLayer");