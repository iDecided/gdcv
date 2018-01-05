/// @description Insert description here
// You can write your code in this editor

for(var i=0; i < ds_list_size(ls_guiObjects); ++i){
	instance_destroy(ls_guiObjects[| i]);
}
ds_list_empty(ls_guiObjects);
scr_draw_gui(menu_state, ls_guiObjects);