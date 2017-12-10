/// @description Insert description here
// You can write your code in this editor
// Draws the summary and zoomed in view of the other object.

//show_debug_message(sprite_get_name(sprite_index));
//show_debug_message(image_index);
giftLevel = "1";
personName = "jacob";
with(obj_items_ctrl)
{
	descriptions = descMap;
}
description = descriptions[? "gift_"+giftLevel+"_"+personName];
drawSummary = true;