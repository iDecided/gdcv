// Draws the actual inventory of the player's objects
#region
for(var i = 0; i < ds_list_size(global.names); ++i)
{
		var tempObj = instance_create_depth(294, 182 + (88.5 * i), 0, obj_headshot);
		with(tempObj)
		{
			character = global.names[| i];
			
			//sprite_index = asset_get_index("spr_gift_" + owner);
			image_speed = 0;
			image_index = i + 1;
			image_xscale = 0.085;
			image_yscale = 0.085;
		}
		ds_list_add(argument0, tempObj);
}  
#endregion