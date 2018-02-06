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
		charDetails = scr_load_json("character_details.json");
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

// I'm moving this to the 0th user event. I've also setup a macro in create that automagically calls the user event.
UPDATE_GUI;