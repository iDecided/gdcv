/// @description Insert description here
// You can write your code in this editor
show_debug_message("Should be closing the new gift box.");

// Copy-pasta'd from the date cancel button.
layer_destroy(layer_get_id("newGiftLayer_bg"));
layer_destroy_instances(layer_get_id("newGiftLayer_obj"));
layer_destroy(layer_get_id("newGiftLayer_obj"));
// This is an awful fix, for it just redrawing the datepicker if you delete the layer, but it works for now
global.showNewGift = "";