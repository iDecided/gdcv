/// @description Insert description here
// You can write your code in this editor

// Will automatically set the menu_state based on the room you're currently in
switch (room) {
	case rm_cc:
	case rm_cs:
	case rm_dc:
	case rm_gdl:
	case rm_lib:
	case rm_ps:
	case rm_sr:
	case rm_ud:
		global.guiController.menu_state = menu_states.ovw;
		break;
	case rm_talking:
		global.guiController.menu_state = menu_states.talking;
		break;
	case rm_tm_items:
		global.guiController.menu_state = menu_states.items;
		break;
	case rm_tm_people_overview:
		global.guiController.menu_state = menu_states.people_overview;
		break;
	case rm_tm_people_details:
		global.guiController.menu_state = menu_states.people_details;
		break;
	case rm_date_morning:
	case rm_date_afternoon:
	case rm_date_night:
		global.guiController.menu_state = menu_states.date;
		break;
	default:
		global.guiController.menu_state = menu_states.none;
		break;
}

// Code for managing the list of objects that need spawned for the GUI
for(var i=0; i < ds_list_size(ls_guiObjects); i++){
	//show_debug_message("Should be destroying all of the owv gui elements");
	instance_destroy(ls_guiObjects[| i]);
}
ds_list_empty(ls_guiObjects);

scr_draw_gui(menu_state, ls_guiObjects);