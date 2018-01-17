var sizeRatio = 0.075;
var startX = 93;
var startY = 135;
var spacingX = 88;
var spacingY = 88;

var row = 0;
var col = 0;

var descMap = scr_load_json("gift_summaries.json");

// Draws the actual inventory of the player's objects
#region
for(var i = 0; i < global.maxGifts; ++i)
{
		if(global.gifts[i] != "")
		{
			var owner = string_copy(global.gifts[i], 0, string_length(global.gifts[i]) - 2);
			var level = string_char_at(global.gifts[i], string_length(global.gifts[i]));
			var tempX = startX + (col * spacingX);
			var tempY = (row * spacingY) + startY;
			var tempObj = instance_create_depth(tempX, tempY, 0, obj_gift_parent);
			with(tempObj)
			{
				giftLevel = level;
				giftRecip = owner;
				giftDesc = descMap[? owner + "_" + level];
				
				sprite_index = asset_get_index("spr_gift_" + owner);
			    image_speed = 0;
				image_index = level;
				image_xscale = sizeRatio;
				image_yscale = sizeRatio;
			}
			ds_list_add(argument0, tempObj);
		}
		
		++col;
		if(col > 4)
		{
			++row;
			col = 0;
		}
}  
#endregion