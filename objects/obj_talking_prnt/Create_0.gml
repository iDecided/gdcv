/// @description Insert description here
// You can write your code in this editor
sprite_index = asset_get_index("spr_char_" + global.talkingTo);
image_xscale = 0.25;
image_yscale = 0.25;

plannedDate = ds_map_create();
plannedDate[? "day"] = "";
plannedDate[? "time"] = "";
plannedDate[? "location"] = "";