/// @description Insert description here
// You can write your code in this editor

switch (room) {
	case rm_cc:
	case rm_cs:
	case rm_dc:
	case rm_gdl:
	case rm_lib:
	case rm_ps:
	case rm_sr:
	case rm_ud:
		global.currentRoom = room;
		scr_populate_overworld();
		break;
	default:
		break;
}