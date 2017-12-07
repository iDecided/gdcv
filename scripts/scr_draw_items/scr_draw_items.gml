var topMenuOffset = 100;
var sizeRatio = 0.100;

var row = 0;
var col = 0;

// Draws the actual inventory of the player's objects
#region
for(var i = 0; i < maxGifts; ++i)
{
		if(gifts[i] != "")
		{
			var owner = string_copy(gifts[i], 0, string_length(gifts[i]) - 2);
			var level = string_char_at(gifts[i], string_length(gifts[i]));
			var tempObj = instance_create_depth(col * 1000 * sizeRatio, (row * 1000 * sizeRatio) + topMenuOffset, 0, asset_get_index("obj_gift_" + owner));
			with(tempObj)
			{
			    image_speed = 0;
				image_index = level;
				image_xscale = sizeRatio;
				image_yscale = sizeRatio;
			}
		}
		
		++col;
		if(col > 4)
		{
			++row;
			col = 0;
		}
}  
#endregion