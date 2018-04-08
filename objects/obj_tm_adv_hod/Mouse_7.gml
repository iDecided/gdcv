/// @description Insert description here
// You can write your code in this editor
scr_advance_half_hour();
scr_spawn_trinkets_backend(room_get_name(global.currentRoom), false);
UPDATE_GUI;

// This should actually probably move to the button click event for the time advance buttons
//with(obj_trinket_spawn) {
//	_type = irandom_range(trinket.tr_1, trinket.tr_6);
//}